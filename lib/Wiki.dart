import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WikipediaExplorer extends StatefulWidget {
  const WikipediaExplorer({Key? key,required this.name}) : super(key: key);
  final String name;
  @override
  WikiState createState() => WikiState();
}

class WikiState extends State<WikipediaExplorer> {
  late WebViewController _controller;
  late String something = 'https://en.wikipedia.org/wiki/' + widget.name;


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // title: 'Flutter Demo',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      home: Scaffold(

        // appBar: AppBar(
        //   title: Text("Birds Information"),
        // ),
        body: Center(
          child: WebView(
            initialUrl: something,
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              _controller = webViewController;
            },
          ),
        ),
      ),
    );
  }
}