import 'dart:async';
import 'dart:io';
import 'package:aurlac/models/user.dart';
import 'package:aurlac/models/products.dart';
import 'package:sqflite/sqflite.dart';
import 'package:excel/excel.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static Database? _database;
  static const String tableName = 'users';
  static const String productTable = 'products';

  // Initialisé la base de donnée
  static Future<void> initDatabase() async {
    _database ??= await openDatabase(
      join(await getDatabasesPath(), 'app_database.db'),
      onCreate: (db, version) async {
        await db.execute(
            '''CREATE TABLE $tableName (id INTEGER PRIMARY KEY AUTOINCREMENT, username TEXT, password TEXT)''');
        await db.execute(
            '''CREATE TABLE $productTable (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, weigth REAL, color TEXT, stockQuantity INTEGER)''');
        await importProductFromExcel('assets/documents/products.xlsx');
      },
      version: 1,
    );
  }

  // Insère un produit dans la base de données
  static Future<void> insertProduct(Product product) async {
    await _database!.insert(productTable, product.toMap());
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

  // Importer la liste des produits depuis un fichier excel
  static Future<void> importProductFromExcel(String excelFilePath) async {
    final excel = Excel.decodeBytes(await File(excelFilePath).readAsBytes());
    final sheet = excel.tables.keys.first;

    for (final row in excel.tables[sheet]!.rows) {
      final productName = row[0].toString();
      final productWeight = double.parse(row[1].toString());
      final productColor = row[2].toString();
      final stockQuantity = int.parse(row[3].toString());

      final product = Product(
          name: productName,
          weight: productWeight,
          color: productColor,
          stockQuantity: stockQuantity);

      await insertProduct(product);
    }
  }

  // Récupère tous les produits
  static Future<List<Product>> getProducts() async {
    final List<Map<String, dynamic>> maps =
        await _database!.query(productTable);
    return List.generate(maps.length, (i) {
      return Product.fromMap(maps[i]);
    });
  }
}
