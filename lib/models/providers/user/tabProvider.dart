import 'package:flutter/material.dart';
import 'package:nuvle/api/apiRequests.dart';
import 'package:nuvle/misc/validations.dart';
import 'package:nuvle/models/skeltons/api/apiRequestModel.dart';
import 'package:nuvle/models/skeltons/user/scanResponse.dart';
import 'package:nuvle/models/skeltons/user/tab.dart';
import 'package:nuvle/models/skeltons/user/userAccount.dart';

class TabProvider extends ChangeNotifier {
  Future<ApiRequestModel> joinTabByCode(
      String code, UserAccount account) async {
    ApiRequestModel apiRequestModel = ApiRequestModel();
    try {
      var responseBody =
          await ApiRequest.post("", "out-tabs/$code/join", account.token);
      if (responseBody["success"]) {
        TabModel myTab = TabModel.fromJson(responseBody["data"]);
        apiRequestModel.isSuccessful = true;
        apiRequestModel.result = myTab;
        notifyListeners();
      } else {
        apiRequestModel = Validations()
            .getErrorMessage(responseBody['message'], responseBody['data']);
      }
    } catch (e) {
      print("EERRRRR $e");
      apiRequestModel.isSuccessful = false;
      apiRequestModel.errorMessage = "Internal error, please try again";
    }
    return apiRequestModel;
  }

  Future<ApiRequestModel> createTab(
      ScanResponse scanResponse, UserAccount account) async {
    ApiRequestModel apiRequestModel = ApiRequestModel();
    var body = {"table_id": scanResponse.tableId};
    try {
      var responseBody = await ApiRequest.post(
          body, "${scanResponse.restaurantId}/tabs", account.token);
      print(responseBody);
      if (responseBody["success"]) {
        TabModel myTab = TabModel.fromJson(responseBody["data"]);
        apiRequestModel.isSuccessful = true;
        apiRequestModel.result = myTab;
        notifyListeners();
      } else {
        apiRequestModel = Validations()
            .getErrorMessage(responseBody['message'], responseBody['data']);
      }
    } catch (e) {
      print("EERRRRR $e");
      apiRequestModel.isSuccessful = false;
      apiRequestModel.errorMessage = "Internal error, please try again";
    }
    return apiRequestModel;
  }
}
