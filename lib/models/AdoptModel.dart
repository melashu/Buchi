class AdoptModel {
  String? phoneNumber;
  String? fullName;
  String? email;
  String? petID;
  AdoptModel({this.email, this.fullName, this.petID, this.phoneNumber});

  Map toMap(AdoptModel adopt) {
    return {
      "c_phone": adopt.phoneNumber,
      "c_fullname": adopt.fullName,
      "c_email": adopt.email,
      "petid": adopt.petID,
      "action":'adopt'
    };
  }
}
