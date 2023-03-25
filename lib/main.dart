import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pax/ui.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({super.key});

  MaterialColor primaryBlack = const MaterialColor(
    0xFF000000,
    <int, Color>{
      50: Color(0xFF000000),
      100: Color(0xFF000000),
      200: Color(0xFF000000),
      300: Color(0xFF000000),
      400: Color(0xFF000000),
      500: Color(0xFF000000),
      600: Color(0xFF000000),
      700: Color(0xFF000000),
      800: Color(0xFF000000),
      900: Color(0xFF000000),
    },
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Pax",
      theme: ThemeData(
        textTheme:
            GoogleFonts.merriweatherTextTheme(Theme.of(context).textTheme),
        primarySwatch: primaryBlack,
        primaryColor: Colors.black,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  // final textController = TextEditingController();
  @override
  // void dispose() {
  //   // Clean up the controllers when the widget is disposed.
  //   textController.dispose();
  //   searchController.dispose();
  //   replaceController.dispose();
  //   super.dispose();
  // }

  // void _replaceText() {
  //   final String text = textController.text;
  //   final String search = searchController.text;
  //   final String replace = replaceController.text;

  //   if (text.isEmpty || search.isEmpty || replace.isEmpty) {
  //     return;
  //   }

  //   setState(() {
  //     _isReplacing = true;
  //   });

  //   final String newText = text.replaceAll(search, replace);

  //   Future.delayed(const Duration(milliseconds: 400), () {
  //     setState(() {
  //       textController.text = newText;
  //       _isReplacing = false;
  //     });
  //   });
  // }

//ui
  @override
  Widget build(BuildContext context) {
    return const HomeUi();
  }
}

// responsive / copy final text / show keys / clear all