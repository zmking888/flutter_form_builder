import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/rows/row.dart';

class IntRow extends BaseRow<int> {
  IntRow(String title) : super(title);
  TextEditingController _controller = new TextEditingController();

  @override
  Widget build() {
    return new TextFormField(
      controller: _controller,
      keyboardType: TextInputType.number,
      enabled: this.enable,
      decoration: new InputDecoration(
        labelText: title,
        filled: true,
        hintText: null,
      ),
      inputFormatters: [
        WhitelistingTextInputFormatter.digitsOnly
      ],
      onSaved: (String value) {
        this.value = int.parse(value);
        if(this.onSaved != null) {
          this.onSaved(this.value);
        }
      },
    );
  }
}
