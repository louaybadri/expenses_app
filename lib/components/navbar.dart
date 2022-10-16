// TODO Implement this library.
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:masroufi/components/text_nav_bar.dart';
import 'package:masroufi/config/config.dart';
import 'package:masroufi/screens/home_screen.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key, required this.notifyParent}) : super(key: key);
final Function() notifyParent;
  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: SettingConfig.height * 0.1,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
              onTap: ()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen())),child: const TextNavBar(navItemName: 'Home', icon: Icons.home, on: true)),
          InkWell(
            onTap:clearTable,
              child:const TextNavBar(
                  navItemName: 'History', icon: Icons.history, on: false)),
          InkWell(
              onTap: (){

                LocalStorage l = LocalStorage("tasks");
                print(l.getItem('expenses'));
                  l.setItem("expenses", []);

                widget.notifyParent();
              }
              ,child: const TextNavBar(navItemName: 'Settings', icon: Icons.settings, on: false)),
        ],
      ),
    );
  }

  void clearTable() {
    LocalStorage l = LocalStorage("tasks");
    setState(()=>l.setItem('expenses', []));
    print('cleared');

    widget.notifyParent();
  }
}
