package org.javadenemesi;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/helloservlet")
public class FormSevlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		PrintWriter out = response.getWriter();
		StringBuffer sb = new StringBuffer();
		sb.append("<html><body bgcolor=pink text = red>");
		sb.append("<form action='' method=''><center>");
		sb.append("<h2>Iletisim Formu</h2><table cellpadding = '5' cellspacing = '5'> <tr> ");	
		sb.append("<td>Ad Soyad:</td><td><input type = 'text' name = 'adsoyad' /></td></tr>");			
		sb.append("<tr><td>Eposta:</td><td><input type = 'text' name = 'eposta' /></td></tr>");		
		sb.append("<tr><td>Mesaj:</td><td><textarea rows= '3' cols = '30' name = 'mesaj'></textarea></td></tr>");		
		sb.append("<tr><td></td><td><input type = 'submit' value = 'GONDER' /></td></tr>");		
		sb.append("</table></center></form>");		
		sb.append("<h1 align = center>Hello from Vinod</h1>");
		sb.append("</body></html>");
		out.println(sb);
		out.close();
	}

}
