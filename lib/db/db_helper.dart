import 'package:panda/model/task.dart';
import 'package:sqflite/sqflite.dart';

final String taskTable = 'task';
final String colId = 'id';
final String colTitle = 'title';
final String colNote = 'note';
final String colDate = 'date';
final String colStartTime = 'startTime';
final String colEndTime = 'endTime';
final String colRemind = 'remind';
final String colRepeat = 'repeat';
final String colColor = 'color';
final String colIsCompleted = 'isCompleted';

class DBHelper {
  static Database _database;
  static DBHelper _dbHelper;
  DBHelper._createInstance();
  factory DBHelper() {
    if (_dbHelper == null) {
      _dbHelper = DBHelper._createInstance();
    }
    return _dbHelper;
  }
  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  //Creating and initializing the SQLite database with the table and its related columns
  static Future<Database> initializeDatabase() async {
    // Get the directory path for both Android and iOS to store database.

    String path = await getDatabasesPath() + 'tasks.db';
    var database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute('''
      CREATE TABLE $taskTable(
      $colId INTEGER PRIMARY KEY AUTOINCREMENT,
      $colTitle TEXT NOT NULL,
      $colNote TEXT NOT NULL,
      $colDate TEXT NOT NULL,
      $colStartTime TEXT NOT NULL,
      $colEndTime TEXT NOT NULL,
      $colRepeat TEXT NOT NULL,
      $colRemind TEXT NOT NULL,
      $colColor INTEGER NOT NULL,
      $colIsCompleted INTEGER NOT NULL)
      ''');
      },
    );
    return database;
  }

  //Insert a new player to the database
  Future<int> insert(Task task) async {
    Database db = await this.database;
    var result = db.insert(taskTable, task.toJson());
    print('Ramin check the result: $result');
    return result ?? 1;
  }
}
