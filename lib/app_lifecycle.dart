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
  bool isHidden = false;
  String appState = '';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    timerP();
  }

  void timerP() async {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (active) {
          setState(() {
            count += 1;
          });
        }
      },
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    setState(() {
      if (state == AppLifecycleState.resumed) {
        active = true;
        isHidden = false;
        appState = 'Resumed';
        print("///Resumed///");
      } else if (state == AppLifecycleState.inactive) {
        active = false;
        appState = 'Inactive';
        print("///Resumed///");
      } else if (state == AppLifecycleState.paused) {
        active = false;
        appState = 'Paused';
        print("///Resumed///");
      } else if (state == AppLifecycleState.detached) {
        appState = 'Detached';
        print("///Resumed///");
      } else if (state == AppLifecycleState.hidden) {
        isHidden = true;
        appState = 'Hidden';
        print("///Resumed///");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App Lifecycle Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Count: $count',
              style: TextStyle(fontSize: 40),
            ),
            SizedBox(height: 20),
            Text(
              'App State: $appState',
              style: TextStyle(fontSize: 20),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  count = 0;
                });
              },
              child: Text('Reset Count'),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();

    WidgetsBinding.instance.removeObserver(this);
    timer?.cancel();
  }
}
