//
//  Score.pde
//  Minesweeper
//
//  Created by Wilson Mak on 5/17/2018.
//

class Score extends Codable { //A type to store both name and score
  String name;
  int time;

  void setName(String name) {
    this.name = name;
  }

  void setTime(int time) {
    this.time = time;
  }

  Score(String name, int time) {
    super();
    this.name = name;
    this.time = time;
  }

  Score(Coder aCoder) {
    super(aCoder);
    setName(aCoder.decodeStringForKey("name"));
    setTime(aCoder.decodeIntForKey("time"));
  }

  public void encodeWithCoder(Coder aCoder) {
    aCoder.encodeStringForKey(name, "name");
    aCoder.encodeIntForKey(time, "time");
  }
}
