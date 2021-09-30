import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:keep_moving/models/my_vehilce.dart';

const String tableVehicles = 'vehicles';

class VehiclesDatabase {
  static final VehiclesDatabase instance = VehiclesDatabase._init();

  static Database? _database;

  VehiclesDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('vehicles.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    print('in _initDB');
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';
    final boolType = 'BOOLEAN NOT NULL';
    final integerType = 'INTEGER NOT NULL';

    await db.execute('''
CREATE TABLE $tableVehicles ( 
  ${VehicleFields.id} $idType, 
  ${VehicleFields.brand} $textType,
  ${VehicleFields.model} $textType,
  ${VehicleFields.fuelType} $textType,
  ${VehicleFields.modelId} $textType,
  ${VehicleFields.regNumber} $textType
  )
''');
  }

  Future<MyVehicle> create(MyVehicle myVehicle) async {
    final db = await instance.database;

    // final json = note.toJson();
    // final columns =
    //     '${NoteFields.title}, ${NoteFields.description}, ${NoteFields.time}';
    // final values =
    //     '${json[NoteFields.title]}, ${json[NoteFields.description]}, ${json[NoteFields.time]}';
    // final id = await db
    //     .rawInsert('INSERT INTO table_name ($columns) VALUES ($values)');

    final id = await db.insert(tableVehicles, myVehicle.toJson());
    return myVehicle.copy(id: id);
  }

  Future<MyVehicle> getVehicle(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      tableVehicles,
      columns: VehicleFields.values,
      where: '${VehicleFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return MyVehicle.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<MyVehicle>> getAllVehicles() async {
    final db = await instance.database;

    //final orderBy = '${NoteFields.time} ASC';
    // final result =
    //     await db.rawQuery('SELECT * FROM $tableNotes ORDER BY $orderBy');

    final result = await db.query(tableVehicles);

    return result.map((json) => MyVehicle.fromJson(json)).toList();
  }

  Future<int> update(MyVehicle note) async {
    final db = await instance.database;

    return db.update(
      tableVehicles,
      note.toJson(),
      where: '${VehicleFields.id} = ?',
      whereArgs: [note.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;

    return await db.delete(
      tableVehicles,
      where: '${VehicleFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
