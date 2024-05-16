import 'dart:async';

import 'package:flutter/material.dart';

class AppLifeCycle extends StatefulWidget {
  const AppLifeCycle({super.key});

  @override
  State<AppLifeCycle> createState() => _AppLifeCycleState();
}

class _AppLifeCycleState extends State<AppLifeCycle>
    with WidgetsBindingObserver {
  Timer? timer;
  int count = 0;
  bool active = true;

  @override
  void initState() {
    super.initState();
    // add observer instance
    WidgetsBinding.instance.addObserver(this);
    //timer

    timerP();
  }

  void timerP() async {
    timer = Timer.periodic(
        const Duration(
          seconds: 1,
        ), (timer) {
      if (active) {
        setState(() {
          count += 1;
        });
      }
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      active = true;
      print("//AppLifecycle: Resumed ${state}//");
    } else if (state == AppLifecycleState.inactive) {
      active = false;
      print("//AppLifecycle: Inactive ${state}//");
    } else if (state == AppLifecycleState.paused) {
      active = false;

      print("//AppLifecycle: Paused${state}//");
    } else if (state == AppLifecycleState.detached) {
      print("//AppLifecycle: Detached ${state}//");
    } else if (state == AppLifecycleState.hidden) {
      print("//AppLifecycle: Hidden ${state}//");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          count.toString(),
          style: TextStyle(fontSize: 70),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // remove observer
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
    timer!.cancel();
  }
}
