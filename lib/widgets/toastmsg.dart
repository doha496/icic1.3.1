import 'dart:async';

import 'toast_animation.dart';
import 'package:flutter/material.dart';

class ToastMsg {
  static Timer toastTimer;
  static OverlayEntry _overlayEntry;

  static void showCustomToast(BuildContext context, String message) {
    if (toastTimer == null || !toastTimer.isActive) {
      _overlayEntry = createOverlayEntry(context, message);
      Overlay.of(context).insert(_overlayEntry);
      toastTimer = Timer(Duration(seconds: 4), () {
        if (_overlayEntry != null) {
          _overlayEntry.remove();
        }
      });
    }
  }

  static OverlayEntry createOverlayEntry(BuildContext context, String message) {
    return OverlayEntry(
      builder: (context) => Positioned(
        top: 500,
        width: MediaQuery.of(context).size.width - 20,
        left: 10,
        child: SlideInToastMessageAnimation(Material(
          elevation: 10.0,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            padding: EdgeInsets.only(left: 10, right: 10, top: 13, bottom: 10),
            decoration: BoxDecoration(
                color: Color.fromRGBO(124, 67, 75, 100),
                borderRadius: BorderRadius.circular(10)),
            child: Align(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    message,
                    textAlign: TextAlign.center,
                    softWrap: true,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ),
          ),
        )),
      ),
    );
  }
}
