import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../resources/images.dart';

Widget errorWidget(String? errorText, {EdgeInsets? margin}) {
  return (errorText == null || errorText.isEmpty)
      ? Container()
      : Container(
    margin: margin ?? const EdgeInsets.all(0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          errorText,
          style: const TextStyle(color: Colors.red)
        ),
      ],
    ),
  );
}