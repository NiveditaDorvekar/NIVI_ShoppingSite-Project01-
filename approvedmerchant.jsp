<%@page import="java.io.PrintWriter"%>
<%@page import="javax.persistence.Persistence"%>
<%@page import="com.shoppingcart.dto.Merchant"%>
<%@page import="java.util.List"%>
<%@page import="javax.persistence.Query"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page import="javax.persistence.EntityManagerFactory"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Approved Merchant</title>
<style>
div
{
background-image:url("https://img.freepik.com/free-photo/composed-organized-workplace-realtor_23-2147764216.jpg?w=900&t=st=1685906748~exp=1685907348~hmac=964434296b614cdf7810d24dce2c6bca7f01213b5dfd391cdf3bdcc9a0766376");
background-repeat:no-repeat;
background-size:cover;
font-size:20px;
color:red;
}
</style>
</head>
<body>
<%
EntityManagerFactory emf = Persistence.createEntityManagerFactory("nivedita");
EntityManager em = emf.createEntityManager();

Query query =em.createQuery("select a from Merchant a where a.status= 'inactive'");
List<Merchant> merchants = query.getResultList();
if(merchants.size()>0){%>
<div>
<table cellpadding="20" border ="1" align="center" >
<th>id</th>
<th>name</th>
<th>email</th>
<th>password</th>
<th>mobilenumber</th>
<th>staus</th>
<th>approve</th>
<%for(Merchant m : merchants){ %>
<tr>
<td><%= m.getId() %></td>
<td><%= m.getName() %></td>
<td><%= m.getEmail() %></td>
<td><%= m.getPassword() %></td>
<td><%= m.getMobilenumber() %></td>
<td><%= m.getStatus() %></td>
<td><a href = "merchantstatusactive.jsp?id=<%=m.getId()%>">approve</a></td>
</tr>
<% } %>
</table>
</div>
<% } else { 
PrintWriter pw = response.getWriter();
pw.print("Invalide Credantials");
RequestDispatcher rd = request.getRequestDispatcher("approvedmerchant.jsp");
rd.include(request, response);
response.setContentType("text/html");
} %>

</body>
</html>