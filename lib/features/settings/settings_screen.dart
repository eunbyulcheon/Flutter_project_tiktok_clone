import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/common/configs/dark_mode_config.dart';
import 'package:tiktok_clone/constants/breakpoints.dart';
import 'package:tiktok_clone/features/videos/view_models/playback_config_vm.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                value: ref.watch(playbackConfigProvider).muted,
                onChanged: (value) {
                  ref.read(playbackConfigProvider.notifier).setMuted(value);
                },
                title: const Text(
                  'Muted Video',
                ),
                subtitle: const Text('Video will be muted by default.'),
              ),
              SwitchListTile.adaptive(
                value: ref.watch(playbackConfigProvider).autoplay,
                onChanged: (value) {
                  ref.read(playbackConfigProvider.notifier).setAutoplay(value);
                },
                title: const Text(
                  'Autoplay',
                ),
                subtitle: const Text('Video will start playing automatically.'),
              ),
              SwitchListTile.adaptive(
                value: false,
                onChanged: (value) {},
                title: const Text(
                  'Enable notifications',
                ),
                subtitle: const Text('We won\'t spam you.'),
              ),
              CheckboxListTile(
                activeColor: Colors.black,
                value: false,
                onChanged: (value) {},
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
