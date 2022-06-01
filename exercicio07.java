import java.util.Scanner;

public class Main
{
	public static void main(String[] args) 
	{
		Scanner ler = new Scanner(System.in);
		System.out.printf("Informe uma palavra:\n");
		String palavra = ler.next();
		
		int tamanho = 0;
		for (char character : palavra.toCharArray()) {
		    tamanho++;
		}
        System.out.println(tamanho);
	}
}