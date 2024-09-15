import 'package:flutter/material.dart';

class HomeStatistics {
  final String homeInterior, electricity;
  final Color color;

  HomeStatistics({
    required this.homeInterior,
    required this.electricity,
    required this.color,
  });
}

List demoHomeStatistics = [
  HomeStatistics(
      homeInterior: "Kitchen", electricity: "2 KW/h", color: Color(0xFFFBD3E1)),
  HomeStatistics(
      homeInterior: "Bedroom",
      electricity: "0.5 KW/h",
      color: Color(0xFFFED8B3)),
  HomeStatistics(
      homeInterior: "Living room",
      electricity: "2.3 KW/h",
      color: Color(0xFFDFD9EF)),
  HomeStatistics(
      homeInterior: "Children's",
      electricity: "1.5 KW/h",
      color: Color(0xFFFEFFC6)),
  HomeStatistics(
      homeInterior: "Bathroom",
      electricity: "1.2 KW/h",
      color: Color(0xFFCCE6FF)),
];
