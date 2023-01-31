import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:random_user_data/helpers/helper.dart';
import 'package:random_user_data/modeles/Model.dart';

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
      appBar: AppBar(
        title: const Text("Random - User"),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
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
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      right: 20, left: 20, top: 50, bottom: 30),
                  child: Container(
                      width: 900,
                      height: 1500,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.network(
                                  "https://in.images.search.yahoo.com/search/images;_ylt=AwrPpjYa3NRj33kj6nG7HAx.;_ylu=Y29sbwNzZzMEcG9zAzEEdnRpZAMEc2VjA3BpdnM-?p=person+images&fr2=piv-web&type=E210IN826G0&fr=mcafee"),
                            ),
                            Text(
                              data!.name,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: [
                                const Text(
                                  "Email : ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                const Spacer(),
                                Text(
                                  data.mail,
                                  style: const TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Text(
                                  "Phone : ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                const Spacer(),
                                Text(
                                  data.phoneNumber.toString(),
                                  style: const TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Text(
                                  "BOD : ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                const Spacer(),
                                Text(
                                  data.bod.toString().split("T")[0],
                                  style: const TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Text(
                                  "Age : ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                const Spacer(),
                                Text(
                                  data.age.toString(),
                                  style: const TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Text(
                                  "Gender : ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                const Spacer(),
                                Text(
                                  data.gender,
                                  style: const TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Text(
                                  "Location : ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                const Spacer(),
                                Text(
                                  data.location,
                                  style: const TextStyle(color: Colors.black),
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
                                      Colors.black,
                                      Colors.grey,
                                    ],
                                    stops: const [
                                      0.1,
                                      1,
                                    ]),
                                borderGradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Colors.black,
                                    Colors.grey,
                                  ],
                                ),
                                child: const Center(
                                    child: Text(
                                  "Change",
                                  style: TextStyle(
                                      color: Colors.black,
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
