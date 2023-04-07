import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:tictok_clone_flutter/features/authentication/repository/authhentication_repo.dart';
import 'package:tictok_clone_flutter/features/videos/view_models/palyback_config_vm.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          SwitchListTile.adaptive(
            value: ref.watch(playbackConfigProvider).muted,
            onChanged: (value) =>
                ref.read(playbackConfigProvider.notifier).setMuted(value),
            title: const Text("Mute video"),
            subtitle: const Text("Video will be muted by default."),
          ),
          SwitchListTile.adaptive(
            value: ref.watch(playbackConfigProvider).autoplay,
            onChanged: (value) =>
                ref.read(playbackConfigProvider.notifier).setAutoplay(value),
            title: const Text("Autoplay"),
            subtitle: const Text("Video will start playing automatically."),
          ),
          SwitchListTile.adaptive(
            title: const Text("This is switch"),
            onChanged: (value) => {},
            value: false,
          ),
          CheckboxListTile(
            onChanged: (value) => {},
            value: false,
            title: const Text("Enable notifications"),
          ),
          ListTile(
            onTap: () async {
              await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime(2030),
              );
            },
            title: const Text('What is your birthday'),
          ),
          ListTile(
            onTap: () => showAboutDialog(context: context),
            title: const Text(
              "About",
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
            subtitle: const Text('About this app...'),
          ),
          ListTile(
            title: const Text("Log out (ios)"),
            textColor: Colors.red,
            onTap: () {
              showCupertinoDialog(
                context: context,
                builder: (context) => CupertinoAlertDialog(
                  title: const Text('Are you sure?'),
                  content: const Text('log out'),
                  actions: [
                    CupertinoDialogAction(
                      child: const Text("No"),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    CupertinoDialogAction(
                      isDestructiveAction: true,
                      child: const Text("Yes"),
                      onPressed: () {
                        ref.read(authRepo).signOut();
                        context.go("/");
                      },
                    ),
                  ],
                ),
              );
            },
          ),
          ListTile(
            title: const Text("Log out (android)"),
            textColor: Colors.red,
            onTap: () {
              showCupertinoDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Are you sure?'),
                  content: const Text('log out'),
                  actions: [
                    IconButton(
                      icon: const FaIcon(FontAwesomeIcons.check),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    TextButton(
                      child: const Text('Yes'),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ],
                ),
              );
            },
          ),
          ListTile(
            title: const Text("Log out (iOS / Bottom)"),
            textColor: Colors.red,
            onTap: () {
              showCupertinoModalPopup(
                context: context,
                builder: (context) => CupertinoActionSheet(
                  title: const Text("Are you sure?"),
                  message: const Text("Please don't go"),
                  actions: [
                    CupertinoActionSheetAction(
                      isDefaultAction: true,
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text("No"),
                    ),
                    CupertinoActionSheetAction(
                      isDestructiveAction: true,
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text("Yes."),
                    )
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
