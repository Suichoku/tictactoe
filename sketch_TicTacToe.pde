Graphics gfx; // does drawing
Board board; // holds tiles
boolean win; // game state
int time; // current time

void setup() {
  int w = 200;
  int h = 200;
  win = false;
  tRes = new int[]{w, h};
  gfx = new Graphics(w, h);
  board = new Board();
  size(600, 600);
  background(255);
}

void draw() {
  if(!win){ // game is still going
    background(25);
    gfx.drawGrid(new int[]{3, 3}); // draw grid
    gfx.drawSymbols(new int[]{3, 3}, board); // draw symbols
  }
  if(win && millis() >= time + 2000) { // wait on victory screen for 2 seconds
    win = false;
    board = new Board(); // reset game
  }
}

void mousePressed() {
  if(mouseButton == LEFT) {
    int[] position = gfx.normalizePosition(mouseX, mouseY); // get mouse position as tile position
    board.mark(position); // mark tile with either X or O depending of board state
    if(board.check() != 0) { // check if game is won or all tiles are marked
      win = true;
      time = millis(); // get current time for delay
      gfx.gameWin(board.check()); // draw victory screen
    };
  }
}
