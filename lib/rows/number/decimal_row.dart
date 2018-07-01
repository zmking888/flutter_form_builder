import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/rows/focusable_row.dart';

class DecimalRow extends FocusableRow<int> {
  final String title;
  final FocusNode _focusNode;
  ValueChanged<String> onFieldSubmitted;

  DecimalRow({this.title, this.onFieldSubmitted}) : _focusNode = new FocusNode();

  @override
  State<StatefulWidget> createState() {
    return new _DecimalRowState();
  }

  @override
  FocusNode get focusNode => _focusNode;
}

class _DecimalTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final StringBuffer newText = new StringBuffer();
    int selectionIndex = newValue.selection.end;
    int subdivisionIdx = newValue.text.indexOf(".");
    int subdivisionMaskCount = '.'.allMatches(newValue.text).length;
    return new TextEditingValue(
      text: newText.toString(),
      selection: new TextSelection.collapsed(offset: selectionIndex),
    );
  }

}

class _DecimalRowState extends State<DecimalRow> {
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

      ],
    );
  }
}
