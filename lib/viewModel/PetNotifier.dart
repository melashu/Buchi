import 'package:buchi/models/petModel.dart';
import 'package:buchi/services/HttpStatus.dart';
import 'package:flutter/cupertino.dart';
import 'package:buchi/services/PetService.dart';

class PetNotiffier extends ChangeNotifier {
  late List<PetModel> _petModelList;
  late bool _loading;
   Failer? _failer;
  PetNotiffier() {
    getAllPets();
  }

  /// This method sets the list of pets
  /// which is fetched from the database
  setPetListModel(List<PetModel> petListModel) async {
    _petModelList = petListModel;
  }

  setLoading(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  setFailer(Failer failer) {
    _failer = failer;
  }

  Failer? getFailer() => _failer;

  List<PetModel>getPetListModel() => _petModelList;

  /// isLoading() method returns whether the UI is loading or not
  isLoading() => _loading;
///
///
///
///
///
  getAllPets() async {
    setLoading(true);
    var response = await PetService.getAllPets();
    if (response is Success) {
      setPetListModel(response.response as List<PetModel>);
    } 
    
    else if (response is Failer) {
      setFailer(response);
    }
    setLoading(false);
  }
}
