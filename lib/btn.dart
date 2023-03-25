//clear btn
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ClearBtn extends StatefulWidget {
  const ClearBtn({super.key});

  @override
  State<ClearBtn> createState() => _ClearBtnState();
}

class _ClearBtnState extends State<ClearBtn> {
  get replaceMap => null;

  get textController => null;

  set replacedText(String replacedText) {}

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            replacedText = '';
            replaceMap.clear();
            textController.clear();
          });
        },
        child: Text(
          'Clear all',
          style: GoogleFonts.merriweather(fontSize: 20),
        ),
      ),
    );
  }
}

//pax btn
class PaxBtn extends StatefulWidget {
  const PaxBtn({super.key});

  @override
  State<PaxBtn> createState() => _PaxBtnState();
}

class _PaxBtnState extends State<PaxBtn> {
  get _isReplacing => null;

  get _replaceText => null;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
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
    );
  }
}
