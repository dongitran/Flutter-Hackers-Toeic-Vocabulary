import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'dart:math';

class LessionPage extends StatefulWidget {
  const LessionPage({
    super.key,
    required this.index,
  });

  final int index;

  @override
  State<LessionPage> createState() => _LessionPageState();
}

class _LessionPageState extends State<LessionPage> {
  List<Map<String, dynamic>> commonEnglishWords = [];
  bool canUpdateDisplayedWord = true;

  @override
  void initState() {
    super.initState();
    loadCommonEnglishWords();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (canUpdateDisplayedWord) {
        updateDisplayedWord();
      }
    });
  }

  void loadCommonEnglishWords() async {
    final String jsonContent = await rootBundle
        .loadString('assets/lessions/day' + (widget.index + 1).toString() + '.json');
    final Map<String, dynamic> data = json.decode(jsonContent);
    final List<dynamic> words = data['commonEnglishWords'];
    commonEnglishWords = List<Map<String, dynamic>>.from(words);
  }

  String displayedWordEnglish = '';
  String displayedWordVietnamese = '';
  String displayedWordExample = '';

  void updateDisplayedWord() {
    final random = Random();
    final randomIndex = random.nextInt(commonEnglishWords.length);
    final newWord = commonEnglishWords[randomIndex];

    setState(() {
      displayedWordEnglish = newWord['english'];
      displayedWordVietnamese = newWord['vietnamese'];
      displayedWordExample = newWord['example'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          '',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          setState(() {
            canUpdateDisplayedWord = !canUpdateDisplayedWord;
          });
        },
        child: Container(
          color: Colors.black,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  displayedWordEnglish,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  displayedWordVietnamese,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  displayedWordExample,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
