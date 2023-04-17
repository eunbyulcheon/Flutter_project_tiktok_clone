import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:tiktok_clone/common/configs/dark_mode_config.dart';
import 'package:tiktok_clone/common/configs/video_config.dart';
import 'package:tiktok_clone/constants/breakpoints.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notifications = false;

  void _onNotificationsChanged(bool? newValue) {
    if (newValue == null) return;
    setState(() {
      _notifications = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: Breakpoints.sm,
          ),
          child: ListView(
            children: [
              AnimatedBuilder(
                animation: darkModeConfig,
                builder: (context, child) => SwitchListTile.adaptive(
                  value: darkModeConfig.value,
                  onChanged: (value) {
                    darkModeConfig.value = !darkModeConfig.value;
                  },
                  title: const Text(
                    'Dark Mode',
                  ),
                  subtitle: const Text('Set the default brightness mode.'),
                ),
              ),
              SwitchListTile.adaptive(
                value: context.watch<VideoConfig>().isMuted,
                onChanged: (value) =>
                    context.read<VideoConfig>().toggleIsMuted(),
                title: const Text(
                  'Video Mute',
                ),
                subtitle: const Text('Videos muted by default.'),
              ),
              SwitchListTile.adaptive(
                value: _notifications,
                onChanged: _onNotificationsChanged,
                title: const Text(
                  'Enable notifications',
                ),
                subtitle: const Text('We won\'t spam you.'),
              ),
              CheckboxListTile(
                activeColor: Colors.black,
                value: _notifications,
                onChanged: _onNotificationsChanged,
                title: const Text(
                  'Enable notifications',
                ),
              ),
              ListTile(
                title: const Text('Log out (iOS)'),
                textColor: Colors.red,
                onTap: () {
                  showCupertinoDialog(
                    context: context,
                    builder: (context) => CupertinoAlertDialog(
                      title: const Text('Are you sure?'),
                      content: const Text('Please don\'t go'),
                      actions: [
                        CupertinoDialogAction(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text('No'),
                        ),
                        CupertinoDialogAction(
                          onPressed: () => Navigator.of(context).pop(),
                          isDestructiveAction: true,
                          child: const Text('Yes'),
                        ),
                      ],
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Log out (Android)'),
                textColor: Colors.red,
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      icon: const FaIcon(FontAwesomeIcons.skull),
                      title: const Text('Are you sure?'),
                      content: const Text('Please don\'t go'),
                      actions: [
                        IconButton(
                          onPressed: () => Navigator.of(context).pop(),
                          icon: const FaIcon(FontAwesomeIcons.car),
                        ),
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text('Yes'),
                        ),
                      ],
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Log out (iOS / Bottom)'),
                textColor: Colors.red,
                onTap: () {
                  showCupertinoModalPopup(
                    context: context,
                    builder: (context) => CupertinoActionSheet(
                      title: const Text('Are you sure?'),
                      message: const Text('Please do not go'),
                      actions: [
                        CupertinoActionSheetAction(
                          isDefaultAction: true,
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text('Not Log out'),
                        ),
                        CupertinoActionSheetAction(
                          onPressed: () => Navigator.of(context).pop(),
                          isDestructiveAction: true,
                          child: const Text('Yes, please'),
                        ),
                      ],
                    ),
                  );
                },
              ),
              const AboutListTile(),
            ],
          ),
        ),
      ),
    );
  }
}
