// ignore: file_names
import 'dart:convert';

class PetModel {
  String? petId;
  String? petName;
  String? petType;
  String? petAge;
  String? petGender;
  String? petSize;
  String? petColor;
  String? petPhoto;
  String? goodWithChilderen;

  PetModel(
      {this.petName,
      this.petType,
      this.petAge,
      this.petGender,
      this.petSize,
      this.petColor,
      this.petPhoto,
      this.petId,
      this.goodWithChilderen});

  /// This named constructor convert
  /// each json record returned from
  /// the api call to PetModel object
  factory PetModel.fromJson(Map<String, dynamic> json) {
    return PetModel(
        petName: json['name'],
        petId: json['id'],
        petType: json['type'],
        petAge: json['age'],
        petColor: json['color'],
        petGender: json['gender'],
        petPhoto: json['photo'],
        petSize: json['size'],
        goodWithChilderen: json['good_with_children']);
  }

  /// This method returns all pet returned from the http call
  /// to list of petModel

  Future<List<PetModel>> getAllPet(String pets) async {
    List<PetModel> petModelList = [];
    var petList = json.decode(pets) as List;
    for (var pet in petList) {
      petModelList.add(PetModel.fromJson(pet));
    }
    return petModelList;
  }
}
