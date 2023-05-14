import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:flutter_svg/flutter_svg.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:quickpass/utils/mytheme.dart';

import 'package:quickpass/utils/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen>{
  // String city = cities[0];


  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: MyTheme.statusBar));
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70),
          child: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
               child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: Constants.dummyAvatar,
                    height: 60,
                    width: 60,
                  ),
                )
            ),
          
          ),
        ),
      ),
      );
    

  }

}