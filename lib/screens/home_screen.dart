import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:masroufi/template/screen.dart';

// import 'package:masroufi/assets/bg.jpg' as IMG;
import '../components/data_and_add.dart';
import '../components/historique_unit.dart';
import '../components/navbar.dart';
import '../config/config.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    refresh() {
      setState(() {});
    }

    final LocalStorage storage = LocalStorage('tasks');
    // storage.setItem("expences", []);
    final List<dynamic> expences = storage.getItem('expences');
    print(
        "&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&");
    print(expences);
    return ScreenTemplate(
      notifyParent:
      refresh,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            DataAndAdd(value: 50, notifyParent:
           refresh,),
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
                  TextButton(onPressed: () {
                    setState(() {

                    });
                  }, child: Text("aaaaa")),
                  SizedBox(
                    height: SettingConfig.height * 0.6,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text("Expenses",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: SettingConfig.height * 0.06)),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              ...expences.map((e) => HistoriqueUnit(
                                  icon: Icons.account_box_outlined,
                                  iconColor: Colors.redAccent,
                                  amount: double.parse(e[1]),
                                  time: e[2],
                                  title: e[0]))
                            ],
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


