class Success {
  int? code;
  Object? response;
  Success({this.code, this.response});
}

class Failer {
  int? code;
  String? errorResponse;
  Failer({this.code, this.errorResponse});
}
