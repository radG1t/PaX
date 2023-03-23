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
      title: "Pws",
      theme: ThemeData(
        primarySwatch: primaryBlack,
        primaryColor: Colors.black,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final textController = TextEditingController();
  final searchController = TextEditingController();
  final replaceController = TextEditingController();

  bool _isReplacing = false;

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
          padding: const EdgeInsets.fromLTRB(35, 35, 35, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: textController,
                decoration: const InputDecoration(
                  labelText: 'Enter the text here',
                  border: OutlineInputBorder(),
                ),
                maxLines: 8,
              ),
              const SizedBox(
                height: 12,
              ),
              TextField(
                controller: searchController,
                decoration: const InputDecoration(
                  labelText: 'Which character do you want to replace?',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              TextField(
                controller: replaceController,
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(),
                  labelText: 'Which character do you want to replace it with?',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 48,
              ),
              //pax btn
              Padding(
                padding: const EdgeInsets.fromLTRB(180, 0, 180, 0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      minimumSize: const Size(double.infinity, 65),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// rang ro trancparency kon bere kolan . yani kadr haro sefid kon ama kam rang kon
//just for test