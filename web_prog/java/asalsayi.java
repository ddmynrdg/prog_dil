package exercise.com;

import java.util.Scanner;

public class Exercise 
{
  public static void main(String[] args)
	{
		 System.out.println("Girilen Sayının Altındaki Asal Sayılar");
	        Scanner s = new Scanner(System.in);        
	        System.out.print("\nSayı giriniz: ");
	        int a = s.nextInt();
	        int sayi;
	        for (int i = 20; i <= a; i++)
	        {
	        	sayi = 0;
	            for (int j = 2; j <= i / 2; j++)
	            	if (i % j == 0) sayi++;
	            
	            if (sayi == 0) System.out.print(i  + ",");
	        } 
	}
}
	
