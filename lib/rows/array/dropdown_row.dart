import 'package:flutter_form_builder/rows/form_row.dart';
import 'package:flutter/material.dart';

class DropdownRow<T> extends FormRow<T> {
  final List<T> options;
  final String title;

  DropdownRow(
      {this.title, ValueChanged<T> onChanged, T initialValue, this.options})
      : super(onChanged: onChanged, initialValue: initialValue) {
    assert(options != null);
    assert(options.contains(initialValue));
  }

  @override
  State<StatefulWidget> createState() {
    return new _DropdownRowState<T>(value: this.initialValue);
  }
}

class _DropdownRowState<T> extends State<DropdownRow> {
  T value;

  _DropdownRowState({this.value});

  DropdownMenuItem<T> _buildDropdownItem(dynamic option) {
    return new DropdownMenuItem<T>(
      value: option,
      child: new Text(option.toString()),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<T>> items =
        widget.options.map(_buildDropdownItem).toList();
    return new Row(
      children: <Widget>[
        new Expanded(child: new Text(widget.title)),
        new DropdownButton<T>(
            key: widget.key,
            value: value,
            items: items,
            onChanged: (T value) {
              setState(() {
                this.value = value;
              });
              if(this.widget.onChanged != null) {
                this.widget.onChanged(value);
              }
            }),
      ],
    );
  }
}
