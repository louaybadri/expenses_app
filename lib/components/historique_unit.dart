import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:masroufi/config/config.dart';

import 'add_update.dart';

class HistoriqueUnit extends StatefulWidget {
  const HistoriqueUnit(
      {super.key,
      required this.amount,
      required this.title,
      required this.time,
      required this.icon,
      required this.iconColor, required this.notifyParent, required this.id});
  final int id;
  final double? amount;
  final String? title;
  final String? time;
  final IconData icon;
  final Color iconColor;
  final Function() notifyParent;
  @override
  State<HistoriqueUnit> createState() => _HistoriqueUnitState();
}

class _HistoriqueUnitState extends State<HistoriqueUnit> {
  @override
  Widget build(BuildContext context) {
    LocalStorage l = LocalStorage('tasks');

    return Center(
      child: Container(
        margin: EdgeInsets.all(SettingConfig.height * 0.01),
        // height: SettingConfig.height * 0.4,
        width: SettingConfig.width * 0.9,
        padding: EdgeInsets.all(SettingConfig.height * 0.01),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  blurRadius: 2,
                  spreadRadius: 2,
                  offset: const Offset(3, 5))
            ],
            color: widget.iconColor,
            borderRadius: const BorderRadius.all(Radius.circular(15))),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Icon(widget.icon,
                        color: widget.iconColor, size: SettingConfig.height * 0.05),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: SettingConfig.width * 0.4,
                      padding: const EdgeInsets.all(8.0),
                      child: SingleChildScrollView(
                        // scrollDirection: Axis.horizontal,
                        child: Text(widget.title!,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: SettingConfig.height * 0.04),
                        textAlign: TextAlign.center,),
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Text('${widget.amount?.toStringAsFixed(3)} DT',
                          style: TextStyle(
                              color: const Color.fromRGBO(0, 0, 0, 0.4),
                              fontWeight: FontWeight.bold,
                              fontSize: SettingConfig.height * 0.03),
                          ),
                    )
                  ],
                ),
                SizedBox(
                  // width: SettingConfig.width * 0.3,
                  child: Text(widget.time!,
                      style: TextStyle(
                          color: const Color.fromRGBO(0, 0, 0, 0.4),
                          fontSize: SettingConfig.height * 0.035),
                      textAlign: TextAlign.center),
                ),

              ],
            ), Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                      onTap: (){
                        showDialog(
                            context: context,
                            builder: (_) => SimpleDialog(
                              shape:const  RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                              children: [
                                AddUpdateExpence(
                                  id:widget.id,
                                  amount: widget.amount,
                                  time:widget.time,
                                  title: widget.title,
                                  notifyParent: widget.notifyParent,

                                ),
                              ],
                            )
                        );
                      },
                      child: const StyledIcon(color: Colors.green, icon: Icons.edit)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: (){
                      final LocalStorage storage = LocalStorage('tasks');
                      List<dynamic> list = storage.getItem('expenses');
                      double old=widget.amount??0;
                      double amount = double.parse(storage.getItem("amount"))+old;
                      storage.setItem("amount", amount.toString());
                      list.removeAt(widget.id);
                      widget.notifyParent();

                    },
                    child:const StyledIcon(color: Colors.red,icon: Icons.currency_exchange),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: (){
                      final LocalStorage storage = LocalStorage('tasks');
                      List<dynamic> list = storage.getItem('expenses');
                      list.removeAt(widget.id);
                      widget.notifyParent();

                    },
                    child:const StyledIcon(color: Colors.red,icon: Icons.delete),),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class StyledIcon extends StatelessWidget {
  const StyledIcon({
    super.key, required this.color, required this.icon,
  });
  final Color color;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(SettingConfig.height*0.015),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: Colors.white,),


        child: Icon(icon,size: SettingConfig.height*0.05,color: color),);
  }
}
