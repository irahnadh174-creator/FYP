import 'package:flutter/material.dart';
import '../constants/app_colors.dart';


class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Peta Lokasi"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.blueLight,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Icon(Icons.map, size: 100, color: AppColors.blue),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Lokasi Menarik Melaka",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: ListView(
                children: const [
                  ListTile(leading: Icon(Icons.location_on), title: Text("A Famosa"), subtitle: Text("Tapak sejarah Portugis")),
                  ListTile(leading: Icon(Icons.location_on), title: Text("Stadthuys"), subtitle: Text("Bangunan merah terkenal")),
                  ListTile(leading: Icon(Icons.location_on), title: Text("Menara Taming Sari"), subtitle: Text("Menara berpusing Melaka")),
                  ListTile(leading: Icon(Icons.location_on), title: Text("Jonker Walk"), subtitle: Text("Pusat pelancongan & makanan")),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}