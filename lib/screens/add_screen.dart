import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:masroufi/config/config.dart';
import 'package:masroufi/template/screen.dart';

class AddExpence extends StatefulWidget {
  const AddExpence({Key? key, required this.notifyParent}) : super(key: key);
final Function() notifyParent;
  @override
  State<AddExpence> createState() => _AddExpenceState();
}

class _AddExpenceState extends State<AddExpence> {
  TimeOfDay time = const TimeOfDay(hour: 0, minute: 0);
  final textController = TextEditingController(text: '');
  final valueController = TextEditingController();

  final LocalStorage storage = LocalStorage('tasks');

  @override
  Widget build(BuildContext context) {
    final String hours = time.hour.toString().padLeft(2, '0');
    final String minutes = time.minute.toString().padLeft(2, '0');
    return ScreenTemplate(
      notifyParent:
      widget.notifyParent,
        child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          padding: EdgeInsets.only(top: SettingConfig.height * 0.03),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30))),
          // height: SettingConfig.height*0.5,
          // color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.title),
                title: TextField(
                  decoration: const InputDecoration.collapsed(
                      hintText: "Title ex: Coke"),
                  controller: textController,
                ),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.date_range),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Pick A DATE"),
                    Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.black12,
                                width: 2,
                                style: BorderStyle.solid,
                                strokeAlign: StrokeAlign.inside)),
                        child: Text(
                          '${hours}:${minutes}',
                          style:
                              TextStyle(fontSize: SettingConfig.height * 0.05),
                        ))
                  ],
                ),
                onTap: () async {
                  TimeOfDay? newTime =
                      await showTimePicker(context: context, initialTime: time);
                  print(textController.text.toString());
                  print(newTime);

                  if (newTime == null) return;
                  setState(() {
                    time = newTime;
                  });
                },
              ),
              ListTile(
                leading: const Icon(Icons.monetization_on),
                title: TextField(
                  keyboardType: TextInputType.number,
                  decoration:
                      const InputDecoration.collapsed(hintText: "Value ex: 30"),
                  controller: valueController,
                ),
                onTap: () {
                  // Navigator.pop(context);
                },
              ),
              Row(
                children: [
                  Container(
                    width: SettingConfig.width * 0.5,
                    color: Colors.redAccent,
                    child: ListTile(
                      leading: Icon(Icons.arrow_back),
                      title: Text('Back'),
                      onTap: () {
                      },
                    ),
                  ),
                  Container(
                    color: Colors.green,
                    width: SettingConfig.width * 0.5,
                    child: ListTile(
                      leading: new Icon(Icons.money),
                      title: new Text('Save'),
                      onTap: () async {
                        List<dynamic> aux = [
                          textController.text,
                          valueController.text,
                          '${hours}:${minutes}'
                        ];
                        List<dynamic> list = await
                            storage.getItem('expences');
                        list.add(aux);
                        await storage.setItem("expences", list);
                        widget.notifyParent();
                        // print("after "+ storage.getItem('expences'));
                        print(textController.text.toString() +
                            " " +
                            hours +
                            ' ' +
                            minutes +
                            ' ' +
                            valueController.text.toString());

                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ));
  }

}
