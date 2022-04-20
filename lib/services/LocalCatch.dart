import 'package:hive/hive.dart';

///This Boxes class contains local hive box
/// to catch retrived data
class Boxes {
  static Future<Box> getBuchi() async {
    var box = await Hive.openBox("buchi");
    return box;
  }

  static Future<Box> getAdopted() async {
    var box = await Hive.openBox("adobt");
    return box;
  }
}
