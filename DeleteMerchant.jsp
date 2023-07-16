<%@page import="javax.persistence.Query"%>
<%@page import="com.shoppingcart.dto.Merchant"%>
<%@page import="java.util.List"%>
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
<style>
body
{
background-image:url("https://img.freepik.com/free-vector/background-realistic-abstract-technology-particle_23-2148431735.jpg?w=900&t=st=1685907203~exp=1685907803~hmac=696d3309017a5b3206a8d76287555a6ae716db313bd6b66565e3aa4358694913");
background-repeat:no-repeat;
background-size:cover;
font-size:25px;
color:white;
}
</style>
</head>
<body>
<%
EntityManagerFactory emf = Persistence.createEntityManagerFactory("nivedita");
EntityManager em = emf.createEntityManager();

Query query = em.createQuery("select a from Merchant a");
List<Merchant> merchant = query.getResultList();

if(merchant.size()>0)
{%>
	<table cellpadding="20" border ="1" align="center">
	<th>id</th>
	<th>name</th>
	<th>email</th>
	<th>password</th>
	<th>mobilenumber</th>
	<th>staus</th>
	<th>delete</th>
	<%for(Merchant m : merchant){ %>
	<tr>
	<td><%= m.getId() %></td>
	<td><%= m.getName() %></td>
	<td><%= m.getEmail() %></td>
	<td><%= m.getPassword() %></td>
	<td><%= m.getMobilenumber() %></td>
	<td><%= m.getStatus() %></td>
	<td><a href = "merchantdeletestatus.jsp?id=<%=m.getId()%>">delete</a></td>
	</tr>
	<% } %>
	</table>
<% }%>
</body>
</html>