import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'widgets.dart';

class DatePickerWidget extends StatefulWidget {
  const DatePickerWidget({ Key? key }) : super(key: key);

  @override
  State<DatePickerWidget> createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  DateTime? date;

  String getText() {
    if (date == null) {
      return 'Select Date';
    } else {
      return DateFormat('MM/dd/yyyy').format(date!);
      // return '${date!.month}/${date!.day}/${date!.year}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return ButtonHeaderWidget(
      title: 'Date',
      text: getText(),
      onClicked: () => pickDate(context),
    );
  }

  Future pickDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context, 
      initialDate: date ?? initialDate, 
      firstDate: DateTime.now().subtract(const Duration(days: 365 * 150)),
      lastDate: DateTime(2100, 1, 1),    
    );

    if (newDate == null) return;

    setState(() {
      date = newDate;
    });
  }
}