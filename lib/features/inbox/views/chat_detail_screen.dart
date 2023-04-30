import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/breakpoints.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/repos/auth_repo.dart';
import 'package:tiktok_clone/features/inbox/view_models/messages_vm.dart';

class ChatDetailScreen extends ConsumerStatefulWidget {
  static const String routeName = 'chatDetail';
  static const String routeURL = ':chatId';

  final String chatId;

  const ChatDetailScreen({
    super.key,
    required this.chatId,
  });

  @override
  ConsumerState<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends ConsumerState<ChatDetailScreen> {
  final TextEditingController _editingController = TextEditingController();
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

  void _onSendPress() {
    final text = _editingController.text;
    if (text == '') return;
    ref.read(messagesProvider.notifier).sendMessage(text);
    _editingController.text = '';
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(messagesProvider).isLoading;
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
          title: Text(
            'kimberly00 (${widget.chatId})',
            style: const TextStyle(
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
                ref.watch(chatProvider).when(
                      error: (error, stackTrace) => Center(
                        child: Text(
                          error.toString(),
                        ),
                      ),
                      loading: () => const Center(
                        child: CircularProgressIndicator.adaptive(),
                      ),
                      data: (data) {
                        return ListView.separated(
                          reverse: true,
                          padding: EdgeInsets.only(
                            top: Sizes.size20,
                            bottom: MediaQuery.of(context).padding.bottom +
                                Sizes.size96,
                            left: Sizes.size14,
                            right: Sizes.size14,
                          ),
                          itemBuilder: (context, index) {
                            final message = data[index];
                            final isMine =
                                message.userId == ref.watch(authRepo).user!.uid;
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
                                  child: Text(
                                    message.text,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: Sizes.size16,
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                          separatorBuilder: (context, index) => Gaps.v10,
                          itemCount: data.length,
                        );
                      },
                    ),
                Positioned(
                  bottom: 0,
                  width:
                      size.width > Breakpoints.sm ? Breakpoints.sm : size.width,
                  child: Container(
                    padding: const EdgeInsets.only(
                      left: Sizes.size16,
                      right: Sizes.size16,
                      top: Sizes.size10,
                      bottom: Sizes.size48,
                    ),
                    color: Colors.grey.shade100,
                    child: Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: Sizes.size44,
                            child: TextField(
                              controller: _editingController,
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
                        Gaps.h6,
                        IconButton(
                          onPressed: isLoading ? null : _onSendPress,
                          icon: FaIcon(
                            isLoading
                                ? FontAwesomeIcons.hourglass
                                : FontAwesomeIcons.paperPlane,
                            color: _isWriting
                                ? Theme.of(context).primaryColor
                                : Colors.black,
                            size: Sizes.size24,
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
