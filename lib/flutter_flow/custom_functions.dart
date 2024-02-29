import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

bool? showSearchResult(
  String? textSearchFor,
  String? textSearchIn,
) {
  return textSearchIn!.toLowerCase().contains(textSearchFor!.toLowerCase());
}

bool searchList(
  String textSearchFor,
  List<String> textSearchIn,
) {
  textSearchFor = textSearchFor.toLowerCase();

  // Iterate through each string in the list
  for (String str in textSearchIn) {
    // Convert str to lowercase
    str = str.toLowerCase();

    // Check if the textSearchFor is contained in the current string
    if (str.contains(textSearchFor)) {
      // If found, return true
      return true;
    }
  }
  // If none of the strings contain the textSearchFor, return false
  return false;
}
