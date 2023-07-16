<%@page import="java.io.PrintWriter"%>
<%@page import="com.shoppingcart.dto.Product"%>
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
<title>Update Product</title>
<style>
body
{
background-image:url("https://images.pexels.com/photos/5926436/pexels-photo-5926436.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2");
font-size:30px;
background-repeat:no-repeat;
background-size:cover;
font-size:30px;
color:;
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
	<table cellpadding="20" border ="1" align="center">
	<th>Id</th>
	<th>Name</th>
	<th>Category</th>
	<th>Price</th>
	<th>Stock</th>
	<th>Update</th>
	<%for(Product pu : product){ %>
	<tr>
	<td><%= pu.getId() %></td>
	<td><%= pu.getName() %></td>
	<td><%= pu.getCategory() %></td>
	<td><%= pu.getPrice() %></td>
	<td><%= pu.getStock() %></td>
	<td><a href = "updateproduct.html">Update Product</a></td>
	</tr>
	<% } %>
	</table>
<% } else {
PrintWriter pw = response.getWriter();
pw.print("No product is available for update.");

RequestDispatcher rd = request.getRequestDispatcher("updateproduct.jsp");
rd.include(request, response);
response.setContentType("text/html");
}%>
</body>
</html>