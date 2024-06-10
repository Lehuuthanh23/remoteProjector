import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:remote_project/model/device/device_model.dart';
import 'package:remote_project/model/dir/dir_model.dart';

class DeviceCard extends StatelessWidget {
  const DeviceCard({super.key, required this.data, required this.dir});
  final Device data;
  final Dir dir;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xffE5E5E5)),
        color: Colors.white,
      ),
      margin: const EdgeInsets.only(top: 5),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 15, bottom: 8),
                      child: ColorFiltered(
                        colorFilter: const ColorFilter.mode(
                            Colors.black, BlendMode.srcIn),
                        child: Image.asset(
                          'assets/images/ic_projector.png',
                          width: 70,
                          height: 56,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data.computerId,
                          style: const TextStyle(
                              color: Color(0xffEB6E2C),
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          data.computerName,
                          style: const TextStyle(
                              color: Color(0xff4F4F4F), fontSize: 14),
                        ),
                      ],
                    )
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 30.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Text(
                                "Trạng thái: ",
                                style: TextStyle(
                                    color: Color(0xff4F4F4F),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),
                              ),
                              Text(
                                data.status == '1'
                                    ? 'Đang kết nối'
                                    : 'Ngắt kết nối',
                                style: TextStyle(
                                    color: data.status == '1'
                                        ? const Color(0xff027800)
                                        : const Color(0xffEB2C2C),
                                    fontSize: 14),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Text(
                                "Loại: ",
                                style: TextStyle(
                                    color: Color(0xff4F4F4F),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),
                              ),
                              Text(
                                data.type,
                                style: const TextStyle(
                                    color: Color(0xff4F4F4F), fontSize: 14),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Text(
                              "Thư mục: ",
                              style: TextStyle(
                                  color: Color(0xff4F4F4F),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                            ),
                            Text(
                              dir.name_dir,
                              style: const TextStyle(
                                  color: Color(0xff4F4F4F), fontSize: 14),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Text(
                              "Chủ: ",
                              style: TextStyle(
                                  color: Color(0xff4F4F4F),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                            ),
                            Text(
                              data.user,
                              style: const TextStyle(
                                  color: Color(0xff4F4F4F), fontSize: 14),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    const Text(
                      'Chuyển thư mục',
                      style: TextStyle(fontSize: 14),
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    ColorFiltered(
                      colorFilter:
                          const ColorFilter.mode(Colors.black, BlendMode.srcIn),
                      child: Image.asset(
                        'assets/images/ic_move_dir.png',
                        width: 16,
                        height: 8,
                      ),
                    ),
                  ],
                ),
                const Row(
                  children: [
                    Text(
                      'Chia sẻ',
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Icon(
                      Icons.share,
                      color: Colors.black,
                      size: 20,
                    )
                  ],
                ),
                const Row(
                  children: [
                    Text(
                      'Xóa thiết bị',
                      style: TextStyle(fontSize: 14),
                    ),
                    Icon(
                      Icons.close,
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
