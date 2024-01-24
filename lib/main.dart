// main.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'navigation_provider.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NavigationProvider(),
      child: MaterialApp(
        title: 'Flutter Bottom Navigation with Provider',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Bottom Navigation with Provider'),
      ),
      body: _buildPage(context),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: Provider.of<NavigationProvider>(context).currentIndex,
        onTap: (index) {
          Provider.of<NavigationProvider>(context, listen: false).changeIndex(index);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Page 1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Page 2',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Page 3',
          ),
        ],
      ),
    );
  }

  Widget _buildPage(BuildContext context) {
    switch (Provider.of<NavigationProvider>(context).currentIndex) {
      case 0:
        return Page1();
      case 1:
        return Page2();
      case 2:
        return Page3();
      default:
        return Container(); // Handle other cases as needed
    }
  }
}

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Container(
      color: Colors.red,
    ));
  }
}

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Container(
      color: Colors.blue,
    ));
  }
}

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Container(
      color: Colors.yellow,
    ));
  }
}