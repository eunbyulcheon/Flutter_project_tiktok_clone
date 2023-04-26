import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/users/widgets/edit_text_field.dart';

class EditProfileScreen extends ConsumerStatefulWidget {
  const EditProfileScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EditProfileScreenState();
}

class _EditProfileScreenState extends ConsumerState<EditProfileScreen> {
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _linkController = TextEditingController();

  bool _isWriting = false;
  String _bio = '';
  String _link = '';

  @override
  void initState() {
    super.initState();
    _bioController.addListener(() {
      setState(
        () {
          _bio = _bioController.text;
        },
      );
    });
    _linkController.addListener(() {
      setState(
        () {
          _link = _linkController.text;
        },
      );
    });
  }

  @override
  void dispose() {
    _bioController.dispose();
    _linkController.dispose();
    super.dispose();
  }

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
                    onPressed: () {},
                    icon: const FaIcon(
                      FontAwesomeIcons.check,
                      size: Sizes.size24,
                    ),
                  ),
                ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(Sizes.size20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                ' Biography',
                style: TextStyle(
                  fontSize: Sizes.size16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Gaps.v10,
              EditTextField(
                startWriting: _onStartWriting,
                controller: _bioController,
              ),
              Gaps.v20,
              const Text(
                ' Link',
                style: TextStyle(
                  fontSize: Sizes.size16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Gaps.v10,
              EditTextField(
                startWriting: _onStartWriting,
                controller: _linkController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
