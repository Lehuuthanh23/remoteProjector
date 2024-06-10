import 'package:flutter/material.dart';

class BasePage extends StatefulWidget {
  final bool showAppBar;
  final bool showLeadingAction;
  final Function? onBackPressed;
  final dynamic title;
  final bool? showActions;
  final Widget? leading;
  final Widget body;
  final Widget? bottomSheet;
  final Widget? bottomNavigationBar;
  final Widget? fab;
  final FloatingActionButtonLocation? fabLocation;
  final Color? appBarColor;
  final double? elevation;
  final Color? appBarItemColor;
  final PreferredSize? customAppbar;
  final Function()? onPressedAction;
  // ignore: prefer_const_constructors_in_immutables
  BasePage({
    this.showAppBar = false,
    this.leading,
    this.showLeadingAction = false,
    this.onBackPressed,
    this.title = "",
    this.showActions = false,
    required this.body,
    this.bottomSheet,
    this.bottomNavigationBar,
    this.fab,
    this.fabLocation,
    this.appBarColor,
    this.appBarItemColor,
    this.elevation,
    this.customAppbar,
    this.onPressedAction,
    super.key,
  });

  @override
  _BasePageState createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: widget.customAppbar ??
          (widget.showAppBar
              ? AppBar(
                  flexibleSpace: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFFEB6E2C),
                          Color(0xFFFABD1D),
                        ],
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft,
                      ),
                    ),
                  ),
                  backgroundColor: Colors.transparent,
                  elevation: widget.elevation,
                  automaticallyImplyLeading: widget.showLeadingAction,
                  leading: widget.showLeadingAction
                      ? widget.leading ??
                          IconButton(
                            icon: Image.asset(
                              'assets/images/back_arrow.png',
                              width: 24,
                              height: 12,
                            ),
                            onPressed: widget.onBackPressed != null
                                ? () => widget.onBackPressed!()
                                : () => Navigator.pop(context),
                          )
                      : null,
                  title: widget.title is Widget
                      ? widget.title
                      : Text(
                          widget.title,
                          style: const TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                  actions: widget.showActions!
                      ? [
                          IconButton(
                              onPressed: widget.onPressedAction,
                              icon: const Icon(
                                Icons.notifications_none,
                                color: Colors.white,
                                size: 36,
                              ))
                        ]
                      : null,
                )
              : null),
      body: widget.body,
      bottomNavigationBar: widget.bottomNavigationBar,
      bottomSheet: widget.bottomSheet,
      floatingActionButton: widget.fab,
      floatingActionButtonLocation: widget.fabLocation,
    );
  }
}
