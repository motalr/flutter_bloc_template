import 'package:flutter/material.dart';

class LoadingOverlay {
  static final LoadingOverlay instance = LoadingOverlay();
  late OverlayEntry _overlay;

  LoadingOverlay();

  void show(BuildContext context) {
    _overlay = OverlayEntry(
      // replace with your own layout
      builder: (context) => const ColoredBox(
        color: Color(0x80000000),
        child: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(Colors.white),
          ),
        ),
      ),
    );
    Overlay.of(context).insert(_overlay);
  }

  void hide() {
    _overlay.remove();
  }
}
