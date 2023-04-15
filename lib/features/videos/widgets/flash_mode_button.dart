import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class FlashModeButon extends StatelessWidget {
  final Future<void> Function(FlashMode flashMode) setFlashMode;
  final FlashMode newFlashMode;
  final FlashMode flashMode;
  final Icon icon;

  const FlashModeButon({
    super.key,
    required this.setFlashMode,
    required this.newFlashMode,
    required this.flashMode,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => setFlashMode(newFlashMode),
      color: flashMode == newFlashMode
          ? Theme.of(context).primaryColor
          : Colors.white,
      icon: icon,
    );
  }
}
