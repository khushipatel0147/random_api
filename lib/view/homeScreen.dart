import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:random_api/provider/randomProvider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<RandomProvider>(context, listen: false).getRandom();
  }

  RandomProvider? providerF;
  RandomProvider? providerT;

  @override
  Widget build(BuildContext context) {
    providerF = Provider.of<RandomProvider>(context, listen: false);
    providerT = Provider.of<RandomProvider>(context, listen: true);

    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.black,
              leading: BackButton(
                color: Colors.white,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              title: Text("Random Data",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                      fontSize: 20)),
              actions: [
                InkWell(
                  onTap: () {
                    providerF!.getRandom();
                  },
                  child: Icon(
                    Icons.refresh,
                    color: Colors.white,
                    size: 25,
                  ),
                ),
                SizedBox(width: 15),
              ],
            ),
            body: providerT!.randomData == null
                ? Center(
                    child: CircularProgressIndicator(
                    color: Colors.black,
                  ))
                : Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 30),
                        Center(
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomLeft: Radius.circular(20)),
                            child: Container(
                              height: 120,
                              width: 120,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black, width: 1)),
                              child: CachedNetworkImage(
                                imageUrl:
                                    "${providerT!.randomData!.results![0].picture!.large}",
                                placeholder: (context, url) => Center(
                                    child: CircularProgressIndicator(
                                  color: Colors.black,
                                )),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        Divider(
                          color: Colors.black,
                          endIndent: 10,
                        ),
                        SizedBox(height: 15),
                        Text(
                            "Name :- ${providerT!.randomData?.results![0].name!.title}  ${providerT!.randomData?.results![0].name!.first}  ${providerT!.randomData?.results![0].name!.last}",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                                fontSize: 18)),
                        SizedBox(height: 15),
                        Text(
                            "Dob Age:- ${providerT!.randomData?.results![0].dob!.age}",
                            style: TextStyle(
                                color: Colors.black,
                                letterSpacing: 1,
                                fontSize: 15)),
                        SizedBox(height: 15),
                        Text(
                            "Gender :- ${providerT!.randomData?.results![0].gender} ",
                            style: TextStyle(
                                color: Colors.black,
                                letterSpacing: 1,
                                fontSize: 15)),
                        SizedBox(height: 15),
                        Text(
                            "Phone :- ${providerT!.randomData?.results![0].phone} ",
                            style: TextStyle(
                                color: Colors.black,
                                letterSpacing: 1,
                                fontSize: 15)),
                        SizedBox(height: 15),
                        Text(
                            "Id :- ${providerT!.randomData?.results![0].id!.name} ${providerT!.randomData?.results![0].id!.value}",
                            style: TextStyle(
                                color: Colors.black,
                                letterSpacing: 1,
                                fontSize: 15)),
                        SizedBox(height: 15),
                        Text(
                            "Cell :- ${providerT!.randomData?.results![0].cell}",
                            style: TextStyle(
                                color: Colors.black,
                                letterSpacing: 1,
                                fontSize: 15)),
                        SizedBox(height: 15),
                        Text(
                            "Email :- ${providerT!.randomData?.results![0].email} ",
                            style: TextStyle(
                                color: Colors.black,
                                letterSpacing: 1,
                                fontSize: 15)),
                        SizedBox(height: 15),
                        Text(
                            "Location :- ${providerT!.randomData?.results![0].location!.country} ",
                            style: TextStyle(
                                color: Colors.black,
                                letterSpacing: 1,
                                fontSize: 15)),
                        SizedBox(height: 15),
                        Text(
                            "State :- ${providerT!.randomData?.results![0].location!.state} ",
                            style: TextStyle(
                                color: Colors.black,
                                letterSpacing: 1,
                                fontSize: 15)),
                        SizedBox(height: 15),
                        Text(
                            "City :- ${providerT!.randomData?.results![0].location!.city} ",
                            style: TextStyle(
                                color: Colors.black,
                                letterSpacing: 1,
                                fontSize: 15)),


                        SizedBox(height: 15),
                        Text(
                            "Login :- ${providerT!.randomData?.results![0].login!.username} -> ${providerT!.randomData?.results![0].login!.password}",
                            style: TextStyle(
                                color: Colors.black,
                                letterSpacing: 1,
                                fontSize: 15)),
                        SizedBox(height: 15),
                        Text(
                            "Nat :- ${providerT!.randomData?.results![0].nat} ",
                            style: TextStyle(
                                color: Colors.black,
                                letterSpacing: 1,
                                fontSize: 15)),
                        SizedBox(height: 15),
                        Text(
                            "Registered Age :- ${providerT!.randomData?.results![0].registered!.age} ",
                            style: TextStyle(
                                color: Colors.black,
                                letterSpacing: 1,
                                fontSize: 15)),
                        SizedBox(height: 15),
                        Text(
                            "Registered :- ${providerT!.randomData?.results![0].registered!.date} ",
                            style: TextStyle(
                                color: Colors.black,
                                letterSpacing: 1,
                                fontSize: 15)),


                      ],
                    ),
                  )));
  }
}
