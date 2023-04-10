import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/breakpoints.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class ChatDetailScreen extends StatefulWidget {
  const ChatDetailScreen({super.key});

  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  bool _isWriting = false;

  void _onStartWriting() {
    setState(() {
      _isWriting = true;
    });
  }

  void _onStopWriting() {
    FocusScope.of(context).unfocus();
    setState(() {
      _isWriting = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
                  'https://avatars.githubusercontent.com/u/75746836?v=4',
                ),
                child: Text('Kimberly'),
              ),
              Positioned(
                right: -1,
                bottom: -1,
                child: Container(
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    border: Border.all(
                      color: Colors.white,
                      width: Sizes.size3,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ],
          ),
          title: const Text(
            'kimberly00',
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          subtitle: const Text(
            'Active now',
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              FaIcon(
                FontAwesomeIcons.flag,
                color: Colors.black,
                size: Sizes.size20,
              ),
              Gaps.h28,
              FaIcon(
                FontAwesomeIcons.ellipsis,
                color: Colors.black,
                size: Sizes.size20,
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: Breakpoints.sm,
          ),
          child: GestureDetector(
            onTap: _onStopWriting,
            child: Stack(
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
                      mainAxisAlignment: isMine
                          ? MainAxisAlignment.end
                          : MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(
                            Sizes.size14,
                          ),
                          decoration: BoxDecoration(
                            color: isMine
                                ? Colors.blue
                                : Theme.of(context).primaryColor,
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
                            'This is a message',
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
                  itemCount: 10,
                ),
                Positioned(
                  bottom: 0,
                  width:
                      size.width > Breakpoints.sm ? Breakpoints.sm : size.width,
                  child: BottomAppBar(
                    padding: const EdgeInsets.symmetric(
                      horizontal: Sizes.size16,
                      vertical: Sizes.size10,
                    ),
                    color: Colors.grey.shade100,
                    child: Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: Sizes.size44,
                            child: TextField(
                              onTap: _onStartWriting,
                              expands: true,
                              minLines: null,
                              maxLines: null,
                              decoration: const InputDecoration(
                                hintText: 'Send a message...',
                                contentPadding: EdgeInsets.only(
                                  left: Sizes.size16,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(
                                      Sizes.size20,
                                    ),
                                    topRight: Radius.circular(
                                      Sizes.size20,
                                    ),
                                    bottomLeft: Radius.circular(
                                      Sizes.size20,
                                    ),
                                    bottomRight: Radius.circular(
                                      Sizes.size1,
                                    ),
                                  ),
                                  borderSide: BorderSide.none,
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                suffixIcon: Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: Sizes.size12,
                                    horizontal: Sizes.size10,
                                  ),
                                  child: FaIcon(
                                    FontAwesomeIcons.faceSmile,
                                    color: Colors.black,
                                    size: Sizes.size20,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Gaps.h16,
                        Container(
                          padding: const EdgeInsets.all(
                            Sizes.size8,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(Sizes.size20),
                          ),
                          child: FaIcon(
                            FontAwesomeIcons.paperPlane,
                            color: _isWriting
                                ? Theme.of(context).primaryColor
                                : Colors.white,
                            size: Sizes.size20,
                          ),
                        ),
                      ],
                    ),
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
