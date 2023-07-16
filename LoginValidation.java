package com.shoppingcart.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shoppingcart.dto.Admin;
import com.shoppingcart.dto.Customer;
import com.shoppingcart.dto.Merchant;

@WebServlet("/loginvalidate")
public class LoginValidation extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req , HttpServletResponse res) throws ServletException, IOException
	{
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		String choice = req.getParameter("choice");
		
		if(choice.equals("Customer"))
		{
			EntityManagerFactory emf =Persistence.createEntityManagerFactory("nivedita");
			EntityManager em = emf.createEntityManager();
			Query q =em.createQuery("select a from Customer a where a.email=?1 and a.password=?2");
			q.setParameter(1, email);
			q.setParameter(2, password);
			
			List<Customer> cu = q.getResultList();
			
			if(cu.size()>0)
				
			{
				HttpSession hs = req.getSession() ;
				hs.setAttribute("customer", cu.get(0));
				
				RequestDispatcher rd = req.getRequestDispatcher("customersearch.html");
				rd.forward(req, res);
			}
			else
			{
				PrintWriter pw = res.getWriter();
				pw.print("invalid Credantials");
				RequestDispatcher rd =req.getRequestDispatcher("login.html");
				rd.include(req, res);
				res.setContentType("text/html");
			}
		}
		else if(choice.equals("Merchant"))
		{
			
				EntityManagerFactory emf =Persistence.createEntityManagerFactory("nivedita");
				EntityManager em = emf.createEntityManager();
				
				Query q =em.createQuery("select a from Merchant a where a.email=?1 and a.password=?2");
				q.setParameter(1, email);
				q.setParameter(2, password);
				
				List<Merchant> merchant = q.getResultList();
			//	System.out.println("size is"+mr.size());
				
				if(merchant.size()>0)
				{
					Merchant m = merchant.get(0);
					HttpSession hs= req.getSession();
					hs.setAttribute("merchant", m);
					if(m.getStatus().equals("active"))
					{
						RequestDispatcher rd =req.getRequestDispatcher("merchantoption.html");
						rd.forward(req, res);
					}
					else if(m.getStatus().equals("inactive"))
					{
						PrintWriter pw = res.getWriter();
						pw.write("Your Account is not active.");
						RequestDispatcher rd = req.getRequestDispatcher("login.html");
						rd.include(req, res);
						res.setContentType("text/html");
					}
					else if(m.getStatus().equals("blocked"))
					{
						PrintWriter pw=res.getWriter();
						pw.print("your account blocked");
						RequestDispatcher rd = req.getRequestDispatcher("login.html");
						rd.include(req, res);
						res.setContentType("text/html");
					}
				}
				else
				{
					PrintWriter pw =res.getWriter();
					pw.print("Invalid Credantials");
					RequestDispatcher rd = req.getRequestDispatcher("login.html");
					res.setContentType("text/html");
				}
			}
			else if(choice.equals("Admin"))
			{
				EntityManagerFactory emf = Persistence.createEntityManagerFactory("nivedita");
				EntityManager em = emf.createEntityManager();
				
				Query q =em.createQuery("select a from Admin a where a.email=?1 and password=?2");
				q.setParameter(1, email);
				q.setParameter(2, password);
				
				List<Admin> ad = q.getResultList();
				
				if(ad.size()>0)
				{
					Admin a = ad.get(0);
					HttpSession hs =req.getSession();
					hs.setAttribute("admin", a);
					RequestDispatcher rd = req.getRequestDispatcher("Admin.html");
					rd.forward(req, res);
				}
				else
				{
					PrintWriter pw = res.getWriter();
					pw.print("Invalid Credantials");
					RequestDispatcher rd = req.getRequestDispatcher("login.html");
					rd.include(req, res);
					res.setContentType("text/html");
				}
			}
		
	}

}
