public class Box {

  public Location actualLocation;
  public Storage storage;
  float weight;


  public Box(Location location, float weight) {
    this.actualLocation = location;
    this.weight = weight;
    this.storage = null;
  }


  // display change en fonction du type d'emplacement (Truck ou Location)
  public void display(int i, float locationX, float locationY) {
    int row = i / actualLocation.getMaxCartonsPerRow();
    int col = i % actualLocation.getMaxCartonsPerRow();

    float x = locationX + 5 + col * 15;
    float y = locationY + 35 + row * 15;

    fill(139, 69, 19);

    if (actualLocation instanceof Truck) {
      rect(locationX + 5 + i * 3, locationY - 25, actualLocation.Size.x /10, actualLocation.Size.y /10);
    } else  if (storage != null) {
      rect(x, y, storage.Size.x / 20, storage.Size.y / 20);
    } else {
      rect(x, y, actualLocation.Size.x /20, actualLocation.Size.y /20);
    }
  }
}
