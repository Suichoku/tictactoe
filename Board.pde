class Board {
  
  Tile[][] grid;
  int state;
  
  public Board() {
    
    this.state = 1; // which symbol
    this.grid = new Tile[3][3];
    
    for(int i = 0; i < this.grid.length; i++) {
      for(int j = 0; j < this.grid[i].length; j++) {
        
        this.grid[i][j] = new Tile(new int[]{i, j});
      } // inner for loop
    } // outer for loop
  } // constructor
  
  public int mark(int[] position) {
    if(this.grid[position[0]][position[1]].mark(this.state) == 0) { // if tile already hasn't been marked
    
      this.state *= -1;
      return 0;
    } return -1;
  } // method: mark
  
  public int check() {
    int gridValue = 1; // value of multiplication of all tile values in grid
    
    for(Tile[] row : this.grid) {
      
      int rowValue = 1;
      int sum = 0;
      
      for(Tile tile : row) {
        
        rowValue *= tile.state;
        sum += tile.state;
      } // for row
      
      gridValue *= rowValue;
      
      if(sum == 3 || sum == -3) return sum; // 3 in row 
      
    } // for this.grid
    
    int diagonalSum = 0;
    
    for(int i = 0; i < this.grid.length; i++) { // loop columns
      
      int sum = 0;
      
      for(int j = 0; j < this.grid[i].length; j++) {
        
        sum += this.grid[j][i].state;
        if(i == j) diagonalSum += this.grid[j][i].state; // descending diagonal
        
      } // for j : rows
      
      if(sum == 3 || sum == -3) return sum; // 3 in column
    } // for i : columns
    
    if (diagonalSum == 3 || diagonalSum == -3) return diagonalSum; // 3 in descending diagonal
    
    diagonalSum = this.grid[0][2].state + this.grid[1][1].state + this.grid[2][0].state;
    
    if (diagonalSum == 3 || diagonalSum == -3) return diagonalSum; // 3 in ascending diagonal
    
    if(gridValue != 0) return 2; // is all tiles marked
    
    return 0; // no victory or full board
  } // method: check
} // class
