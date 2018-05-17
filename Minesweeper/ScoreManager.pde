class ScoreManager {
  ArrayList<Score> scores; //Array of score sets
  Coder aCoder;
  ScoreManager() { 
    aCoder = new Coder("scores.JSON"); //Get file name 
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
    aCoder.encodeArrayForKey(scores, "Score"); //Encode data for JSON file
    aCoder.writeToFilePath("scores.JSON"); //Write to JSON file
  }

  void addScore(Score score) {
    scores.add(score);
  }

  ArrayList getScores() {
    return scores;
  }
}
