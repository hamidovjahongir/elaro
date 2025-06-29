import 'package:elaro/features/card/data/model/card_mode.dart';
import 'package:hive_flutter/adapters.dart';



class LocalCardRepository {
  static Box? hive;

  Future<void> getInstance() async {
  await Hive.initFlutter();
  hive = await Hive.openBox("card");
  print("hive passed success");
}

  Future<void> addData(CardMode data) async {
    await getInstance();
    await hive?.add(data);
  }

  Future<List<CardMode>> getData() async {
    await getInstance();

    List<CardMode> list = [];
    list = hive?.values.map((e) => e as CardMode).toList() ?? list;
    return list;
  }
}
