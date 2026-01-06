package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Register;
import com.helper.FactoryProvider;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public RegisterServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String password = request.getParameter("password");

			Register register = new Register(name, email, password);

			Session s = FactoryProvider.getFactory().openSession();

			Transaction tx = s.beginTransaction();
			s.save(register);
			tx.commit();

			s.close();

			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			response.sendRedirect("alert.html");

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
