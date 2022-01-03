import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'conversion_history_model.dart';

class ConversionHandler extends GetxController {
  //InitializingAndCreatingTable
  Future<Database> initializeDB() async {
    final String dbPath = await getDatabasesPath();
    return openDatabase(join(dbPath, 'currencyConversion.model'), version: 1, onCreate: (database, version,
    ) async {await database.execute('CREATE TABLE conversionCurrency(id INTEGER PRIMARY KEY,historyValue TEXT NOT NULL,dateTime TEXT NOT NULL)');});
  }
}

class InsertData extends ConversionHandler {
  //InsertData
  Future<int> insertCurrencyData(List<ConversionModel> currencies) async {
    int result = 0;
    final Database db = await initializeDB();
    for (var currency in currencies) {result = await db.insert('conversionCurrency', currency.toMap());}
    return result;
  }
}

class RetrieveData extends ConversionHandler {
//RetrieveData
  Future<List<ConversionModel>> retrieveCurrencyData() async {
    final Database db = await initializeDB();
    final List<Map<String, Object?>> queryResult = await db.query('conversionCurrency');
    return queryResult.map((e) => ConversionModel.fromMap(e)).toList().reversed.toList();
  }
}

class DeleteData extends ConversionHandler {
  //DeleteData
  Future<void> deleteData(int id) async {
    final db = await initializeDB();
    await db.delete('conversionCurrency', where: 'id = ?', whereArgs: [id]);
  }
}

class ClearDataBase extends ConversionHandler {
  deleteAll() async {
    Database db = await initializeDB();
    return await db.rawDelete("delete from conversionCurrency");
  }
}
