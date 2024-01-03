public class Truck extends Location
{
  public PVector Velocity;
  public int Capacity;
  public float MaxWeight;

  private boolean goToNewLocation;
  
  private PImage image;
  


  public Truck(float x, float y, float w, float h, color col, PVector velocity, int capacity, float maxWeight) {
    super("Camion", x, y, w, h, col);
    goToNewLocation = false;
    Velocity = velocity;
    Capacity = capacity;
    MaxWeight = maxWeight;
  }

  public void display() {
    float x = this.Position.x;
    float y = this.Position.y;
    //fill(255, 0, 0);
    
    image = goToNewLocation ? loadImage("truckFlipped.png") : loadImage("truck.png");

    image(image, x, y, 50, 30);
    for (int i = 0; i < Boxes.size(); i++) {
      Boxes.get(i).display(i, Position.x, Position.y);
    }
  }


  public void move() {
    if (main.oldLocation.Boxes.size() == 0 && this.Boxes.size() == 0)
    {
      gameState = State.Ended;
      //main.switchLocation();
    }
    if (goToNewLocation) {
      if (Position.x < main.newLocation.Position.x + main.newLocation.Size.x/2) {
        Position.x += Velocity.x;
      } else {
        // Vide le camion dans newLocation
        emptyTruckTo(main.newLocation);
        main.newLocation.sortInStorages();
        goToNewLocation = false;
      }
    } else {
      if (Position.x > main.oldLocation.Position.x + main.oldLocation.Size.x/2) {
        Position.x -= Velocity.x;
      } else {
        // Rempli le camion
        fillTruck();

        goToNewLocation = true;
      }
    }
  }

  private void emptyTruckTo(Location loc) {
    int count = Boxes.size();
    while (Boxes.size() > 0) {
      this.popCartonTo(loc);
    }
    println("Camion a déposé " + count + " cartons dans le nouveau local");
  }

  private void fillTruck() {
    // Vérifie qu'il y a assez de cartons pour remplir le camion
    float weight = 0;
    int min = min(Capacity, main.oldLocation.Boxes.size());
    for (int i = 0; i < min; i++)
    {
      if(weight + main.oldLocation.Boxes.get(main.oldLocation.Boxes.size() - 1).weight > MaxWeight)
      {
        break;
      }
      weight += main.oldLocation.Boxes.get(main.oldLocation.Boxes.size() - 1).weight;
      main.oldLocation.popCartonTo(this);
    }
  }
}
