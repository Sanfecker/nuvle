import 'package:flutter/material.dart';
import 'package:nuvle/components/widgets/user/callWaiterBottomSheet.dart';
import 'package:nuvle/misc/functions.dart';
import 'package:nuvle/styles/colors.dart';
import 'package:nuvle/styles/nuvleIcons.dart';

class CallWaiterIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        NuvleIcons.party_1,
        size: 25,
        color: CustomColors.primary100,
      ),
      onPressed: () =>
          Functions.openBottomSheet(context, CallWaiterBottomSheet(), true),
    );
  }
}
