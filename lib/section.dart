import 'package:flutter/material.dart';
import 'package:flutter_form_builder/rows/focusable_row.dart';

class Section extends StatefulWidget {
  final List<Widget> children;

  Section({this.children = const <Widget>[]});

  @override
  State<StatefulWidget> createState() {
    return new _SectionState();
  }
}

class _SectionState extends State<Section> {
  @override
  Widget build(BuildContext context) {
    FocusNode currentFocusNode;
    for(Widget widget in widget.children.reversed) {
      if(widget is FocusableRow) {
        if(currentFocusNode != null) {
          FocusNode node = currentFocusNode;
          widget.onFocusNext = () {
            FocusScope.of(context).requestFocus(node);
          };
        }
        currentFocusNode = widget.focusNode;
      }else {
        currentFocusNode = null;
      }
    }
    return new Column(children: widget.children,);
  }
}