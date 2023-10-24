import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:watchlist/Screens/moviesPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return FlutterSizer(
        builder: (context, orientation, screenType) {
          return GetMaterialApp(
            title: 'WatchList',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: const MyHomePage(),
          );
        }
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  static List<Widget> _widgetOptions = <Widget>[
    MoviesScreen(),
    Container(),
    Container()
  ];

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("The Watcher"),
        actions: [
          IconButton(onPressed: () => print("Pressed"), icon: const Icon(Icons.settings))
        ],
      ),
      body: Container(
        child: MyHomePage._widgetOptions.elementAt(_currentIndex),
      ),
      bottomNavigationBar: SalomonBottomBar(
        onTap: (int val){
          print(val);
          setState(() {
            _currentIndex = val;
          });
        },
        currentIndex: _currentIndex,
        items: [
          SalomonBottomBarItem(icon: const Icon(Icons.movie_outlined), title: const Text("Movies")),
          SalomonBottomBarItem(icon: const Icon(Icons.tv_outlined), title: const Text("TV Shows")),
          SalomonBottomBarItem(icon: const Icon(Icons.list_outlined), title: const Text("Watchlist")),
        ],
      ),
    );
  }
}
