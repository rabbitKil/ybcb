import 'package:flutter/material.dart';
import 'package:ybcb/generated/l10n.dart';

class ReadView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ReadView();
}

class _ReadView extends State<ReadView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(S.of(context).mainTabLabelRead),
    );
  }
}