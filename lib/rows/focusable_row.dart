import 'package:flutter/material.dart';
import 'package:flutter_form_builder/rows/form_row.dart';

abstract class FocusableRow<T> extends FormRow<T> {

  VoidCallback onFocusNext;
  @override
  FocusNode get focusNode => null;


}