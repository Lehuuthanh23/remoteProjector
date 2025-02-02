import 'package:flutter/material.dart';

class HomeNavigationBar extends StatefulWidget {
  final int currentIndex;
  final Function(int) onTabSelected;

  const HomeNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTabSelected,
  });

  @override
  State<HomeNavigationBar> createState() => _HomeNavigationBarState();
}

class _HomeNavigationBarState extends State<HomeNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget.currentIndex,
      fixedColor: const Color(0xffEB6E2C),
      unselectedItemColor: const Color(0xff797979),
      onTap: widget.onTabSelected,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      items: [
        BottomNavigationBarItem(
          icon: ColorFiltered(
            colorFilter: ColorFilter.mode(
                widget.currentIndex == 0
                    ? const Color(0xffEB6E2C)
                    : const Color(0xff797979),
                BlendMode.srcIn),
            child: Image.asset(
              'assets/images/ic_device.png',
              width: 24,
              height: 24,
            ),
          ),
          label: 'Thiết bị',
        ),
        BottomNavigationBarItem(
          icon: ColorFiltered(
            colorFilter: ColorFilter.mode(
                widget.currentIndex == 1
                    ? const Color(0xffEB6E2C)
                    : const Color(0xff797979),
                BlendMode.srcIn),
            child: Image.asset(
              'assets/images/ic_packData.png',
              width: 24,
              height: 24,
            ),
          ),
          label: 'Gói cước',
        ),
        BottomNavigationBarItem(
          icon: ColorFiltered(
            colorFilter: ColorFilter.mode(
                widget.currentIndex == 2
                    ? const Color(0xffEB6E2C)
                    : const Color(0xff797979),
                BlendMode.srcIn),
            child: Image.asset(
              'assets/images/ic_camp.png',
              width: 24,
              height: 24,
            ),
          ),
          label: 'Camp',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.account_box_rounded,
            color: widget.currentIndex == 3
                ? Colors.orange
                : const Color(0xff797979),
          ),
          label: 'Tài khoản',
        ),
      ],
    );
  }
}
