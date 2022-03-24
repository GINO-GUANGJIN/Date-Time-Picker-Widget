import 'package:builddatetimepicker/widgets/widgets.dart';
import 'package:flutter/material.dart';

class TimePickerWidget extends StatefulWidget {
  const TimePickerWidget({ Key? key }) : super(key: key);

  @override
  State<TimePickerWidget> createState() => _TimePickerWidgetState();
}

class _TimePickerWidgetState extends State<TimePickerWidget> {

  TimeOfDay? time;

  String getText() {
    if (time == null) {
      return 'Select Time';
    } else {
      final hours = time!.hour.toString().padLeft(2,'0');
      final minute = time!.hour.toString().padLeft(2,'0');
      // return DateFormat('MM/dd/yyyy').format(time!);
      return '$hours:$minute';
    }
  }

  @override
  Widget build(BuildContext context) {
    return ButtonHeaderWidget(
      title: 'Time',
      text: getText(),
      onClicked: () => pickTime(context),
    );
  }

  Future pickTime(BuildContext context) async {
    const initialTime = TimeOfDay(hour: 9, minute: 0);
    final newTime = await showTimePicker(
      context: context, 
      initialTime: time ?? initialTime,
    );

    if (newTime == null) return;

    setState(() {
      time = newTime;
    });
  }
}