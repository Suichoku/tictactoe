// Gameboard which holds tiles and does most of the game logic
class Board {
  
  Tile[][] grid; // all tiles
  int state; // current symbol (O = -1 & X = 1)
  
  public Board() {
    
    this.state = 1; // set starting symbol as X
    this.grid = new Tile[3][3];
    
    for(int i = 0; i < this.grid.length; i++) { // initialize board with tiles
      for(int j = 0; j < this.grid[i].length; j++) {
        
        this.grid[i][j] = new Tile(new int[]{i, j});
      } // inner for loop
    } // outer for loop
  } // constructor
  
  // mark position with current symbol
  // returns: 
  // 0 = tile state was changed
  //-1 = tile state wasnt changed
  public int mark(int[] position) {
    if(this.grid[position[0]][position[1]].mark(this.state) == 0) { // if tile already hasn't been marked
    
      this.state *= -1; // switch symbol to another one
      return 0;
    } return -1;
  } // method: mark
  
  // check if game is over
  // returns:
  // 3 : X has won
  //-3 : O has won
  // 2 : board is full
  // 0 : game isn't over
  public int check() {
    int gridValue = 1; // value of multiplication of all row values in grid
    
    for(Tile[] row : this.grid) {
      
      int rowValue = 1; // value of multiplication of all tile values in row
      int sum = 0; // sum of row (3 : X won, -3 : O won, anything else: no one won)
      
      for(Tile tile : row) {
        
        rowValue *= tile.state;
        sum += tile.state;
      } // for row
      
      gridValue *= rowValue;
      
      if(sum == 3 || sum == -3) return sum; // 3 same symbols in row 
      
    } // for this.grid
    
    int diagonalSum = 0; // sum for diagonal symbols, same rules as for row sums
    
    for(int i = 0; i < this.grid.length; i++) { // loop columns
      
      int sum = 0; // holds sum of current column, same rules as for row sums
      
      for(int j = 0; j < this.grid[i].length; j++) { // loop rows in current column
        
        sum += this.grid[j][i].state;
        if(i == j) diagonalSum += this.grid[j][i].state; // descending diagonal
        
      } // for j : rows
      
      if(sum == 3 || sum == -3) return sum; // 3 in column
    } // for i : columns
    
    if (diagonalSum == 3 || diagonalSum == -3) return diagonalSum; // 3 same symbols in descending diagonal
    
    diagonalSum = this.grid[0][2].state + this.grid[1][1].state + this.grid[2][0].state; // calculate descending diagonal sum
    
    if (diagonalSum == 3 || diagonalSum == -3) return diagonalSum; // 3 same symbols in ascending diagonal
    
    if(gridValue != 0) return 2; // is all tiles marked
    
    return 0; // no victory or full board
  } // method: check
} // class
