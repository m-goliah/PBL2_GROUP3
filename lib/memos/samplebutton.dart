// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:memo_pbl2/memos/memo.dart';

// // class SampleButton extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return OutlineButton(
// //       child: Text('Outline Button'),
// //       onPressed: () {},
// //     );
// //   }
// // }

// class SampleButton extends StatelessWidget {
//   // bool selected = false;
//   // List<String> locationList = [];
//   // Map<String, bool> tag;
//   // List<bool> isSelected;
//   Memo _memo;
//   Function _onChanged;

//   SampleButton(this._memo, this._onChanged);

//   void _handlePressed(String key) {
//     _memo.tag[key] = !_memo.tag[key];
//     _onChanged(_memo);
//   }

//   // @override
//   // Widget build(BuildContext context) {
//   //   return Container(
//   //       padding: const EdgeInsets.all(50.0),
//   //       child: Column(
//   //         children: <Widget>[
//   //           FlatButton(
//   //             onPressed: _handlePressed,
//   //             color: _backgroundColor,
//   //             child: Text(
//   //               'コンビニ',
//   //               style: TextStyle(color: _textColor, fontSize: 20.0),
//   //             ),
//   //             shape: OutlineInputBorder(
//   //               borderRadius: BorderRadius.all(Radius.circular(5.0)),
//   //             ),
//   //           )
//   //         ],
//   //       )
//   //     );
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         margin: EdgeInsets.symmetric(vertical: 20.0),
//         height: 50.0,
//         child: ListView.builder(
//           scrollDirection: Axis.horizontal,
//           padding: const EdgeInsets.all(8),
//           itemCount: _memo.tag.length,
//           itemBuilder: (BuildContext context, int index) {
//             // return FlatButton(
//             //   onPressed: _handlePressed,
//             //   color: _backgroundColor,
//             //   child: Text(
//             //     'コンビニ',
//             //     style: TextStyle(color: _textColor, fontSize: 20.0),
//             //   ),
//             //   shape: OutlineInputBorder(
//             //     borderRadius: BorderRadius.all(Radius.circular(5.0)),
//             //   ),
//             // );
//             String key = _memo.tag.keys.elementAt(index);

//             return Padding(
//               padding: EdgeInsets.symmetric(horizontal: 5),
//               child: RaisedButton(
//                 color: _memo.tag[key] == true ? Colors.blue : Colors.white,
//                 onPressed: () => _handlePressed(key),
//                 child: Text(key,
//                     style: TextStyle(
//                         color: _memo.tag[key] == true
//                             ? Colors.white
//                             : Colors.black,
//                         fontSize: 20.0)),
//                 shape: StadiumBorder(),
//               ),
//             );
//           },
//         ));
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:memo_pbl2/memos/memo.dart';

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

  Memo memo; //上位Widgetから受け取りたいデータ
  Function onChanged;

  SampleButton(this.memo, this.onChanged); //コンストラクタ

  @override
  _ChangeFormState createState() => _ChangeFormState();
}

class _ChangeFormState extends State<SampleButton> {

  void _handlePressed(String key) {
    setState(() {
    widget.memo.tag[key] = widget.memo.tag[key];
    widget.onChanged(widget.memo);
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
          itemCount: widget.memo.tag.length,
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
            String key = widget.memo.tag.keys.elementAt(index);

            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: RaisedButton(
                color: widget.memo.tag[key] == true ? Colors.blue : Colors.white,
                onPressed: () => _handlePressed(key),
                child: Text(key,
                    style: TextStyle(
                        color: widget.memo.tag[key] == true
                            ? Colors.white
                            : Colors.black,
                        fontSize: 20.0)),
                shape: StadiumBorder(),
              ),
            );
          },
        ));
  }
}
