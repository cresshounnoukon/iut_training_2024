import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class PersonService {
  static Database? _database;
  static const String _tableName = 'persons';

  Future<void> _initDatabase() async {
    if (_database == null) {
      _database = await openDatabase(
        join(await getDatabasesPath(), 'persons_database.db'),
        onCreate: (db, version) {
          return db.execute(
            'CREATE TABLE $_tableName(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)',
          );
        },
        version: 1,
      );
    }
  }

  Future<void> insertPerson(Person person) async {
    await _initDatabase();
    await _database!.insert(
      _tableName,
      person.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Person>> getPersons() async {
    await _initDatabase();
    final List<Map<String, dynamic>> maps = await _database!.query(_tableName);
    return List.generate(maps.length, (i) {
      return Person(
        id: maps[i]['id'],
        name: maps[i]['name'],
        age: maps[i]['age'],
      );
    });
  }

  Future<void> updatePerson(Person person) async {
    await _initDatabase();
    await _database!.update(
      _tableName,
      person.toMap(),
      where: 'id = ?',
      whereArgs: [person.id],
    );
  }

  Future<void> deletePerson(int id) async {
    await _initDatabase();
    await _database!.delete(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}

class Person {
  final int? id;
  final String name;
  final int age;

  Person({this.id, required this.name, required this.age});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'age': age,
    };
  }
}