import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:remote_project/controller/packet/packet_controller.dart';
import 'package:remote_project/features/packet/widgets/packet_item.dart';
import 'package:remote_project/features/packet/widgets/packet_section.dart';
import 'package:remote_project/model/packet/packet_model.dart';
import 'package:remote_project/widget/basePage.dart';

class PacketPage extends StatefulWidget {
  const PacketPage({super.key});

  @override
  State<PacketPage> createState() => _PacketPageState();
}

class _PacketPageState extends State<PacketPage> {
  late PacketController _packetController;
  late List<PacketModel>? packetList = [];
  late List<PacketModel>? purchasedPacketList = [];

  @override
  void initState() {
    super.initState();
    _packetController = PacketController(dio: Dio());
    getAllPacket();
    getPurchasedPacket();
  }

  Future<void> getAllPacket() async {
    final loadedPacket = await _packetController.getAllPacket();
    setState(() {
      packetList = loadedPacket;
    });
  }

  Future<void> getPurchasedPacket() async {
    final loadedPurchased = await _packetController.getPurchasedPacket();
    setState(() {
      purchasedPacketList = loadedPurchased;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      showAppBar: true,
      title: "Gói cước",
      showActions: true,
      onPressedAction: () {},
      body: DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: Scaffold(
          body: Column(
            children: <Widget>[
              const TabBar(
                indicator: BoxDecoration(
                  color: Colors.transparent,
                ),
                tabs: <Widget>[
                  Tab(
                    text: "Gói cước cung cấp",
                  ),
                  Tab(
                    text: "Gói cước đã mua",
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: <Widget>[
                    Center(
                      child: packetList != null && packetList!.isNotEmpty
                          ? PackageSection(
                              packages: packetList!
                                  .map((item) => PackageItem(
                                        type: item.namePacket,
                                        duration: item.monthQty,
                                        price: item.price,
                                        details: item.detail,
                                        buttonLabel: 'Mua gói cước',
                                        badgeImage: Image.asset(
                                            "assets/images/img_package.png"),
                                        onPaymentTap: true,
                                      ))
                                  .toList(),
                            )
                          : Text("Không có dữ liệu"),
                    ),
                    Center(
                      child: packetList != null && packetList!.isNotEmpty
                          ? PackageSection(
                              packages: purchasedPacketList!
                                  .map((item) => PackageItem(
                                        type: item.namePacket,
                                        duration: item.monthQty,
                                        price: item.price,
                                        details: item.detail,
                                        buttonLabel: 'Mua gói cước',
                                        badgeImage: Image.asset(
                                            "assets/images/img_package.png"),
                                        onPaymentTap: true,
                                      ))
                                  .toList(),
                              //  [
                              //   PackageItem(
                              //     type: 'BASIC',
                              //     duration: '12 tháng',
                              //     price: '360,000',
                              //     details: 'Điều khiển 1 máy chiếu',
                              //     buttonLabel: 'Mua gói cước',
                              //     badgeImage:
                              //         Image.asset("assets/images/img_package.png"),
                              //   ),
                              //   PackageItem(
                              //     type: 'VIP',
                              //     duration: '12 tháng',
                              //     price: '490,000',
                              //     details: 'Điều khiển tất cả máy chiếu',
                              //     buttonLabel: 'Mua gói cước',
                              //     badgeImage:
                              //         Image.asset("assets/images/img_package.png"),
                              //   ),
                              // ]
                            )
                          : Text("Không có dữ liệu"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
