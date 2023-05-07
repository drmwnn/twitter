import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter/models/user_model.dart';
import 'package:twitter/theme/pallete.dart';

class UserProfile extends ConsumerWidget {
  final UserModel user;
  const UserProfile({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [
          SliverAppBar(
            expandedHeight: 150,
            floating: true,
            snap: true,
            flexibleSpace: Stack(
              children: [
                Positioned.fill(
                  child: user.bannerPic.isEmpty
                      ? Container(
                          color: Pallete.blueColor,
                        )
                      : Image.network(user.bannerPic),
                ),
              ],
            ),
          ),
        ];
      },
      body: Container(),
    );
  }
}
