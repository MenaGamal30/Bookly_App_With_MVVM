import 'package:flutter/material.dart';

void showSnackBar(context,String url) {
  ScaffoldMessenger.of(context).showSnackBar( SnackBar(content:  Text("cannot Launch$url")));
}