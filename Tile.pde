class Tile {

  int[] position; // tile position in array
  int state; // tile symbol state (0 = empty, 1 = X, -1 = O)
  
  public Tile(int[] position) {
    
    this.position = position;
    this.state = 0; // initialize state as empty
  } // constructor
  
  public int mark(int state) {
    
    if(this.state == 0) { // change state if tile is empty
    
      this.state = state;
      return 0; // change was done
    } return -1; // change didn't happen
  } // method: mark
} // class
