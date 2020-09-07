import 'package:nuvle/misc/enum.dart';

class ApiRequestModel {
  bool isSuccessful;
  APIRequestStatus apiRequestStatus;
  dynamic result;
  String errorMessage;

  ApiRequestModel(
      {this.isSuccessful = false,
      this.apiRequestStatus,
      this.result,
      this.errorMessage});
}
