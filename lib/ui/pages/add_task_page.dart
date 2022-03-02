import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:panda/services/dateAndTime.dart';
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

  @override
  void initState() {
    super.initState();
    _currentDate = DateTime.now();
    _startTime = DateFormat('hh:mm a').format(DateTime.now()).toString();
    _endTime = _startTime;
    dateAndTime = DateAndTime();
  }

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
            ],
          ),
        ),
      ),
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
