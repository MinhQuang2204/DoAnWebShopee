package adminController;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import dao.OrderDetailDao;
import dao.UserDao;
import entity.OrderDetail;
import entity.User;


@WebServlet(urlPatterns="/admin/customer")
public class customerAdminController  extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		resp.setContentType("text/html");
		resp.setCharacterEncoding("UTF-8");
		req.setCharacterEncoding("UTF-8");
		
		
		UserDao user = new UserDao();
		List<User> listUser = user.getAllUserArrByCreateAt();
		
		req.setAttribute("listUser", listUser);
		RequestDispatcher rq=req.getRequestDispatcher("/views/customerAdmin.jsp");
		rq.forward(req, resp);
		
		
		
		
		
}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}
}
