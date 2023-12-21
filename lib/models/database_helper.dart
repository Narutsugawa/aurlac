import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:aurlac/models/user.dart';
import 'package:aurlac/models/product.dart';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:excel/excel.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static Database? _database;
  static const String tableName = 'users';
  static const String productTable = 'products';

  // Initialiser la base de données
  static Future<void> initDatabase() async {
    try {
      print('Création de la table');
      _database ??= await openDatabase(
        join(await getDatabasesPath(), 'app_database.db'),
        onCreate: (db, version) async {
          try {
            await db.execute(
                '''CREATE TABLE $tableName (id INTEGER PRIMARY KEY AUTOINCREMENT, username TEXT, password TEXT)''');
            await db.execute(
                '''CREATE TABLE IF NOT EXISTS $productTable (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, weight REAL, color TEXT, stockQuantity INTEGER)''');
          } catch (e) {
            print('Erreur lors de la création des tables : $e');
          }
        },
        version: 1,
      );
      await importProductFromExcel('assets/documents/products.xlsx');
      print('Base de données initialisée');
    } catch (e) {
      print('Erreur lors de l\'ouverture de la base de données : $e');
    }
  }

  // Insérer un produit dans la base de données
  static Future<void> insertProduct(Product product) async {
    await _database!.insert(productTable, product.toMap());
  }

  // Insérer un utilisateur dans la base de données
  static Future<void> insertUser(User user) async {
    await _database!.insert(tableName, user.toMap());
  }

  // Récupérer tous les utilisateurs
  static Future<List<User>> getUsers() async {
    final List<Map<String, dynamic>> maps = await _database!.query(tableName);
    return List.generate(maps.length, (i) => User.fromMap(maps[i]));
  }

  // Importer la liste des produits depuis un fichier Excel
  static Future<void> importProductFromExcel(String excelFilePath) async {
    try {
      final ByteData data =
          await rootBundle.load('assets/documents/products.xlsx');
      final List<int> bytes = data.buffer.asUint8List();
      final excel = Excel.decodeBytes(Uint8List.fromList(bytes));
      final sheet = excel.tables.keys.first;

      print('Nombre de lignes : ${excel.tables[sheet]!.rows.length}');

      for (final row in excel.tables[sheet]!.rows) {
        final productName = row[0]?.props.first.toString();
        //get quantity before unit(KG, L) from exemple 25KG or 1L as product weight using split and regexp if there is unit, else parse the number
        final productWeight = double.parse(
            row[1]?.props.first.toString().split(RegExp(r'[A-Z]')).first ??
                (row[1]?.props.first.toString() ?? '0'));
        final productColor = row[2]?.props.first.toString();
        final stockQuantity = int.parse(row[3]?.props.first.toString() ?? '0');

        // print('Nom du produit : $productName');
        // print('Poids du produit : $productWeight');
        // print('Couleur du produit : $productColor');
        // print('Quantité en stock : $stockQuantity \n\n');

        final product = Product(
          name: productName!,
          weight: productWeight,
          color: productColor!,
          stockQuantity: stockQuantity,
        );
        print('Produit importé : $product');
        await insertProduct(product);
      }
    } catch (e) {
      print('Erreur lors de l\'importation depuis Excel : $e');
    }
  }

  // Récupérer tous les produits
  static Future<List<Product>> getProducts() async {
    final List<Map<String, dynamic>> maps =
        await _database!.query(productTable);
    return List.generate(maps.length, (i) => Product.fromMap(maps[i]));
  }
}
