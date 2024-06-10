import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:remote_project/app/app_utils.dart';
import 'package:remote_project/model/packet/packet_model.dart';
import 'package:remote_project/model/packet/response/packet_list_response_model.dart';
import 'package:remote_project/app/app_sp.dart';
import 'package:remote_project/app/app_sp_key.dart';
import 'package:remote_project/app/string_utils.dart';

class PacketController {
  final Dio dio;
  PacketController({required this.dio});

  Future<List<PacketModel>?> getAllPacket() async {
    final String cookieData = AppSP.get(AppSPKey.PHPSESSID);
    final String userId = await AppUtils.getUserIdFromLocal();

    late List<PacketModel>? listData = const [];

    final response = await dio.get(
      AppUtils.createUrl(StringUtils.getAllPacket),
      options: AppUtils.createOptionsWithCookie(cookieData),
    );

    final responseData = jsonDecode(response.data);
    final packetResponse = PacketListResponseModel.fromJson(responseData);
    listData = packetResponse.packetList;
    try {} on DioError catch (e) {
      debugPrint(e.toString());
    }

    return listData;
  }

  Future<List<PacketModel>?> getPurchasedPacket() async {
    final String cookieData = AppSP.get(AppSPKey.PHPSESSID);
    final String userId = await AppUtils.getUserIdFromLocal();
    late List<PacketModel>? listData = const [];

    final response = await dio.get(
      AppUtils.createUrlWithUserId(StringUtils.getPacketByID, userId),
      options: AppUtils.createOptionsWithCookie(cookieData),
    );

    final responseData = jsonDecode(response.data);
    final packetResponse = PacketListResponseModel.fromJson(responseData);
    listData = packetResponse.packetList;
    try {} on DioError catch (e) {
      debugPrint(e.toString());
    }

    return listData;
  }
}
