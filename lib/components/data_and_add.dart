
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:masroufi/components/add_update.dart';
import 'package:masroufi/components/edit_data.dart';

import '../config/config.dart';

class DataAndAdd extends StatefulWidget {
  const DataAndAdd({Key? key, required this.value, required this.notifyParent})
      : super(key: key);
  final double value;
  final Function() notifyParent;
  @override
  State<DataAndAdd> createState() => _DataAndAddState();
}

class _DataAndAddState extends State<DataAndAdd> {

  @override
  Widget build(BuildContext context) {
    return Container(
      
        margin: const EdgeInsets.all(30),
        width: double.infinity,
        height: SettingConfig.height * 0.10,
        child: InkWell(
            child: Center(
                child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Expenses",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: SettingConfig.height * 0.03,
                    )),
                Text(
                  '${widget.value.toStringAsFixed(3)} DT',
                  style: TextStyle(
                    // color: Colors.b,
                    fontSize: SettingConfig.height * 0.04,
                    color: Colors.white,
                  ),
                ),
              ],
            ),


            SizedBox(
              width: SettingConfig.width*.3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {

                      final LocalStorage storage = LocalStorage('tasks');
                      showDialog(
                          context: context,
                          builder: (_) =>  SimpleDialog(
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                            children: [
                              EditData(notifyParent: widget.notifyParent),
                            ],
                          )
                      );
                    },
                    child: Icon(Icons.price_change ,size: SettingConfig.height * 0.05, color: Colors.white),
                  ),
                  InkWell(
                      onTap: () {

                        final LocalStorage storage = LocalStorage('tasks');
                        showDialog(
                            context: context,
                            builder: (_) => SimpleDialog(
                                  shape: const RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(30))),
                                  children: [
                                    AddUpdateExpence(
                                      id: storage.getItem("expenses").length,
                                      notifyParent: widget.notifyParent,
                                    ),
                                  ],
                                )
                        );
                      },
                      child: Icon(Icons.add,
                          size: SettingConfig.height * 0.05, color: Colors.white)),
                ],
              ),
            ),
          ],
        ))));
  }
}
