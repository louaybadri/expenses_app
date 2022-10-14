import 'package:masroufi/db/constant.dart';
import 'package:masroufi/expenses/expenses.dart';
import 'package:mongo_dart/mongo_dart.dart';

class MangoDataBase {
  static var db, userCollection;

  static connect() async {
    db = await Db.create(MANGO_CONN_URL);
    await db.open();
    userCollection = db.collection(MASROUFY);
    print(await userCollection.find().toList());
  }
  static insert(Expense expense) async {
    await userCollection.insertAll(expense);
  }
  static Future<List<Map<String, dynamic>>> getDocuments() async {
    try {
      final users = await userCollection.find().toList();
      return users;
    } catch (e) {
      print(e);

      return Future.value(e as Future<List<Map<String, dynamic>>>);
      // ignore: null_argument_to_non_null_type
    }
  }
  
}
