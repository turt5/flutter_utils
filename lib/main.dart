// main.dart

import 'dart:ui';

import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tutorial2/myDrawer.dart';
import 'package:flutter_tutorial2/theme_provider.dart';
import 'package:provider/provider.dart';
import 'navigation_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => NavigationProvider()),
        ChangeNotifierProvider(create: (context) => ThemeProvider())
      ],
      child: Builder(
        builder: (context) {
          // Use the builder function to get a new context
          return MaterialApp(
            title: 'Flutter Bottom Navigation with Provider',
            theme: Provider.of<ThemeProvider>(context).themeData,
            home: MyHomePage(),
          );
        },
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: Text('Bottom Navigation with Provider'),
      ),
      body: _buildPage(context),
      floatingActionButton: Container(
        width: 300,
        height: 80,
        margin: EdgeInsets.only(bottom: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: BackdropFilter(
            filter: ImageFilter.blur(
                sigmaX: 10,
                sigmaY: 10), // Adjust the sigma values for the blur effect
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white
                    .withOpacity(0.5), // Adjust the opacity and color as needed
                borderRadius: BorderRadius.circular(30),
              ),
              child: BottomNavigationBar(
                currentIndex:
                    Provider.of<NavigationProvider>(context).currentIndex,
                onTap: (index) {
                  Provider.of<NavigationProvider>(context, listen: false)
                      .changeIndex(index);
                },
                showSelectedLabels: false,
                showUnselectedLabels: false,
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
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
    return SafeArea(
        child: Container(
      color: Colors.red,
    ));
  }
}

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      color: Colors.blue,
    ));
  }
}

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      color: Colors.yellow,
    ));
  }
}
