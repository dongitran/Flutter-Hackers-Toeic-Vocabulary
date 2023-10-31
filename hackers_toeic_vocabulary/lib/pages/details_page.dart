import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:hackers_toeic_vocabulary/pages/lesson_page.dart';

import '../models/list_of_lessons.dart';
import '../models/tab_bar_model.dart';
import '../widget/reuseable_text.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({
    super.key,
    required this.tabData,
    required this.personData,
    required this.isCameFromPersonSection,
    required this.index,
  });

  final TabBarModel? tabData;
  final LessionModel? personData;
  final bool isCameFromPersonSection;
  final int index;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  int selected = 0;
  final EdgeInsetsGeometry padding =
      const EdgeInsets.symmetric(horizontal: 20.0);
  dynamic current;

  onFirstLoaded() {
    if (widget.tabData == null) {
      return current = widget.personData;
    } else {
      return current = widget.tabData;
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    onFirstLoaded();
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: _buildAppBar(),
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 0,
                right: 0,
                child: Hero(
                  tag: current.tag,
                  child: Container(
                    width: size.width,
                    height: size.height * 0.45,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage(current?.image),
                      fit: BoxFit.cover,
                    )),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                bottom: 0,
                right: 0,
                child: Container(
                  padding: padding,
                  width: size.width,
                  height: size.height * 0.65,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      )),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FadeInUp(
                        delay: const Duration(milliseconds: 80),
                        child: Padding(
                          padding: EdgeInsets.only(top: size.height * 0.02),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppText(
                                    text: current.title,
                                    size: 22,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.location_on,
                                        color: Colors.black54,
                                        size: 15,
                                      ),
                                      SizedBox(
                                        width: size.width * 0.01,
                                      ),
                                      AppText(
                                        text: current.location,
                                        size: 12,
                                        color: const Color.fromARGB(
                                            137, 198, 137, 137),
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * 0.03),
                      FadeInUp(
                        delay: const Duration(milliseconds: 120),
                        child: const AppText(
                          text: "Speed",
                          size: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                      SizedBox(height: size.height * 0.001),
                      FadeInUp(
                        delay: const Duration(milliseconds: 200),
                        child: Container(
                          margin: EdgeInsets.only(top: size.height * 0.01),
                          width: size.width * 0.9,
                          height: size.height * 0.08,
                          child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: 5,
                              itemBuilder: (ctx, index) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selected = index;
                                    });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: AnimatedContainer(
                                      width: size.width * 0.12,
                                      decoration: BoxDecoration(
                                        color: selected == index
                                            ? Colors.black
                                            : const Color.fromARGB(
                                                255, 245, 245, 245),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      duration:
                                          const Duration(milliseconds: 200),
                                      child: Center(
                                        child: Text(
                                          "${1 + index}",
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w500,
                                              color: selected == index
                                                  ? Colors.white
                                                  : Colors.black),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ),
                      SizedBox(height: size.height * 0.02),
                      FadeInUp(
                        delay: const Duration(milliseconds: 300),
                        child: Padding(
                          padding: EdgeInsets.only(top: size.height * 0.05),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              MaterialButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                minWidth: size.width * 0.6,
                                height: size.height * 0.06,
                                color: Colors.deepPurpleAccent,
                                onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LessonPage(
                                      index: widget.index,
                                      speed: (selected + 1),
                                    ),
                                  ),
                                ),
                                child: const AppText(
                                  text: "Start",
                                  size: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
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
            ],
          ),
        ));
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back_ios),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.more_vert_outlined),
        ),
      ],
    );
  }
}
