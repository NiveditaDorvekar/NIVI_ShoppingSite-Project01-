package com.shoppingcart.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shoppingcart.dto.Product;

@WebServlet("/sproduct")
public class saveproduct extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req , HttpServletResponse res)throws ServletException, IOException {
		String name=req.getParameter("name");
		String category=req.getParameter("category");
		String price=req.getParameter("price");
		String stock=req.getParameter("stock");
		
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("nivedita");
		EntityManager em = emf.createEntityManager();
		EntityTransaction et = em.getTransaction();
		
		
		Product product = new Product();
		product.setName(name);
		product.setCategory(category);
		product.setPrice(Double.parseDouble(price));
		product.setStock(Integer.parseInt(stock));
		
	
		
		et.begin();
		em.persist(product);
		et.commit();
		
		PrintWriter pout =res.getWriter();
		pout.print("Product Added Successfully.");
		RequestDispatcher rd = req.getRequestDispatcher("login.html");
		rd.include(req, res);
		res.setContentType("text/html");
		
	}

}
