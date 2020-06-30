import 'package:flutter/material.dart';

class Board extends ChangeNotifier {
  List<List<String>> _board;
  List<int> _actInd;

  List<List<String>> get board => this._board;

  List<int> get actInd => this._actInd;
  set actInd(List<int> val){
    this._actInd = val;
    notifyListeners();
  }

  Board(){
    this._board = [["","","d",""],["","","1",""],["","","",""],["","","f",""],];
    this._actInd = [1,0];
  }

  String boardState(){
    String resp = "";
    for (var i = 0; i < 4; i++) {
      for (var j = 0; j < 4; j++) {
        resp += ( ( this._board[i][j] != "" ) ? this._board[i][j] : " " );
      }
      resp += "\n";
    }
    return resp;
  }
  
}