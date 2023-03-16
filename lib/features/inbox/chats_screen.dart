import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tictok_clone_flutter/constants/sizes.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {}, icon: const FaIcon(FontAwesomeIcons.plus))
        ],
        elevation: 1,
        title: const Text('Direct messages'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: Sizes.size10),
            child: ListTile(
              leading: const CircleAvatar(
                radius: 30,
                foregroundImage: NetworkImage(
                    "https://avatars.githubusercontent.com/u/62362753?v=4"),
                child: Text('민추'),
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    'Lytt',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "3:42PM",
                    style: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: Sizes.size14,
                    ),
                  ),
                ],
              ),
              subtitle: const Text('Don\' forger to make video'),
            ),
          )
        ],
      ),
    );
  }
}
