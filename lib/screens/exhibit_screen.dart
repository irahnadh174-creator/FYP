import 'package:flutter/material.dart';
import '../constants/app_colors.dart';


class ExhibitScreen extends StatefulWidget {
  final Map<String, dynamic> clue;
  final Function(int score) onCompleted;

  const ExhibitScreen({
    super.key,
    required this.clue,
    required this.onCompleted,
  });

  @override
  State<ExhibitScreen> createState() => _ExhibitScreenState();
}

class _ExhibitScreenState extends State<ExhibitScreen> {
  int qIndex = 0;
  int score = 0;
  int correct = 0;
  String? selected;
  bool answered = false;

  List<Map<String, dynamic>> get questions =>
      List<Map<String, dynamic>>.from(widget.clue["questions"]);

  Map<String, dynamic> get q => questions[qIndex];

  void answer(String opt) {
    if (answered) return;

    setState(() {
      selected = opt;
      answered = true;
    });

    final isCorrect = opt == q["correct"];

    if (isCorrect) {
      score += 10;
      correct++;
    }

    Future.delayed(const Duration(milliseconds: 800), () {
      next();
    });
  }

  void next() {
    if (qIndex < questions.length - 1) {
      setState(() {
        qIndex++;
        selected = null;
        answered = false;
      });
    } else {
      widget.onCompleted(score);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: AppBar(
        title: Text(widget.clue["roomName"]),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: AppColors.dark,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  Text(
                    widget.clue["emoji"],
                    style: const TextStyle(fontSize: 40),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    q["q"],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            ...q["options"].map<Widget>((opt) {
              final isCorrect = opt == q["correct"];
              final isSelected = opt == selected;

              Color bg = Colors.white;
              Color border = Colors.grey.shade300;

              if (answered) {
                if (isCorrect) {
                  bg = Colors.green.shade100;
                  border = Colors.green;
                } else if (isSelected && !isCorrect) {
                  bg = Colors.red.shade100;
                  border = Colors.red;
                }
              }

              return GestureDetector(
                onTap: () => answer(opt),
                child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: bg,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: border),
                  ),
                  child: Text(
                    opt,
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
              );
            }),

            const Spacer(),

            Text(
              "Soalan ${qIndex + 1} / ${questions.length}",
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}