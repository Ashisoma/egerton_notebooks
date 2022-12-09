import 'package:egerton_notebooks/screens/home_page.dart';
import 'package:egerton_notebooks/widgets/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SlidePageOne extends StatelessWidget {
  const SlidePageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.background_color,
      appBar: AppBar(
        backgroundColor: MyColors.backgroud_card_color,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,
              color: MyColors.backgroud_icon_back_color),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'eger',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                    decoration: TextDecoration.underline,
                    fontSize: 20,
                  ),
                ),
                Text(
                  'NOTES',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            threeDots(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.height * 0.35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                // color: MyColors.backgroud_icon_back_color,
                border: Border.all(
                    color: MyColors.backgroud_icon_back_color, width: 2),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.search,
                    size: 30,
                    color: MyColors.backgroud_icon_back_color,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Search',
                    style: GoogleFonts.lato(
                      color: MyColors.backgroud_icon_back_color,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Text(
              'Quickly and easily\nsearch the units you want',
              textAlign: TextAlign.center,
              style:
                  GoogleFonts.lato(fontWeight: FontWeight.w400, fontSize: 18),
            ),
            GestureDetector(
              onTap: () {
                Get.to(() => const SlidePageTwo());
              },
              child: Container(
                height: MediaQuery.of(context).size.height * 0.07,
                width: MediaQuery.of(context).size.width * 0.6,
                decoration: BoxDecoration(
                    color: MyColors.btn_purpleish_color,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 40,
                    ),
                    Center(
                      child: Text(
                        'Next tip',
                        style: GoogleFonts.lato(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Icon(Icons.arrow_forward),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.to(() => const HomePage());
              },
              child: Container(
                height: MediaQuery.of(context).size.height * 0.07,
                width: MediaQuery.of(context).size.width * 0.6,
                decoration: BoxDecoration(
                    color: MyColors.btn_greenish_color,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 40,
                    ),
                    Center(
                      child: Text(
                        'Skip tips',
                        style: GoogleFonts.lato(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.height * 0.03,
                    ),
                    const Icon(Icons.arrow_forward),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
          ],
        ),
      ),
    );
  }

  Center threeDots() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 10,
            width: 10,
            decoration: BoxDecoration(
              color: MyColors.backgroud_icon_back_color,
              borderRadius: BorderRadius.circular(50),
              border: Border.all(
                  color: MyColors.backgroud_icon_back_color, width: 8),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Container(
            height: 10,
            width: 10,
            decoration: BoxDecoration(
              color: MyColors.background_color,
              borderRadius: BorderRadius.circular(50),
              border: Border.all(
                  color: MyColors.backgroud_icon_back_color, width: 8),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Container(
            height: 10,
            width: 10,
            decoration: BoxDecoration(
              color: MyColors.backgroud_card_color,
              borderRadius: BorderRadius.circular(50),
              border: Border.all(
                  color: MyColors.backgroud_icon_back_color, width: 8),
            ),
          ),
        ],
      ),
    );
  }
}

class SlidePageTwo extends StatelessWidget {
  const SlidePageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.background_color,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,
              color: MyColors.backgroud_icon_back_color),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'eger',
                  style: GoogleFonts.lato(
                      decoration: TextDecoration.underline, fontSize: 20),
                ),
                Text(
                  'NOTES',
                  style: GoogleFonts.lato(
                      fontSize: 22, fontWeight: FontWeight.w400),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            threeDots(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Text(
              'To add a unit to My\nUnits folder, click on this icon',
              textAlign: TextAlign.center,
              style:
                  GoogleFonts.lato(fontWeight: FontWeight.w400, fontSize: 18),
            ),
            const Icon(
              Icons.favorite_outline_sharp,
              color: MyColors.backgroud_icon_back_color,
              size: 150,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            GestureDetector(
              onTap: () {
                Get.to(() => const SlidePageThree());
              },
              child: Container(
                height: MediaQuery.of(context).size.height * 0.07,
                width: MediaQuery.of(context).size.width * 0.6,
                decoration: BoxDecoration(
                    color: MyColors.btn_purpleish_color,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 50,
                    ),
                    Center(
                      child: Text(
                        'Next tip',
                        style: GoogleFonts.lato(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Icon(Icons.arrow_forward),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            GestureDetector(
              onTap: () {
                Get.to(() => const HomePage());
              },
              child: Container(
                height: MediaQuery.of(context).size.height * 0.07,
                width: MediaQuery.of(context).size.width * 0.6,
                decoration: BoxDecoration(
                    color: MyColors.btn_greenish_color,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 40,
                    ),
                    Center(
                      child: Text(
                        'Skip tips',
                        style: GoogleFonts.lato(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Icon(Icons.arrow_forward),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
          ],
        ),
      ),
    );
  }

  Row threeDots() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 10,
          width: 10,
          decoration: BoxDecoration(
            color: MyColors.background_color,
            borderRadius: BorderRadius.circular(50),
            border:
                Border.all(color: MyColors.backgroud_icon_back_color, width: 8),
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        Container(
          height: 10,
          width: 10,
          decoration: BoxDecoration(
            color: MyColors.backgroud_icon_back_color,
            borderRadius: BorderRadius.circular(50),
            border:
                Border.all(color: MyColors.backgroud_icon_back_color, width: 8),
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        Container(
          height: 10,
          width: 10,
          decoration: BoxDecoration(
            color: MyColors.background_color,
            borderRadius: BorderRadius.circular(50),
            border:
                Border.all(color: MyColors.backgroud_icon_back_color, width: 8),
          ),
        ),
      ],
    );
  }
}

class SlidePageThree extends StatelessWidget {
  const SlidePageThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.background_color,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,
              color: MyColors.backgroud_icon_back_color),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'eger',
                style: GoogleFonts.lato(
                    decoration: TextDecoration.underline, fontSize: 20),
              ),
              Text(
                'NOTES',
                style: GoogleFonts.lato(
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          threeDots(),
          const Icon(
            Icons.arrow_downward,
            color: MyColors.backgroud_icon_back_color,
            size: 150,
          ),
          Center(
            child: Column(
              children: [
                Container(
                  color: MyColors.backgroud_icon_back_color,
                  height: 3,
                  width: 200,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Container(
                    color: MyColors.backgroud_icon_back_color,
                    height: 3,
                    width: 100),
              ],
            ),
          ),
          Text(
            'Download notes to\naccess them offline',
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(fontWeight: FontWeight.w400, fontSize: 20),
          ),
          GestureDetector(
            onTap: () {
              Get.to(() => const HomePage());
            },
            child: Container(
              height: MediaQuery.of(context).size.height * 0.07,
              width: MediaQuery.of(context).size.width * 0.6,
              decoration: BoxDecoration(
                  color: MyColors.btn_purpleish_color,
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  const SizedBox(
                    width: 40,
                  ),
                  Center(
                    child: Text(
                      'Start Studying',
                      style: GoogleFonts.lato(
                          fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Icon(Icons.arrow_forward),
                ],
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
        ],
      ),
    );
  }

  Row threeDots() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 10,
          width: 10,
          decoration: BoxDecoration(
            color: MyColors.background_color,
            borderRadius: BorderRadius.circular(50),
            border:
                Border.all(color: MyColors.backgroud_icon_back_color, width: 8),
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        Container(
          height: 10,
          width: 10,
          decoration: BoxDecoration(
            color: MyColors.background_color,
            borderRadius: BorderRadius.circular(50),
            border:
                Border.all(color: MyColors.backgroud_icon_back_color, width: 8),
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        Container(
          height: 10,
          width: 10,
          decoration: BoxDecoration(
            color: MyColors.backgroud_icon_back_color,
            borderRadius: BorderRadius.circular(50),
            border:
                Border.all(color: MyColors.backgroud_icon_back_color, width: 8),
          ),
        ),
      ],
    );
  }
}
