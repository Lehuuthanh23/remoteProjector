import 'package:flutter/material.dart';

import 'package:remote_project/widget/basePage.dart';
import 'package:remote_project/widget/buttonCustom.dart';
import 'package:remote_project/widget/pop_up.dart';

class PacketPaymentPage extends StatelessWidget {
  const PacketPaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    const int index = 0;

    void showTransactionFailedPopup() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return const PopUpPaymenSuccessWidget();
        },
      );
    }

    return BasePage(
      showAppBar: true,
      title: "Thanh toán",
      showActions: true,
      onPressedAction: () {},
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            topBadge(),
            DefaultTabController(
              initialIndex: index,
              length: 2,
              child: Column(
                children: [
                  Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xffE5E5E5),
                      borderRadius: BorderRadius.circular(50.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(4),
                    child: TabBar(
                      indicator: BoxDecoration(
                        color: const Color(0xffEB6E2C),
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      labelColor: Colors.white,
                      labelStyle: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                      unselectedLabelColor: const Color(0xff9E9E9E),
                      labelPadding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 4),
                      indicatorSize: TabBarIndicatorSize.tab,
                      tabs: const [
                        Tab(
                          text: 'Thanh toán online',
                        ),
                        Tab(
                          text: 'Chuyển khoản',
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 2,
                    child: TabBarView(
                      children: [
                        transferPayment(),
                        transferPayment(),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 65,
        child: ButtomCustom(
          onPressed: () {
            showTransactionFailedPopup();
          },
          title: "Thanh toán",
          textSize: 22,
          borderRadius: 0,
        ),
      ),
    );
  }

  Widget topBadge() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
              flex: 4, child: Image.asset("assets/images/img_package.png")),
          Expanded(
            flex: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'GÓI CƯỚC',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Thời hạn: ',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          )),
                      TextSpan(
                        text: "1 tháng",
                      ),
                    ],
                  ),
                ),
                const Text(
                  '400.000đ',
                  style: TextStyle(color: Color(0xffEB6E2C)),
                ),
                const Text("Chi tiết"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget transferPayment() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                transferText(title: "Chủ tài khoản", data: "Nguyễn Ngọc Hân"),
                transferText(title: "Số tài khoản", data: "123456789"),
                transferText(title: "Ngân hàng", data: "ABC Bank"),
                transferText(title: "Chi nhánh", data: "Hà Nội"),
              ],
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }

  RichText transferText({required String title, required String data}) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(
          fontSize: 18.0,
          color: Colors.black,
        ),
        children: <TextSpan>[
          TextSpan(
            text: '$title: ',
            style: const TextStyle(
              fontSize: 18.0,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: data,
          ),
        ],
      ),
    );
  }
}
