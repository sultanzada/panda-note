import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:panda/services/dateAndTime.dart';
import 'package:panda/ui/widgets/button.dart';
import '../theme.dart';
import '../widgets/appBarUserProfilePic.dart';
import '../widgets/input_field.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({Key key}) : super(key: key);

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  DateAndTime dateAndTime;
  DateTime _currentDate;
  String _startTime;
  String _endTime;

  int _selectedRemind = 5;
  List<int> _remindList = [5, 10, 15, 20];

  String _selectedRepeat = 'None';
  List<String> _repeatList = ['None', 'Daily', 'Weekly', 'Monthly'];
  @override
  void initState() {
    super.initState();
    _currentDate = DateTime.now();
    _startTime = DateFormat('hh:mm a').format(DateTime.now()).toString();
    _endTime = _startTime;
    dateAndTime = DateAndTime();
  }

  int _selectedColor = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.theme.colorScheme.background,
        leading: GoBack(),
        actions: [
          AppBarUserProfilePic(),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: 20.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Add Task',
                style: headingStyle,
              ),
              MyInputFormField(
                label: 'Title',
                hint: 'Enter your title',
              ),
              MyInputFormField(
                label: 'Note',
                hint: 'Enter your note',
                minLines: 3,
                maxLines: 5,
                textInputType: TextInputType.multiline,
              ),
              MyInputFormField(
                label: 'Date',
                hint: DateFormat.yMd().format(_currentDate),
                suffixIcon: IconButton(
                  onPressed: () {
                    dateAndTime.getDateFromUser(context);
                  },
                  icon: Icon(
                    Icons.calendar_today_outlined,
                    color: Colors.grey,
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: MyInputFormField(
                      label: 'Start Time',
                      hint: _startTime,
                      suffixIcon: IconButton(
                        onPressed: () {
                          dateAndTime
                              .getTimeFromUser(context, TimeSelector.startTime,
                                  _startTime, _endTime)
                              .then((value) {
                            if (value != '') {
                              setState(() {
                                _startTime = value;
                              });
                            } else {
                              print('Start picked Time god cancelled');
                            }
                          });
                        },
                        icon: Icon(
                          Icons.access_time,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: MyInputFormField(
                      label: 'End Time',
                      hint: _endTime,
                      suffixIcon: IconButton(
                        onPressed: () {
                          dateAndTime
                              .getTimeFromUser(context, TimeSelector.endTime,
                                  _startTime, _endTime)
                              .then((value) {
                            if (value != '') {
                              setState(() {
                                _endTime = value;
                              });
                            } else {
                              print('End picked Time god cancelled');
                            }
                          });
                        },
                        icon: Icon(
                          Icons.access_time,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              MyInputFormField(
                label: 'Remind',
                hint: '$_selectedRemind minutes early',
                suffixIcon: DropdownButtonHideUnderline(
                  child: ButtonTheme(
                    alignedDropdown: true,
                    child: DropdownButton(
                      items: _remindList.map<DropdownMenuItem<String>>(
                        (int value) {
                          return DropdownMenuItem<String>(
                            value: value.toString(),
                            child: Text(
                              value.toString(),
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          );
                        },
                      ).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedRemind = int.parse(value);
                        });
                      },
                      underline: Container(),
                      icon: Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.grey,
                      ),
                      iconSize: 32,
                      elevation: 4,
                      style: subTitleStyle,
                    ),
                  ),
                ),
              ),
              MyInputFormField(
                label: 'Repeat',
                hint: '$_selectedRepeat',
                suffixIcon: DropdownButtonHideUnderline(
                  child: ButtonTheme(
                    alignedDropdown: true,
                    child: DropdownButton(
                      items: _repeatList.map<DropdownMenuItem<String>>(
                        (String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          );
                        },
                      ).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedRepeat = value;
                          print(_selectedRepeat);
                        });
                      },
                      underline: Container(),
                      icon: Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.grey,
                      ),
                      iconSize: 32,
                      elevation: 4,
                      style: subTitleStyle,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _colorPalette(),
                    MyButton(
                      label: 'Create Task',
                      onTap: null,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column _colorPalette() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Color',
          style: titleStyle,
        ),
        SizedBox(
          height: 8.0,
        ),
        Wrap(
          children: List<Widget>.generate(3, (index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedColor = index;
                });
              },
              child: Padding(
                padding: EdgeInsets.only(
                  right: 8.0,
                ),
                child: CircleAvatar(
                  backgroundColor: index == 0
                      ? primaryClr
                      : index == 1
                          ? pinkColor
                          : yellowClr,
                  radius: 14,
                  child: _selectedColor == index
                      ? Icon(
                          Icons.done,
                          color: white,
                        )
                      : SizedBox.shrink(),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}

class GoBack extends StatelessWidget {
  const GoBack({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => Get.back(),
      icon: Icon(
        Icons.arrow_back_ios_rounded,
        size: 20,
        color: Get.isDarkMode ? Colors.white : Colors.black,
      ),
    );
  }
}
