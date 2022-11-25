import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

import '../helpers/helper.dart';
import '../modeles/Model.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Datapage(),
  ));
}

class Datapage extends StatefulWidget {
  const Datapage({Key? key}) : super(key: key);

  @override
  State<Datapage> createState() => _DatapageState();
}

class _DatapageState extends State<Datapage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: UserAPIHelper.userAPIHelper.fetchingUserData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("Error :- ${snapshot.error}"),
            );
          } else if (snapshot.hasData) {
            UserData? data = snapshot.data as UserData?;

            return Stack(
              children: [
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                        Colors.black,
                        Colors.white,
                      ])),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      right: 20, left: 20, top: 50, bottom: 30),
                  child: GlassmorphicContainer(
                      width: 900,
                      height: 1500,
                      borderRadius: 20,
                      blur: 15,
                      border: 1,
                      linearGradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            const Color(0xFFffffff).withOpacity(0.3),
                            const Color(0xFFFFFFFF).withOpacity(0.1),
                          ],
                          stops: const [
                            0.1,
                            1,
                          ]),
                      borderGradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          const Color(0xFFffffff).withOpacity(0.5),
                          const Color((0xFFFFFFFF)).withOpacity(0.5),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.network(data!.photo),
                            ),
                            Text(
                              data.name,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: [
                                const Text(
                                  "Email : ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                const Spacer(),
                                Text(
                                  data.mail,
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Text(
                                  "Phone : ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                const Spacer(),
                                Text(
                                  data.phoneNumber.toString(),
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Text(
                                  "BOD : ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                const Spacer(),
                                Text(
                                  data.bod.toString().split("T")[0],
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Text(
                                  "Age : ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                const Spacer(),
                                Text(
                                  data.age.toString(),
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Text(
                                  "Gender : ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                const Spacer(),
                                Text(
                                  data.gender,
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Text(
                                  "Location : ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                const Spacer(),
                                Text(
                                  data.location,
                                  style: const TextStyle(color: Colors.white),
                                  textAlign: TextAlign.end,
                                ),
                              ],
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {});
                              },
                              child: GlassmorphicContainer(
                                width: 250,
                                height: 50,
                                borderRadius: 20,
                                blur: 20,
                                alignment: Alignment.bottomCenter,
                                border: 2,
                                linearGradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      const Color(0xFFffffff).withOpacity(0.1),
                                      const Color(0xFFFFFFFF).withOpacity(0.05),
                                    ],
                                    stops: const [
                                      0.1,
                                      1,
                                    ]),
                                borderGradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    const Color(0xFFffffff).withOpacity(0.5),
                                    const Color((0xFFFFFFFF)).withOpacity(0.5),
                                  ],
                                ),
                                child: const Center(
                                    child: Text(
                                  "Change",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                )),
                              ),
                            ),
                          ],
                        ),
                      )),
                ),
              ],
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
