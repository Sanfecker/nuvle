import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nuvle/api/apiRequests.dart';
import 'package:nuvle/misc/validations.dart';
import 'package:nuvle/models/skeltons/api/apiRequestModel.dart';
import 'package:nuvle/models/skeltons/menus/supportTicket.dart';
import 'package:nuvle/models/skeltons/user/userAccount.dart';

class SupportTicketProvider extends ChangeNotifier {
  sendMessage(SupportTicket ticket, UserAccount userAccount) async {
    ApiRequestModel apiRequestModel = ApiRequestModel();
    Map<String, dynamic> body = {
      "subject": ticket.title,
      "message": ticket.message
    };
    try {
      var responseBody = await ApiRequest.post(
          body,
          userAccount.tab.attributes.restaurantId + "/emails/support",
          userAccount.token);
      print(responseBody);
      if (responseBody["success"]) {
        apiRequestModel.isSuccessful = true;
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
