import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/breakpoints.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/settings/settings_screen.dart';
import 'package:tiktok_clone/features/users/edit_profile_screen.dart';
import 'package:tiktok_clone/features/users/view_models/users_view_model.dart';
import 'package:tiktok_clone/features/users/widgets/avatar.dart';
import 'package:tiktok_clone/features/users/widgets/persistent_tabbar.dart';
import 'package:tiktok_clone/features/users/widgets/user_accounts.dart';

class UserProfileScreen extends ConsumerStatefulWidget {
  final String username;
  final String tab;

  const UserProfileScreen({
    super.key,
    required this.username,
    required this.tab,
  });

  @override
  ConsumerState<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends ConsumerState<UserProfileScreen> {
  void _onGearpressed() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const SettingsScreen(),
      ),
    );
  }

  void _onPenTap() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const EditProfileScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return ref.watch(usersProvider).when(
          error: (error, stackTrace) => Center(
            child: Text(
              error.toString(),
            ),
          ),
          loading: () => const Center(
            child: CircularProgressIndicator.adaptive(),
          ),
          data: (data) => Scaffold(
            backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
            body: SafeArea(
              child: DefaultTabController(
                initialIndex: widget.tab == 'likes' ? 1 : 0,
                length: 2,
                child: NestedScrollView(
                  headerSliverBuilder: (context, innerBoxIsScrolled) {
                    return [
                      SliverAppBar(
                        title: Text(data.name),
                        centerTitle: true,
                        actions: [
                          IconButton(
                            onPressed: _onPenTap,
                            icon: const FaIcon(
                              FontAwesomeIcons.pen,
                              size: Sizes.size20,
                            ),
                          ),
                          IconButton(
                            onPressed: _onGearpressed,
                            icon: const FaIcon(
                              FontAwesomeIcons.gear,
                              size: Sizes.size20,
                            ),
                          ),
                        ],
                      ),
                      SliverToBoxAdapter(
                        child: Column(
                          children: [
                            Gaps.v20,
                            Avatar(
                              name: data.name,
                              hasAvatar: data.hasAvatar,
                              uid: data.uid,
                            ),
                            Gaps.v20,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '@${data.name}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: Sizes.size18,
                                  ),
                                ),
                                Gaps.h5,
                                FaIcon(
                                  FontAwesomeIcons.solidCircleCheck,
                                  size: Sizes.size16,
                                  color: Colors.blue.shade500,
                                ),
                              ],
                            ),
                            Gaps.v24,
                            SizedBox(
                              height: Sizes.size52,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const UserAccounts(
                                      amount: '37', type: 'Following'),
                                  VerticalDivider(
                                    width: Sizes.size32,
                                    thickness: Sizes.size1,
                                    indent: Sizes.size14,
                                    endIndent: Sizes.size14,
                                    color: Colors.grey.shade300,
                                  ),
                                  const UserAccounts(
                                      amount: '10.5M', type: 'Followers'),
                                  VerticalDivider(
                                    width: Sizes.size32,
                                    thickness: Sizes.size1,
                                    indent: Sizes.size14,
                                    endIndent: Sizes.size14,
                                    color: Colors.grey.shade300,
                                  ),
                                  const UserAccounts(
                                      amount: '149.3M', type: 'Likes'),
                                ],
                              ),
                            ),
                            Gaps.v14,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: Sizes.size12,
                                    horizontal: Sizes.size52,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor,
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(
                                        Sizes.size4,
                                      ),
                                    ),
                                  ),
                                  child: const Text(
                                    'Follow',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Gaps.h5,
                                Container(
                                  padding: const EdgeInsets.all(
                                    Sizes.size10,
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey.shade300,
                                    ),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(
                                        Sizes.size4,
                                      ),
                                    ),
                                  ),
                                  child: const FaIcon(
                                    FontAwesomeIcons.youtube,
                                    size: Sizes.size20,
                                  ),
                                ),
                                Gaps.h5,
                                Container(
                                  padding: const EdgeInsets.all(
                                    Sizes.size10,
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey.shade300,
                                    ),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(
                                        Sizes.size4,
                                      ),
                                    ),
                                  ),
                                  child: const Icon(
                                    Icons.arrow_drop_down,
                                    size: Sizes.size20,
                                  ),
                                ),
                              ],
                            ),
                            Gaps.v14,
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: Sizes.size32,
                              ),
                              child: Text(
                                data.bio,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Gaps.v14,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const FaIcon(
                                  FontAwesomeIcons.link,
                                  size: Sizes.size12,
                                ),
                                Gaps.h4,
                                Text(
                                  data.link,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            Gaps.v20,
                          ],
                        ),
                      ),
                      SliverPersistentHeader(
                        delegate: PersistentTabBar(),
                        pinned: true,
                      ),
                    ];
                  },
                  body: TabBarView(
                    children: [
                      GridView.builder(
                        keyboardDismissBehavior:
                            ScrollViewKeyboardDismissBehavior.onDrag,
                        itemCount: 20,
                        padding: EdgeInsets.zero,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: width > Breakpoints.md ? 5 : 3,
                          crossAxisSpacing: Sizes.size2,
                          mainAxisSpacing: Sizes.size2,
                          childAspectRatio: 9 / 13,
                        ),
                        itemBuilder: (context, index) => Column(
                          children: [
                            Stack(
                              children: [
                                AspectRatio(
                                  aspectRatio: 9 / 13,
                                  child: FadeInImage.assetNetwork(
                                      fit: BoxFit.cover,
                                      placeholder:
                                          'assets/images/placeholder.png',
                                      image:
                                          'https://images.unsplash.com/photo-1516483638261-f4dbaf036963?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=686&q=80'),
                                ),
                                Positioned(
                                  bottom: 2,
                                  left: 0,
                                  child: Row(
                                    children: const [
                                      Icon(
                                        Icons.play_arrow_outlined,
                                        size: Sizes.size20,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        '4.1M',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: Sizes.size11,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const Center(
                        child: Text('Page Two'),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
  }
}
