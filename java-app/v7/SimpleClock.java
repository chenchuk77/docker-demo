import java.util.*;
import java.util.concurrent.TimeUnit;

public class SimpleClock{
  public static void main(String args[]) throws Exception{

    String hostname = System.getenv("HOSTNAME");
    String jvmVersion = System.getProperty("java.version");
    while(true){
      Date date = new Date();
      System.out.println(hostname + ":jvm-" + jvmVersion + ":Today is " + date);
      TimeUnit.SECONDS.sleep(1);
    }
  }
}
