import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tictok_clone_flutter/constants/gaps.dart';
import 'package:tictok_clone_flutter/constants/sizes.dart';
import 'package:tictok_clone_flutter/features/settings/settings_screen.dart';
import 'package:tictok_clone_flutter/features/user/view_models/users_view_model.dart';
import 'package:tictok_clone_flutter/features/user/widgets/avatar.dart';
import 'package:tictok_clone_flutter/features/user/widgets/persistent_tab_bar.dart';

class UserProfileScreen extends ConsumerStatefulWidget {
  final String username;
  final String tab = '';

  const UserProfileScreen({super.key, required this.username, String tab = ''});

  @override
  ConsumerState<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends ConsumerState<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return ref.watch(usersProvider).when(
          error: (error, stackTrace) => Center(
            child: Text(error.toString()),
          ),
          loading: () => const Center(
            child: CircularProgressIndicator.adaptive(),
          ),
          data: (data) => Scaffold(
            backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
            body: SafeArea(
              child: DefaultTabController(
                initialIndex: widget.tab == "likes" ? 1 : 0,
                length: 2,
                child: NestedScrollView(
                  headerSliverBuilder: (context, innerBoxIsScrolled) {
                    return [
                      SliverAppBar(
                        title: Text(data.name),
                        actions: [
                          IconButton(
                            onPressed: _onGearPressed,
                            icon: const FaIcon(
                              FontAwesomeIcons.gear,
                              size: Sizes.size20,
                            ),
                          )
                        ],
                      ),
                      SliverToBoxAdapter(
                        child: Column(
                          children: [
                            Avatar(
                              uid: data.uid,
                              hasAvatar: data.hasAvatar,
                              name: data.name,
                            ),
                            Gaps.v20,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "@${data.name}",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: Sizes.size18,
                                  ),
                                ),
                                Gaps.h5,
                                const FaIcon(
                                  FontAwesomeIcons.solidCircleCheck,
                                  size: Sizes.size16,
                                  color: Colors.blue,
                                )
                              ],
                            ),
                            Gaps.v24,
                            SizedBox(
                              height: Sizes.size48,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    children: [
                                      const Text(
                                        "124",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: Sizes.size18,
                                        ),
                                      ),
                                      Gaps.v3,
                                      Text("Following",
                                          style: TextStyle(
                                            color: Colors.grey.shade500,
                                          ))
                                    ],
                                  ),
                                  VerticalDivider(
                                    width: Sizes.size32,
                                    thickness: Sizes.size1,
                                    color: Colors.grey.shade400,
                                    indent: Sizes.size14,
                                    endIndent: Sizes.size14,
                                  ),
                                  Column(
                                    children: [
                                      const Text(
                                        "20K",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: Sizes.size18,
                                        ),
                                      ),
                                      Gaps.v3,
                                      Text(
                                        "Followers",
                                        style: TextStyle(
                                          color: Colors.grey.shade500,
                                        ),
                                      )
                                    ],
                                  ),
                                  VerticalDivider(
                                    width: Sizes.size32,
                                    thickness: Sizes.size1,
                                    color: Colors.grey.shade400,
                                    indent: Sizes.size14,
                                    endIndent: Sizes.size14,
                                  ),
                                  Column(
                                    children: [
                                      const Text(
                                        "42.2M",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: Sizes.size18,
                                        ),
                                      ),
                                      Gaps.v3,
                                      Text(
                                        "Likes",
                                        style: TextStyle(
                                          color: Colors.grey.shade500,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Gaps.v14,
                            FractionallySizedBox(
                              widthFactor: 0.33,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: Sizes.size12,
                                ),
                                decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(Sizes.size4),
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
                            ),
                            Gaps.v14,
                            const Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: Sizes.size32,
                              ),
                              child: Text(
                                "All highlights and where to watch live matches on FIFA+ I wonder how it would loook",
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Gaps.v14,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                FaIcon(
                                  FontAwesomeIcons.link,
                                  size: Sizes.size12,
                                ),
                                Gaps.h4,
                                Text(
                                  "https://github.com/alswn2348",
                                  style: TextStyle(
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
                        itemCount: 20,
                        padding: EdgeInsets.zero,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: Sizes.size2,
                          mainAxisSpacing: Sizes.size2,
                          childAspectRatio: 9 / 14,
                        ),
                        itemBuilder: (context, index) => Column(
                          children: [
                            AspectRatio(
                              aspectRatio: 9 / 14,
                              child: FadeInImage.assetNetwork(
                                fit: BoxFit.cover,
                                placeholder: "assets/images/image2.jpg",
                                image:
                                    "https://source.unsplash.com/random/200x${355 + index}",
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Center(
                        child: Text('Page two'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
  }

  void _onGearPressed() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const SettingsScreen(),
      ),
    );
  }
}
