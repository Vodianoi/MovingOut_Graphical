import java.util.LinkedList;
public class Location
{
  public String Name;
  public PVector Position;
  public PVector Size;
  public color Color;
  public LinkedList<Box> Boxes;

  public Location(String name, float x, float y, float w, float h, color col) {
    Name = name;
    Position = new PVector(x, y);
    Size = new PVector(w, h);
    Color = col;
    Boxes = new LinkedList();
  }

  public void display() {
    
    //Calcul de la hauteur automatique
    float boxHeight = map(Boxes.size(), 0, capacity, Size.y / 1.13, Size.y);  
    float roofHeight = Size.y - boxHeight;
    
    // Disable automatic roofHeight
    if(!Settings.AUTO_HEIGHT)
    {
      boxHeight = Size.y;
      roofHeight = 0;
    }

    // Batiment
    fill(this.Color);
    rect(Position.x, Position.y + roofHeight, Size.x, boxHeight);

    // Toit
    fill(150);
    triangle(Position.x, Position.y + roofHeight, Position.x + Size.x, Position.y + roofHeight, Position.x + Size.x / 2, Position.y + roofHeight - 20);
  
    // Nom + nombre de cartons
    fill(getTextColor(this.Color));
    text(Name + ": " + Boxes.size(), Position.x + 20, Position.y + roofHeight + 20);
    
    // affichage des cartons
    for (int i = 0; i < Boxes.size(); i++) {
      Boxes.get(i).display(i, Position.x, Position.y + roofHeight);
    }
  }



  public void setCartons(int nbCartons) {
    for (int i = 0; i < nbCartons; i++) {
      Boxes.push(new Box(this));
    }
  }

  // Enlève un carton de this et le place dans newLocation
  public void popCartonTo(Location newLocation)
  {
    Box carton = Boxes.pop();
    carton.actualLocation = newLocation;
    newLocation.Boxes.push(carton);
  }

  // Calcul du nombre de carton max par ligne
  public int getMaxCartonsPerRow() {
    return int(Size.x / 15); 
  }


  // Code récupéré pour calculer la bonne couleur en fonction du fond (ça marche pas lol)
  private color getTextColor(color bgColor) {
    // Calculate the brightness of the background color
    float brightness = brightness(bgColor);

    // Choose the text color based on background brightness
    if (brightness > 128) {
      return 0;  // Black text for light backgrounds
    } else {
      return 255;  // White text for dark backgrounds
    }
  }
}
