// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomeScreen> {
  final _localRenderer = new RTCVideoRenderer();

  @override
  void dispose() {
    super.dispose();
    _localRenderer.dispose();
  }

  @override
  void initState() {
    super.initState();
    initRenders();
    _getUsermedia();
  }

  initRenders() async {
    await _localRenderer.initialize();
  }

  _getUsermedia() async {
    final Map<String, dynamic> mediaConstraints = {
      'audio': 'true',
      'video': {'facingMode': 'user'}
    };

    MediaStream stream = await navigator.getUserMedia(mediaConstraints);
    _localRenderer.srcObject = stream;
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Colors.yellow,
      child: new SafeArea(
        child: new Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Positioned.fill(
              child: Align(
                alignment: Alignment.center,
                child: new Column(
                  // alignment: Alignment.bottomCenter,
                  children: <Widget>[
                    new Container(
                      // margin: new EdgeInsets.all(20.0),
                      padding: new EdgeInsets.all(20),
                      // color: CupertinoColors.systemTeal,
                      width: MediaQuery.of(context).size.width / 100 * 90,
                      height: MediaQuery.of(context).size.height /
                          100 *
                          30, // 30 precent of the screen
                      child: new Column(
                        children: [
                          new Container(
                            alignment: Alignment.center,
                            child: Text(
                              "00.00",
                              // style: DefaultTextStyle.of(context)
                              //     .style
                              //     .apply(fontSizeFactor: 2.0),
                              style: TextStyle(
                                fontFamily: '24 display',
                                fontSize: 50,
                              ),
                            ),
                            width: MediaQuery.of(context).size.width /
                                100 *
                                90 / // this is the width of the parent
                                100 *
                                50,
                            height: MediaQuery.of(context).size.height /
                                100 *
                                30 /
                                100 *
                                30,
                            decoration: BoxDecoration(
                              color: Colors.green[700],
                              borderRadius:
                                  new BorderRadius.all(Radius.circular(3)),
                              border: Border.all(
                                width: 5,
                                color: Colors.black,
                                style: BorderStyle.solid,
                              ),
                            ),
                          ),
                          new IntrinsicHeight(
                              child: new Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: new Container(
                                  child: Text("Lock"),
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: new Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Expanded(
                                      child: new Container(
                                        child: Text("Up"),
                                        decoration: BoxDecoration(
                                          color: Colors.green,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: new Container(
                                        child: Text("Down"),
                                        decoration: BoxDecoration(
                                          color: Colors.green,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: new Container(
                                  child: Text("Power"),
                                  decoration: BoxDecoration(
                                    color: Colors.purple,
                                  ),
                                ),
                              ),
                            ],
                          )),
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey[800],
                        borderRadius: new BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(30),
                          bottomLeft: Radius.circular(30),
                        ),
                        border: Border.all(
                          width: 5,
                          color: Colors.black,
                          style: BorderStyle.solid,
                        ),
                      ),
                    ),
                    new Container(
                      alignment: Alignment.center,
                      margin: new EdgeInsets.only(top: 80),
                      // color: CupertinoColors.systemTeal,
                      width: MediaQuery.of(context).size.width / 100 * 90,
                      height: MediaQuery.of(context).size.height /
                          100 *
                          30, // 30 precent of the screen
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/talk-image-off.png"),
                        ),
                      ),
                    ), // ptt button
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Welcome to Flutter',
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Welcome to Flutter'),
//         ),
//         body: Center(
//           child: Text('Hello World'),
//         ),
//       ),
//     );
//   }
// }

// inleiding
// waarom doe ik dit
// vraag en doel
// bewijs last
// conclusie
// --------------------------
//| ontwerp realiseren       |
//| analyseren advies        |
// --------------------------
