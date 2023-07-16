<%@page import="java.io.PrintWriter"%>
<%@page import="com.shoppingcart.dto.Merchant"%>
<%@page import="com.shoppingcart.dto.Customer"%>
<%@page import="com.shoppingcart.dto.Cart"%>
<%@page import="com.shoppingcart.dto.Item"%>
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
body {
	background-image:
		url("https://img.freepik.com/free-photo/wooden-boards-with-shiny-background_1253-22.jpg?w=900&t=st=1685947349~exp=1685947949~hmac=23ecfecc67777b44a43d42989dc57478af1b384ee98135716eda7b7dce9fc183");
	font-size: 30px;
	background-repeat: no-repeat;
	background-size: cover;
}
</style>
</head>
<body align="center">
	<%
	if (session.getAttribute("merchant") != null) {
	%>
	<%
	//Customer cust= (Customer)session.getAttribute("customer");
	//          int id=cust.getId();
	Merchant m1 = (Merchant) session.getAttribute("merchant");
	int id = m1.getId();

	EntityManagerFactory emf = Persistence.createEntityManagerFactory("nivedita");
	EntityManager em = emf.createEntityManager();
	Merchant m2 = em.find(Merchant.class, id);
	List<Product> pr = m2.getProducts();
	//Customer c=em.find(Customer.class, id);
	//  List<Cart>cr=c.getCart();               
	//Query query =em.createQuery("select a from Item a");
	//List<Item> item = query.getResultList();
	Cart cart = new Cart();
	if (pr.size() > 0) {
	%>
	<h1 align="center">All Products</h1>
	<table cellpadding="15" border="1" align="center">
		<th>Id</th>
		<th>Name</th>
		<th>Category</th>
		<th>Price</th>
		<th>Stock</th>
		<%
		for (Product p : pr) {
		%>
		<tr>
			<td><%=p.getId()%></td>
			<td><%=p.getName()%></td>
			<td><%=p.getCategory()%></td>
			<td><%=p.getPrice()%></td>
			<td><%=p.getStock()%></td>
		</tr>
		<%
		}
		%>
	</table>
	<%
	} else {
	PrintWriter pw = response.getWriter();
	pw.print("<h1>Product is not available</h1>");
	RequestDispatcher rd = request.getRequestDispatcher("merchantoption.html");
	rd.include(request, response);
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