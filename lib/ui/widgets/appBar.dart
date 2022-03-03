import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({
    Key key,
    this.leading,
    this.actions,
  }) : super(key: key);

  final Widget leading;
  final List<Widget> actions;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: context.theme.colorScheme.background,
      leading: leading,
      actions: actions,
    );
  }
}
