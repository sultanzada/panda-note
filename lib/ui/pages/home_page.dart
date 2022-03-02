import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/appBarUserProfilePic.dart';
import '../widgets/change_theme_mode.dart';
import '../widgets/dateBarContainer.dart';
import '../widgets/taskBarContainer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime _selectedDate = DateTime.now();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.theme.colorScheme.background,
        leading: ChangeThemeMode(),
        actions: [
          AppBarUserProfilePic(),
        ],
      ),
      body: Column(
        children: [
          TaskBarContainer(),
          DateBarContainer(
            selectedDate: _selectedDate,
          ),
        ],
      ),
    );
  }
}
