import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../services/notification_services.dart';
import '../../services/theme_services.dart';

class ChangeThemeMode extends StatefulWidget {
  const ChangeThemeMode({Key key}) : super(key: key);

  @override
  State<ChangeThemeMode> createState() => _ChangeThemeModeState();
}

class _ChangeThemeModeState extends State<ChangeThemeMode> {
  NotifyHelper notifyHelper;
  @override
  void initState() {
    super.initState();
    notifyHelper = NotifyHelper();
    notifyHelper.requestIOSPermissions();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        ThemeService().switchTheme();
        // notifyHelper.initializeNotification();
        // notifyHelper.scheduledNotification(
        //   title: 'Theme Changed',
        //   body: Get.isDarkMode
        //       ? 'Light theme Activated'
        //       : 'Dark theme Activated',
        // );
        // notifyHelper.displayNotification(
        //   title: 'Theme Changed',
        //   body:
        //       Get.isDarkMode ? 'Light theme Activated' : 'Dark theme Activated',
        // );
      },
      icon: Icon(
        Get.isDarkMode ? Icons.nightlight_outlined : Icons.wb_sunny_outlined,
        size: 20,
        color: Get.isDarkMode ? Colors.white : Colors.black,
      ),
    );
  }
}
