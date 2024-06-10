// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:remote_project/app/string_utils.dart';
import 'package:remote_project/controller/device/device_controller.dart';
import 'package:remote_project/features/device/widget/device_card.dart';
import 'package:remote_project/model/device/device_model.dart';
import 'package:remote_project/model/dir/dir_model.dart';
import 'package:remote_project/widget/basePage.dart';

class DevicePage extends StatefulWidget {
  const DevicePage({super.key, required this.dir});
  final Dir dir;
  @override
  State<DevicePage> createState() => _DevicePageState();
}

late Dio dio;

class _DevicePageState extends State<DevicePage> {
  DeviceController? controller;
  List<Device> lstDevice = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dio = Dio();
    controller = DeviceController(dio: dio);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      List<Device> lst = await controller!.getDevices();
      setState(() {
        lstDevice = lst;
        lstDevice = lstDevice
            .where((device) => device.idDir == widget.dir.id_dir.toString())
            .toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      showAppBar: true,
      showActions: true,
      showLeadingAction: true,
      title: widget.dir.name_dir,
      body: ListView.builder(
        itemCount: lstDevice.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: DeviceCard(
              dir: widget.dir,
              data: lstDevice[index],
            ),
          );
        },
      ),
    );
  }
}
