import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class DummyData {
  static final List<Map<String, dynamic>> badges = [
    {'id': 'explorer', 'name': 'Explorer', 'icon': '🗺️', 'color': AppColors.primary, 'earned': true},
    {'id': 'heritage', 'name': 'Heritage', 'icon': '🏛️', 'color': AppColors.primary, 'earned': true},
    {'id': 'collector', 'name': 'Collector', 'icon': '⭐', 'color': AppColors.amber, 'earned': true},
    {'id': 'historian', 'name': 'Historian', 'icon': '📜', 'color': AppColors.blue, 'earned': true},
    {'id': 'adventurer', 'name': 'Adventurer', 'icon': '🧭', 'color': AppColors.primary, 'earned': true},
    {'id': 'master', 'name': 'Melaka Hero', 'icon': '🏆', 'color': AppColors.amber, 'earned': false},
  ];

  static final List<Map<String, dynamic>> missions = [
    {
      'id': 'dutch',
      'title': 'Dutch Heritage Trail',
      'desc': 'Terokai bangunan kolonial Belanda',
      'icon': '🏛️',
      'color': AppColors.primary,
      'bgColor': AppColors.greenLight,
      'totalPts': 300,
      'progress': 0.75,
      'completed': 3,
      'total': 4,
    },
    {
      'id': 'portuguese',
      'title': 'Portuguese Legacy',
      'desc': 'Temui warisan Portugis di Melaka',
      'icon': '⚔️',
      'color': AppColors.amber,
      'bgColor': AppColors.amberLight,
      'totalPts': 350,
      'progress': 0.0,
      'completed': 0,
      'total': 4,
    },
    {
      'id': 'freedom',
      'title': 'Freedom Trail',
      'desc': 'Laluan kemerdekaan Malaysia',
      'icon': '🇲🇾',
      'color': AppColors.blue,
      'bgColor': AppColors.blueLight,
      'totalPts': 200,
      'progress': 0.0,
      'completed': 0,
      'total': 3,
    },
  ];

  static final List<Map<String, dynamic>> leaderboard = [
    {'rank': 1, 'name': 'Ahmad Nadzri', 'initials': 'AN', 'pts': 2450, 'color': AppColors.amber},
    {'rank': 2, 'name': 'Nurain Nadhirah', 'initials': 'NN', 'pts': 1200, 'color': AppColors.primary, 'isMe': true},
    {'rank': 3, 'name': 'Siti Rahmah', 'initials': 'SR', 'pts': 980, 'color': Color(0xFF639922)},
    {'rank': 4, 'name': 'Mohd Faris', 'initials': 'MF', 'pts': 750, 'color': AppColors.primary},
    {'rank': 5, 'name': 'Liyana Husna', 'initials': 'LH', 'pts': 620, 'color': AppColors.blue},
    {'rank': 6, 'name': 'Izzat Hakim', 'initials': 'IH', 'pts': 510, 'color': AppColors.amber},
    {'rank': 7, 'name': 'Nur Aisyah', 'initials': 'NA', 'pts': 430, 'color': Color(0xFFD85A30)},
  ];
}