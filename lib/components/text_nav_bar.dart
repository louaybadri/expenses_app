import 'package:flutter/material.dart';

import '../config/config.dart';

class TextNavBar extends StatelessWidget {
  const TextNavBar(
      {Key? key, required this.on, required this.icon, required this.navItemName})
      : super(key: key);
  final IconData icon;
  final bool on;
  final String navItemName;
  final Color black= Colors.black;
  final Color white= Colors.white;
  Widget ifOn(Widget child) =>
      Container(
          height: SettingConfig.height * 0.07,
          width: SettingConfig.width * 0.3,
          decoration: BoxDecoration(
            color: black,
              border: Border.all(
                  // color: on == true ? Colors.white : Colors.transparent,
                  width: 3),
              borderRadius: const BorderRadius.all(Radius.circular(10))
            // ,color: Colors.blueGrey
          ),
          child: Center(child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(icon, color: Colors.white,),
              Text(navItemName,style: const TextStyle(color: Colors.white)),
            ],
          )));
  Widget ifoff()=>Container(
  height: SettingConfig.height * 0.05,
  width: SettingConfig.width * 0.2,
  decoration: BoxDecoration(
  border: Border.all(
  color: on == true ? Colors.white : Colors.transparent,
  width: 3),
  borderRadius: const BorderRadius.all(Radius.circular(10))
  // ,color: Colors.blueGrey
  ),
  child: Center(child: Icon(icon, color: Colors.black26,)));
  @override
  Widget build(BuildContext context) {
    return on == true ? ifOn(ifoff()):ifoff();
        }
}
