import 'package:flutter/material.dart';

enum TimeSelector {
  startTime,
  endTime,
}

class DateAndTime {
  Future<DateTime> getDateFromUser(BuildContext context) async {
    DateTime _pickDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015),
      lastDate: DateTime(2100),
    );
    return _pickDate;
  }

  Future<String> getTimeFromUser(BuildContext context, TimeSelector type,
      String startTime, String endTime) async {
    String _formattedTime = '';
    TimeOfDay pickedTime =
        await _showTimePicker(context, type, startTime, endTime);
    if (pickedTime == null) {
      return '';
    } else {
      _formattedTime = pickedTime.format(context).toString();
      return _formattedTime;
    }
  }

  Future<TimeOfDay> _showTimePicker(BuildContext context, TimeSelector type,
      String startTime, String endTime) {
    return showTimePicker(
      initialEntryMode: TimePickerEntryMode.input,
      context: context,
      initialTime: TimeOfDay(
        //_startTime -> 10:30 AM
        hour: type == TimeSelector.startTime
            ? int.parse(startTime.split(':')[0])
            : int.parse(endTime.split(':')[0]),
        minute: type == TimeSelector.startTime
            ? int.parse(startTime.split(':')[1].split(' ')[0])
            : int.parse(endTime.split(':')[1].split(' ')[0]),
      ),
    );
  }
}
