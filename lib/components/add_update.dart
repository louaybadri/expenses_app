import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:masroufi/config/config.dart';

class AddUpdateExpence extends StatefulWidget {
  const AddUpdateExpence(
      {Key? key,
      required this.notifyParent,
      this.amount,
      this.time,
      this.title,
      required this.id})
      : super(key: key);
  final Function() notifyParent;
  final int id;
  final double? amount;
  final String? title;
  final String? time;

  @override
  State<AddUpdateExpence> createState() => _AddUpdateExpenceState();
}

class _AddUpdateExpenceState extends State<AddUpdateExpence> {
  final LocalStorage storage = LocalStorage('tasks');
  late bool init = true;
  TextEditingController textController = TextEditingController(text: '');

  TimeOfDay time = const TimeOfDay(hour: 0, minute: 0);
  TextEditingController valueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (widget.title != null && widget.amount != null && init) {
      setState(() {
        init = false;
        textController = TextEditingController(text: widget.title);
        valueController =
            TextEditingController(text: widget.amount?.toString());
        time = TimeOfDay(
            hour: int.parse(widget.time!.substring(0, 2)),
            minute: int.parse(widget.time!.substring(3, 5)));
      });
    }
    final String hours = time.hour.toString().padLeft(2, '0');
    final String minutes = time.minute.toString().padLeft(2, '0');
    return Center(
      child: Column(
        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.title),
            title: TextField(
              decoration:
                  const InputDecoration.collapsed(hintText: "Title ex: Coke"),
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
                    )),
                    child: Text(
                      '$hours:$minutes',
                      style: TextStyle(fontSize: SettingConfig.height * 0.05),
                    ))
              ],
            ),
            onTap: () async {
              TimeOfDay? newTime =
                  await showTimePicker(context: context, initialTime: time);

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
          InkWell(
              onTap: () {
                List<dynamic> list = storage.getItem('expenses');
                List<dynamic> aux;
                aux = [
                  textController.text,
                  valueController.text.isNotEmpty ? valueController.text : "0",
                  '$hours:$minutes',
                ];
                double amount = double.parse(
                    storage.getItem("amount").length > 0
                        ? storage.getItem("amount")
                        : "0");
                double update =widget.amount??0;

                double newAmount = amount -
                    double.parse(valueController.text.isNotEmpty
                        ? valueController.text
                        : widget.amount.toString())+ update;
                if (newAmount < 0) {
                  showDialog(
                      context: context,
                      builder: (_) => SimpleDialog(
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50))),
                            children: [
                              Container(
                                margin: const EdgeInsets.all(10),
                                // color: Colors.red,
                                child: Column(
                                  children: [
                                    Icon(Icons.dangerous,
                                        color: Colors.red,
                                        size: SettingConfig.height * 0.07),
                                    Text(
                                        'Please verify your data! You got negative amount \n !!!',
                                        style: TextStyle(
                                            fontSize:
                                                SettingConfig.height * 0.05),
                                        textAlign: TextAlign.center),
                                    InkWell(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: Icon(Icons.arrow_back,
                                            size: SettingConfig.height * 0.07))
                                  ],
                                ),
                              )
                            ],
                          ));
                } else {
                  storage.setItem('amount', newAmount.toString());

                  if (init) {
                    list.add(aux);
                  } else {
                    list[widget.id] = aux;
                  }
                  storage.setItem("expenses", list);
                  widget.notifyParent();

                  Navigator.pop(context);
                }
              },
              child: Icon(
                Icons.add_circle,
                size: SettingConfig.height * 0.1,
              )),
        ],
      ),
    );
  }
}
