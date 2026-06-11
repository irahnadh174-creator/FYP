import 'package:flutter/material.dart';

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Leaderboard"),
        centerTitle: true,
      ),
      body: ListView(
        children: const [

          ListTile(
            leading: CircleAvatar(
              child: Text("1"),
            ),
            title: Text("Ali"),
            trailing: Text("2500 XP"),
          ),

          ListTile(
            leading: CircleAvatar(
              child: Text("2"),
            ),
            title: Text("Siti"),
            trailing: Text("2200 XP"),
          ),

          ListTile(
            leading: CircleAvatar(
              child: Text("3"),
            ),
            title: Text("Ahmad"),
            trailing: Text("2000 XP"),
          ),
        ],
      ),
    );
  }
}