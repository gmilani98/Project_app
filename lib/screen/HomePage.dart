//import 'dart:html';
//import 'dart:ui';

import 'dart:html';

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:prova/screen/LoginPage.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatefulWidget {
  static const route = '/HomePage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  PageController pageController = PageController();

  void onTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "App prova",
            style: TextStyle(
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Color.fromARGB(255, 0, 110, 255),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 30.0, 0.0),
              child: IconButton(
                tooltip: "Esci",
                icon: const Icon(MdiIcons.closeBox),
                onPressed: () {
                  Navigator.pop(context, '/LoginPage');
                },
              ),
            ),
          ],
        ),
        drawer: NewDrawer(),
        body: PageView(
          controller: pageController,
          children: [
            Center(
              child: Container(
                child: Text("CIAO"),
              ),
            ),
            Center(
              child: Container(
                child: Text("CIAO 2"),
              ),
            ),
            Center(child: Container(child: Text('CIAO 3'))),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          //backgroundColor: Color.fromARGB(255, 0, 110, 255),
          currentIndex: _selectedIndex,
          type: BottomNavigationBarType.shifting,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.supervisor_account,
                color: Colors.black,
              ),
              label: 'Profilo',
              tooltip: 'Profilo',
              backgroundColor: Color.fromARGB(255, 255, 0, 0),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.info,
                color: Colors.black,
              ),
              label: 'Informazioni',
              tooltip: 'Informazioni',
              backgroundColor: Color.fromARGB(255, 251, 255, 0),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.other_houses,
                color: Colors.black,
              ),
              label: "Curiosità",
              tooltip: 'Curiosità',
              backgroundColor: Color.fromARGB(255, 0, 255, 0),
            ),
          ],
          onTap: onTapped,
        ),
      ),
    );
  }
}

class NewDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color.fromRGBO(50, 55, 205, 1),
        child: ListView(
          children: [
            DrawerHeader(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Nome profilo",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                Text(
                  "Email",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ],
            )),
            ListTile(
              selectedTileColor: Colors.white24,
              leading: Icon(
                Icons.person,
                color: Colors.white,
              ),
              title: Text(
                "Profile",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              selectedTileColor: Colors.white24,
              title: Text(
                "Profile information",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              onTap: () {
                Navigator.pop(context, '/HomePage'); //esempio mio da fare
              },
            ),
          ],
        ),
      ),
    );
  }
}

