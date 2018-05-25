//
//  Minesweeper.pde
//  Minesweeper
//
//  Created by David Moore on 4/26/18.
//

// Height of the GUI tab bar that will display score and other pertinent information.
final float kMinesweeperTabBarHeight = 60;

// Create a new scene.
MinesweeperScene scene = new MinesweeperScene(new Rect(0, kMinesweeperTabBarHeight, 400, 400));

void settings() {
  // Configure the size.
  size((int)(scene.frame().width() + 0.5), (int)(scene.frame().height() + kMinesweeperTabBarHeight + 0.5));
}

void setup() {
  // Set the frame rate.
  frameRate(60);

  // Notify the scene that it has been loaded.
  scene.sceneDidLoad();
}

void draw() {
  // Retrieve the current time for synchronization.
  int currentTime = millis();

  // Call the scene's update method so it may draw itself.
  scene.update(currentTime);
  scene.didFinishUpdate();
  scene.draw(currentTime);

  // TODO: Draw tab bar to display score (i.e., time) and other pertinent information.
}

void mousePressed() {
  // Call the scene's mouseDown method.
  scene.mouseDownAtPoint(new Point(mouseX, mouseY));
}

void mouseDragged() { 
  // Call the scene's mouseMoved method.
  scene.mouseMovedAtPoint(new Point(mouseX, mouseY));
}

void mouseReleased() {
  // Call the scene's mouseUp method.
  scene.mouseUpAtPoint(new Point(mouseX, mouseY));
}

void keyPressed() {
  // Call the scene's key down event.
  scene.keyDownWithEvent(new KeyEvent());
}

void keyReleased() {
  // Call the scene's key up event.
  scene.keyUpWithEvent(new KeyEvent());
}
