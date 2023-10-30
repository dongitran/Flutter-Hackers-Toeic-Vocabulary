import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'dart:math';

class LessionPage extends StatefulWidget {
  const LessionPage({
    super.key,
    required this.index,
    required this.speed,
  });

  final int index;
  final int speed;

  @override
  State<LessionPage> createState() => _LessionPageState();
}

class _LessionPageState extends State<LessionPage> {
  List<Map<String, dynamic>> commonEnglishWords = [];
  bool canUpdateDisplayedWord = true;
  String displayedWordEnglish = '';
  String displayedWordVietnamese = '';
  String displayedWordExample = '';

  @override
  @override
  void initState() {
    super.initState();
    _initialize();
  }

  Future<void> _initialize() async {
    await loadCommonEnglishWords();
    updateDisplayedWord();
    Timer.periodic(Duration(seconds: widget.speed), (timer) {
      if (canUpdateDisplayedWord) {
        updateDisplayedWord();
      }
    });
  }

  Future<void> loadCommonEnglishWords() async {
    final String jsonContent = await rootBundle
        .loadString('assets/lessions/day${widget.index + 1}.json');
    final Map<String, dynamic> data = json.decode(jsonContent);
    final List<dynamic> words = data['commonEnglishWords'];
    commonEnglishWords = List<Map<String, dynamic>>.from(words);
  }

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
