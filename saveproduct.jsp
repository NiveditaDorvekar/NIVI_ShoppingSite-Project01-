<%@page import="java.util.List"%>
<%@page import="com.shoppingcart.dto.Merchant"%>
<%@page import="java.io.PrintWriter"%>
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
	
		String name=request.getParameter("name");
		String category=request.getParameter("category");
		String price=request.getParameter("price");
		String stock=request.getParameter("stock");
		
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("nivedita");
		EntityManager em = emf.createEntityManager();
		EntityTransaction et = em.getTransaction();
		
		
		Product product = new Product();
		product.setName(name);
		product.setCategory(category);
		product.setPrice(Double.parseDouble(price));
		product.setStock(Integer.parseInt(stock));
		
		Merchant m=(Merchant)session.getAttribute("merchant");
		product.setMerchant(m);
		
		List<Product>p=m.getProducts();
		p.add(product);
		m.setProducts(p);
		
		
		et.begin();
		em.persist(product);
		em.merge(m);
		et.commit();
		
		PrintWriter pout =response.getWriter();
		pout.print("Product Added Successfully.");
		RequestDispatcher rd = request.getRequestDispatcher("addproduct.html");
		rd.include(request, response);
		response.setContentType("text/html");
		
	%>
</body>
</html>