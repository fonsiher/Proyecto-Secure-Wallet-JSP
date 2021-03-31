package com.proyecto.utils;

import java.math.BigInteger;
import java.security.MessageDigest;

public class Encriptar {
	public static String encriptar(String valor) {
		String sha1 = "";
		// With the java libraries
		try {
			MessageDigest digest = MessageDigest.getInstance("SHA-1");
			digest.reset();
			digest.update(valor.getBytes("utf8"));
			sha1 = String.format("%040x", new BigInteger(1, digest.digest()));
		} catch (Exception e) {
			e.printStackTrace();
		}

		return sha1;
	}
}
