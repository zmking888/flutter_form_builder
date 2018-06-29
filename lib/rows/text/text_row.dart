import 'package:flutter/material.dart';
import 'package:flutter_form_builder/rows/row.dart';

class TextRow extends BaseRow<String> {
  TextRow(String title) : super(title);

  @override
  Widget build() {
    return new TextFormField(
      initialValue: this.value == null ? "" : this.value,
      enabled: this.enable,
      decoration: new InputDecoration(
        labelText: title,
        filled: true,
        hintText: null,
      ),
      onSaved: (String value) {
        this.value = value;
      },
    );
  }
}
