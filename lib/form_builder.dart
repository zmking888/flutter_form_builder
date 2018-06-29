import 'package:flutter/material.dart';
import 'package:flutter_form_builder/rows/row.dart';
import 'package:flutter_form_builder/section.dart';

class FormBuilder extends StatefulWidget {
  final List<Section> _sections;

  FormBuilder(List<Section> sections) : _sections = sections {
    assert(_sections != null);
  }

  @override
  State<StatefulWidget> createState() {
    return new _FormBuilderState();
  }
}

class _FormBuilderState extends State<FormBuilder> {
  Widget _buildSection(Section section) {
    List<Widget> widgets = [];

    final sectionWidget = section.widget == null
        ? Align(
            alignment: Alignment.centerLeft,
            child: new Text(section.title),
          )
        : section.widget;
    widgets.add(sectionWidget);
    widgets.addAll(section.rows.map((BaseRow row) => row.build()));

    return new Column(
      children: widgets,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Form(
        child: new SingleChildScrollView(
      child: new Column(
        children: widget._sections.map(_buildSection).toList(),
      ),
    ));
  }
}
