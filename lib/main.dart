// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/cupertino.dart';
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
      child: new Stack(
        children: <Widget>[
          Center(
            child: Container(
              color: CupertinoColors.darkBackgroundGray,
              width: MediaQuery.of(context).size.width / 2,
              height: MediaQuery.of(context).size.height / 2,
            ),
          ),
        ],
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
