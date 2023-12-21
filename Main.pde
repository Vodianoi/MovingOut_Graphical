final int totalCartons = 200;
final int capacity = 9;
final int truckBaseSpeed = 2;

public class Main {
  Truck truck;
  Location oldLocation;
  Location newLocation;

  // Init des différentes données membre
  public Main() {
    truck = new Truck(50, 400, 20, 30, color(204, 153, 0), new PVector(truckBaseSpeed, truckBaseSpeed), capacity);
    oldLocation = new Location("Ancien Local", 100, 300, 150, 100, color(150, 150, 150));
    newLocation = new Location("Nouveau Local", 300, 300, 150, 100, color(225,33,107));

    oldLocation.setCartons(totalCartons);
  }

  public void update() {
    truck.move();
  }

  public void display() {
    oldLocation.display();
    newLocation.display();
    truck.display();
  }
}
