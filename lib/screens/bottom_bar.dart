import 'package:flutter/material.dart';
import 'package:ticketbookapp/screens/home_screen.dart';
import 'package:ticketbookapp/screens/profile_screen.dart';
import 'package:ticketbookapp/screens/search_screen.dart';
import 'package:ticketbookapp/screens/ticket_screen.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
static int  _selectedItemIndex=0;
  static final List<Widget> _widgetOption=<Widget>[

    // const Text("Home"), //0
    const MyHomePage(),
    const SearchScreen(), //1
    const TicketScreen(), //2
    const ProfileScreen(), //3

  ];
  void _onTappedBtn(int index){
    setState(() {
      _selectedItemIndex=index;
    });



  }
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return Scaffold(

          body:  Builder(
            builder: (context) {
              return Center(
                  child: _widgetOption[_selectedItemIndex],
              );
            }
          ),
          bottomNavigationBar: BottomNavigationBar(
            onTap: _onTappedBtn,
            currentIndex: _selectedItemIndex,

            selectedItemColor: Colors.blueGrey,
            unselectedItemColor: Colors.blue,
            elevation: 20,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,

            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
              BottomNavigationBarItem(icon: Icon(Icons.search),label: "Search"),
              BottomNavigationBarItem(icon: Icon(Icons.airplane_ticket), label:"Ticket"),
              BottomNavigationBarItem(icon: Icon(Icons.person),label: "Profile"),
            ],
          ),
        );
      }
    );
  }

}
