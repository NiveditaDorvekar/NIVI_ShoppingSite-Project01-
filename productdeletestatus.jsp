<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.shoppingcart.dto.Merchant"%>
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
String id = request.getParameter("id");
int id1= Integer.parseInt(id);
EntityManagerFactory emf = Persistence.createEntityManagerFactory("nivedita");
EntityManager em = emf.createEntityManager();
EntityTransaction et =em.getTransaction();

Product p = em.find(Product.class, id1);
Merchant m =p.getMerchant();

if(m!=null)
{
	List<Product> pr=m.getProducts();
	List<Product> products= new ArrayList();
	for(Product product:pr)
	{
		if(product.getId() == id1)
		{
			
		}
		else
		{
		    products.add(product);
		}
	}
	
m.setProducts(products);
et.begin();
em.merge(m);
em.remove(p);
et.commit();

RequestDispatcher rd= request.getRequestDispatcher("deleteproduct.jsp");
rd.forward(request, response);
}
%>

</body>
</html>