import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/rows/row.dart';

class DecimalRow extends BaseRow<num> {
  DecimalRow(String title) : super(title);

  @override
  Widget build() {
    return new TextFormField(
      decoration: new InputDecoration(
        labelText: title,
        filled: true,
      ),
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      enabled: this.enable,
      onSaved: (String value) {
        this.value = num.parse(value);
        if(this.onSaved != null) {
          this.onSaved(this.value);
        }
      },
    );
  }
}
