import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Example2 extends StatefulWidget {
  final int number;

  const Example2({super.key, required this.number});

  @override
  State<Example2> createState() {
    print("///////createState////");
    return _Example2State();
  }
}

class _Example2State extends State<Example2> {
  int number = 1;
  @override
  // TODO: implement mounted
  bool get mounted => super.mounted;
  @override
  void initState() {
    super.initState();
    // print(Theme.of(context)); Error in runtime
    print("//////initState${widget.number}///$mounted//////");
    number = widget.number;
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print(Theme.of(context));
    print("didChangeDependencies$mounted");
    // if any dependencies changes
  }

  @override
  void didUpdateWidget(covariant Example2 oldWidget) {
    // respond any to changes in our widget
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget $mounted");
    if (oldWidget.number != widget.number) {
      print("cahnged $mounted");
    }
  }

  @override
  void reassemble() {
    // TODO: implement reassemble
    super.reassemble();
    print("hotReload reassemble $mounted");
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    print("deactivate");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("//////dispose${widget.number}/////////");
  }

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print("////build $mounted");
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                print("setState ${mounted}");
                number += 1;
              });
            },
            icon: Icon(
              Icons.add,
            ),
          )
        ],
      ),
      body: Center(
        child: Text(
          number.toString(),
          style: TextStyle(fontSize: 60),
        ),
      ),
      // body: ListView.separated(
      //     itemBuilder: (context, index) {
      //       number = index + 1;
      //       return InkWell(
      //         onTap: () {
      //           setState(() {
      //             print("setState");
      //             number += 2;
      //           });
      //         },
      //         child: Text(number.toString()),
      //       );
      //     },
      //     separatorBuilder: (context, index) => Divider(),
      //     itemCount: 30),
    );
  }
}
