//ui
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeUi extends StatefulWidget {
  const HomeUi({super.key});

  @override
  State<HomeUi> createState() => _HomeUiState();
}

class _HomeUiState extends State<HomeUi> {
  final textController = TextEditingController();
  final searchController = TextEditingController();
  final replaceController = TextEditingController();
  bool _isReplacing = false;
  // these 2 lines are for clear all btn
  String replacedText = '';
  Map<String, String> replaceMap = {};
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
