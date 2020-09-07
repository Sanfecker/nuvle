import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nuvle/misc/functions.dart';
import 'package:nuvle/misc/settings.dart';
import 'package:nuvle/models/providers/user/order/orderProvider.dart';
import 'package:nuvle/models/skeltons/menus/item.dart';
import 'package:nuvle/models/skeltons/menus/menuData.dart';
import 'package:nuvle/pages/user/main/menus/myTab/feedback/rateOrder.dart';
import 'package:nuvle/styles/colors.dart';
import 'package:nuvle/styles/nuvleIcons.dart';
import 'package:provider/provider.dart';

class FeedbackListingWidget extends StatefulWidget {
  final MenuItems menuItem;

  const FeedbackListingWidget({
    Key key,
    @required this.menuItem,
  }) : super(key: key);

  @override
  _FeedbackListingWidgetState createState() => _FeedbackListingWidgetState();
}

class _FeedbackListingWidgetState extends State<FeedbackListingWidget> {
  List emoji = [
    NuvleIcons.unhappy_1,
    NuvleIcons.face_1,
    NuvleIcons.scared_1,
    NuvleIcons.smile__1__1,
    NuvleIcons.smile_1,
  ];
  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: () =>
          Functions().transitTo(context, RateOrder(menuItem: widget.menuItem)),
      child: Container(
        margin: EdgeInsets.only(bottom: 20),
        padding: EdgeInsets.all(14),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: CachedNetworkImage(
                imageUrl: widget.menuItem.imageUrl ?? '',
                width: 109,
                // height: 125,
                height: 110,
                errorWidget: (context, url, error) => Image.asset(
                  Settings.placeholderImageSmall,
                  width: 109,
                  height: 125,
                ),
                placeholder: (BuildContext context, String val) {
                  return Image.asset(
                    Settings.placeholderImageSmall,
                    width: 109,
                    height: 125,
                  );
                },
                fit: widget.menuItem.itemType.toLowerCase() == 'drink'
                    ? BoxFit.contain
                    : BoxFit.cover,
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              child: Container(
                height: 86,
                margin: EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      widget.menuItem.itemName,
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: 16,
                        letterSpacing: 0.3,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Consumer<OrderProvider>(builder: (context, pro, child) {
                      return Row(
                        children: emoji
                            .map(
                              (e) => Container(
                                margin: EdgeInsets.only(right: 9),
                                child: Icon(
                                  e,
                                  color: emoji.indexOf(e) + 1 ==
                                          widget.menuItem.rating
                                      ? Color(0xffCCAD6E)
                                      : Color(0xff9F9FAF),
                                ),
                              ),
                            )
                            .toList(),
                      );
                    }),
                  ],
                ),
              ),
            ),
            Container(
              height: 86,
              child: Icon(
                NuvleIcons.icon_chevron_right,
                color: CustomColors.primary,
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: CustomColors.licoRice,
        ),
      ),
    );
  }
}
