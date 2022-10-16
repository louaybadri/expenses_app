import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:masroufi/config/config.dart';

class EditData extends StatefulWidget {
  const EditData({Key? key, required this.notifyParent}) : super(key: key);

  final Function() notifyParent;
  @override
  State<EditData> createState() => _EditDataState();
}

class _EditDataState extends State<EditData> {
  TextEditingController valueController = TextEditingController();
  final LocalStorage storage = LocalStorage('tasks');

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(
          SettingConfig.height * 0.1, 0, SettingConfig.height * 0.1, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("Update Amount",
              style: TextStyle(fontSize: SettingConfig.height * 0.03)),
          ListTile(
            leading: const Icon(Icons.attach_money_outlined),
            title: TextField(
              decoration:
                  const InputDecoration.collapsed(hintText: "Amount ex: 30"),
              controller: valueController,
              keyboardType: TextInputType.number,
            ),
          ),
          InkWell(
            onTap: () {
              valueController.value.text.isNotEmpty
                  ?storage.setItem('amount', valueController.value.text):
              storage.setItem('amount', "0") ;
              widget.notifyParent();
                    Navigator.pop(context);
                  }
                ,
            child: const Icon(Icons.price_change),
          ),
        ],
      ),
    );
  }
}
