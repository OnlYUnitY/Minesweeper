//
//  ScoreManager.pde
//  Minesweeper
//
//  Created by Wilson Mak on 5/17/2018.
//

final String ScoreManageFilePath = "Data/scores.json";

class ScoreManager {
  ArrayList<Score> scores; //Array of score sets

  ScoreManager() {
    Coder aCoder = new Coder(ScoreManageFilePath); //Get file name
    scores = aCoder.decodeArrayForKey("Score"); //Decode Data from JSON file to array
  }

  void sortData() { //Insertion sort, lowest times at top
    int i;
    int j;
    Score comp;
    int size = scores.size();
    for (j = 1; j < size; j++) {
      comp = scores.get(j);
      for (i = j - 1; i >= 0 && scores.get(i).time > comp.time; i--) { //Compares scoreSets score value
        scores.set(i + 1, scores.get(i));
      }
      scores.set(i + 1, comp);
    }

    Coder aCoder = new Coder(ScoreManageFilePath);
    aCoder.encodeArrayForKey(scores, "Score"); //Encode data for JSON file
    aCoder.writeToFilePath(ScoreManageFilePath); //Write to JSON file
  }

  void addScore(Score score) {
    scores.add(score);
    sortData();
  }

  ArrayList getScores() {
    return scores;
  }
}
