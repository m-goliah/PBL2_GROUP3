import 'package:json_annotation/json_annotation.dart';

part 'memo.g.dart';

@JsonSerializable()
class Memo {
  String title;
  String body;
  // The key is locations and the value is whether the location was selected or not.
  Map<String, bool> tag;

  Memo.add() {
    this.title = "";
    this.body = "";
    this.tag = {};
    List<String> _locationList = ["コンビニ", "駅", "学校", "スーパーマーケット", "郵便局", "レストラン"];
    _locationList.forEach((location) => this.tag[location] = false);
  }

  Memo({
    this.title,
    this.body,
    this.tag,
  });

  factory Memo.fromJson(Map<String, dynamic> json) => _$MemoFromJson(json);
  Map<String, dynamic> toJson() => _$MemoToJson(this);

  // void switchTag(String key) {
  //   this.tag[key] = !this.tag[key];
  // }
}
