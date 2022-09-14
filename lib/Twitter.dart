import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'TweetHelper.dart';
import 'TweetItemModel.dart';

class Twitter extends StatefulWidget {
  const Twitter({Key? key}) : super(key: key);
  
  @override
  State<Twitter> createState() => _TwitterState();
}

class _TwitterState extends State<Twitter> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 78, 78, 78),
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, position) {
          TweetItemModel tweet = TweetHelper.getTweet(position);
          var teams;
          return Column(children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.account_circle, size: 50.0, color: Colors.grey,),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Padding(padding: const EdgeInsets.only(top: 4.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                child: Container(child: RichText(text: TextSpan( 
                                  children: [
                                    TextSpan(text: tweet.username, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0, color: Color.fromARGB(255, 255, 255, 255),)),
                                    TextSpan(text: "" + tweet.twitterHandle, style: TextStyle(fontSize: 16.0, color: Colors.grey,)),
                                    TextSpan(text: "${tweet.time}" , style: TextStyle(fontSize: 16.0, color: Colors.grey,))
                                  ],
                                ),
                                overflow: TextOverflow.ellipsis,
                                ),),
                                flex: 5,
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 4.0),
                                  child: Icon(Icons.expand_more, color: Colors.grey,),
                                  ),
                                  flex: 1,
                                )
                            ],
                          ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            child: Text(tweet.tweet, style: TextStyle(fontSize: 18.0, color: Colors.white),),
                            ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Icon(FontAwesomeIcons.comment, color: Colors.grey,),
                                Icon(FontAwesomeIcons.retweet, color: Colors.grey,),
                                Icon(FontAwesomeIcons.heart, color: Colors.grey,),
                                Icon(FontAwesomeIcons.shareAlt, color: Colors.grey,),
                              ],
                            ),
                          )
                        ],
                      ),
                      )
                ],
              ),
              ),
              Divider()
          ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        
      },
      child: Icon(FontAwesomeIcons.featherAlt,
      
      ),
      ),
      )
    );
  }
}