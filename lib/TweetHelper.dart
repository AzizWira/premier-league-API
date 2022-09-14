import 'TweetItemModel.dart';

class TweetHelper{
  static var tweets=[
    TweetItemModel("Apabila mendengar peringatan segera menjauh dari daerah tersebut", "BMKG", "2m", "@BMKG"),
    TweetItemModel("Belajar Flutter Sederhana di StackOverflow dengan VSCode", "Codetr", "5m", "@Flutter"),
    TweetItemModel("Halaman sederhana page kodetr berikut https://www.youtube.com", "Windah", "10m", "@WindahB")

  ];

  static TweetItemModel getTweet(int position){
    return tweets[position];
  }

}