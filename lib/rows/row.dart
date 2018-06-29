import 'package:flutter/material.dart';

abstract class BaseRow<T> {
  bool enable;
  String tag;
  T value;

  String _title;
  String get title => _title;
  FormFieldSetter<T> onSaved;

  BaseRow(String title, {this.enable=true, this.tag,this.onSaved}) : _title = title {
    assert(_title != null);
  }
  Widget build();

  FocusNode get focusNode => null;


}