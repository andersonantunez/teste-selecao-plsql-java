import java.util.Scanner;

public class Main
{
	private static String ConcatERemove(String s, String t, int k)
	{
		// Verificacao das limitacoes
		int tam_s = s.length();
		int tam_t = t.length();
		if (!((tam_s >= 1 && tam_s <= 100) && 
			  (tam_t >= 1 && tam_t <= 100) && 
			  (k >= 1 && k <= 100)))
			return "Não";
			
		// Verifica se a palavra nao eh igual
		if (s.contentEquals(t))
		   return "Sim";
		   
		// Percorre S ate encontrar um caractere diferente ao comparar com T
		int pos_diferente;
		for (pos_diferente = 0; pos_diferente < tam_t; pos_diferente++)
		    if (!(s.charAt(pos_diferente) == t.charAt(pos_diferente)))
                break;

		// Recupera as sobras de S e T
		String sobra_s = s.substring(pos_diferente);
		String sobra_t = t.substring(pos_diferente);
		int qte_movimentos = sobra_s.length() + sobra_t.length();
		
		return (k >= qte_movimentos) ? "Sim" : "Não";
	}
		
	public static void main(String[] args) 
	{
		Scanner ler = new Scanner(System.in);
		System.out.printf("Informe uma palavra inicial:\n");
		var s = ler.next();
		System.out.printf("Informe uma palavra desejada:\n");
		var t = ler.next();
		System.out.printf("Informe o número de operações:\n");
		var k = Integer.parseInt(ler.next());
		System.out.println("Retorno da função:");
		System.out.println(ConcatERemove(s, t, k));
	}
}