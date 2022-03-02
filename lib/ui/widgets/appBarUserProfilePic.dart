import 'package:flutter/material.dart';

class AppBarUserProfilePic extends StatelessWidget {
  const AppBarUserProfilePic({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: null,
      icon: CircleAvatar(
        backgroundImage: AssetImage('assets/images/avatar.png'),
        // backgroundColor: Get.isDarkMode ? Colors.red : Colors.green,
      ),
    );
  }
}
