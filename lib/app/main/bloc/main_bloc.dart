import 'dart:async';

import 'package:rxdart/rxdart.dart';

enum MainTabs {
  home,
  read,
  learn
}

class MainBloc {
  final StreamController<MainTabs> _tabController = BehaviorSubject<MainTabs>();
  Stream<MainTabs> get tabStream => _tabController.stream;

  final initialTab = MainTabs.home;

  void changeTab(MainTabs tab) {
    _tabController.add(tab);
  }

  void dispose() {
    _tabController.stream.drain();
    _tabController.close();
  }
}