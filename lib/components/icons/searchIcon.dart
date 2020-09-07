import 'package:flutter/material.dart';
import 'package:nuvle/components/widgets/user/callWaiterBottomSheet.dart';
import 'package:nuvle/components/widgets/user/searchBottomSheet.dart';
import 'package:nuvle/misc/functions.dart';
import 'package:nuvle/models/skeltons/user/userAccount.dart';
import 'package:nuvle/styles/colors.dart';

class SearchIcon extends StatelessWidget {
  final UserAccount userAccount;

  const SearchIcon({Key key, this.userAccount}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.search,
        size: 25,
        color: CustomColors.primary100,
      ),
      onPressed: () => Functions.openBottomSheet(
          context,
          SearchBottomSheet(
            userAccount: userAccount,
          ),
          true),
    );
  }
}
