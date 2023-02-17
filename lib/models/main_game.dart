import 'dart:math';



class MainGame{
  int _userImage = 1;
  int _cpuImage = 1;
  int userScore = 0;
  int cpuScore = 0;
  int _totalPlayable = 10;
  String winnerCheck= "MATCH START" ;

  MainGame({required int userImage, required int cpuImage, required int totalPlayable}){
    _userImage = userImage;
    _cpuImage = cpuImage;
    _totalPlayable = totalPlayable;
  }
  void check() {
    //1- Rock,2- Paper,3- Scissors
    if (_userImage == _cpuImage) {
        _totalPlayable -= 1;
        winnerCheck = "Draw";
      }

    else if (_userImage == 1 && _cpuImage == 2 ||
        _userImage == 2 && _cpuImage == 3 ||
        _userImage == 3 && _cpuImage == 1) {

        _totalPlayable -= 1;
        cpuScore += 1;
        winnerCheck = "CPU WON";
      }
    else if (_cpuImage == 1 && _userImage == 2 ||
        _cpuImage == 2 && _userImage == 3 ||
        _cpuImage == 3 && _userImage == 1) {
        _totalPlayable -= 1;
        userScore += 1;
        winnerCheck = "USER WON";

    }
    else {
      _totalPlayable -= 1;

      winnerCheck = "Error";

    }
  }
  void rockSet(){
    _userImage = 1;
    _cpuImage = Random().nextInt(3) + 1;
  }
  void paperSet(){
    _userImage = 2;
    _cpuImage = Random().nextInt(3) + 1;
  }
  void scissorSet(){
    _userImage = 3;
    _cpuImage = Random().nextInt(3) + 1;
  }
  void reset(){
    _userImage = 1;
    _cpuImage = 1;
    userScore = 0;
    cpuScore = 0;
    _totalPlayable = 10;
    winnerCheck = "CPU WON";
  }
  int getTotalPlayable(){
    return _totalPlayable;
  }

  int getUserImage() {
    return _userImage;
  }

  int getCpuImage() {
    return _cpuImage;
  }

  String getWinnerCheck() {
    return winnerCheck;
  }

  int getUserScore() {
    return userScore;
  }

  int getCpuScore() {
    return cpuScore;
  }
  void declareWinner(){
    if(cpuScore > userScore){
    winnerCheck = "CPU WON THE GAME";
  }else if (cpuScore < userScore){
      winnerCheck = "USER WON THE GAME";
    }else{
      winnerCheck = "GAME DRAW";
    }
  }
}
