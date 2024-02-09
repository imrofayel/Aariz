import 'package:flutter/material.dart';
import 'package:journal/database/db_handler.dart';
import 'package:journal/database/notes.dart';

class DatabaseProvider with ChangeNotifier{

  DatabaseProvider(){
    initDatabase();
  }

  DBHelper dbHelper = DBHelper();

  late Future<List<NotesModel>> notesList;

  initDatabase() async{

    notesList = dbHelper.getNotesList();
    
    notifyListeners();
  }

  int length = 0;

  setLength() async{

    dbHelper.getNotesList().then((value) => length = value.length);

    notifyListeners();
  }

}