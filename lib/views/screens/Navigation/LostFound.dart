import 'package:flutter/material.dart';
import 'package:anim_search_bar/anim_search_bar.dart';

class LostFound extends StatefulWidget {
  const LostFound({Key? key}) : super(key: key);

  @override
  State<LostFound> createState() => _LostFoundState();
}

class _LostFoundState extends State<LostFound> {
  TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 100,
              width: 100,
              color: Colors.white,
            );
          }),
    );
  }
}
