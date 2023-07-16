							<%@page import="com.shoppingcart.dto.Product"%>
<%@page import="java.util.List"%>
<%@page import="javax.persistence.Query"%>
<%@page import="javax.persistence.Persistence"%>
<%@page import="javax.persistence.EntityManagerFactory"%>
<%@page import="javax.persistence.EntityManager"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete Product</title>
<style>
body
{
background-image:url("https://images.pexels.com/photos/961402/pexels-photo-961402.jpeg?auto=compress&cs=tinysrgb&w=600");
font-size:30px;
background-repeat:no-repeat;
background-size:cover;
}
</style>
</head>
<body>
<%
EntityManagerFactory emf = Persistence.createEntityManagerFactory("nivedita");
EntityManager em = emf.createEntityManager();

Query query = em.createQuery("select a from Product a");
List<Product> product = query.getResultList();

if(product.size()>0)
{%>
<h1 align="center">Products</h1>
	<table cellpadding="20" border ="1" align="center">
	<th>Id</th>
	<th>Name</th>
	<th>Category</th>
	<th>Price</th>
	<th>Stock</th>
	<th>Delete</th>
	<%for(Product p1 : product){ %>
	<tr>
	<td><%= p1.getId() %></td>
	<td><%= p1.getName() %></td>
	<td><%= p1.getCategory() %></td>
	<td><%= p1.getPrice() %></td>
	<td><%= p1.getStock() %></td>
	<td><a href = "productdeletestatus.jsp?id=<%=p1.getId()%>">Delete Product</a></td>
	</tr>
	<% } %>
	</table>
<% }%>
</body>
</html>