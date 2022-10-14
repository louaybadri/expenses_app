import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:masroufi/config/config.dart';

class HistoriqueUnit extends StatelessWidget {
  const HistoriqueUnit(
      {super.key,
      required this.amount,
      required this.title,
      required this.time,
      required this.icon,
      required this.iconColor});

  final double? amount;
  final String? title;
  final String? time;
  final IconData icon;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
 LocalStorage l= LocalStorage('tasks');

    return Center(
      child: Container(
        margin: EdgeInsets.all(SettingConfig.height * 0.01),
        height: SettingConfig.height * 0.4,
        width: SettingConfig.width * 0.6,
        padding: EdgeInsets.all(SettingConfig.height * 0.01),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  blurRadius: 2,
                  spreadRadius: 2,
                  offset: const Offset(3, 5))
            ],
            color: iconColor,
            borderRadius: const BorderRadius.all(Radius.circular(15))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration:const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Icon(icon,
                    color: iconColor, size: SettingConfig.height * 0.05),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Text(title!,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: SettingConfig.height * 0.05)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child:Text('${amount?.toStringAsFixed(3)} DT',
                      style: TextStyle(
                          color: const Color.fromRGBO(0, 0, 0, 0.4),
                          fontWeight: FontWeight.bold,
                          fontSize: SettingConfig.height * 0.035),
                      textAlign: TextAlign.right),
                ))
              ],
            ),
            SizedBox(
              width: SettingConfig.width * 0.3,
              child: Text(time!,
                  style: TextStyle(
                      color: const Color.fromRGBO(0, 0, 0, 0.4),
                      fontSize: SettingConfig.height * 0.035),
                  textAlign: TextAlign.center),
            ),
          ],
        ),
      ),
    );
  }


}
