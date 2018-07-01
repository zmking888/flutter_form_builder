import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/rows/form_row.dart';
import 'package:intl/intl.dart';

class DateRow extends FormRow<DateTime> {
  final String title;
  final DateTime firstDate;
  final DateTime lastDate;
  final SelectableDayPredicate selectableDayPredicate;

  DateRow({
    this.title,
    @required DateTime initialDate,
    @required this.firstDate,
    @required this.lastDate,
    this.selectableDayPredicate,
  }) : super(initialValue: initialDate) {
    assert(initialDate != null);
  }

  @override
  State<StatefulWidget> createState() =>
      new _DateRowState(datetime: initialValue);
}

class _DateRowState extends State<DateRow> {
  DateTime datetime;

  _DateRowState({this.datetime}) {
    if (datetime == null) {
      datetime = DateTime.now();
    }
  }

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: datetime,
      firstDate: widget.firstDate,
      lastDate: widget.lastDate,
      selectableDayPredicate: widget.selectableDayPredicate,
    );

    if (picked != null && picked != datetime) {
      setState(() {
        datetime = picked;
      });
      widget.onChanged(datetime);
    }
  }

  @override
  Widget build(BuildContext context) {
    String valueText = new DateFormat.yMMMd().format(datetime);
    final TextStyle valueStyle = Theme.of(context).textTheme.title;
    return new InkWell(
      onTap: () {
        _selectDate(context);
      },
      child: new InputDecorator(
        decoration: new InputDecoration(
          labelText: widget.title,
          filled: true,
        ),
        baseStyle: valueStyle,
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new Text(valueText, style: valueStyle),
            new Icon(Icons.arrow_drop_down,
                color: Theme.of(context).brightness == Brightness.light
                    ? Colors.grey.shade700
                    : Colors.white70),
          ],
        ),
      ),
    );
  }
}
