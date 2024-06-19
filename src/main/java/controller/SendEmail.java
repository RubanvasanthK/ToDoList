package controller;

import java.io.IOException;
import java.util.Properties;
import java.util.Random;
import java.util.stream.IntStream;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/mailapp")
public class SendEmail extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	
//    Random r=new Random();
//    int a=r.nextInt(1000, 9999);
    
    	int a=(int) req.getAttribute("pin");
        String recipientEmail = (String) req.getAttribute("email");
//        String recipientEmail = "saranya7677@gmail.com";
        String subject = "Account recovery";
        String content = "your pin is " + a +"";

        String host = "smtp.gmail.com";
        final String senderEmail = "vasanthkumaravel24@gmail.com"; // Use your sender email
        final String senderPassword =  "bevr kvfu jbqk hbwn"; // Retrieve from environment variables

        Properties properties = new Properties();
        properties.put("mail.smtp.host", host);
        properties.put("mail.smtp.port", "465");
        properties.put("mail.smtp.ssl.enable", "true");
        properties.put("mail.smtp.auth", "true");

        Session session = Session.getInstance(properties, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(senderEmail, senderPassword);
            }
        });

        session.setDebug(true);

        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(senderEmail));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(recipientEmail));
            message.setSubject(subject);
            message.setContent(content, "text/html");
            resp.sendRedirect("login.jsp");
            Transport.send(message);
           
            System.out.println("Sent message successfully....");
            
            
        } catch (MessagingException mex) {
            mex.printStackTrace();
            throw new ServletException("Failed to send email", mex);
        }
        
          }
}
