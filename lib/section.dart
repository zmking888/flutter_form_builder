import 'package:flutter_form_builder/rows/row.dart';
import 'package:flutter/material.dart' as meterial;

class Section {
  String _title;
  String get title => _title;
  List<BaseRow> _rows = [];
  List<BaseRow> get rows => _rows;
  meterial.Widget _widget;
  meterial.Widget get widget => _widget;

  Section({String title}) : _title = title {
    assert(_title != null);
  }

  operator << (BaseRow row) {
    _rows.add(row);
    return this;
  }

  Section addRow(BaseRow row) {
    _rows.add(row);
    return this;
  }
}