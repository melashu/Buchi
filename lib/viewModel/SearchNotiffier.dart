import 'package:buchi/services/PetService.dart';
import 'package:flutter/cupertino.dart';

class SearchNotifier extends ChangeNotifier {
  final List<dynamic> _petModelList = [];

  Future<List> searchAllPets(
      {List<String>? petTypes,
      String? gender,
      String? age,
      String? size,
      String? goodWithChildern}) async {
    var allPets = await PetService.getCatchedData();
    for (var pet in allPets) {
      if (petTypes!.contains(pet.petType!.toLowerCase()) &&
          (gender!.toLowerCase() == 'any' ||
              pet.petGender!.toLowerCase() == gender.toLowerCase()) &&
          (age!.toLowerCase() == 'any' ||
              pet.petAge!.toLowerCase() == age.toLowerCase()) &&
          (size!.toLowerCase() == 'any' ||
              pet.petSize!.toLowerCase() == size.toLowerCase()) &&
          (goodWithChildern!.toLowerCase() == 'any' ||
              pet.goodWithChilderen!.toLowerCase() ==
                  goodWithChildern.toLowerCase())) {
        _petModelList.add(pet);
      }
    }

    return _petModelList;
  }
}
