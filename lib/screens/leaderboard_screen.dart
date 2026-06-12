import 'package:flutter/material.dart';

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final players = [
      {
        "rank": "1",
        "initial": "AN",
        "name": "Ahmad\nNadzri",
        "points": "2,450 pts",
        "avatarColor": const Color(0xFFE8A12B),
        "highlight": true,
      },
      {
        "rank": "2",
        "initial": "NN",
        "name": "Nurain\nNadhirah",
        "points": "1,200 pts",
        "avatarColor": Colors.grey,
        "highlight": false,
      },
      {
        "rank": "3",
        "initial": "SR",
        "name": "Siti\nRahmah",
        "points": "980 pts",
        "avatarColor": const Color(0xFF8BC34A),
        "highlight": false,
      },
      {
        "rank": "4",
        "initial": "MF",
        "name": "Mohd\nFaris",
        "points": "750 pts",
        "avatarColor": const Color(0xFF61C9A8),
        "highlight": false,
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Leaderboard",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: players.length,
          itemBuilder: (context, index) {
            final player = players[index];

            return Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.symmetric(
                horizontal: 14,
                vertical: 12,
              ),
              decoration: BoxDecoration(
                color: player["highlight"] as bool
                    ? const Color(0xFFFFF4E3)
                    : Colors.white,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: player["highlight"] as bool
                      ? const Color(0xFFE8A12B)
                      : Colors.grey.shade300,
                ),
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 26,
                    child: Text(
                      player["rank"] as String,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),

                  const SizedBox(width: 10),

                  CircleAvatar(
                    radius: 16,
                    backgroundColor:
                        player["avatarColor"] as Color,
                    child: Text(
                      player["initial"] as String,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 11,
                      ),
                    ),
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    child: Text(
                      player["name"] as String,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        height: 1.2,
                      ),
                    ),
                  ),

                  Text(
                    player["points"] as String,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Color(0xFF7A5A20),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}