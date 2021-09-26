import 'package:flutter/material.dart';
import 'package:ybcb/generated/l10n.dart';

class LearnView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LearnView();
}

class _LearnView extends State<LearnView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(S.of(context).mainTabLabelLearn),
    );
  }
}