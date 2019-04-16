// Does most of graphics
class Graphics {
  int tileWidth;
  int tileHeight;
  
  public Graphics(int tileWidth, int tileHeight) {
    
    this.tileWidth = tileWidth;
    this.tileHeight = tileHeight;
  } // constructor
  
  // Normalize mousePosition to tilePosition
  public int[] normalizePosition(int x, int y) {
    
    return new int[] {
      (int) y / tileHeight, // normalize y position
      (int) x / tileWidth   // normalize x position
    }; // return
  } // method: normalizePosition
  
  // Draw grid lines
  // parameter: size = board size in tiles
  public void drawGrid(int[] size) {
    stroke(200);
    strokeWeight(2);
    for(int i = 1; i < size[0]; i++) { // draw row lines
      line(0, i * tileHeight, width, i * tileHeight);
    } // for loop rows
    for(int i = 1; i < size[1]; i++) { // draw column lines
      line(i * tileWidth, 0, i * tileWidth, height);
    } // for loop columns
  } // method: drawGrid
  
  // Draw symbols (X & O)
  // parameter: size = board size in tiles
  public void drawSymbols(int[] size, Board b) {
    textAlign(CENTER, CENTER);
    for(int i = 0; i < size[0]; i++) { // loop all tiles
      for(int j = 0; j < size[1]; j++) {
        textSize(min(tileWidth, tileHeight) * 0.8);
        String t;
        if(b.grid[i][j].state == -1) { // set symbol as O if tile state is -1
          t = "O";
          fill(230,255,230); // very light green color
        }
        else if(b.grid[i][j].state == 1) { // set symbol as X if tile state is 1
          t = "X";
          fill(255,230,230); // very light red color
        }
        else t = " "; // empty tile
        text(t, j * tileWidth, i * tileHeight - tileHeight * 0.1, tileWidth, tileHeight);
      } // for loop columns
    } // for loop rows
    
  } // method: drawSymbols
  
  // draw victory screen based on winner information (winner = Board.check() return)
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
