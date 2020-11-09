import coffee.Coffee;

public class Main {

  public static void main(String[] args) throws Exception {
    String name = System.getenv("RIT_NAME");
    String type = System.getenv("RIT_COFFEE_TYPE");
    boolean delivery = Boolean.parseBoolean(System.getenv("RIT_DELIVERY"));
    Coffee coffee = new Coffee(name, type, delivery);
    coffee.Prepare();
  }
}
