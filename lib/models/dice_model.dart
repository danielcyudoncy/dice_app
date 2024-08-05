class DiceModel {
  int number;
  int rollCount;
  int totalSum;
  final int maxRolls = 6; 
  List<int> rollResults; 

  DiceModel({
    this.number = 1,
    this.rollCount = 0,
    this.totalSum = 0,
    List<int>? rollResults, 
  }) : rollResults = rollResults ?? [];
}
