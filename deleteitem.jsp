<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.List"%>
<%@page import="javax.persistence.Query"%>
<%@page import="com.shoppingcart.dto.Item"%>
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
EntityManagerFactory emf = Persistence.createEntityManagerFactory("nivedita");
EntityManager em = emf.createEntityManager();

Query query = em.createQuery("select a from Item a");
List<Item> item = query.getResultList();

if(item.size()>0)
{%>
	<table cellpadding="20" border ="1" align="center">
	<th>Id</th>
	<th>Name</th>
	<th>Category</th>
	<th>Price</th>
	<th>Quantity</th>
	<th>Remove Item From Cart</th>
	<%for(Item it : item){ %>
	<tr>
	<td><%= it.getId() %></td>
	<td><%= it.getName() %></td>
	<td><%= it.getCategory() %></td>
	<td><%= it.getPrice() %></td>
	<td><%= it.getQuantity() %></td>
	<td><a href = "removecartitem.jsp?id=<%=it.getId()%>">Remove Item from Cart</a></td>
	</tr>
	<% } %>
	</table>
<% 
} else{
	PrintWriter pw =response.getWriter();
	pw.print("NO product to be deleted");
	RequestDispatcher rd =request.getRequestDispatcher("customersearch.html");
	rd.include(request,response);
	response.setContentType("text/html");
}

%>
</body>
</html>