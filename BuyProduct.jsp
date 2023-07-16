<%@page import="com.shoppingcart.dto.Item"%>
<%@page import="com.shoppingcart.dto.Product"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page import="javax.persistence.Persistence"%>
<%@page import="javax.persistence.EntityManagerFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	int id =Integer.parseInt(request.getParameter("id"));
	EntityManagerFactory emf =Persistence.createEntityManagerFactory("nivedita");
	EntityManager em =emf.createEntityManager();

	Item it = em.find(Item.class, id) ;
    int pid = it.getPid() ;
    Product pr = em.find(Product.class, pid) ;
%>

<form action="BuyProduct1.jsp">
Id:<input type = "number" name="id" value="<%=pr.getId()%>" readonly="readonly"><br><br>
Name:<input type ="text" name="name" value="<%=pr.getName() %>"readonly="readonly"><br><br>
Category:<input type ="text" name="category" value="<%=pr.getCategory()%>"readonly="readonly"><br><br>
Price:<input type ="number" name="price" value="<%=pr.getPrice() %>"readonly="readonly"><br><br>
Stock:<input type ="number" name="stock" value="<%=pr.getStock() %>"readonly="readonly"><br><br>
Enter Quantity:<input type ="number" name="quantity"><br><br>
<input type ="submit">
</form>

</body>
</html>