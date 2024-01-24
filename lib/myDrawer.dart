import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tutorial2/theme_provider.dart';
import 'package:provider/provider.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DrawerHeader(
                  child: Center(
                child: Column(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      child: CircleAvatar(
                        // backgroundColor: Colors.black,
                        backgroundImage:
                            AssetImage('images/kaium-al-limon.jpg'),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text('Kaium Al Limon')
                  ],
                ),
              )),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Dark mode',
                          style: TextStyle(fontSize: 16),
                        ),
                        CupertinoSwitch(
                            value: Provider.of<ThemeProvider>(context,
                                    listen: false)
                                .isDark,
                            onChanged: (value) => Provider.of<ThemeProvider>(
                                    context,
                                    listen: false)
                                .toggleTheme())
                      ],
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Theme.of(context).colorScheme.primary)
                          .copyWith(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: BorderSide(
                                color: Colors.red.shade600, width: 2.0),
                          ),
                        ),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Logout',
                            style: TextStyle(color: Colors.white),
                          ),
                          Icon(
                            Icons.logout,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              )
            ]),
      ),
    );
  }
}
