<%@page import="java.io.PrintWriter"%>
<%@page import="com.shoppingcart.dto.Product"%>
<%@page import="javax.persistence.EntityTransaction"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page import="javax.persistence.Persistence"%>
<%@page import="javax.persistence.EntityManagerFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body align="center">

<%
	int id =Integer.parseInt(request.getParameter("id"));
int stock=Integer.parseInt(request.getParameter("stock"));
int quantity=Integer.parseInt(request.getParameter("quantity"));
double price =Double.parseDouble(request.getParameter("price"));

EntityManagerFactory emf=Persistence.createEntityManagerFactory("nivedita");
EntityManager em =emf.createEntityManager();
EntityTransaction et =em.getTransaction();

Product pr =em.find(Product.class,id);
if(stock>=quantity)
{
	
	int Stock = stock-quantity;
	pr.setStock(Stock);
	
	double totalprice=price*quantity;
	et.begin();
	em.persist(pr);
	et.commit();
	
	PrintWriter pw =response.getWriter();
	pw.print("Order placed Successfully "+totalprice+"rupees");
	
	RequestDispatcher rd = request.getRequestDispatcher("AddProductToItem.jsp");
	rd.include(request,response);
	response.setContentType("text/html");
}else
{
	PrintWriter pw =response.getWriter();
	pw.print("No item is Available");
	
	RequestDispatcher rd = request.getRequestDispatcher("AddProductToItem.jsp");
	rd.include(request,response);
	response.setContentType("text/html");
}
%>

</body>
</html>