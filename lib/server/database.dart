import 'package:expence_blaster_yt/models/expence.dart';
import 'package:hive/hive.dart';

class Database {
  //create a databse reference
  final _myBox = Hive.box("expenceDatabase");
  List<ExpenceModel> expenceList = [];

  //create the init expence list function

  void createInitialDatabase() {
    expenceList = [
      ExpenceModel(
          amount: 12.5,
          date: DateTime.now(),
          title: "Football",
          category: Category.leasure),
      ExpenceModel(
          amount: 10,
          date: DateTime.now(),
          title: "Carrot",
          category: Category.food),
      ExpenceModel(
          amount: 20,
          date: DateTime.now(),
          title: "Bag",
          category: Category.travel)
    ];
  }

  //load the data
  void loadData() {
    final dynamic data = _myBox.get("EXP_DATA");
    //validation data
    if (data != null && data is List<dynamic>) {
      expenceList = data.cast<ExpenceModel>().toList();
    }
  }

  //update the data
  Future<void> updateData() async {
    await _myBox.put("EXP_DATA", expenceList);
    print("data saved");
  }
}
