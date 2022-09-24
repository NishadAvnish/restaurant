import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

BOXSHADOW(
        {double? dx,
        double? dy,
        double? sRadius,
        double? bRadius,
        Color? color}) =>
    BoxShadow(
        offset: Offset(dx ?? 0, dy ?? 6),
        blurRadius: bRadius ?? 8,
        spreadRadius: sRadius ?? 0.0,
        color: color ?? const Color.fromRGBO(0, 0, 0, 0.1));

double VALUE_INPUT_BORDER_RADIUS = 8.0.r;
double LARGE_BORDER_RADIUS = 24.0.r;
const String CURRENCY = "₹";
