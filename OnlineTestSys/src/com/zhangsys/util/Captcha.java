package com.zhangsys.util;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.util.Random;

public class Captcha {
	private static String vCode;
	
    public static String getvCode() {
		return vCode;
	}

	public static void setvCode(String Code) {
		vCode = Code;
	}

	public static BufferedImage CaptchaImage(){
	    int width=90;
		int height=22;
		BufferedImage image=new BufferedImage(width,height,BufferedImage.TYPE_INT_RGB);
		Graphics g=image.getGraphics();
		g.setColor(Color.GREEN);
		g.drawRect(0, 0, width, height);
		
		g.setColor(Color.YELLOW);
		g.fillRect(1, 1, width-2, height-2);
		
		g.setColor(Color.GRAY);
		Random r=new Random();
		for(int i=0;i<10;i++){
			g.drawLine(r.nextInt(width),r.nextInt(height),r.nextInt(width),r.nextInt(height));
		}
		g.setColor(Color.RED);
		g.setFont(new Font("宋体",Font.BOLD|Font.ITALIC,20));
		int x=10;
		StringBuffer vcode=new StringBuffer("");
		for(int i=0;i<4;i++){
			String num=r.nextInt(10)+"";
			vcode.append(num);
			g.drawString(num, x, 20);
			x+=20;
		}
		setvCode(vcode.toString());
		return image;
   }
}
