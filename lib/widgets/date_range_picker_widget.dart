import 'package:builddatetimepicker/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateRangePickerWidget extends StatefulWidget {
  const DateRangePickerWidget({ Key? key }) : super(key: key);

  @override
  State<DateRangePickerWidget> createState() => _DateRangePickerWidgetState();
}

class _DateRangePickerWidgetState extends State<DateRangePickerWidget> {
  DateTimeRange? dateRange;

  String getFrom() {
    if (dateRange == null) {
      return 'From';
    } else {
      return DateFormat('MM/dd/yyyy').format(dateRange!.start);
    }
  }

  String getUntil() {
    if (dateRange == null) {
      return 'Until';
    } else {
      return DateFormat('MM/dd/yyyy').format(dateRange!.end);
    }
  }

  @override
  Widget build(BuildContext context) {
    return HeaderWidget(
      title: 'Date Range',
      child: Row(
        children: [
          Expanded(
            child: ButtonWidget(
              text: 'From',
              onClicked: () => pickDateRange(context),
            )
          ),
          const SizedBox(width: 8),
          const Icon(Icons.arrow_forward, color: Colors.white),
          const SizedBox(width: 8),
          Expanded(
            child: ButtonWidget(
              text: getUntil(),
              onClicked: () => pickDateRange(context),
            ),
          ),
        ],
      ),
    );
  }

  Future pickDateRange(BuildContext context) async {
    final initialDateRange = DateTimeRange(
      start: DateTime.now(),
      end: DateTime.now().add(const Duration(hours: 24 * 3)),
    );
    final newDateRange = await showDateRangePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
      initialDateRange: dateRange ?? initialDateRange,
    );

    if (newDateRange == null) return;

    setState(() => dateRange = newDateRange);
  }
}