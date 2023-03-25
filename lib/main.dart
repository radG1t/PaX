import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  final textController = TextEditingController();
  final searchController = TextEditingController();
  final replaceController = TextEditingController();

  bool _isReplacing = false;
  // these 2 lines are for clear all btn
  String replacedText = '';
  Map<String, String> replaceMap = {};

  @override
  void dispose() {
    // Clean up the controllers when the widget is disposed.
    textController.dispose();
    searchController.dispose();
    replaceController.dispose();
    super.dispose();
  }

  void _replaceText() {
    final String text = textController.text;
    final String search = searchController.text;
    final String replace = replaceController.text;

    if (text.isEmpty || search.isEmpty || replace.isEmpty) {
      return;
    }

    setState(() {
      _isReplacing = true;
    });

    final String newText = text.replaceAll(search, replace);

    Future.delayed(const Duration(milliseconds: 400), () {
      setState(() {
        textController.text = newText;
        _isReplacing = false;
      });
    });
  }

//ui
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(85, 75, 85, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: textController,
                decoration: const InputDecoration(
                  labelText: 'Enter the text here',
                  border: OutlineInputBorder(),
                ),
                maxLines: 10,
              ),
              const SizedBox(
                height: 16,
              ),
              TextField(
                controller: searchController,
                decoration: const InputDecoration(
                  labelText: 'Which character do you want to replace?',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              TextField(
                controller: replaceController,
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(),
                  labelText: 'Which character do you want to replace it with?',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 48),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    replacedText = '';
                    replaceMap.clear();
                    textController.clear();
                  });
                },
                child: const Text('Clear all'),
              ),

              const SizedBox(height: 48),
              // const SizedBox(height: 0.4 * double.infinity),
              //pax btn
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    maximumSize: const Size(140, 65),
                    fixedSize: const Size(50, 65),
                    minimumSize: const Size(50, 65),
                    backgroundColor: Colors.black,
                  ),
                  onPressed: _isReplacing ? null : _replaceText,
                  child: _isReplacing
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 3,
                          ),
                        )
                      : Text(
                          'do the Pax',
                          style: GoogleFonts.merriweather(fontSize: 20),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// responsive / copy final text / show keys / clear all
// file jadid ezafe beshe, braye btn,ui,etc ..
