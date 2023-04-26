import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/utilities.dart';

class EditTextField extends ConsumerWidget {
  final void Function() startWriting;
  final TextEditingController controller;

  const EditTextField({
    super.key,
    required this.startWriting,
    required this.controller,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: Sizes.size80,
      child: TextField(
        onTap: startWriting,
        controller: controller,
        expands: true,
        minLines: null,
        maxLines: null,
        textAlignVertical: TextAlignVertical.top,
        decoration: InputDecoration(
          hintText: 'bio or link',
          hintStyle: TextStyle(
            fontSize: Sizes.size14,
            color: isDarkMode(context) ? Colors.white : Colors.grey.shade600,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Sizes.size12),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor:
              isDarkMode(context) ? Colors.grey.shade800 : Colors.grey.shade200,
          contentPadding: const EdgeInsets.all(
            Sizes.size12,
          ),
        ),
      ),
    );
  }
}
