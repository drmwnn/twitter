import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:twitter/constants/assets_constant.dart';
import 'package:twitter/features/explore/view/explore_view.dart';
import 'package:twitter/features/tweet/widgets/tweet_list.dart';
import 'package:twitter/theme/pallete.dart';

class UIConstants {
  static AppBar appBar() {
    return AppBar(
      title: SvgPicture.asset(
        AssetsConstants.twitterLogo,
        color: Pallete.blueColor,
        height: 30,
      ),
      centerTitle: true,
    );
  }

  static const List<Widget> bottonTabBarPages = [
    TweetList(),
    ExploreView(),
    Text('Notification Screen'),
  ];
}
