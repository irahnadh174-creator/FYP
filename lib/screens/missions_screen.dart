import 'package:flutter/material.dart';

class MissionsScreen extends StatelessWidget {
  const MissionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Missions"),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [

          Card(
            child: ListTile(
              leading: Icon(Icons.flag),
              title: Text("Lawati A Famosa"),
              subtitle: Text("50 XP"),
            ),
          ),

          Card(
            child: ListTile(
              leading: Icon(Icons.flag),
              title: Text("Lawati Stadthuys"),
              subtitle: Text("75 XP"),
            ),
          ),

          Card(
            child: ListTile(
              leading: Icon(Icons.flag),
              title: Text("Selesaikan Quiz Sejarah"),
              subtitle: Text("100 XP"),
            ),
          ),
        ],
      ),
    );
  }
}