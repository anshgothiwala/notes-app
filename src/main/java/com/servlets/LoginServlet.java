package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.query.Query;

import com.entities.Register;
import com.helper.FactoryProvider;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// Get email and password from form
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        
        PrintWriter out=response.getWriter();
        response.setContentType("text/html");

        // Hibernate session
        Session s=FactoryProvider.getFactory().openSession();

        try {
            // HQL query to check user
            Query<Register> query = s.createQuery("FROM Register WHERE email = :email AND password = :password", Register.class);
            query.setParameter("email", email);
            query.setParameter("password", password);

            Register user = query.uniqueResult();
            
            RequestDispatcher rd=request.getRequestDispatcher("Login.html");
            
            if (user != null) {
                // Valid credentials
                HttpSession httpSession = request.getSession();
                httpSession.setAttribute("current-user", user);

                response.sendRedirect("index.jsp");
            } else {
                // Invalid credentials
                out.println("Invalid Credentials");
                rd.include(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("Login.html");
        } finally {
            s.close();
        }
	}

}
