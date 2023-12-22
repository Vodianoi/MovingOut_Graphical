
Main main;

enum State {
  Started,
    Paused,
    Ended
}
State gameState = State.Paused;

void setup() {
  size(500, 500);
  frameRate(60);
  main = new Main();
  //surface.setResizable(true);

}

void draw() {
  background(255);
  fill(0);
  text("State : " + gameState, 20, 20);
  if (gameState == State.Started)
  {
    main.update();
  }
  main.display();

}

void keyPressed() {
  if (keyCode == ENTER)
  {
    switch(gameState) {
    case Started:
      gameState = State.Paused;
      println(gameState);
      break;
    case Paused:
      gameState = State.Started;
      println(gameState);
      break;
    case Ended:
      //main = new Main();
      gameState = State.Started;
      println(gameState);
      break;
    }
  } else if (key == '+')
  {
    main.truck.Velocity = new PVector(main.truck.Velocity.x*2, main.truck.Velocity.y*2);
  } else if (key == '-')
  {
    main.truck.Velocity = new PVector(main.truck.Velocity.x/2, main.truck.Velocity.y/2);
  } else if (key == 'h') {
    Settings.AUTO_HEIGHT = !Settings.AUTO_HEIGHT;
  } else if (key == '²') {
    Settings.CONSOLE = !Settings.CONSOLE;
  }
}
