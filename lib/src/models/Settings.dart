import 'package:flutter/material.dart';

class Settings {
  int id;
  IconData icon;
  String title;
  String? trailingTitle;

  Settings({
    required this.id,
    required this.icon,
    required this.title,
    this.trailingTitle,
  });
}
