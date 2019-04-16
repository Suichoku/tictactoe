Graphics gfx;
Board board;
int[] tRes;
boolean win;
int time;

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
  if(!win){
    background(25);
    gfx.drawGrid(new int[]{3, 3});
    gfx.drawSymbols(new int[]{3, 3}, tRes, board);
  }
  if(win && millis() >= time + 2000) {
    win = false;
    board = new Board();
  }
}

void mousePressed() {
  if(mouseButton == LEFT) {
    int[] position = gfx.normalizePosition(mouseX, mouseY);
    int ok = board.mark(position);
    if(ok == 0 && board.check() != 0) {
      win = true;
      time = millis();
      gfx.gameWin(board.check());
    };
  }
}
