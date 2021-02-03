public class test {
	public static void main(){
		String x = "abcde";
		[] y = x.toCharArray();

		y[0] = null;
		x = new String(y);
		System.out.println(x);
	}
}
W