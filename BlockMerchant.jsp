<%@page import="com.shoppingcart.dto.Merchant"%>
<%@page import="java.util.List"%>
<%@page import="javax.persistence.Query"%>
<%@page import="javax.persistence.Persistence"%>
<%@page import="javax.persistence.EntityManager"%>
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
background-image:url("https://www.pngplay.com/wp-content/uploads/7/Blocked-Transparent-File.png");
background-repeat:no-repeat;
background-size:60%;
font-size:20px;
color:black;
}
</style>
</head>
<body>
<%
EntityManagerFactory emf = Persistence.createEntityManagerFactory("nivedita");
EntityManager em = emf.createEntityManager();

Query query =em.createQuery("select a from Merchant a where a.status='active'");
List<Merchant> mr = query.getResultList();
if(mr.size()>0)
{%>
<h1 align="center">All Active Merchant</h1>
<table cellpadding="15" border ="1" align="center">
<th>Id</th>
<th>Name</th>
<th>Email Id</th>
<th>Mobile Number</th>
<th>Status</th>
<th>Block</th>
<%for(Merchant p :mr){ %>
<tr>
<td><%= p.getId() %></td>
<td><%= p.getName() %></td>
<td><%= p.getEmail() %></td>
<td><%= p.getMobilenumber() %></td>
<td><%= p.getStatus() %></td>
<td><a href = "merchantblockstatus.jsp?id=<%=p.getId()%>">Block</a></td>

</tr>
<% } %>
</table>
<% } %>
</body>
</html>