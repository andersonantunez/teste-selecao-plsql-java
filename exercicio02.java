public class Main
{
	public static void main(String[] args) 
	{		
		for (int x=1; x<=100; x++) 
		{
		    int m3 = (x % 3) == 0;
		    int m5 = (x % 5) == 0;
			System.out.println(((m3 && m5) ? "FooBaa" : ((m3) ? "Foo" : ((m5) ? "Baa": x))));
		}
	}
}