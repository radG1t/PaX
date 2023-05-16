import 'package:flutter/material.dart';

class MenuDivider extends StatefulWidget {
  const MenuDivider({Key? key}) : super(key: key);

  @override
  _MenuDividerState createState() => _MenuDividerState();
}

class _MenuDividerState extends State<MenuDivider> {
  bool _menuOpen = false;

  void _toggleMenu() {
    setState(() {
      _menuOpen = !_menuOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _toggleMenu,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Random'),
              Icon(_menuOpen ? Icons.arrow_drop_up : Icons.arrow_drop_down),
            ],
          ),
          if (_menuOpen)
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text('Random between .. ?'),
                  ],
                )
              ],
            ),
        ],
      ),
    );
  }
}
