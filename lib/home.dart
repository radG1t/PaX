import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

  void _pax() {
    final String text = textController.text;
    final String search = searchController.text;
    final String replace = replaceController.text;

    if (text.isEmpty || search.isEmpty || replace.isEmpty) {
      return;
    }

    setState(() {});

    final String newText = text.replaceAll(search, replace);
    previousText = text;
    previousSearch = search;
    previousReplace = replace;

    Future.delayed(const Duration(milliseconds: 400), () {
      setState(() {
        textController.text = newText;
      });
    });
  }

  void _dePax() {
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
          padding: const EdgeInsets.fromLTRB(55, 30, 55, 0),
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
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: GestureDetector(
                      onTap: () => _pax(),
                      child: Container(
                        width: 70,
                        height: 35,
                        color: Colors.black38,
                        child: const Center(
                            child: Text('PaX',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold))),
                      ),
                    ),
                  ),
                  const SizedBox(width: 6),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: GestureDetector(
                      onTap: () => _dePax(),
                      child: Container(
                        width: 70,
                        height: 35,
                        color: Colors.black38,
                        child: const Center(
                            child: Text(
                          'dePax',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        )),
                      ),
                    ),
                  ),
                  const SizedBox(width: 6),
                  GestureDetector(
                    onTap: () => _dePax(),
                    child: Container(
                      width: 70,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.black38,
                      ),
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: DropdownButton<String>(
                              underline: Container(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(12),
                              isExpanded: false,
                              onChanged: (String? value) {
                                if (value == 'copy') {
                                  Clipboard.setData(
                                      ClipboardData(text: textController.text));
                                } else if (value == 'share') {
                                  // handle share option
                                } else if (value == 'reset') {
                                  _reset();
                                } else if (value == '') {}
                              },
                              items: [
                                const DropdownMenuItem(
                                  value: 'copy',
                                  child: Center(
                                    child: Text(
                                      'Copy',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  ),
                                ),
                                const DropdownMenuItem(
                                  value: 'share',
                                  child: Center(
                                    child: Text(
                                      'Share',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  ),
                                ),
                                const DropdownMenuItem(
                                  value: 'reset',
                                  child: Center(
                                    child: Text(
                                      'Reset',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  ),
                                ),
                                DropdownMenuItem(
                                  value: 'Daramet',
                                  child: Center(
                                    child: Image.asset(
                                      color: Colors.white,
                                      "assets/pizza.png",
                                      width: 30,
                                    ),
                                  ),
                                ),
                              ],
                              hint: const Text(''),
                              focusColor: Colors.grey,
                              dropdownColor: Colors.grey,
                            ),
                          ),
                          const Positioned.fill(
                            child: Center(
                              child: Text(
                                'etc',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
