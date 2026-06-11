import 'package:flutter/material.dart';
import 'result_screen.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  int currentIndex = 0;
  List<Map<String, dynamic>> resultLog = [];

  final List<Map<String, dynamic>> questions = [
    {
      "question": "Siapakah yang membina Stadthuys?",
      "answers": ["Portugis", "Belanda", "British", "Jepun"],
      "correct": "Belanda"
    },
    {
      "question": "Muzium Melaka terletak di?",
      "answers": ["Ayer Keroh", "KL", "Johor", "Penang"],
      "correct": "Ayer Keroh"
    },
    {
      "question": "Melaka terkenal dengan?",
      "answers": ["Sejarah", "Ski", "Gunung", "Salji"],
      "correct": "Sejarah"
    },
  ];

  void answer(String selected) {
    var q = questions[currentIndex];
    bool isCorrect = selected == q["correct"];

    resultLog.add({
      "question": q["question"],
      "selected": selected,
      "correct": q["correct"],
      "isCorrect": isCorrect,
    });

    if (currentIndex < questions.length - 1) {
      setState(() {
        currentIndex++;
      });
    } else {
      int correctCount = resultLog.where((e) => e["isCorrect"] == true).length;
      int totalQ = questions.length;
      int scoreTotal = correctCount * 30;
      bool passed = correctCount >= 2;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => ResultScreen(
            clueTitle: 'Museum Quiz',
            score: scoreTotal,
            correct: correctCount,
            total: totalQ,
            log: resultLog.map((e) => {
              'q': e['question'],
              'selected': e['selected'],
              'correct': e['correct'],
              'isCorrect': e['isCorrect'],
            }).toList(),
            passed: passed,
            onContinue: () => Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => const GameScreen()),
              (_) => false,
            ),
            onRetry: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const GameScreen()),
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var q = questions[currentIndex];

    return Scaffold(
      backgroundColor: const Color(0xFF2C1B18),
      appBar: AppBar(
        title: const Text("🏛 Museum Quiz"),
        backgroundColor: const Color(0xFFD4AF37),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              q["question"],
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
            const SizedBox(height: 20),
            ...q["answers"].map<Widget>((a) {
              return Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(vertical: 6),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFD4AF37),
                    foregroundColor: Colors.black,
                  ),
                  onPressed: () => answer(a),
                  child: Text(a),
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}