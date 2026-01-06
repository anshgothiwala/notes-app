package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Note;
import com.entities.Register;
import com.helper.FactoryProvider;

@WebServlet("/SaveNoteServlet")
public class SaveNoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SaveNoteServlet() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			// Fetching title and content
			String title = request.getParameter("title");
			String content = request.getParameter("content");

			// Getting user from session
			HttpSession httpSession = request.getSession();
			Register user = (Register) httpSession.getAttribute("current-user");

			if (user == null) {
				response.sendRedirect("Login.html");
				return;
			}

			// Creating note object
			Note note = new Note(title, content, new Date(), user);

			// Hibernate save
			Session s = FactoryProvider.getFactory().openSession();
			Transaction tx = s.beginTransaction();

			s.save(note);

			tx.commit();
			s.close();

			response.sendRedirect("all_notes.jsp");

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
