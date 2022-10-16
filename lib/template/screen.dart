import 'package:flutter/material.dart';
import '../components/navbar.dart';

class ScreenTemplate extends StatefulWidget {
  const ScreenTemplate({Key? key, required this.child, required this.notifyParent}) : super(key: key);
  final Widget child;
  final Function() notifyParent;

  @override
  State<ScreenTemplate> createState() => _ScreenTemplateState();
}

class _ScreenTemplateState extends State<ScreenTemplate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('lib/assets/bg.jpg'), fit: BoxFit.fill)),
        child: widget.child,
      ),
      bottomNavigationBar:  NavBar(notifyParent: widget.notifyParent),
    );
  }
}
