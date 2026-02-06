import 'package:flutter/material.dart';

ShapeBorder listTileShape(int index, int length) {
  if (length == 1) {
    return RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0));
  } else if (index == 0) {
    return const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16.0),
        topRight: Radius.circular(16.0),
        bottomLeft: Radius.circular(8.0),
        bottomRight: Radius.circular(8.0),
      ),
    );
  } else if (index == length - 1) {
    return const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(16.0),
        bottomRight: Radius.circular(16.0),
        topLeft: Radius.circular(8.0),
        topRight: Radius.circular(8.0),
      ),
    );
  } else {
    return RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0));
  }
}
