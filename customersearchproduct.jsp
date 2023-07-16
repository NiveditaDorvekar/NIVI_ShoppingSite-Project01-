<%@page import="java.util.List"%>
<%@page import="javax.persistence.Query"%>
<%@page import="javax.persistence.Persistence"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="com.shoppingcart.dto.Product"%>
<%@page import="javax.persistence.EntityTransaction"%>
<%@page import="javax.persistence.EntityManager"%>
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
String name = request.getParameter("search");
EntityManagerFactory emf = Persistence.createEntityManagerFactory("nivedita");
EntityManager em = emf.createEntityManager();
EntityTransaction et = em.getTransaction();

Query query = em.createQuery("select a from Product a where a.name=?1 or a.category=?2");

query.setParameter(1,name);
query.setParameter(2,name);
List<Product> product =query.getResultList();

if(product.size()>0){

%>
<h1 align="center">All Products</h1>
<table cellpadding="15" border ="1" align="center">
<tr>
<th>Id</th>
<th>Name</th>
<th>Category</th>
<th>Price</th>
<th>Stock</th>
<th>Buy Product</th>
<th>Add to Cart</th>
</tr>
<%for(Product p :product){ %>
<tr>
<td><%= p.getId() %></td>
<td><%= p.getName() %></td>
<td><%= p.getCategory() %></td>
<td><%= p.getPrice() %></td>
<td><%= p.getStock() %></td>
<td><a href="buyProduct.jsp?id=<%= p.getId()%>"></a>Buy Product</td>
<td><a href="saveitemtocart.jsp?id=<%= p.getId() %>">Add Item</a></td>
</tr>
<% } %>
</table>
<% 
} else{
PrintWriter pw = response.getWriter();
pw.print("product is not available");
RequestDispatcher rd = request.getRequestDispatcher("customersearch.html");
rd.include(request, response);
response.setContentType("text/html");
}	
%>




</body>
</html>