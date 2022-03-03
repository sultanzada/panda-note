import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/appBar.dart';
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
      backgroundColor: context.theme.colorScheme.background,
      appBar: PreferredSize(
        child: MyAppBar(
          leading: ChangeThemeMode(),
          actions: [
            AppBarUserProfilePic(),
          ],
        ),
        preferredSize: Size.fromHeight(kToolbarHeight),
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
