
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'models/main_game.dart';

void main() {
  runApp(const MyApp());
}


// int userImage = 1;
// int cpuImage = 1;
// int userScore = 0;
// int cpuScore = 0;
// int totalPlayable = 10;
// String winnerCheck = "CPU WON";
MainGame mainGame = MainGame(userImage: 1, cpuImage: 1, totalPlayable: 10);

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: AppBar(
            title: Center(
                child: Text(
              "ROCK PAPER SCISSOR",
              style: GoogleFonts.anton(fontSize: 35),
            )),
            backgroundColor: Colors.pink[700],
          ),
        ),
        //15,8
        body: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "TURNS REMAINING: ${mainGame.getTotalPlayable()}",
                style: GoogleFonts.patrickHand(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: AspectRatio(
                      aspectRatio: 1/1,
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.pink,
                                blurRadius: 8,
                                spreadRadius: 0,
                                blurStyle: BlurStyle.normal,
                                offset: Offset.fromDirection(2))
                          ],
                          borderRadius: const BorderRadius.all(
                            Radius.circular(100),
                          ),
                        ),
                        child: CircleAvatar(
                          radius: 90,
                          backgroundColor: Colors.pink[600],
                          child: Image.asset(
                            "assets/images/${mainGame.getUserImage()}.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: AspectRatio(
                      
                      aspectRatio: 1/1,
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.pink,
                                blurRadius: 8,
                                spreadRadius: 0,
                                blurStyle: BlurStyle.normal,
                                offset: Offset.fromDirection(2))
                          ],
                          borderRadius: const BorderRadius.all(
                            Radius.circular(100),
                          ),
                        ),
                        child: CircleAvatar(
                          radius: 90,
                          backgroundColor: Colors.pink[600],
                          child: Image.asset(
                            "assets/images/${mainGame.getCpuImage()}.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.pink,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                height: 100,
                width: double.maxFinite,
                child: Center(
                    child: Text(
                  "${mainGame.getWinnerCheck()} !!!",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.patrickHand(
                      color: Colors.white, fontSize: 40),
                )),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Please Choose one of the following:",
                textAlign: TextAlign.center,
                style: GoogleFonts.patrickHand(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                flex: 1,
                child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          if (mainGame.getTotalPlayable() != 0) {
                            setState(() {
                              mainGame.rockSet();
                              mainGame.check();
                            });
                          } else {
                            setState(() {
                              mainGame.declareWinner();
                              mainGame.reset();
                            });
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                          margin: EdgeInsets.all(5),
                          decoration: const BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.pinkAccent,
                                  blurRadius: 8,
                                  spreadRadius: 2,
                                  offset: Offset(1, 1))
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                          child: Center(
                              child: Text(
                            "ROCK",
                            style: GoogleFonts.patrickHand(
                                color: Colors.black,
                                fontSize: 30,

                                fontWeight: FontWeight.w500),
                          )),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          if (mainGame.getTotalPlayable() != 0) {
                            setState(() {
                              mainGame.paperSet();
                              mainGame.check();
                            });
                          } else {
                            setState(() {
                              mainGame.declareWinner();
                              mainGame.reset();
                            });
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                          margin: EdgeInsets.all(5),

                          decoration: const BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.pinkAccent,
                                  blurRadius: 8,
                                  spreadRadius: 2,
                                  offset: Offset(1, 1))
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                          child: Center(
                              child: Text(
                            "PAPER",
                            style: GoogleFonts.patrickHand(
                                color: Colors.black,
                                fontSize: 30,

                                fontWeight: FontWeight.w500),
                          )),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          if (mainGame.getTotalPlayable() != 0) {
                            setState(() {
                              mainGame.scissorSet();
                              mainGame.check();
                            });
                          } else {
                            setState(() {
                              mainGame.declareWinner();
                              mainGame.reset();
                            });
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                          margin: EdgeInsets.all(5),
                          // height: 80,
                          // width: 120,
                          decoration: const BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.pinkAccent,
                                  blurRadius: 8,
                                  spreadRadius: 2,
                                  offset: Offset(1, 1))
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                          child: Center(
                              child: Text(
                            "SCISSOR",
                            style: GoogleFonts.patrickHand(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.w500),
                          )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: Container(
                    decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.pinkAccent,
                            blurRadius: 8,
                            spreadRadius: 2,
                            offset: Offset(1, 1))
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    height: 200,
                    width: double.maxFinite,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "USER WON: ${mainGame.getUserScore()}",
                          style: GoogleFonts.patrickHand(
                              color: Colors.pink, fontSize: 35),
                        ),
                        Text("CPU WON: ${mainGame.getCpuScore()}",
                            style: GoogleFonts.patrickHand(
                                color: Colors.pink, fontSize: 35)),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
