import 'package:flutter/material.dart';
import 'package:remote_project/features/packet/packet_payment.dart';

class PackageItem {
  final String type;
  final String duration;
  final String price;
  final String details;
  final String buttonLabel;
  final Widget? badgeImage;
  final bool onPaymentTap;

  PackageItem({
    required this.type,
    required this.duration,
    required this.price,
    required this.details,
    required this.buttonLabel,
    required this.badgeImage,
    this.onPaymentTap = false,
  });

  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      surfaceTintColor: Colors.transparent,
      borderOnForeground: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(3), // if you need this
        side: BorderSide(
          color: Colors.grey.withOpacity(0.2),
          width: 1,
        ),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 4,
                  child: badgeImage ??
                      Image.asset("assets/images/img_package.png"),
                ),
                Expanded(
                  flex: 6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'GÓI CƯỚC $type',
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      RichText(
                        text: TextSpan(
                          // Note: Styles for TextSpans must be explicitly defined.
                          // Child text spans will inherit styles from parent
                          style: const TextStyle(
                            fontSize: 14.0,
                            color: Colors.black,
                          ),
                          children: <TextSpan>[
                            const TextSpan(
                                text: 'Thời hạn: ',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                )),
                            TextSpan(
                              text: "$duration tháng",
                            ),
                          ],
                        ),
                      ),
                      Text(
                        '$priceđ',
                        style: const TextStyle(color: Color(0xffEB6E2C)),
                      ),
                      Text(details),
                    ],
                  ),
                ),
              ],
            ),
            const Divider(),
            GestureDetector(
              onTap: onPaymentTap
                  ? () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PacketPaymentPage()));
                    }
                  : null,
              child: Row(
                children: [
                  const Spacer(),
                  const Text(
                    'Mua gói cước',
                    style: TextStyle(color: Color(0xff027800), fontSize: 14),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Image.asset("assets/images/ic_pay.png"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
