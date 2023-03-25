//ui
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pax/btn.dart';

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

              const SizedBox(height: 48),
              // const SizedBox(height: 0.4 * double.infinity),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  ClearBtn(),
                  SizedBox(
                    width: 10,
                  )
                  //    PaxBtn(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
