import 'dart:convert';

class Memo {
  String title;
  String body;
  Map<String, bool> tag;

  Memo.add() {
    this.title = "";
    this.body = "";
    this.tag = {};
    List<String> _locationList = ["コンビニ", "駅", "学校", "スーパーマーケット", "郵便局"];
    _locationList.forEach((location) => this.tag[location] = false);
  }

  Memo({
    this.title,
    this.body,
    this.tag,
  });


  // void _init(String title, String body, Map tag) {
  //   this.title = title;
  //   this.body = body;
  //   this.tag = tag;
  // }

  /// Map型に変換
  // Map toJson() => {
  //       'title': title,
  //       'body': body,
  //       'tag': tag,
  //     };

  // /// JSONオブジェクトを代入
  // Memo.fromJson(Map json)
  //     : title = json['title'],
  //       body = json['body'],
  //       tag = json['tag'];

  factory Memo.fromJson(Map<String, dynamic> jsonData) {
    return Memo(
      title: jsonData['title'],
      body: jsonData['body'],
      tag: jsonData['tag'],
    );
  }

  static Map<String, dynamic> toMap(Memo memo) => {
        'title': memo.title,
        'body': memo.body,
        'tag': memo.tag,

      };

  static String encode(List<Memo> memos) => json.encode(
        memos
            .map<Map<String, dynamic>>((memo) => Memo.toMap(memo))
            .toList(),
      );

  static List<Memo> decode(String memos) =>
      (json.decode(memos) as List<dynamic>)
          .map<Memo>((item) => Memo.fromJson(item))
          .toList();

  void switchTag(String key) {
    this.tag[key] = !this.tag[key];
  }
}
