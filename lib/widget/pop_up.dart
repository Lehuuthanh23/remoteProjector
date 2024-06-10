import 'package:flutter/material.dart';

class PopUpWidget extends StatelessWidget {
  final Widget icon;
  final String title;
  final Function()? onTap;
  const PopUpWidget(
      {super.key,
      required this.icon,
      required this.title,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xffFABD1D), Color(0xffEB6E2C)],
            ),
            borderRadius: BorderRadius.all(Radius.circular(6))),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: SizedBox(
                height: 100,
                child: icon,
              ),
            ),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const Divider(
              height: 2,
            ),
            GestureDetector(
              onTap: onTap,
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  'XÁC NHẬN',
                  style: TextStyle(color: Colors.white, fontSize: 26),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PopUpPaymenSuccessWidget extends StatelessWidget {
  const PopUpPaymenSuccessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PopUpWidget(
      icon: Image.asset(
        "assets/images/ic_success.png",
      ),
      title: "Giao dịch thành công",
      onTap: () {
        Navigator.of(context).pop();
      },
    );
  }
}

class PopUpPaymenFailWidget extends StatelessWidget {
  const PopUpPaymenFailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PopUpWidget(
      icon: Image.asset(
        "assets/images/ic_error.png",
      ),
      title: "Giao dịch không thành công",
      onTap: () {
        Navigator.of(context).pop();
      },
    );
  }
}
