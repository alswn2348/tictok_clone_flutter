import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tictok_clone_flutter/constants/gaps.dart';
import 'package:tictok_clone_flutter/constants/sizes.dart';

class ChatDetailScreen extends StatefulWidget {
  const ChatDetailScreen({super.key});

  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          contentPadding: EdgeInsets.zero,
          horizontalTitleGap: Sizes.size8,
          leading: Stack(
            children: [
              const CircleAvatar(
                radius: Sizes.size24,
                foregroundImage: NetworkImage(
                  "https://cdn-icons-png.flaticon.com/512/4775/4775486.png",
                ),
                child: Text('민추'),
              ),
              Positioned(
                bottom: -3,
                right: -3,
                height: 20,
                width: 20,
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                        width: Sizes.size4,
                      ),
                      borderRadius: BorderRadius.circular(Sizes.size10),
                      color: Colors.green),
                  child: null,
                ),
              ),
            ],
          ),
          title: const Text(
            '민추',
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          subtitle: const Text('Active now'),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              FaIcon(
                FontAwesomeIcons.flag,
                color: Colors.black,
                size: Sizes.size20,
              ),
              Gaps.h32,
              FaIcon(
                FontAwesomeIcons.ellipsis,
                color: Colors.black,
                size: Sizes.size20,
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          ListView.separated(
            padding: const EdgeInsets.symmetric(
              vertical: Sizes.size20,
              horizontal: Sizes.size14,
            ),
            itemBuilder: (context, index) {
              final isMine = index % 2 == 0;
              return Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment:
                    isMine ? MainAxisAlignment.end : MainAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(Sizes.size14),
                    decoration: BoxDecoration(
                      color:
                          isMine ? Colors.blue : Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(
                          Sizes.size20,
                        ),
                        topRight: const Radius.circular(
                          Sizes.size20,
                        ),
                        bottomLeft: Radius.circular(
                          isMine ? Sizes.size20 : Sizes.size5,
                        ),
                        bottomRight: Radius.circular(
                          !isMine ? Sizes.size20 : Sizes.size5,
                        ),
                      ),
                    ),
                    child: const Text(
                      "this is a message!",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: Sizes.size16,
                      ),
                    ),
                  ),
                ],
              );
            },
            separatorBuilder: (context, index) => Gaps.v10,
            itemCount: 6,
          ),
          Positioned(
            bottom: 0,
            width: MediaQuery.of(context).size.width,
            child: BottomAppBar(
              color: Colors.grey.shade100,
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(Sizes.size10),
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: 'Send a message...',
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(Sizes.size16),
                                borderSide: BorderSide.none),
                            suffixIcon: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  FaIcon(FontAwesomeIcons.faceSmile)
                                ])),
                      ),
                    ),
                  ),
                  Gaps.h5,
                  Container(
                    alignment: Alignment.center,
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Sizes.size20),
                        color: Colors.grey.shade300),
                    child: const FaIcon(
                      FontAwesomeIcons.solidPaperPlane,
                      color: Colors.white,
                      size: Sizes.size18,
                    ),
                  ),
                  Gaps.h10,
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
