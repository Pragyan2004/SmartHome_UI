import 'package:flutter/material.dart';

class HomeInterior {
  final String title, image, humidifier, airPurrifier;
  final bool boolHumidifier, boolAirPurrifier;
  final double floorlamp, mainLight;

  HomeInterior({
    required this.image,
    required this.title,
    required this.humidifier,
    required this.airPurrifier,
    required this.floorlamp,
    required this.mainLight,
    required this.boolHumidifier,
    required this.boolAirPurrifier,
  });
}

List demoHomeInterior = [
  HomeInterior(
    image: "images/image4.jpg",
    title: "Bedroom",
    humidifier: "87%",
    airPurrifier: "52%",
    boolHumidifier: true,
    boolAirPurrifier: false,
    mainLight: 60,
    floorlamp: 40,
  ),
  HomeInterior(
    image: "images/image1.jpg",
    title: "Children's",
    humidifier: "70%",
    airPurrifier: "52%",
    boolHumidifier: false,
    boolAirPurrifier: true,
    mainLight: 70,
    floorlamp: 50,
  ),
  HomeInterior(
    image: "images/image3.jpg",
    title: "Kitchen",
    humidifier: "80%",
    airPurrifier: "45%",
    boolHumidifier: true,
    boolAirPurrifier: false,
    mainLight: 80,
    floorlamp: 40,
  ),
  HomeInterior(
    image: "images/image2.jpg",
    title: "Bathroom",
    humidifier: "77%",
    airPurrifier: "66%",
    boolHumidifier: true,
    boolAirPurrifier: true,
    mainLight: 50,
    floorlamp: 70,
  ),
  HomeInterior(
    image: "images/image5.jpg",
    title: "Living room",
    humidifier: "65%",
    airPurrifier: "44%",
    boolHumidifier: true,
    boolAirPurrifier: false,
    mainLight: 66,
    floorlamp: 55,
  ),
];
