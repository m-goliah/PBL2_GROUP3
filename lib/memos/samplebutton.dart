import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// class SampleButton extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return OutlineButton(
//       child: Text('Outline Button'),
//       onPressed: () {},
//     );
//   }
// }

class SampleButton extends StatefulWidget {
  @override
  _ChangeFormState createState() => _ChangeFormState();
}

class _ChangeFormState extends State<SampleButton> {
  bool selected = false;
  List<String> tagList;
  List<bool> isSelected;

  @override
  void initState() {
    super.initState();
    tagList = ["コンビニ", "駅", "学校", "スーパーマーケット", "郵便局"];
    isSelected = List.generate(tagList.length, (i)=>false);
  }

  void _handlePressed(int index) {
    setState(() {
      if (isSelected[index]) {
        isSelected[index] = false;
      } else {
        isSelected[index] = true;
      }
    });
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Container(
  //       padding: const EdgeInsets.all(50.0),
  //       child: Column(
  //         children: <Widget>[
  //           FlatButton(
  //             onPressed: _handlePressed,
  //             color: _backgroundColor,
  //             child: Text(
  //               'コンビニ',
  //               style: TextStyle(color: _textColor, fontSize: 20.0),
  //             ),
  //             shape: OutlineInputBorder(
  //               borderRadius: BorderRadius.all(Radius.circular(5.0)),
  //             ),
  //           )
  //         ],
  //       )
  //     );
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 20.0),
        height: 50.0,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.all(8),
          itemCount: tagList.length,
          itemBuilder: (BuildContext context, int index) {
            // return FlatButton(
            //   onPressed: _handlePressed,
            //   color: _backgroundColor,
            //   child: Text(
            //     'コンビニ',
            //     style: TextStyle(color: _textColor, fontSize: 20.0),
            //   ),
            //   shape: OutlineInputBorder(
            //     borderRadius: BorderRadius.all(Radius.circular(5.0)),
            //   ),
            // );
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: RaisedButton(
                color: isSelected[index] == true ? Colors.blue : Colors.white,
                onPressed: () => _handlePressed(index),
                child: Text(
                  tagList[index],
                  style: TextStyle(color: isSelected[index] == true ? Colors.white : Colors.black, fontSize: 20.0)),
                shape: StadiumBorder(),
              ),
            );
          },
        )
    );
  }
}
