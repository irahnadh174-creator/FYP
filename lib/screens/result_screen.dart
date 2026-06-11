import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class ResultScreen extends StatelessWidget {
  final String clueTitle;
  final int score;
  final int correct;
  final int total;
  final List<Map<String, dynamic>> log;
  final bool passed;
  final VoidCallback onContinue;
  final VoidCallback onRetry;

  const ResultScreen({
    super.key,
    required this.clueTitle,
    required this.score,
    required this.correct,
    required this.total,
    required this.log,
    required this.passed,
    required this.onContinue,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    int wrong = total - correct;

    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              color: passed ? AppColors.primary : AppColors.red,
              child: Column(
                children: [
                  Text(
                    passed ? "🎉 Tahniah!" : "😔 Cuba Lagi",
                    style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    clueTitle,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white70, fontSize: 12),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
              child: Column(
                children: [
                  Text("Score: $score", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _stat("✔", correct.toString()),
                      _stat("❌", wrong.toString()),
                      _stat("⭐", score.toString()),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    passed ? "Anda lulus dan boleh teruskan!" : "Perlu 2/3 betul untuk teruskan",
                    style: const TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: log.map((e) {
                  final ok = e["isCorrect"] == true;
                  return Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: ok ? AppColors.primary : AppColors.red),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(e["question"], style: const TextStyle(fontWeight: FontWeight.w600)),
                        const SizedBox(height: 5),
                        Text("Jawapan: ${e["selected"]}"),
                        Text("Betul: ${e["correct"]}"),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  if (passed)
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                        ),
                        onPressed: onContinue,
                        child: const Text("Teruskan →"),
                      ),
                    )
                  else
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.dark,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                        ),
                        onPressed: onRetry,
                        child: const Text("Cuba Semula"),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _stat(String label, String value) {
    return Column(
      children: [
        Text(label),
        const SizedBox(height: 4),
        Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }
}