import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}




class ResponseClass {
  Response response;

  ResponseClass({this.response});

  ResponseClass.fromJson(Map<String, dynamic> json) {
    response = json['response'] != null
        ? new Response.fromJson(json['response'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.response != null) {
      data['response'] = this.response.toJson();
    }
    return data;
  }
}

class Response {
  int numFound;
  int start;
  double maxScore;
  List<Docs> docs;

  Response({this.numFound, this.start, this.maxScore, this.docs});

  Response.fromJson(Map<String, dynamic> json) {
    numFound = json['numFound'];
    start = json['start'];
    maxScore = json['maxScore'];
    if (json['docs'] != null) {
      docs = new List<Docs>();
      json['docs'].forEach((v) {
        docs.add(new Docs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['numFound'] = this.numFound;
    data['start'] = this.start;
    data['maxScore'] = this.maxScore;
    if (this.docs != null) {
      data['docs'] = this.docs.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Docs {
  String id;
  String journal;
  String eissn;
  String publicationDate;
  String articleType;
  List<String> authorDisplay;
  List<String> abstract;
  String titleDisplay;
  double score;

  Docs(
      {this.id,
      this.journal,
      this.eissn,
      this.publicationDate,
      this.articleType,
      this.authorDisplay,
      this.abstract,
      this.titleDisplay,
      this.score});

  Docs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    journal = json['journal'];
    eissn = json['eissn'];
    publicationDate = json['publication_date'];
    articleType = json['article_type'];
    authorDisplay = json['author_display'].cast<String>();
    abstract = json['abstract'].cast<String>();
    titleDisplay = json['title_display'];
    score = json['score'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['journal'] = this.journal;
    data['eissn'] = this.eissn;
    data['publication_date'] = this.publicationDate;
    data['article_type'] = this.articleType;
    data['author_display'] = this.authorDisplay;
    data['abstract'] = this.abstract;
    data['title_display'] = this.titleDisplay;
    data['score'] = this.score;
    return data;
  }
}