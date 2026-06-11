import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import 'exhibit_screen.dart';

class FloorGameScreen extends StatefulWidget {
  final int floor;
  const FloorGameScreen({super.key, required this.floor});

  @override
  State<FloorGameScreen> createState() => _FloorGameScreenState();
}

class _FloorGameScreenState extends State<FloorGameScreen> {
  int clueIndex = 0;

  List<Map<String, dynamic>> get clues {
    switch (widget.floor) {
      case 1:
        return [
          {
            'clue': 'Cari bilik pertama selepas masuk pintu utama.\nLihat 5 patung gangsa yang berdiri gagah di sini.',
            'room': 'Bilik 101 — Entrance Hall',
            'emoji': '🗿',
            'roomName': 'Entrance Hall',
            'exhibitTitle': '5 Patung Gangsa — Fasa Sejarah Melaka',
            'info': 'Bilik ini mempamerkan 5 patung gangsa yang mewakili 5 fasa sejarah Melaka:\n\n'
                '1️⃣ Zaman Kesultanan Melayu Melaka (1400–1511)\n'
                '2️⃣ Penjajahan Portugis (1511–1641)\n'
                '3️⃣ Penjajahan Belanda (1641–1824)\n'
                '4️⃣ Penjajahan British (1824–1957)\n'
                '5️⃣ Kemerdekaan Malaysia (1957)\n\n'
                'Stadthuys dibina pada 1641 oleh Syarikat Hindia Timur Belanda (VOC).',
            'questions': [
              {
                'q': 'Berapa fasa sejarah yang diwakili oleh patung gangsa?',
                'options': ['3 fasa', '4 fasa', '5 fasa', '6 fasa'],
                'correct': '5 fasa',
                'explanation': 'Terdapat 5 patung gangsa mewakili 5 fasa sejarah Melaka.',
              },
              {
                'q': 'Stadthuys dibina pada tahun berapa?',
                'options': ['1511', '1600', '1641', '1824'],
                'correct': '1641',
                'explanation': 'Stadthuys dibina pada 1641 oleh Belanda.',
              },
              {
                'q': 'Siapakah yang membina Stadthuys?',
                'options': ['Portugis', 'British', 'Belanda (VOC)', 'Kesultanan Melayu'],
                'correct': 'Belanda (VOC)',
                'explanation': 'Syarikat Hindia Timur Belanda (VOC) membina Stadthuys.',
              },
            ],
          },
          {
            'clue': 'Dari Entrance Hall, jalan lurus ke dalam.\nCari bilik yang ada peralatan zaman pemerintahan Belanda.',
            'room': 'Bilik 108 — Bilik Belanda',
            'emoji': '🌷',
            'roomName': 'Bilik Belanda',
            'exhibitTitle': 'Era Penjajahan Belanda di Melaka',
            'info': 'Belanda memerintah Melaka selama 183 tahun (1641–1824).\n\n'
                '• Mereka membina banyak bangunan merah yang masih ada hingga kini\n'
                '• Stadthuys berfungsi sebagai rumah gabenor\n'
                '• Christ Church (1753) juga dibina oleh Belanda\n'
                '• Perdagangan rempah ratus menjadi tumpuan utama',
            'questions': [
              {
                'q': 'Berapa lama Belanda memerintah Melaka?',
                'options': ['100 tahun', '130 tahun', '183 tahun', '200 tahun'],
                'correct': '183 tahun',
                'explanation': 'Belanda memerintah Melaka dari 1641 hingga 1824.',
              },
              {
                'q': 'Gereja mana yang dibina oleh Belanda di Melaka?',
                'options': ['St. Paul Church', 'Christ Church', 'St. Peter Church', 'St. Francis Church'],
                'correct': 'Christ Church',
                'explanation': 'Christ Church dibina oleh Belanda pada tahun 1753.',
              },
              {
                'q': 'Apakah fungsi asal Stadthuys semasa era Belanda?',
                'options': ['Hospital', 'Penjara', 'Rumah gabenor & dewan bandaraya', 'Sekolah'],
                'correct': 'Rumah gabenor & dewan bandaraya',
                'explanation': 'Stadthuys berfungsi sebagai kediaman rasmi gabenor Belanda.',
              },
            ],
          },
          {
            'clue': 'Cari kawasan court di tingkat 1.\nAda replika rumah tradisional Melayu Melaka di sini!',
            'room': 'Court 118 — Rumak Melaka',
            'emoji': '🏠',
            'roomName': 'Court 118 — Rumak Melaka',
            'exhibitTitle': 'Rumak Melaka — Rumah Tradisional',
            'info': '"Rumak Melaka" adalah nama tempatan untuk rumah tradisional Melayu Melaka.\n\n'
                '• Dibina di atas tiang kayu (rumah panggung)\n'
                '• Bumbung berbentuk pelana dengan ukiran halus\n'
                '• Mempunyai anjung (serambi) di hadapan\n'
                '• Menggunakan kayu cengal dan meranti',
            'questions': [
              {
                'q': 'Apa nama rumah tradisional Melayu Melaka?',
                'options': ['Rumah Bumbung Lima', 'Rumak Melaka', 'Rumah Limas', 'Rumah Melayu'],
                'correct': 'Rumak Melaka',
                'explanation': '"Rumak Melaka" adalah nama khas untuk rumah tradisional di Melaka.',
              },
              {
                'q': 'Apakah ciri utama Rumak Melaka?',
                'options': ['Dibina atas batu', 'Dibina di atas tiang kayu', 'Dibina bawah tanah', 'Dibina dari bata merah'],
                'correct': 'Dibina di atas tiang kayu',
                'explanation': 'Rumak Melaka adalah rumah panggung di atas tiang kayu.',
              },
              {
                'q': 'Apakah nama bahagian hadapan rumah untuk menerima tetamu?',
                'options': ['Selasar', 'Anjung', 'Pelantar', 'Bilik'],
                'correct': 'Anjung',
                'explanation': 'Anjung adalah serambi hadapan rumah tradisional Melayu.',
              },
            ],
          },
        ];
      case 2:
        return [
          {
            'clue': 'Naik ke tingkat 2.\nCari bilik yang ada pelbagai pakaian tradisional komuniti Melaka.',
            'room': 'Bilik 201 — Pakaian Tradisional',
            'emoji': '👘',
            'roomName': 'Bilik Pakaian Tradisional',
            'exhibitTitle': 'Pakaian Tradisional Komuniti Melaka',
            'info': 'Melaka terkenal dengan kepelbagaian budayanya:\n\n'
                '👗 Melayu — Baju kurung & songket\n'
                '🔴 Cina — Cheongsam berwarna merah & emas\n'
                '🟡 India — Saree dengan pelbagai warna\n'
                '💜 Baba & Nyonya — Kebaya nyonya\n'
                '🇵🇹 Portugis — Pakaian komuniti Kristang',
            'questions': [
              {
                'q': 'Pakaian tradisional komuniti Baba & Nyonya dipanggil apa?',
                'options': ['Baju kurung', 'Cheongsam', 'Baju kebaya nyonya', 'Saree'],
                'correct': 'Baju kebaya nyonya',
                'explanation': 'Baju kebaya nyonya adalah pakaian tradisional komuniti Peranakan.',
              },
              {
                'q': 'Kain tradisional Melayu yang menggunakan benang emas dipanggil?',
                'options': ['Batik', 'Songket', 'Tenun', 'Sutera'],
                'correct': 'Songket',
                'explanation': 'Songket adalah kain tenunan tradisional Melayu dengan benang emas.',
              },
              {
                'q': 'Komuniti mana yang menggunakan pakaian Cheongsam?',
                'options': ['Melayu', 'India', 'Cina', 'Portugis'],
                'correct': 'Cina',
                'explanation': 'Cheongsam adalah pakaian tradisional komuniti Cina.',
              },
            ],
          },
          {
            'clue': 'Masih di tingkat 2. Cari bilik yang ada perabot antik komuniti Peranakan.',
            'room': 'Bilik 214 — Baba & Nyonya',
            'emoji': '🏮',
            'roomName': 'Bilik Baba & Nyonya',
            'exhibitTitle': 'Budaya Baba & Nyonya (Peranakan)',
            'info': 'Baba & Nyonya adalah komuniti hasil perkahwinan campur:\n\n'
                '• "Baba" = lelaki Peranakan\n'
                '• "Nyonya" = perempuan Peranakan\n'
                '• Bahasa = Melayu bercampur Hokkien\n'
                '• Masakan = gabungan Cina & rempah Melayu\n'
                '• Antara komuniti Peranakan tertua di Asia Tenggara',
            'questions': [
              {
                'q': 'Apakah maksud "Nyonya"?',
                'options': ['Lelaki Peranakan', 'Perempuan Peranakan', 'Kanak-kanak', 'Ketua komuniti'],
                'correct': 'Perempuan Peranakan',
                'explanation': '"Nyonya" merujuk kepada perempuan dalam komuniti Peranakan.',
              },
              {
                'q': 'Komuniti Baba & Nyonya terhasil dari perkahwinan antara?',
                'options': ['Melayu & India', 'Portugis & Melayu', 'Pedagang Cina & wanita Melayu', 'British & Cina'],
                'correct': 'Pedagang Cina & wanita Melayu',
                'explanation': 'Peranakan terhasil dari perkahwinan pedagang Cina dengan wanita Melayu.',
              },
              {
                'q': 'Masakan Nyonya adalah gabungan antara?',
                'options': ['India & Arab', 'Cina & rempah Melayu', 'Portugis & British', 'Thai & Indonesia'],
                'correct': 'Cina & rempah Melayu',
                'explanation': 'Masakan Nyonya menggabungkan teknik Cina dengan rempah Melayu.',
              },
            ],
          },
          {
            'clue': 'Di hujung tingkat 2, cari galeri dengan lukisan besar.\nKisah penjelajah laut terkenal dari China!',
            'room': 'Bilik 220 — Admiral Cheng Ho',
            'emoji': '⚓',
            'roomName': 'Admiral Cheng Ho Gallery',
            'exhibitTitle': 'Admiral Cheng Ho & Hubungan China-Melaka',
            'info': 'Admiral Cheng Ho adalah penjelajah laut China terkenal:\n\n'
                '• Melawat Melaka 7 kali antara 1405–1433\n'
                '• Armada 300+ kapal & 27,000 anak kapal\n'
                '• Mengukuhkan hubungan diplomatik China-Melaka\n'
                '• Melaka jadi pelabuhan transit penting',
            'questions': [
              {
                'q': 'Berapa kali Admiral Cheng Ho melawat Melaka?',
                'options': ['3 kali', '5 kali', '7 kali', '10 kali'],
                'correct': '7 kali',
                'explanation': 'Admiral Cheng Ho melawat Melaka 7 kali antara 1405–1433.',
              },
              {
                'q': 'Berapa bilangan anak kapal armada Cheng Ho?',
                'options': ['5,000', '10,000', '20,000', '27,000'],
                'correct': '27,000',
                'explanation': 'Armada Cheng Ho mempunyai 300+ kapal dengan 27,000 anak kapal.',
              },
              {
                'q': 'Apakah kepentingan lawatan Cheng Ho ke Melaka?',
                'options': ['Menakluk Melaka', 'Mengukuhkan hubungan diplomatik', 'Berdagang rempah sahaja', 'Membina bangunan'],
                'correct': 'Mengukuhkan hubungan diplomatik',
                'explanation': 'Lawatan Cheng Ho mengukuhkan hubungan diplomatik China-Melaka.',
              },
            ],
          },
        ];
      case 3:
      default:
        return [
          {
            'clue': 'Naik ke tingkat 3. Cari kawasan Bakery House.\nAda pameran legenda dan kisah rakyat Melaka!',
            'room': 'Bakery House — Legenda Melaka',
            'emoji': '📜',
            'roomName': 'Bakery House Area',
            'exhibitTitle': 'Legenda Melaka — Kisah Rakyat',
            'info': 'Melaka kaya dengan legenda turun-temurun:\n\n'
                '🐟 Parameswara melihat pelanduk putih menendang anjing — tanda keberanian — lalu mendirikan kerajaan\n\n'
                '⚔️ Hang Tuah — Pahlawan Melayu yang setia kepada sultan\n\n'
                '💔 Hang Li Po — Puteri China dikahwinkan dengan Sultan Melaka',
            'questions': [
              {
                'q': 'Apakah tanda yang dilihat Parameswara sebelum mendirikan Melaka?',
                'options': ['Harimau putih', 'Pelanduk putih menendang anjing', 'Burung helang', 'Ikan besar'],
                'correct': 'Pelanduk putih menendang anjing',
                'explanation': 'Pelanduk putih menendang anjing pemburu — tanda keberanian.',
              },
              {
                'q': 'Hang Tuah terkenal sebagai?',
                'options': ['Pedagang kaya', 'Pahlawan setia kepada sultan', 'Gabenor Belanda', 'Pengasas Melaka'],
                'correct': 'Pahlawan setia kepada sultan',
                'explanation': 'Hang Tuah adalah pahlawan lagenda yang setia kepada Sultan Melaka.',
              },
              {
                'q': 'Siapakah Hang Li Po?',
                'options': ['Permaisuri sultan pertama', 'Puteri China dikahwinkan dengan Sultan', 'Pedagang wanita', 'Pengikut Cheng Ho'],
                'correct': 'Puteri China dikahwinkan dengan Sultan',
                'explanation': 'Hang Li Po adalah puteri China yang dikahwinkan dengan Sultan Melaka.',
              },
            ],
          },
          {
            'clue': 'Di tengah tingkat 3, ada court terbuka.\nCari pameran peta-peta lama dan foto bersejarah!',
            'room': 'Court Tingkat 3 — Peta & Foto',
            'emoji': '🗺️',
            'roomName': 'Court Tingkat 3',
            'exhibitTitle': 'Peta & Foto Sejarah Melaka',
            'info': 'Koleksi peta dan foto bersejarah Melaka:\n\n'
                '🗺️ Peta 1511 — Peta Portugis pertama\n'
                '🗺️ Peta 1641 — Pelan bandar Belanda (VOC)\n'
                '🗺️ Peta 1824 — Peta British\n'
                '📸 Foto 1900an — Jalan-jalan lama Melaka\n'
                '📸 Foto 1957 — Perisytiharan kemerdekaan',
            'questions': [
              {
                'q': 'Siapa yang menghasilkan peta pertama Melaka (1511)?',
                'options': ['Belanda', 'British', 'Portugis', 'China'],
                'correct': 'Portugis',
                'explanation': 'Portugis menghasilkan peta pertama Melaka pada 1511.',
              },
              {
                'q': 'Tahun berapa Perjanjian Inggeris-Belanda ditandatangani?',
                'options': ['1786', '1800', '1824', '1867'],
                'correct': '1824',
                'explanation': 'Perjanjian 1824 menyebabkan Melaka diserahkan kepada British.',
              },
              {
                'q': 'Apakah yang ditunjukkan foto tahun 1957?',
                'options': ['Pembinaan Stadthuys', 'Kedatangan Belanda', 'Perisytiharan kemerdekaan', 'Perang Dunia'],
                'correct': 'Perisytiharan kemerdekaan',
                'explanation': 'Foto 1957 merakamkan perisytiharan kemerdekaan Malaya.',
              },
            ],
          },
          {
            'clue': 'Bahagian hujung tingkat 3 — Storage Building.\nIni Muzium Kesusasteraan Melaka. Stop terakhir!',
            'room': 'Storage Building — Muzium Sastera',
            'emoji': '📖',
            'roomName': 'Storage Building',
            'exhibitTitle': 'Kesusasteraan Melayu Melaka',
            'info': 'Melaka adalah pusat kesusasteraan Melayu klasik:\n\n'
                '📚 Sulalatus Salatin (Sejarah Melayu) — Karya agung ditulis 1612\n\n'
                '📚 Hikayat Hang Tuah — Epik pahlawan Melayu terbesar\n\n'
                '🖊️ Bahasa Melayu Melaka jadi lingua franca perdagangan Asia Tenggara',
            'questions': [
              {
                'q': 'Nama karya agung sejarah Kesultanan Melayu Melaka?',
                'options': ['Hikayat Hang Tuah', 'Sulalatus Salatin', 'Hikayat Raja-Raja Pasai', 'Hikayat Merong'],
                'correct': 'Sulalatus Salatin',
                'explanation': 'Sulalatus Salatin atau Sejarah Melayu ditulis sekitar 1612.',
              },
              {
                'q': 'Apakah peranan Bahasa Melayu Melaka dalam perdagangan?',
                'options': ['Bahasa penjajah', 'Bahasa agama', 'Lingua franca perdagangan', 'Bahasa tulisan'],
                'correct': 'Lingua franca perdagangan',
                'explanation': 'Bahasa Melayu Melaka jadi bahasa perantaraan pedagang Asia Tenggara.',
              },
              {
                'q': 'Hikayat Hang Tuah menceritakan tentang?',
                'options': ['Sejarah Pasai', 'Epik pahlawan Melayu terbesar', 'Kisah pedagang Cina', 'Penaklukan Portugis'],
                'correct': 'Epik pahlawan Melayu terbesar',
                'explanation': 'Hikayat Hang Tuah adalah epik pahlawan lagenda Melayu.',
              },
            ],
          },
        ];
    }
  }

  void _showComplete() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('🎉', style: TextStyle(fontSize: 50)),
            const SizedBox(height: 12),
            Text(
              'Tingkat ${widget.floor} Selesai!',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.greenLight,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                'Bonus +50 pts!',
                style: TextStyle(
                  color: AppColors.primaryDark,
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: const Text('Kembali'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final current = clues[clueIndex];

    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: AppBar(
        title: Text('Tingkat ${widget.floor}'),
        backgroundColor: Colors.white,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4),
          child: LinearProgressIndicator(
            value: (clueIndex + 1) / clues.length,
            backgroundColor: AppColors.card,
            valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primary),
            minHeight: 4,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'Stop ${clueIndex + 1} / ${clues.length}',
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColors.amberLight,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    current['room'] as String,
                    style: const TextStyle(
                      fontSize: 11,
                      color: AppColors.amber,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: AppColors.border),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Icon(Icons.search, color: AppColors.primary, size: 18),
                      SizedBox(width: 6),
                      Text(
                        'Clue',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: AppColors.dark,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    current['clue'] as String,
                    style: const TextStyle(
                      fontSize: 13,
                      color: AppColors.dark,
                      height: 1.6,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: AppColors.border),
              ),
              child: Row(
                children: [
                  Text(
                    current['emoji'] as String,
                    style: const TextStyle(fontSize: 28),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          current['roomName'] as String,
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: AppColors.dark,
                          ),
                        ),
                        Text(
                          current['exhibitTitle'] as String,
                          style: const TextStyle(
                            fontSize: 11,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  elevation: 0,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ExhibitScreen(
                        clue: current,
                        onCompleted: (score) {
                          if (clueIndex < clues.length - 1) {
                            setState(() => clueIndex++);
                          } else {
                            _showComplete();
                          }
                        },
                      ),
                    ),
                  );
                },
                child: const Text(
                  'Aku Dah Sampai! 🎯',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}