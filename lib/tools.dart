import 'package:flutter/material.dart';

class ShiftMenuDivider extends StatefulWidget {
  const ShiftMenuDivider({Key? key}) : super(key: key);

  @override
  _ShiftMenuDividerState createState() => _ShiftMenuDividerState();
}

class _ShiftMenuDividerState extends State<ShiftMenuDivider> {
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
              const Text('Shifting'),
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
                    Text('shift shift shift'),
                  ],
                )
              ],
            ),
        ],
      ),
    );
  }
}

class RandomMenuDivider extends StatefulWidget {
  const RandomMenuDivider({Key? key}) : super(key: key);

  @override
  _RandomMenuDividerState createState() => _RandomMenuDividerState();
}

class _RandomMenuDividerState extends State<RandomMenuDivider> {
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
              // add delete off check box
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
