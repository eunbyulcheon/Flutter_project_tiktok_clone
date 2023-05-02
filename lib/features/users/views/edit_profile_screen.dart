import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/users/view_models/users_view_model.dart';
import 'package:tiktok_clone/utilities.dart';

class EditProfileScreen extends ConsumerStatefulWidget {
  const EditProfileScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EditProfileScreenState();
}

class _EditProfileScreenState extends ConsumerState<EditProfileScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _isWriting = false;

  late Map<String, String> formData = {
    'bio': ref.read(usersProvider).value?.bio == 'undefined'
        ? ''
        : ref.read(usersProvider).value?.bio ?? '',
    'link': ref.read(usersProvider).value?.link == 'undefined'
        ? ''
        : ref.read(usersProvider).value?.link ?? '',
  };

  void _onStartWriting() {
    setState(() {
      _isWriting = true;
    });
  }

  void _stopWriting() {
    FocusScope.of(context).unfocus();
    setState(() {
      _isWriting = false;
    });
  }

  void _onSubmitTap() {
    if (_formKey.currentState != null) {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState?.save();
        ref.read(usersProvider.notifier).onProfileEdit(
              bio: formData['bio'],
              link: formData['link'],
            );
        Navigator.pop(context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _stopWriting,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Edit profile'),
          actions: !_isWriting
              ? null
              : [
                  IconButton(
                    onPressed: _onSubmitTap,
                    icon: const FaIcon(
                      FontAwesomeIcons.check,
                      size: Sizes.size24,
                    ),
                  ),
                ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(Sizes.size20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Biography',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: Sizes.size16,
                  ),
                ),
                Gaps.v10,
                SizedBox(
                  height: Sizes.size80,
                  child: TextFormField(
                    onTap: _onStartWriting,
                    initialValue: formData['bio'],
                    expands: true,
                    minLines: null,
                    maxLines: null,
                    textAlignVertical: TextAlignVertical.top,
                    decoration: InputDecoration(
                      hintText: 'bio',
                      hintStyle: TextStyle(
                        fontSize: Sizes.size14,
                        color: isDarkMode(context)
                            ? Colors.white
                            : Colors.grey.shade600,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(Sizes.size12),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: isDarkMode(context)
                          ? Colors.grey.shade800
                          : Colors.grey.shade200,
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: Sizes.size12,
                        horizontal: Sizes.size16,
                      ),
                    ),
                    onSaved: (newValue) {
                      if (newValue != null) {
                        formData['bio'] = newValue;
                      }
                    },
                  ),
                ),
                Gaps.v20,
                const Text(
                  'Link',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: Sizes.size16,
                  ),
                ),
                Gaps.v10,
                SizedBox(
                  height: Sizes.size80,
                  child: TextFormField(
                    onTap: _onStartWriting,
                    initialValue: formData['link'],
                    expands: true,
                    minLines: null,
                    maxLines: null,
                    textAlignVertical: TextAlignVertical.top,
                    decoration: InputDecoration(
                      hintText: 'bio',
                      hintStyle: TextStyle(
                        fontSize: Sizes.size14,
                        color: isDarkMode(context)
                            ? Colors.white
                            : Colors.grey.shade600,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(Sizes.size12),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: isDarkMode(context)
                          ? Colors.grey.shade800
                          : Colors.grey.shade200,
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: Sizes.size12,
                        horizontal: Sizes.size16,
                      ),
                    ),
                    validator: (value) {
                      final regExp = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                      if (value != null && !regExp.hasMatch(value)) {
                        return 'Insert a valid link';
                      }
                      return null;
                    },
                    onSaved: (newValue) {
                      if (newValue != null) {
                        formData['link'] = newValue;
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
