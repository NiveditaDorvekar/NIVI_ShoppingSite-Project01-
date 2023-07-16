<%@page import="java.io.PrintWriter"%>
<%@page import="com.shoppingcart.dto.Customer"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.shoppingcart.dto.Cart"%>
<%@page import="com.shoppingcart.dto.Item"%>
<%@page import="javax.persistence.EntityTransaction"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page import="javax.persistence.Persistence"%>
<%@page import="javax.persistence.EntityManagerFactory"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	if (session.getAttribute("customer") != null) {
	%>
<%
String id = request.getParameter("id");
int id1= Integer.parseInt(id);
EntityManagerFactory emf = Persistence.createEntityManagerFactory("nivedita");
EntityManager em = emf.createEntityManager();
EntityTransaction et =em.getTransaction();

Item i = em.find(Item.class, id1);
Cart c = i.getCart();
Customer cust =c.getCustomer();

if(cust!=null)
{
	List<Item> cr=c.getItem();
	List<Item> item= new ArrayList();
	for(Item its:cr)
	{
		if(its.getId() == id1)
		{
			
		}
		else
		{
			item.add(its);
		}
	}
	c.setItem(item);
et.begin();
em.merge(c);
em.remove(i);
em.remove(c);
et.commit();

PrintWriter pw =response.getWriter();
pw.print("Item is Deleted");
RequestDispatcher rd= request.getRequestDispatcher("deleteitem.jsp");
rd.include(request, response);
response.setContentType("text/html");
}
else{
	PrintWriter pw =response.getWriter();
	pw.print("Customer is not available");
	RequestDispatcher rd=request.getRequestDispatcher("deleteitem.jsp");
	rd.include(request,response);
	response.setContentType("text/html");
}
%>
<%
	} else {
	%>
	<h1>please Login first</h1>
	<br>
	<a href="login.html">Login</a>

	<%
	}
	%>
</body>
</html>