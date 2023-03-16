import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tictok_clone_flutter/constants/sizes.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  final GlobalKey<AnimatedListState> _key = GlobalKey<AnimatedListState>();

  final List<int> _items = [];

  void _addItem() {
    if (_key.currentState != null) {
      _key.currentState!.insertItem(_items.length);
      _items.add(_items.length);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: _addItem, icon: const FaIcon(FontAwesomeIcons.plus))
          ],
          elevation: 1,
          title: const Text('Direct messages'),
        ),
        body: AnimatedList(
          key: _key,
          padding: const EdgeInsets.symmetric(vertical: Sizes.size10),
          itemBuilder: (context, index, animation) {
            return FadeTransition(
              key: UniqueKey(),
              opacity: animation,
              child: SizeTransition(
                sizeFactor: animation,
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
                      Text(
                        '$index',
                        style: const TextStyle(fontWeight: FontWeight.w600),
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
              ),
            );
          },
        ));
  }
}