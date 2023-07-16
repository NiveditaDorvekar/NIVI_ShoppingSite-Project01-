<%@page import="com.shoppingcart.dto.Merchant"%>
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
<style>
body
{
background-image:url("https://www.cashbackworld.com/media/int/news/EN_New%20Merchants%20_600X300.jpg");
background-repeat:no-repeat;
background-size:cover;
font-size:25px;
color:black;
}
</style>
</head>
<body>
<%
EntityManagerFactory emf = Persistence.createEntityManagerFactory("nivedita");
EntityManager em  = emf.createEntityManager();

Query query = em.createQuery("select a from Merchant a where a.status='active'");
List<Merchant> mr = query.getResultList();
if(mr.size()>0)
{%>
<b>
	<table cellpadding="20" border ="1" align="center">
	<th>Id</th>
	<th>Name</th>
	<th>Email</th>
	<th>Password</th>
	<th>Mobilenumber</th>
	<th>Staus</th>
	<%for(Merchant m : mr){ %>
	<tr>
	<td><%= m.getId() %></td>
	<td><%= m.getName() %></td>
	<td><%= m.getEmail() %></td>
	<td><%= m.getPassword() %></td>
	<td><%= m.getMobilenumber() %></td>
	<td><%= m.getStatus() %></td>
	</tr>
	<% } %>
	</table>
	</b>
<%}%>
</body>
</html>