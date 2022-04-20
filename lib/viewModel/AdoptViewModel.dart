import 'package:buchi/models/AdoptModel.dart';
import 'package:buchi/services/PetService.dart';

/// This Class calls the api to send Http request to
/// the server
///
class AdoptViewModel {
  static Future<String> httpSetAdotion(
      String email, String phone, String fullName, String petId) async {
    AdoptModel adopt = AdoptModel(
        email: email, phoneNumber: phone, fullName: fullName, petID: petId);
    var response = adopt.toMap(adopt);
    String res = await PetService.setAdopt(response);
    return res;
  }
}
