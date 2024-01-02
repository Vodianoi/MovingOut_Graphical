public class Box {

  public Location actualLocation;
  float weight;


  public Box(Location location, float weight) {
    this.actualLocation = location;
    this.weight = weight;
  }


  // display change en fonction du type d'emplacement (Truck ou Location)
  public void display(int i, float locationX, float locationY) {
    int row = i / actualLocation.getMaxCartonsPerRow();
    int col = i % actualLocation.getMaxCartonsPerRow();

    float x = locationX + 5 + col * 15;
    float y = locationY + 35 + row * 15;

    fill(139, 69, 19);

    if (actualLocation instanceof Truck) {
      rect(locationX + 5 + i * 3, locationY - 25, 20, 20);
    } else {
      rect(x, y, 10, 10);
    }
  }
}
