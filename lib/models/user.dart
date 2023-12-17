class User {
  int? id; // clé primaire de la table
  String username;
  String password;

  User({this.id, required this.username, required this.password});

  // Convertir un utilisateur en une map pour l'insertion dans la base
  Map<String, dynamic> toMap() {
    return {"id": id, "username": username, "password": password};
  }

  // Conversion inverse : crée un utilisateur à partir d'une map extraite de la base de donnée
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
        id: map["id"], username: map["username"], password: map["password"]);
  }

  @override
  String toString() {
    return 'User{id: $id, username: $username, password: $password}';
  }
}
