class ScoreManager {
  String data[]; //Array for textfile to load into
  ScoreSet scoreSets[]; //Array of score sets
  ScoreManager(String dataFile) { //Get file name
    data = loadStrings(dataFile); //Load file
    scoreSets = new ScoreSet[data.length + 1]; //Allow space for player and all current data

    for (int i = 0; i < data.length; i++) {
      String set[] = split(data[i], ":");
      scoreSets[i] = new ScoreSet(set[0], int(set[1])); //sets up all data from file
    }
  }

  void sortData() { //Insertion sort, highest scores at top
    int i;
    int j;
    ScoreSet comp;
    int size = scoreSets.length;
    for (j = 1; j < size; j++) {
      comp = scoreSets[j];
      for (i = j - 1; i >= 0 && scoreSets[i].time > comp.time; i--) { //Compares scoreSets score value
        scoreSets[i + 1] = scoreSets[i];
      }
      scoreSets[i + 1] = comp;
    }
  }

  void setPlayerScore(String name, float time) { //Time is in secounds
    scoreSets[data.length] = new ScoreSet(name, time); //Set player score
  }

  void saveData() {
    String freshData[] = new String[scoreSets.length];
    for (int i = 0; i < scoreSets.length; i++) {
      freshData[i] = scoreSets[i].name + ":" + scoreSets[i].time;
    }
    saveStrings("scores.txt", freshData); //Change to original text file
  }

  void display() {
    fill(255); //White text
    textSize(35);
    text("NAME", SCREEN_WIDTH_CENTRE - 200, 50); //Headers
    text("SCORE", SCREEN_WIDTH_CENTRE + 100, 50);
    for (int i = 0; i < scoreSets.length; i++) { //Display score data
      text(scoreSets[i].name + ":", SCREEN_WIDTH_CENTRE - 200, (i * 50) + 100);
      text(scoreSets[i].time, SCREEN_WIDTH_CENTRE + 100, (i * 50) + 100);
    }
  }

  class ScoreSet { //A type to store both name and score
    String name;
    float time;
    ScoreSet(String name, float time) {
      this.name = name;
      this.time = time;
    }
  }
}
