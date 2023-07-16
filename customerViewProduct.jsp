<%@page import="javax.persistence.EntityManager"%>
<%@page import="java.util.List"%>
<%@page import="com.shoppingcart.dto.Product"%>
<%@page import="javax.persistence.Query"%>
<%@page import="javax.persistence.Entity"%>
<%@page import="javax.persistence.Persistence"%>
<%@page import="javax.persistence.EntityManagerFactory"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Product</title>
<style>
body
{
background-image:url("https://img.freepik.com/free-photo/wooden-boards-with-shiny-background_1253-22.jpg?w=900&t=st=1685947349~exp=1685947949~hmac=23ecfecc67777b44a43d42989dc57478af1b384ee98135716eda7b7dce9fc183");
font-size:30px;
background-repeat:no-repeat;
background-size:cover;
}
</style>
</head>
<body>
<%
	if (session.getAttribute("customer") != null) {
	%>
<%
EntityManagerFactory emf = Persistence.createEntityManagerFactory("nivedita");
EntityManager em = emf.createEntityManager();

Query query =em.createQuery("select a from Product a");
List<Product> product = query.getResultList();
if(product.size()>0)
{%>
<h1 align="center">All Products</h1>
<table cellpadding="15" border ="1" align="center">
<th>Id</th>
<th>Name</th>
<th>Category</th>
<th>Price</th>
<th>Stock</th>
<%for(Product p :product){ %>
<tr>
<td><%= p.getId() %></td>
<td><%= p.getName() %></td>
<td><%= p.getCategory() %></td>
<td><%= p.getPrice() %></td>
<td><%= p.getStock() %></td>
</tr>
<% } %>
</table>
<% } %>
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