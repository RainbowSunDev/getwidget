import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_kit/components/avatar/gf_avatar.dart';

class GFListItem extends StatelessWidget {
  /// The card's background color.
  final Color color;

  /// [GFAvatar] used to create rounded user profile
  final GFAvatar avatar;

  /// The title to display inside the [GFListItem]. see [Text]
  final Widget title;

  /// The subTitle to display inside the [GFListItem]. see [Text]
  final Widget subTitle;

  /// The icon to display inside the [GFListItem]. see [Icon]
  final Widget icon;

  const GFListItem(
      {Key key,
      this.color,
      this.avatar,
      this.title,
      this.subTitle,
      this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: avatar,
      title: title,
      subtitle: subTitle,
      trailing: icon,
    );
  }
}