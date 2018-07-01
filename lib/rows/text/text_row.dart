import 'package:flutter/material.dart';
import 'package:flutter_form_builder/rows/focusable_row.dart';


class TextRow extends FocusableRow<String> {
  final String title;
  final FocusNode _focusNode;
  ValueChanged<String> onFieldSubmitted;
  TextRow({this.title, this.onFieldSubmitted}) : _focusNode = new FocusNode();

  @override
  State<StatefulWidget> createState() {
    return new _TextRowState();
  }

  @override
  FocusNode get focusNode => _focusNode;
}

class _TextRowState extends State<TextRow> {
  String value;
  @override
  Widget build(BuildContext context) {
    return new TextFormField(
      key: widget.key,
      initialValue: this.value == null ? "" : this.value,
      enabled: widget.enable,
      decoration: new InputDecoration(
        labelText: widget.title,
        filled: true,
        hintText: null,
      ),
      onFieldSubmitted: (String value) {
        this.value = value;
        if(widget.onChanged != null)
          widget.onChanged(value);
        if(widget.onFieldSubmitted != null) {
          widget.onFieldSubmitted(value);
        }
        if(widget.onFocusNext != null) {
          widget.onFocusNext();
        }
      },
      onSaved: (String value) {
        this.value = value;
        if(widget.onChanged != null)
          widget.onChanged(value);
      },
      focusNode: widget.focusNode,
    );
  }
}
