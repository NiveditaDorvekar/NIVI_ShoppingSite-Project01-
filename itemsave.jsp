<%@page import="com.shoppingcart.dto.Customer"%>
<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.shoppingcart.dto.Cart"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="com.shoppingcart.dto.Item"%>
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
	String name = request.getParameter("name");
	String category = request.getParameter("category");
	double price = Double.parseDouble(request.getParameter("price"));
	int quantity = Integer.parseInt(request.getParameter("quantity"));
	int stock = Integer.parseInt(request.getParameter("stock"));

	EntityManagerFactory emf = Persistence.createEntityManagerFactory("nivedita");
	EntityManager em = emf.createEntityManager();
	EntityTransaction et = em.getTransaction();
	double totalprice = 0;
	Customer c1 = (Customer) session.getAttribute("customer");
	System.out.println(c1);
	Cart c = c1.getCart();
	System.out.println(c);//NULL
	if (c != null) {

	} else {
		c = new Cart();
	}

	if (stock >= quantity) {
		Item it = new Item();
		it.setName(name);
		it.setCategory(category);
		it.setPrice(price * quantity);
		it.setQuantity(quantity);
		it.setPid(Integer.parseInt(request.getParameter("id"))) ;

		List<Item> it1 = c.getItem();
		it1.add(it);

		for (Item i : it1) {
			totalprice = totalprice + i.getPrice();
		}
		c.setTotalprice(totalprice);

		c.setItem(it1);

		it.setCart(c);
		c1.setCart(c);
		c.setCustomer(c1);

		et.begin();
		em.persist(it);
		em.merge(c);
		em.merge(c1);
		et.commit();

		PrintWriter pout = response.getWriter();
		pout.print("Item Added Successfully.");
		RequestDispatcher rd = request.getRequestDispatcher("additem.jsp");
		rd.include(request, response);
		response.setContentType("text/html");

	} else {
		PrintWriter pw = response.getWriter();
		pw.print("Items are not available.");
		RequestDispatcher rd1 = request.getRequestDispatcher("additem.jsp");
		rd1.include(request, response);
		response.setContentType("text/html");
	}
	%>
</body>
</html>