import 'package:nuvle/misc/enum.dart';

class PaymentCard {
  PaymentCardType type;
  String sId;
  String cardNumber;

  PaymentCard({this.cardNumber, this.sId, this.type});
}
