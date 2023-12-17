import 'dart:async';
import 'package:aurlac/models/user.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static Database? _database;
  static const String tableName = 'users';

  // Initialisé la base de donnée
  static Future<void> initDatabase() async {
    _database ??= await openDatabase(
      join(await getDatabasesPath(), 'app_database.db'),
      onCreate: (db, version) {
        return db.execute(
            '''CREATE TABLE $tableName (id INTEGER PRIMARY KEY AUTOINCREMENT, username TEXT, password TEXT)''');
      },
      version: 1,
    );
  }

  // Insère un utilisateur dans la base de donnée
  static Future<void> insertUser(User user) async {
    await _database!.insert(tableName, user.toMap());
  }

  // Récupère tous les utilisateurs
  static Future<List<User>> getUsers() async {
    final List<Map<String, dynamic>> maps = await _database!.query(tableName);
    return List.generate(maps.length, (i) {
      return User.fromMap(maps[i]);
    });
  }
}
