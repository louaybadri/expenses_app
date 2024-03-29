import 'dart:async';

import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:masroufi/template/screen.dart';
import '../components/data_and_add.dart';
import '../components/historique_unit.dart';
import '../config/config.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final LocalStorage storage = LocalStorage('tasks');
  bool initialized = false;

  @override
  Widget build(BuildContext context) {
    refresh() {}
    Timer timer= Timer(const Duration(seconds: 1), () {
      setState(() {

        initialized = true;
      });
    });
// storage.clear();
    if (!initialized) {
      return ScreenTemplate(
          notifyParent: refresh,
          child: Container(
            padding: EdgeInsets.only(top: SettingConfig.height * 0.03),
            width: SettingConfig.width,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Center(
              child: InkWell(
                  onTap: () {
                    refresh();
                    setState(() {
                    });
                  },
                  child: const Text("Get Started")),
            ),
          ));
    } else {
      final expenses = storage.getItem('expenses') ?? [];

      return ScreenTemplate(
          notifyParent: refresh,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              DataAndAdd(
                value: double.parse(storage.getItem('amount') ?? '0'),
                notifyParent: refresh,
              ),
              Container(
                padding: EdgeInsets.only(top: SettingConfig.height * 0.03),
                width: SettingConfig.width,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: SettingConfig.height * 0.6,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                         SizedBox(
                            width: SettingConfig.width,
                            child: Center(
                              child: Text("Expenses",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: SettingConfig.height * 0.06)),
                            ),
                          ),
                          SizedBox(
                            height: SettingConfig.height*0.5,
                            child: SingleChildScrollView(
                              child: Center(
                                child: Column(
                                  children: [
                                    ...expenses.map(
                                      (e) => HistoriqueUnit(
                                          id: expenses.indexOf(e),
                                          notifyParent: refresh,
                                          icon: Icons.account_box_outlined,
                                          iconColor: Colors.redAccent,
                                          amount: double.parse(e["amount"]),
                                          time: e["time"],
                                          title: e["title"]),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ));
    }
  }
}
