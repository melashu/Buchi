import 'dart:io';

import 'package:buchi/models/petModel.dart';
import 'package:buchi/services/HttpStatus.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

class PetService {
  /// This method fetch data either from the remote database
  /// or local database
  static var buchiBox = Hive.box("buchi");

  static Future<Object> getAllPets() async {
    const API_URL = "https://buchi.keteraraw.com/api.php?data=get_r";
    if (buchiBox.get('isCatched')) {
      return Success(
          response: await PetModel().getAllPet(buchiBox.get('pets')));
    } else {
      try {
        var response = await http.get(Uri.parse(API_URL));
        if (response.statusCode == 200) {
          buchiBox.put("pets", response.body);
          buchiBox.put("isCatched", true);
          return Success(response: await PetModel().getAllPet(response.body));
        }
      } on HttpException {
        return Failer(
            errorResponse:
                "Your are not connected to internet, Please connect to Wifi or Data");
      } on FormatException {
        return Failer(
            errorResponse: "There is formating error on the response");
      } catch (e) {
        return Failer(
            errorResponse: "Unknown Error Happened please restart the app");
      }
    }

    return Failer(errorResponse: "Response error");
  }

  static Future<List<dynamic>> getCatchedData() async {
    var data = await PetModel().getAllPet(buchiBox.get('pets'));
    return data;
  }

  static Future<String> setAdopt(Map input) async {
    const API_URL = "https://buchi.keteraraw.com/api.php";
    try {
      var response = await http.post(Uri.parse(API_URL), body: input);
      if (response.statusCode == 200) {
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      return 'error';
    }
  }
}
