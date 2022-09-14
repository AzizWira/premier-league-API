import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:app_1/PremierLeagueModel.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DetailPage extends StatefulWidget {
  DetailPage({Key? key, required this.teams}) : super(key: key);
  Teams teams;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  Future<void> _launchInBrowser(String url) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {}
  }

  var linktext = const TextStyle(color: Colors.blue);

  bool isEnglish = true;
  bool isRusia = true;
  bool isFrancis = true;

  bool isEnglishdesc = true;
  bool isRusiadesc = true;
  bool isFrancisdesc = true;

  // Initial Selected Value
  String dropdownvalue = 'English';

  // List of items in our dropdown menu
  var items = [
    'English',
    'Rusia',
    'Francis',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 78, 78, 78),
      ),
      backgroundColor: Color.fromARGB(255, 78, 78, 78),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  child: Image.network(
                    widget.teams.strTeamFanart1.toString(),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                    height: 95,
                    width: 95,
                    child: Image.network(widget.teams.strTeamBadge.toString())),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  widget.teams.strTeam.toString(),
                  style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(widget.teams.strStadium.toString(),
                    style: const TextStyle(color: Colors.white)),
                Text(
                  'Since ' + widget.teams.intFormedYear.toString(),
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(
                  height: 25,
                ),
                InkWell(
                  onTap: () async {
                    await launchUrl(Uri.parse(
                        "https://" + widget.teams.strWebsite.toString()));
                  },
                  child: Text(
                    widget.teams.strWebsite.toString(),
                    style: linktext,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                        onTap: () async {
                          await launchUrl(Uri.parse(
                              "https://" + widget.teams.strYoutube.toString()));
                        },
                        child: const Icon(
                          FontAwesomeIcons.youtube,
                          color: Colors.red,
                        )),
                    InkWell(
                        onTap: () async {
                          await launchUrl(Uri.parse("https://" +
                              widget.teams.strInstagram.toString()));
                        },
                        child: Image.asset(
                          "assets/ig.png",
                          width: 28,
                          height: 28,
                        )),
                    InkWell(
                        onTap: () async {
                          await launchUrl(Uri.parse(
                              "https://" + widget.teams.strTwitter.toString()));
                        },
                        child: const Icon(
                          FontAwesomeIcons.twitter,
                          color: Colors.lightBlue,
                        )),
                    InkWell(
                        onTap: () async {
                          await launchUrl(Uri.parse("https://" +
                              widget.teams.strFacebook.toString()));
                        },
                        child: const Icon(
                          FontAwesomeIcons.facebook,
                          color: Colors.blueAccent,
                        )),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(
                            50,
                          ),
                          topRight: Radius.circular(50)),
                    ),
                    child: Container(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "Description",
                                style: TextStyle(fontSize: 20),
                              ),
                              DropdownButton(
                                // Initial Value
                                value: dropdownvalue,

                                // Down Arrow Icon
                                icon: const Icon(Icons.keyboard_arrow_down),

                                // Array list of items
                                items: items.map((String items) {
                                  return DropdownMenuItem(
                                    value: items,
                                    child: Text(
                                      items,
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  );
                                }).toList(),
                                // After selecting the desired option,it will
                                // change button value to selected value
                                onChanged: (String? newValue) {
                                  setState(() {
                                    // Changing the value of dropdown
                                    dropdownvalue = newValue!;
                                    if (dropdownvalue == "English") {
                                      isEnglishdesc = true;
                                      isRusiadesc = false;
                                      isFrancisdesc = false;
                                    } else if (dropdownvalue == "Rusia") {
                                      isEnglishdesc = false;
                                      isRusiadesc = true;
                                      isFrancisdesc = false;
                                    } else if (dropdownvalue == "Francis") {
                                      isFrancisdesc = true;
                                      isEnglishdesc = false;
                                      isRusiadesc = false;
                                    }
                                  });
                                },
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: isEnglish
                                    ? Container(
                                        width: 300,
                                        child: Text(
                                          isEnglishdesc
                                              ? widget.teams.strDescriptionEN
                                                  .toString()
                                              : isRusiadesc
                                                  ? widget
                                                      .teams.strDescriptionRU
                                                      .toString()
                                                  : isFrancis
                                                      ? widget.teams
                                                          .strDescriptionFR
                                                          .toString()
                                                      : "",
                                        ))
                                    : Container()),
                          ),
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
