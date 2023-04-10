import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/utilities.dart';

class SearchField extends StatefulWidget {
  const SearchField({super.key});

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  bool _isWriting = false;

  final TextEditingController _textEditingController = TextEditingController();

  void _onStartWriting() {
    setState(() {
      _isWriting = true;
    });
  }

  void _clearWriting() {
    FocusScope.of(context).unfocus();
    _textEditingController.clear();
    setState(() {
      _isWriting = false;
    });
  }

  void _onSearchChanged(String value) {}

  void _onSearchSubmitted(String value) {}

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Sizes.size44,
      child: TextField(
        controller: _textEditingController,
        onTap: _onStartWriting,
        onChanged: _onSearchChanged,
        onSubmitted: _onSearchSubmitted,
        decoration: InputDecoration(
          hintText: 'Search',
          hintStyle: TextStyle(
            color: isDarkMode(context) ? Colors.white : Colors.grey.shade800,
          ),
          filled: true,
          fillColor:
              isDarkMode(context) ? Colors.grey.shade800 : Colors.grey.shade200,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Sizes.size12),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: Sizes.size10,
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 11,
            ),
            child: FaIcon(
              FontAwesomeIcons.magnifyingGlass,
              size: Sizes.size20,
              color: Colors.grey.shade900,
            ),
          ),
          suffixIcon: _isWriting == true
              ? IconButton(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 0,
                    vertical: 0,
                  ),
                  onPressed: _clearWriting,
                  icon: FaIcon(
                    FontAwesomeIcons.solidCircleXmark,
                    size: Sizes.size20,
                    color: Colors.grey.shade900,
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
