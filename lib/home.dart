import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final textController = TextEditingController();
  final searchController = TextEditingController();
  final replaceController = TextEditingController();

  String previousText = '';
  String previousSearch = '';
  String previousReplace = '';

  bool _isReplacing = false;

  @override
  void initState() {
    super.initState();
    previousText = '';
    previousSearch = '';
    previousReplace = '';
  }

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
    previousText = text;
    previousSearch = search;
    previousReplace = replace;

    Future.delayed(const Duration(milliseconds: 400), () {
      setState(() {
        textController.text = newText;
        _isReplacing = false;
      });
    });
  }

  void _undo() {
    setState(() {
      textController.text = previousText;
      searchController.text = previousSearch;
      replaceController.text = previousReplace;
      previousText = '';
      previousSearch = '';
      previousReplace = '';
    });
  }

  void _reset() {
    setState(() {
      textController.clear();
      searchController.clear();
      replaceController.clear();
      previousText = '';
      previousSearch = '';
      previousReplace = '';
    });
  }

  // ui
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(85, 75, 85, 0),
          child: Column(
            children: [
              TextField(
                controller: textController,
                minLines: 15,
                maxLines: 100,
                decoration: const InputDecoration(
                  hintText: 'Enter your text here',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: searchController,
                      decoration: const InputDecoration(
                        hintText: 'replace this ..',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      controller: replaceController,
                      decoration: const InputDecoration(
                        hintText: 'with this ..',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    onPressed: _replaceText,
                    child: const Text('Pax'),
                  ),
                  const SizedBox(width: 6),
                  FloatingActionButton(
                    onPressed: _undo,
                    child: const Text('dePax'),
                  ),
                  FloatingActionButton(
                    onPressed: _reset,
                    child: const Text('reset'),
                  ),
                ],
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.grey,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: const Icon(Icons.settings),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.info_outline),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
