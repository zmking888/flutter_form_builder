import 'package:flutter/material.dart';

abstract class FormRow<T> extends StatefulWidget{
  final bool enable;
  final String tag;
  final T initialValue;
  final ValueChanged<T> onChanged;

  FormRow(
      {this.enable = true, this.tag, this.onChanged, this.initialValue});

  FocusNode get focusNode => null;
}
