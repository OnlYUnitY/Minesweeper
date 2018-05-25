//
//  ScoreManager.pde
//  Minesweeper
//
//  Created by Wilson Mak on 5/17/2018.
//
ArrayList names;
String msg=""; // name of a person

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
  String[] sorted=new String[names.size()];{ // make temp string array which will be sorted

  for (int i=0;i<names.size();i++) 
  {
    sorted[i]=(String)names.get(i);
  }

  sorted = sort(sorted); // sort temp array

  for (int i=0;i<sorted.length;i++) // make biggest score appear at the top of the list
  {
    println(sorted.length);
    String number=""; 
    String name=sorted[i].substring(3,sorted[i].length()); // get the name of a person

    if (sorted[i].substring(0,1).equals("0")) 
    {
      if (sorted[i].substring(1,2).equals("0"))  
        number=sorted[i].substring(2,3); // example score 005
      else 
        number=sorted[i].substring(1,3); // example score 027
    } 
    else number=sorted[i].substring(0,3); // example score 165
    
    text(name+": "+number,20,40+map(i,0,sorted.length,sorted.length,0)*10); // map makes listing of biggest score at the top
  }

  text("type name and score in \"###name\" manner: "+msg, 20,20);
}

void keyPressed1()
{
  if (key==ENTER)
  {
    names.add(msg);
    msg="";
  }
  else msg+=key;
}
