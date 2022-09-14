import 'dart:convert';

import 'package:app_1/DetailPage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'PremierLeagueModel.dart';

class gridView extends StatefulWidget {
  const gridView({Key? key}) : super(key: key);

  @override
  State<gridView> createState() => _gridViewState();
}

class _gridViewState extends State<gridView> {
  PremierLeagueModel? premierLeagueModel;
  bool isloaded = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllListPL();
  }

  void getAllListPL() async {
    setState(() {
      isloaded = false;
    });

    final res = await http.get(Uri.parse(
        "https://www.thesportsdb.com/api/v1/json/2/search_all_teams.php?l=English%20Premier%20League"));
    print("status code " + res.statusCode.toString());
    premierLeagueModel =
        PremierLeagueModel.fromJson(json.decode(res.body.toString()));
    print("team 0 : " + premierLeagueModel!.teams![0].strTeam.toString());

    setState(() {
      isloaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 33, 33, 33),
      body: Center(
        child: Container(
          child: isloaded
              ? Padding(
                  padding:
                      const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                      itemCount: premierLeagueModel!.teams!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailPage(
                                      teams:
                                          premierLeagueModel!.teams![index])),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              child: Container(
                                margin: EdgeInsets.all(15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                        width: 80,
                                        height: 80,
                                        child: FadeInImage.assetNetwork(
                                            placeholder: 'assets/loading1.gif',
                                            image:
                                                '${premierLeagueModel!.teams![index].strTeamBadge.toString()}')),
                                    Column(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 5.0),
                                          child: Text(
                                            premierLeagueModel!
                                                .teams![index].strTeam
                                                .toString(),
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                )
              : CircularProgressIndicator(),
        ),
      ),
    );
  }
}
