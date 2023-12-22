public class Storage {

  public String Name;
  public PVector Position;
  public PVector Size;
  public color Color;
  public LinkedList<Box> Boxes;

  public float weightCeil;


  public Storage(String name, float x, float y, float w, float h, color col, float weightCeil)
  {
    Name = name;
    Position = new PVector(x, y);
    Size = new PVector(w/4, h/4);
    Color = col;
    Boxes = new LinkedList();
    this.weightCeil = weightCeil;
  }

  public int getMaxCartonsPerRow() {
    return int(Size.x / 15);
  }


  void display() {
    float x = Position.x;
    float y = Position.y;
    float w = Size.x;
    float h = Size.y;

    fill(Color);
    rect(x, y, w, h);
  }
}
