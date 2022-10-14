// TODO Implement this library.
import 'package:flutter/material.dart';
import 'package:masroufi/screens/add_screen.dart';

import '../config/config.dart';

class DataAndAdd extends StatefulWidget {
  const DataAndAdd({Key? key, required this.value, required this.notifyParent}) : super(key: key);
  final double value;
  final Function() notifyParent;
  @override
  State<DataAndAdd> createState() => _DataAndAddState();
}

class _DataAndAddState extends State<DataAndAdd> {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // decoration: const BoxDecoration(color: Colors.amberAccent),
      width: double.infinity,
      height: SettingConfig.height * 0.150,
      child: InkWell(
        child: Center(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
          Container(
          margin: EdgeInsets.only(
          bottom: SettingConfig.height * 0.01,
              top: SettingConfig.height * 0.01,
              left: SettingConfig.height * 0.05,
              right: SettingConfig.height * 0.05),
          padding: EdgeInsets.all(SettingConfig.height * 0.01),
          child: Column(
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
        ),
        Container(
            margin: EdgeInsets.only(
                bottom: SettingConfig.height * 0.02,
                top: SettingConfig.height * 0.02,
                left: SettingConfig.height * 0.05,
                right: SettingConfig.height * 0.05),
            padding: EdgeInsets.all(SettingConfig.height * 0.02),
            child: InkWell(
                onTap: () async {
                final value = await Navigator.push(context,
                MaterialPageRoute(builder: (context) =>  AddExpence(notifyParent: widget.notifyParent)));

            },
            child: Icon(Icons.add,
                size: SettingConfig.height * 0.05, color: Colors.white)),

      ),
      ],
    )))
    );
  }
}
