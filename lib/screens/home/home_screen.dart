import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../widgets/mobile/home_screen_mobile.dart';
import '../../widgets/tablet/home_screen_tablet.dart';

class HomeScreen extends HookWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
      ),
      body: ResponsiveBuilder(
        builder: (_, sizingInformation) {
          if (sizingInformation.isTablet) {
            return HomeScreenTablet();
          } else {
            return HomeScreenMobile();
          }
        },
      ),
    );
  }
}
