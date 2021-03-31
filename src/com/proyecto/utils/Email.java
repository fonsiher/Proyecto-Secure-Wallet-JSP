package com.proyecto.utils;

import java.util.Properties;

import javax.mail.Message.RecipientType;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.*;

public class Email {

	public boolean enviarCorreo(String de, String clave, String para, String mensaje, String asunto) {
		boolean enviado = false;
		try {
			String host = "smtp.gmail.com";

			Properties prop = System.getProperties();
			prop.put("mail.smtp.starttls.enable", "true");
			prop.put("mail.smtp.host", host);
			prop.put("mail.smtp.user", de);
			prop.put("mail.smtp.password", clave);
			prop.put("mail.smtp.port", 587);
			prop.put("mail.smtp.auth", "true");
			prop.put("mail.debug", "true");

			Session sesion = Session.getDefaultInstance(prop, null);
			MimeMessage message = new MimeMessage(sesion);

			message.setRecipient(Message.RecipientType.TO, new InternetAddress(para));

			message.setSubject(asunto);
			message.setText(mensaje);

			Transport transport = sesion.getTransport("smtps");
			transport.connect(host, de, clave);
			transport.sendMessage(message, message.getAllRecipients());
			transport.close();
			enviado = true;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return enviado;
	};

	public String addImagen(String result) {
		String resp = "";
		if (result.equals("Gracias. Te contactaremos pronto")) {
			resp = "<img src=\"imagenes/verificacion.png\"\r\n"
					+ "					align=\"center\" style=\"width: 250px; height: 230px;\">";
		} else
			resp = "<img src=\"imagenes/fallo.png\"\r\n"
					+ "					align=\"center\" style=\"width: 250px; height: 230px;\">";

		return resp;
	}
}
