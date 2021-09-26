import 'package:flutter/material.dart';
import 'package:ybcb/config/view_config.dart';
import 'package:ybcb/generated/l10n.dart';
import 'package:ybcb/app/main/bloc/main_bloc.dart';
import 'package:ybcb/app/main_home/ui/home_view.dart';
import 'package:ybcb/app/main_learn/ui/learn_view.dart';
import 'package:ybcb/app/main_read/read_view.dart';

class MainView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainView();
}

class _MainView extends State<MainView> {
  final _bloc = MainBloc();
  final _tabMap = {
    MainTabs.home: HomeView(),
    MainTabs.read: ReadView(),
    MainTabs.learn: LearnView()
  };

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () { return; },
      child: StreamBuilder<MainTabs>(
        stream: _bloc.tabStream,
        initialData: _bloc.initialTab,
        builder: (context, snapshot) {
          final tab = snapshot.data;
          return Scaffold(
            body: SafeArea(
              child: AnimatedSwitcher(
                duration: ViewConfig.mainTabViewSwitchingDuration,
                child: _tabMap[tab],
              ),
            ),
            bottomNavigationBar: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Divider(height: 1, color: Colors.grey),
                BottomNavigationBar(
                  currentIndex: MainTabs.values.indexOf(tab),
                  items: <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home_rounded),
                      label: S.of(context).mainTabLabelHome
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.article_rounded),
                      label: S.of(context).mainTabLabelRead
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.rate_review_rounded),
                      label: S.of(context).mainTabLabelLearn
                    ),
                  ],
                    onTap: (int index) => _bloc.changeTab(MainTabs.values[index]),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}