class Graphics {
  int tileWidth;
  int tileHeight;
  
  public Graphics(int tileWidth, int tileHeight) {
    
    this.tileWidth = tileWidth;
    this.tileHeight = tileHeight;
  } // constructor
  
  public int[] normalizePosition(int x, int y) {
    
    return new int[] {
      (int) y / tileHeight,
      (int) x / tileWidth
    }; // return
  } // method: normalizePosition
  
  public void drawGrid(int[] size) {
    stroke(200);
    strokeWeight(2);
    for(int i = 1; i < size[0]; i++) {
      line(0, i * tileHeight, width, i * tileHeight);
    } // for loop rows
    for(int i = 1; i < size[1]; i++) {  
      line(i * tileWidth, 0, i * tileWidth, height);
    } // for loop columns
  } // method: drawGrid
  
  public void drawSymbols(int[] size, int[] res, Board b) {
    textAlign(CENTER, CENTER);
    for(int i = 0; i < size[0]; i++) {
      for(int j = 0; j < size[1]; j++) {
        textSize(min(res[0], res[1]) * 0.8);
        String t;
        if(b.grid[i][j].state == -1) {
          t = "O";
          fill(230,255,230);
        }
        else if(b.grid[i][j].state == 1) {
          t = "X";
          fill(255,230,230);
        }
        else t = " ";
        text(t, j * tileWidth, i * tileHeight - tileHeight * 0.1, tileWidth, tileHeight);
      } // for loop columns
    } // for loop rows
    
  } // method: drawSymbols
  
  public void gameWin(int winner) {
    String t = "";
    background(20,20,30);
    textAlign(CENTER, CENTER);
    textSize(min(width, height) * 0.1);
    fill(200,230,245);
    if(winner == 3) t = "Winner is X!";
    else if(winner == -3) t = "Winner is O!";
    else if(winner == 2) t = "Draw!";
    
    text(t, 0, 0 - height * 0.03, width, height);
  } // method: gameWin
} // class
