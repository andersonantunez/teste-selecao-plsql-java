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
		System.out.println(((ConcatERemove("aba", 			"aba",		1) == "Sim") ? "Funcionou" : "Não Funcionou"));
		System.out.println(((ConcatERemove("blablablabla", 	"blablab", 	5) == "Sim") ? "Funcionou" : "Não Funcionou"));
		System.out.println(((ConcatERemove("ashley", 		"ash", 		3) == "Sim") ? "Funcionou" : "Não Funcionou"));
		System.out.println(((ConcatERemove("abc", 			"xyz",		6) == "Sim") ? "Funcionou" : "Não Funcionou"));
		System.out.println(((ConcatERemove("xyyyy", 		"yyyz",		9) == "Sim") ? "Funcionou" : "Não Funcionou"));
	}
}