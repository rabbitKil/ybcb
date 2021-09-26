import 'package:flutter/material.dart';
import 'package:ybcb/generated/l10n.dart';

class HomeView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeView();
}

class _HomeView extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(S.of(context).mainTabLabelHome),
    );
  }
}