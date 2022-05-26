import 'package:final_project_app/Screens/add_contact.dart';
import 'package:final_project_app/Screens/app_drawer.dart';
import 'package:final_project_app/Screens/chats_screen.dart';
import 'package:final_project_app/Screens/emergency_contacts.dart';
import 'package:final_project_app/Screens/home_screen.dart';
import 'package:final_project_app/Screens/map_screen.dart';
import 'package:final_project_app/Widget/widget.dart';
import 'package:flutter/material.dart';

class BottomNevigations extends StatefulWidget {
  const BottomNevigations({Key? key}) : super(key: key);

  @override
  State<BottomNevigations> createState() => _BottomNevigationsState();
}

class _BottomNevigationsState extends State<BottomNevigations> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    ChatScreen(),
    EmergencyScreen(),
    AddContactScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
          child: AppDrawer(),
        ),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: appBarMain("PAN!C"),
        ),
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Colors.blue, Colors.purple, Colors.red.shade500])),
          child: BottomNavigationBar(
            backgroundColor: Colors.transparent,
            type: BottomNavigationBarType.fixed,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.message_sharp),
                label: 'Chats',
                backgroundColor: Colors.green,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.donut_large_sharp),
                label: 'Emergency',
                backgroundColor: Colors.purple,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_add_alt),
                label: 'Add Contact',
                backgroundColor: Colors.purple,
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.white,
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }
}
