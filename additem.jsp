<%@page import="com.shoppingcart.dto.Product"%>
<%@page import="com.shoppingcart.dto.Item"%>
<%@page import="java.util.List"%>
<%@page import="javax.persistence.Query"%>
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
<style>
body
{
background-image:url("https://tse1.mm.bing.net/th?id=OIP.sxkfw6mN4C0gaaezhLXTzgHaEL&pid=Api&P=0&h=180");
font-size:25px;
background-repeat:no-repeat;
background-size:cover;
color:red;
}
</style>
<body>
<%
EntityManagerFactory emf = Persistence.createEntityManagerFactory("nivedita");
EntityManager em = emf.createEntityManager();

Query query =em.createQuery("select a from Product a");
List<Product> product = query.getResultList();
if(product.size()>0)
{%>
<h1 align="center">All Products</h1>
<b>
<table cellpadding="15" border ="1" align="center">
<th>Id</th>
<th>Name</th>
<th>Category</th>
<th>Price</th>
<th>Stock</th>
<th>Add Item</th>
<%for(Product p :product){ %>
<tr>
<td><%= p.getId() %></td>
<td><%= p.getName() %></td>
<td><%= p.getCategory() %></td>
<td><%= p.getPrice() %></td>
<td><%= p.getStock() %></td>
<td><a href = "saveitemtocart.jsp?id=<%=p.getId()%>">Add</a></td>
</tr>
<% } %>
</table>
</b>
<% } %>
</body>
</html>