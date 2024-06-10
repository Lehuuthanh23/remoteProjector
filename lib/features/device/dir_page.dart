// ignore_for_file: prefer_const_constructors
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:remote_project/controller/dir/dir_controller.dart';
import 'package:remote_project/features/device/device_page.dart';
import 'package:remote_project/model/dir/dir_model.dart';
import 'package:remote_project/widget/basePage.dart';

class DirPage extends StatefulWidget {
  const DirPage({super.key});

  @override
  State<DirPage> createState() => _DirPageState();
}

late Dio dio;
List<Dir>? lstDir;

class _DirPageState extends State<DirPage> {
  bool isEditingFolderName = false;
  TextEditingController folderNameController = TextEditingController();
  DirController? controller;
  @override
  void initState() {
    super.initState();
    dio = Dio();
    controller = DirController(dio: dio);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      List<Dir> lst = await controller!.getAllDir();
      setState(() {
        lstDir = lst;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      showAppBar: true,
      showActions: true,
      title: 'QUẢN LÍ THIẾT BỊ',
      body: DefaultTabController(
        length: 3,
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const TabBar(
              labelStyle: TextStyle(fontSize: 18),
              tabs: [
                Tab(text: 'Tất cả'),
                Tab(text: 'Chủ sở hữu'),
                Tab(text: 'Được chia sẻ'),
              ],
              indicatorColor: Color(0xFFEB6E2C),
              labelColor: Color(0xFFEB6E2C),
              unselectedLabelColor: Color(0xFF4F4F4F),
            ),
            Expanded(
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  gridViewAllMethod(),
                  gridViewOwnerMethod(),
                  gridViewShareMethod(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Directionality gridViewAllMethod() {
    return Directionality(
      textDirection: lstDir == null || lstDir!.isEmpty
          ? TextDirection.ltr
          : TextDirection.rtl,
      child: GridView.builder(
        itemCount: lstDir == null ? 1 : lstDir!.length + 1,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 40.0,
          mainAxisSpacing: 20.0,
          childAspectRatio: 1.0,
        ),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        itemBuilder: (context, index) {
          if (lstDir != null) {
            if (index == lstDir!.length) {
              return dirAddCard(context);
            }
            return dirOwnerCard(context, index);
          } else {
            return dirAddCard(context);
          }
        },
      ),
    );
  }

  InkWell dirAddCard(BuildContext context) {
    return InkWell(
      focusColor: Colors.transparent,
      onTap: () {
        setState(() {
          isEditingFolderName = !isEditingFolderName;
        });
        if (isEditingFolderName) {
          FocusScope.of(context).requestFocus();
        }
      },
      child: Column(
        children: [
          Image.asset(
            'assets/images/img_folder_add.png',
          ),
          SizedBox(
            height: 5,
          ),
          isEditingFolderName
              ? Directionality(
                  textDirection: TextDirection.ltr,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: SizedBox(
                      width: 140,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 105,
                            bottom: -13,
                            child: IconButton(
                                onPressed: () {
                                  controller!.createDir(
                                    folderNameController.text,
                                    'New Type',
                                  );
                                },
                                icon: Icon(
                                  Icons.check_circle_outline_rounded,
                                  color: Color(0xffFABD1D),
                                )),
                          ),
                          SizedBox(
                            height: 25,
                            width: 120,
                            child: TextField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xffFABD1D)))),
                              controller: folderNameController,
                              style: TextStyle(
                                color: Color(0xff797979),
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              : Text(
                  'Tạo thư mục',
                  style: TextStyle(color: Color(0xff797979), fontSize: 16),
                ),
        ],
      ),
    );
  }

  InkWell dirOwnerCard(BuildContext context, int index, [bool isOwner = true]) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DevicePage(dir: lstDir![index]),
            ));
      },
      child: Column(
        children: [
          Image.asset(
            isOwner
                ? 'assets/images/img_folder_owner.png'
                : 'assets/images/img_folder_share.png',
          ),
          Text(
            lstDir![index].name_dir,
            style: TextStyle(color: Color(0xff797979), fontSize: 16),
          ),
        ],
      ),
    );
  }

  Directionality gridViewOwnerMethod() {
    return Directionality(
      textDirection: lstDir == null ? TextDirection.ltr : TextDirection.rtl,
      child: GridView.builder(
        itemCount: lstDir == null ? 1 : lstDir!.length + 1,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 40.0,
          mainAxisSpacing: 20.0,
          childAspectRatio: 1.0,
        ),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        itemBuilder: (context, index) {
          if (lstDir != null) {
            if (index == lstDir!.length) {
              return dirAddCard(context);
            }
            return dirOwnerCard(context, index);
          } else {
            return dirAddCard(context);
          }
        },
      ),
    );
  }

  Directionality gridViewShareMethod() {
    return Directionality(
      textDirection: lstDir == null ? TextDirection.ltr : TextDirection.rtl,
      child: GridView.builder(
        itemCount: lstDir == null ? 1 : lstDir!.length + 1,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 40.0,
          mainAxisSpacing: 20.0,
          childAspectRatio: 1.0,
        ),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        itemBuilder: (context, index) {
          if (lstDir != null) {
            if (index == lstDir!.length) {
              return dirAddCard(context);
            }
            return dirOwnerCard(context, index, false);
          } else {
            return dirAddCard(context);
          }
        },
      ),
    );
  }
}
