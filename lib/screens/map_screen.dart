import 'dart:math';
import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  // Index of the currently selected location.
  int _selected = 0;

  // The user's "you are here" position, as a fraction of the map area.
  static const Offset _user = Offset(0.38, 0.80);

  // All map locations. x/y are fractions (0..1) of the map area so the
  // layout scales to any screen size.
  final List<Map<String, dynamic>> _locations = [
    {
      'name': 'Stadthuys',
      'category': 'Warisan Belanda',
      'pts': 50,
      'distance': '85m · 2 min jalan kaki',
      'desc':
          'Bangunan kerajaan Belanda tertua di Asia Tenggara (1650). Terokai bahagian dalam untuk lengkapkan ',
      'trail': 'Dutch Heritage Trail',
      'color': AppColors.red,
      'icon': Icons.account_balance,
      'x': 0.46,
      'y': 0.30,
      'locked': false,
    },
    {
      'name': 'A Famosa',
      'category': 'Warisan Portugis',
      'pts': 40,
      'distance': '320m · 5 min jalan kaki',
      'desc':
          'Kubu pertahanan Portugis yang dibina pada 1511. Terokai bahagian dalam untuk lengkapkan ',
      'trail': 'Portuguese Legacy',
      'color': AppColors.amber,
      'icon': Icons.castle,
      'x': 0.30,
      'y': 0.26,
      'locked': false,
    },
    {
      'name': 'Christ Church',
      'category': 'Warisan Belanda',
      'pts': 35,
      'distance': '60m · 1 min jalan kaki',
      'desc':
          'Gereja Anglican merah ikonik yang dibina pada 1753. Terokai bahagian dalam untuk lengkapkan ',
      'trail': 'Dutch Heritage Trail',
      'color': AppColors.amber,
      'icon': Icons.church,
      'x': 0.62,
      'y': 0.30,
      'locked': false,
    },
    {
      'name': 'Muzium Rakyat',
      'category': 'Terkunci',
      'pts': 0,
      'distance': 'Lengkapkan trail untuk buka',
      'desc': 'Lokasi ini masih terkunci. Lengkapkan mission berhampiran untuk membukanya.',
      'trail': '',
      'color': Colors.grey,
      'icon': Icons.lock,
      'x': 0.26,
      'y': 0.55,
      'locked': true,
    },
    {
      'name': 'Menara Taming Sari',
      'category': 'Terkunci',
      'pts': 0,
      'distance': 'Lengkapkan trail untuk buka',
      'desc': 'Lokasi ini masih terkunci. Lengkapkan mission berhampiran untuk membukanya.',
      'trail': '',
      'color': Colors.grey,
      'icon': Icons.lock,
      'x': 0.70,
      'y': 0.52,
      'locked': true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final selectedLoc = _locations[_selected];

    return Scaffold(
      body: Stack(
        children: [
          // ---------- MAP AREA (full screen) ----------
          Positioned.fill(
            child: LayoutBuilder(
              builder: (context, constraints) {
                final w = constraints.maxWidth;
                final h = constraints.maxHeight;

                final selOffset = Offset(
                  selectedLoc['x'] as double,
                  selectedLoc['y'] as double,
                );

                return Stack(
                  children: [
                    // Painted map background (roads + river)
                    const Positioned.fill(
                      child: CustomPaint(painter: _MapBackgroundPainter()),
                    ),

                    // Dotted walking path from user to selected pin
                    Positioned.fill(
                      child: CustomPaint(
                        painter: _PathPainter(start: _user, end: selOffset),
                      ),
                    ),

                    // User "you are here" dot
                    Positioned(
                      left: _user.dx * w - 11,
                      top: _user.dy * h - 11,
                      child: const _UserDot(),
                    ),

                    // Location pins
                    for (int i = 0; i < _locations.length; i++)
                      _buildPin(i, w, h),
                  ],
                );
              },
            ),
          ),

          // ---------- TOP SEARCH BAR ----------
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
              child: Column(
                children: [
                  Row(
                    children: [
                      // Dark search pill
                      Expanded(
                        child: Container(
                          height: 48,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                            color: AppColors.dark,
                            borderRadius: BorderRadius.circular(24),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.2),
                                blurRadius: 12,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: const Row(
                            children: [
                              Icon(Icons.location_on,
                                  color: AppColors.primary, size: 20),
                              SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  'Kawasan Bangunan Merah',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      // List button
                      Container(
                        height: 48,
                        width: 48,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.1),
                              blurRadius: 10,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: const Icon(Icons.menu, color: AppColors.dark),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  // Small floating label showing the selected location
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.1),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Text(
                      selectedLoc['name'] as String,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 13,
                        color: AppColors.dark,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ---------- BOTTOM INFO CARD ----------
          Align(
            alignment: Alignment.bottomCenter,
            child: _InfoCard(
              location: selectedLoc,
              onNavigate: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Membuka ${selectedLoc['name']}…'),
                    duration: const Duration(seconds: 1),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPin(int index, double w, double h) {
    final loc = _locations[index];
    final bool locked = loc['locked'] as bool;
    final bool isSelected = index == _selected;

    final double size = locked
        ? 38
        : isSelected
            ? 56
            : 44;

    // Selected unlocked pin turns green; locked pins are grey.
    final Color color = locked
        ? Colors.grey.shade500
        : isSelected
            ? AppColors.primary
            : loc['color'] as Color;

    return Positioned(
      left: (loc['x'] as double) * w - size / 2,
      top: (loc['y'] as double) * h - size,
      child: GestureDetector(
        onTap: () {
          if (locked) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Lokasi ini masih terkunci 🔒'),
                duration: Duration(seconds: 1),
              ),
            );
            return;
          }
          setState(() => _selected = index);
        },
        child: _MapPin(
          size: size,
          color: color,
          icon: loc['icon'] as IconData,
          locked: locked,
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Pin widget — a teardrop marker with an icon in the circle.
// ---------------------------------------------------------------------------
class _MapPin extends StatelessWidget {
  final double size;
  final Color color;
  final IconData icon;
  final bool locked;

  const _MapPin({
    required this.size,
    required this.color,
    required this.icon,
    required this.locked,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: locked ? 0.7 : 1,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Icon(
            Icons.location_on,
            size: size,
            color: color,
            shadows: [
              Shadow(
                color: Colors.black.withValues(alpha: 0.25),
                blurRadius: 6,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          // White circle + small icon sitting in the head of the pin
          Positioned(
            top: size * 0.14,
            child: Container(
              width: size * 0.46,
              height: size * 0.46,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: size * 0.30, color: color),
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// User location dot.
// ---------------------------------------------------------------------------
class _UserDot extends StatelessWidget {
  const _UserDot();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 22,
      height: 22,
      decoration: BoxDecoration(
        color: AppColors.blue,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 3),
        boxShadow: [
          BoxShadow(
            color: AppColors.blue.withValues(alpha: 0.4),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Bottom info card.
// ---------------------------------------------------------------------------
class _InfoCard extends StatelessWidget {
  final Map<String, dynamic> location;
  final VoidCallback onNavigate;

  const _InfoCard({required this.location, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    final bool locked = location['locked'] as bool;
    final int pts = location['pts'] as int;
    final String trail = location['trail'] as String;

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.12),
            blurRadius: 20,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Grab handle
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 14),

          // Title + points badge
          Row(
            children: [
              Expanded(
                child: Text(
                  location['name'] as String,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.dark,
                  ),
                ),
              ),
              if (!locked)
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: AppColors.greenLight,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.star,
                          size: 14, color: AppColors.primaryDark),
                      const SizedBox(width: 4),
                      Text(
                        '+$pts pts',
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          color: AppColors.primaryDark,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
          const SizedBox(height: 10),

          // Distance + category
          Row(
            children: [
              const Icon(Icons.near_me, size: 16, color: AppColors.primary),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  location['distance'] as String,
                  style: const TextStyle(fontSize: 13, color: Colors.grey),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                location['category'] as String,
                style: const TextStyle(fontSize: 13, color: Colors.grey),
              ),
            ],
          ),
          const SizedBox(height: 14),

          // Description (with bold trail name)
          Text.rich(
            TextSpan(
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.dark,
                height: 1.4,
              ),
              children: [
                TextSpan(text: location['desc'] as String),
                if (trail.isNotEmpty)
                  TextSpan(
                    text: trail,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                if (trail.isNotEmpty) const TextSpan(text: '.'),
              ],
            ),
          ),
          const SizedBox(height: 18),

          // Action button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: locked ? null : onNavigate,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                disabledBackgroundColor: Colors.grey.shade300,
                padding: const EdgeInsets.symmetric(vertical: 16),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              icon: Icon(locked ? Icons.lock : Icons.navigation, size: 20),
              label: Text(
                locked ? 'Terkunci' : 'Navigate + Explore Inside',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Painter: stylised map background (sage land, roads, river).
// ---------------------------------------------------------------------------
class _MapBackgroundPainter extends CustomPainter {
  const _MapBackgroundPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    // Land
    canvas.drawRect(
      Offset.zero & size,
      Paint()..color = const Color(0xFFD6E2C4),
    );

    // A softer green "park" blob
    final park = Paint()..color = const Color(0xFFC7D9AE);
    canvas.drawOval(
      Rect.fromLTWH(w * 0.55, h * 0.55, w * 0.6, h * 0.4),
      park,
    );

    // Roads (cream coloured)
    final road = Paint()
      ..color = const Color(0xFFF4F1EA)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 26
      ..strokeCap = StrokeCap.round;

    // Horizontal-ish road
    final road1 = Path()
      ..moveTo(-20, h * 0.40)
      ..quadraticBezierTo(w * 0.5, h * 0.34, w + 20, h * 0.42);
    canvas.drawPath(road1, road);

    // Vertical-ish road
    final road2 = Path()
      ..moveTo(w * 0.45, -20)
      ..quadraticBezierTo(w * 0.40, h * 0.5, w * 0.50, h + 20);
    canvas.drawPath(road2, road);

    // Diagonal smaller road
    final road3 = Paint()
      ..color = const Color(0xFFF4F1EA)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 16
      ..strokeCap = StrokeCap.round;
    final road3Path = Path()
      ..moveTo(w * 0.05, h * 0.7)
      ..quadraticBezierTo(w * 0.4, h * 0.6, w * 0.9, h * 0.75);
    canvas.drawPath(road3Path, road3);

    // River along the bottom-right
    final river = Paint()..color = const Color(0xFFB9D4E8);
    final riverPath = Path()
      ..moveTo(w, h * 0.62)
      ..quadraticBezierTo(w * 0.7, h * 0.7, w * 0.78, h)
      ..lineTo(w, h)
      ..close();
    canvas.drawPath(riverPath, river);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// ---------------------------------------------------------------------------
// Painter: dotted walking path between two fractional points.
// ---------------------------------------------------------------------------
class _PathPainter extends CustomPainter {
  final Offset start; // fractions
  final Offset end; // fractions

  const _PathPainter({required this.start, required this.end});

  @override
  void paint(Canvas canvas, Size size) {
    final p1 = Offset(start.dx * size.width, start.dy * size.height);
    final p2 = Offset(end.dx * size.width, end.dy * size.height);

    final dot = Paint()..color = AppColors.primary;

    final distance = (p2 - p1).distance;
    const step = 14.0;
    final count = (distance / step).floor();

    for (int i = 0; i <= count; i++) {
      final t = i / count;
      final p = Offset.lerp(p1, p2, t)!;
      canvas.drawCircle(p, 3.5, dot);
    }
  }

  @override
  bool shouldRepaint(covariant _PathPainter oldDelegate) =>
      oldDelegate.end != end || oldDelegate.start != start;
}
