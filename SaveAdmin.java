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

import com.shoppingcart.dto.Admin;

@WebServlet("/saveadmin")
public class SaveAdmin extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req , HttpServletResponse res)throws ServletException, IOException {
		String email=req.getParameter("email");
		String password=req.getParameter("password");
		
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("nivedita");
		EntityManager em = emf.createEntityManager();
		EntityTransaction et = em.getTransaction();
		
		
		Admin admin = new Admin();
		admin.setEmail(email);
		admin.setPassword(password);
		
		et.begin();
		em.persist(admin);
		et.commit();
		
		PrintWriter pout =res.getWriter();
		pout.print("Acccount created Successfully.");
		RequestDispatcher rd = req.getRequestDispatcher("login.html");
		rd.include(req, res);
		res.setContentType("text/html");
		
	}

}
