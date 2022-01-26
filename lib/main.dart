import 'package:flutter/material.dart';
import 'pizza.dart';
import 'register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: '2.3',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: '2.3'),
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int WidgetIndex = 0;


  @override
  Widget build(BuildContext context) {

    List<Widget> MyWidgets = [
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            'Main screen',
            textAlign: TextAlign.center,
          )
        ],
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            'Экран помощи',
          ),
          Text(
            'тут будет описание работы приложения и ответы на вопросы',
          ),
        ],
      ),
      Column(
        children: <Widget>[
          Text(
            'Еще какой-то экран',
            style: TextStyle(fontSize: 20)
          ),
        ],
      ),

    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          TextButton(
              onPressed: () => {Navigator.push(context, MaterialPageRoute(builder: (context) => pizza()))},
              child: const Text ("Пицца", style: TextStyle(color: Colors.white),)
          ),
          IconButton(
              onPressed: () => {Navigator.push(context, MaterialPageRoute(builder: (context) => register()))},
              icon: const Icon(Icons.account_circle_outlined)),
          IconButton(
              onPressed: () {
                setState(() {
                  WidgetIndex = 1;
                });
              },
              icon: const Icon(Icons.help))
        ],
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Кейс 2.3'),
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.indigo,
              ),
            ),
            ListTile(
              title: Text('Пункт 1'),
              onTap: () {
                Navigator.pop(context);
                final snackBar = SnackBar(content: Text('Пункт 1'));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
            ),
            ListTile(
              title: Text('Пункт 2'),
              onTap: () {
                Navigator.pop(context);
                final snackBar = SnackBar(content: Text('Пункт 2'));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
            ),
            Divider(),
            ListTile(
              title: Text('Регистрация'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => register()));
              },
            ),
            ListTile(
              title: Text('Заказ пиццы'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => pizza()));
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items:  <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Main',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help),
            label: 'Помощь',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
        currentIndex: WidgetIndex,
        selectedItemColor: Colors.indigo[800],
        onTap: (int index) {
          setState(() {
            WidgetIndex = index;
            print(WidgetIndex);
            print(MyWidgets[WidgetIndex]);
            print("");
          });
        },
      ),
      body: Center(child: MyWidgets[WidgetIndex]),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
