<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@page import="javax.persistence.EntityTransaction"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.shoppingcart.dto.Admin"%>
<%@page import="javax.persistence.Persistence"%>
<%@page import="com.shoppingcart.dto.Merchant"%>
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
String id = request.getParameter("id");
int id1 = Integer.parseInt(id);

EntityManagerFactory emf = Persistence.createEntityManagerFactory("nivedita");
EntityManager em = emf.createEntityManager();
EntityTransaction et = em.getTransaction();

Merchant m = em.find(Merchant.class, id1);
m.setStatus("active");

Admin a =(Admin) session.getAttribute("admin");
m.setAdmin(a);

//List<Merchant> merchant =new ArrayList();
//merchant.add(m);
//a.setMerchant(merchant);


et.begin();
em.merge(a);
em.merge(m);
et.commit();

RequestDispatcher rd = request.getRequestDispatcher("approvedmerchant.jsp");
rd.forward(request,response);


%>
</body>
</html>