import 'package:digital_lcd/digital_lcd.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:skeu/skeu-btn.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class Btn {
  String text;
  void Function() callback;

  Btn(this.text, [this.callback]);
}

class _MyHomePageState extends State<MyHomePage> {
  List<Btn> texts = [];

  @override
  void initState() {
    super.initState();

    this.texts.add(Btn('('));
    this.texts.add(Btn(')'));
    this.texts.add(Btn('%'));
    this.texts.add(Btn('C', () {
          this.content = 0;
        }));
    this.texts.add(Btn('7', makeCallbackAdder(7)));
    this.texts.add(Btn('8', makeCallbackAdder(8)));
    this.texts.add(Btn('9', makeCallbackAdder(9)));
    this.texts.add(Btn('/'));
    this.texts.add(Btn('4', makeCallbackAdder(4)));
    this.texts.add(Btn('5', makeCallbackAdder(5)));
    this.texts.add(Btn('6', makeCallbackAdder(6)));
    this.texts.add(Btn('*'));
    this.texts.add(Btn('1', makeCallbackAdder(1)));
    this.texts.add(Btn('2', makeCallbackAdder(2)));
    this.texts.add(Btn('3', makeCallbackAdder(3)));
    this.texts.add(Btn('-'));
    this.texts.add(Btn('0', makeCallbackAdder(0)));
    this.texts.add(Btn('.'));
    this.texts.add(Btn('='));
    this.texts.add(Btn('+'));
  }

  int content = 0;

  void Function() makeCallbackAdder(int n) {
    return () {
      this.setState(() {
        this.content = this.content * 10 + n;
      });
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFFeaebf3),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    child: Lcd(context).Number(
                        number: this.content,
                        digitCount: 10,
                        lcdHeight: 60,
                        lcdWidth: 62,
                        digitAlignment: MainAxisAlignment.end),
                  ),
                ),
              ],
            ),
          ),
          StaggeredGridView.countBuilder(
            staggeredTileBuilder: (int index) => StaggeredTile.count(1, 1),
            itemCount: texts.length,
            crossAxisCount: 4,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            padding: EdgeInsets.all(20),
            shrinkWrap: true,
            itemBuilder: (BuildContext ctx, int i) {
              var text = texts[i];
              return SkeuButton(
                text: text.text,
                onPressed: () {
                  setState(() {
                    if (text.callback != null) text.callback();
                  });
                },
              );
            },
          ),
        ]),
      ),
    );
  }
}
