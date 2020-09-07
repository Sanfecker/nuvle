import 'package:flutter/material.dart';
import 'package:nuvle/components/widgets/user/selectableListingWidget.dart';
import 'package:nuvle/misc/functions.dart';
import 'package:nuvle/models/providers/user/order/orderProvider.dart';
import 'package:nuvle/models/skeltons/menus/menuData.dart';
import 'package:nuvle/models/skeltons/user/userAccount.dart';
import 'package:nuvle/styles/colors.dart';
import 'package:provider/provider.dart';

class SidesBottomSheet extends StatefulWidget {
  final UserAccount userAccount;

  const SidesBottomSheet({Key key, @required this.userAccount})
      : super(key: key);

  @override
  _SidesBottomSheetState createState() => _SidesBottomSheetState();
}

class _SidesBottomSheetState extends State<SidesBottomSheet> {
  _handleSubmitted(BuildContext context) {
    // Provider.of<OrderProvider>(context, listen: false)
    //     .confirmedSideSelection(menuItem);
    Navigator.pop(context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    MenuItems menuItem;
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: <Widget>[
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Sides",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                      color: Color(0xffF2F2F9),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.close,
                      size: 30,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),
              Consumer<OrderProvider>(
                builder: (context, pro, child) {
                  List<List<MenuItems>> menuItems = List<List<MenuItems>>();
                  pro.orders.forEach((element) {
                    if (element.sides.isNotEmpty) {
                      menuItems.addAll(
                          element.sides.map((e) => [element, e]).toList());
                    }
                  });
                  return Flexible(
                    child: ListView(
                      children: pro.orders.isNotEmpty && menuItems.isNotEmpty
                          ? menuItems
                              .map(
                                (e) => SelectableListingWidget(
                                  menuItem: e[1],
                                  parent: e[0],
                                  userAccount: widget.userAccount,
                                ),
                              )
                              .toList()
                          : [],
                    ),
                  );
                },
              ),
              Functions().customButton(
                context,
                onTap: () => _handleSubmitted(context),
                width: screenSize.width,
                text: "Add Side",
                specificBorderRadius: BorderRadius.circular(5),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
