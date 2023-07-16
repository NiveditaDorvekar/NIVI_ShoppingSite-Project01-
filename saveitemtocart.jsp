<%@page import="com.shoppingcart.dto.Product"%>
<%@page import="java.io.PrintWriter"%>
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
	
	System.out.println(id);
	
	int id1 = Integer.parseInt(id);
	EntityManagerFactory emf = Persistence.createEntityManagerFactory("nivedita");
	EntityManager em = emf.createEntityManager();

	Product p = em.find(Product.class, id1);
	System.out.println(p);
	%>
	<form action="itemsave.jsp" align="center ">
	<input type="hidden" name="id" value="<%=p.getId() %>">
		Name <input type="text" name="name" value="<%=p.getName()%>"
			readonly="readonly"><br>
		<br> Category <input type="text" name="category"
			value="<%=p.getCategory()%>" readonly="readonly"><br>
		<br> Stock <input type="number" name="stock"
			value="<%=p.getStock()%>" readonly="readonly"><br>
		<br> Price <input type="number" name="price"
			value="<%=p.getPrice()%>" readonly="readonly"><br>
		<br> Enter Quantity <input type="number" name="quantity"><br>
		<br> <input type="submit">
	</form>

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