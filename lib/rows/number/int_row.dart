import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/rows/focusable_row.dart';

class IntRow extends FocusableRow<int> {
  final String title;
  final FocusNode _focusNode;
  ValueChanged<String> onFieldSubmitted;

  IntRow({this.title, this.onFieldSubmitted}) : _focusNode = new FocusNode();

  @override
  State<StatefulWidget> createState() {
    return new _IntRowState();
  }

  @override
  FocusNode get focusNode => _focusNode;
}

class _IntRowState extends State<IntRow> {
  int value;

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
        this.value = int.parse(value);
        if (widget.onChanged != null) widget.onChanged(this.value);
        if (widget.onFieldSubmitted != null) {
          widget.onFieldSubmitted(value);
        }
        if(widget.onFocusNext != null) {
          widget.onFocusNext();
        }
      },
      onSaved: (String value) {
        this.value = int.parse(value);
        if (widget.onChanged != null) widget.onChanged(this.value);
      },
      focusNode: widget.focusNode,
      keyboardType: TextInputType.number,
      inputFormatters: [
        WhitelistingTextInputFormatter.digitsOnly,
      ],
    );
  }
}
