import 'package:loggy/loggy.dart';
import 'package:sqflite/sqflite.dart' as sql;
// ignore: depend_on_referenced_packages
import 'package:path/path.dart' as path;
import 'package:sqflite/sqlite_api.dart';
import 'package:uuid/uuid.dart';


class AppDatabase {
  
  AppDatabase() {
    database();
  }

  Future<void> createContactTable(Database db) async {

    await db.execute('''CREATE TABLE IF NOT EXISTS appcontacts(
      id TEXT PRIMARY KEY,              -- Local UUID or other unique ID
      phoneContactId TEXT,             -- ID if from phone
      name TEXT,
      email TEXT,
      phone TEXT,
      created_at TEXT,
      updated_at TEXT
    );''');

    //await db.execute("DROP TABLE toilet;");
  }



  Future<void> createTables(Database db) async {
    await createContactTable(db);
  }

  Future<Database> database() async {  
    final dbPath = await sql.getDatabasesPath();
    
    return await sql.openDatabase(
      path.join(dbPath,'mydiary.db'),
      onCreate: (db, version) async {
        await createTables(db);
      },
      version: 1,
      onConfigure: _onConfigure
    );
  }

  //Enables foreign keys to work
  static Future _onConfigure(Database db) async {
    await db.execute('PRAGMA foreign_keys = ON');
    await db.execute('PRAGMA auto_vacuum=FULL');
  }

  // Future<void> insertToilet(Map<String, dynamic> backendToilet) async {
  //   final db = await database();

  //   // Convert nullable bools to int (SQLite doesn't have boolean type)
  //   int? boolToInt(dynamic val) => val == null ? null : (val == true ? 1 : 0);

  //   String localId = const Uuid().v4();

  //   await db.insert(
  //     'toilet',
  //     {
  //       'id': localId,
  //       'toiletId': backendToilet['id'],
  //       'created_at': backendToilet['created_at'],
  //       'updated_at': backendToilet['updated_at'],
  //       'verified_at': backendToilet['verified_at'],
  //       'active': boolToInt(backendToilet['active']),
  //       'latitude': backendToilet['latitude'],
  //       'longitude': backendToilet['longitude'],
  //       'name': backendToilet['name'],
  //       'opening_times': backendToilet['opening_times'],
  //       'accessible': boolToInt(backendToilet['accessible']),
  //       'men': backendToilet['men'] is int ? backendToilet['men'] : null,
  //       'women': backendToilet['women'] is int ? backendToilet['women'] : null,
  //       'all_gender': backendToilet['all_gender'] is int ? backendToilet['all_gender'] : null,
  //       'baby_change': backendToilet['baby_change'] is int ? backendToilet['baby_change'] : null,
  //       'children': backendToilet['children'] is int ? backendToilet['children'] : null,
  //       'urinal_only': boolToInt(backendToilet['urinal_only']),
  //       'radar': backendToilet['radar'] is int ? backendToilet['radar'] : null,
  //       'automatic': backendToilet['automatic'] is int ? backendToilet['automatic'] : null,
  //       'no_payment': boolToInt(backendToilet['no_payment']),
  //       'payment_details': backendToilet['payment_details'],
  //       'notes': backendToilet['notes'],
  //       'removal_reason': backendToilet['removal_reason'],
  //       'attended': backendToilet['attended'] is int ? backendToilet['attended'] : null,
  //       'geohash': backendToilet['geohash'],
  //       'area_name': backendToilet['area_name'],
  //       'area_type': backendToilet['area_type'],
  //     },
  //     conflictAlgorithm: ConflictAlgorithm.replace, // Replace if toiletId already exists
  //   );

  // }

  Future<void> insertContactFromObject(AppContact contact) async {
    final db = await database();

    await createTables(db);

    String localId = const Uuid().v4();
    DateTime dt = DateTime.now();

    await db.insert(
      'toilet',
      {
        'id': localId,
        'name' : contact.name,
        'email' : contact.email,
        'phone' : contact.phone,
        'created_at' : dt.toIso8601String(),
        'updated_at' : dt.toIso8601String(), 
      },
      conflictAlgorithm: ConflictAlgorithm.replace, // Replace if toiletId already exists
    );

  }


  Future<void> removeAppContactFromObject(AppContact appContact) async {
    final db = await database();

    await createTables(db);

    await db.delete(
      'toilet',
      where: "toiletId = ?",
      whereArgs: [appContact.id]
    );

  }



  static List<AppContact> _processContactData(List<Map<String,dynamic>> data) {
    List<AppContact> appContacts = [];

    for (Map<String,dynamic> item in data) {
      try {
        appContacts.add(
          AppContact(
            id : item[''],
            name: item['name'],
            email : item[''],
            phone : item['phone'],
          )
        );
      } catch(err) {
        logError("Error crating object ${err}");
      }
      

      
    }

    return appContacts;

  }

  Future<List<AppContact>> getAppContacts() async {
    final db = await database();
    await createTables(db);

    List<AppContact> contacts = [];

    List<Map<String, dynamic>> contactData = await db.rawQuery(
      """
        SELECT * FROM appcontacts; 
      """
    );

    contacts = _processContactData(contactData);


    return contacts;
  }


}


class AppContact {
  final String id;
  final String name;
  final String email;
  final String phone;

  AppContact({
    required this.id,
    required this.name,
    required this.email,
    required this.phone
  });

}