package exercise.com;

import java.util.*;

public class Exercise {
	public static void main(String[] args) {
		
		Random rst = new Random();
		int sayi1 = rst.nextInt(10);
		
		Scanner s = new Scanner(System.in); 
		while (true) {
			System.out.println("Bir sayi gir :");
			int sayi2 = s.nextInt();
			
			if (sayi1 == sayi2) {
				System.out.println("Tebrikler bildiniz.");
				break;
			} else {
				System.out.println("Tekrar dene.");
			}
					
		}
	}
}
