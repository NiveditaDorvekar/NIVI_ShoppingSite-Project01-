<%@page import="java.util.List"%>
<%@page import="javax.persistence.Query"%>
<%@page import="com.shoppingcart.dto.Product"%>
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

   int id=Integer.parseInt(request.getParameter("id"));
   String name=request.getParameter("name");
   String category=request.getParameter("category");
   double price=Double.parseDouble(request.getParameter("price"));
   int stock=Integer.parseInt(request.getParameter("stock"));
                
                         

EntityManagerFactory emf = Persistence.createEntityManagerFactory("nivedita");
EntityManager em = emf.createEntityManager();
EntityTransaction et =em.getTransaction();




Product p = new Product();
p.setId(id);
p.setName(name);
p.setCategory(category);
p.setPrice(price);
p.setStock(stock);

et.begin();
em.merge(p);
et.commit();
RequestDispatcher rd= request.getRequestDispatcher("updateproduct.jsp");
rd.forward(request, response);
%>
</body>
</html>