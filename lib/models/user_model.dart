import 'dart:convert';

class User {
  final String id;
  final String email;
  final String name;
  final String token;
  final String password;

  User(
      {required this.id,
      required this.email,
      required this.name,
      required this.token,
      required this.password});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'name': name,
      'token': token,
      'password': password,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
        id: map['_id'] as String,
        email: map['email'] as String,
        name: map['name'] as String,
        token: map['token'] as String,
        password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}
