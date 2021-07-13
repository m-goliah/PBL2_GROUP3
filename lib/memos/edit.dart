import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:memo_pbl2/maps/mapPageWithButton.dart';
import 'package:memo_pbl2/maps/screenArguments.dart';
import 'package:memo_pbl2/memos/memo.dart';
import 'package:memo_pbl2/memos/tagList.dart';
import 'package:google_maps_place_picker/google_maps_place_picker.dart';
/*
 *  Page to edit the memo you selected.
 */

class Edit extends StatelessWidget {
  Memo _currentMemo;
  static Memo memoContent;
  Function _onChanged;
  Edit(this._currentMemo, this._onChanged);
  static PickResult selectedPlace;
  static void changeSelectedPlace(PickResult selected){
    selectedPlace = selected;
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: new AppBar(
          title: new Text('Edit'),
          // Close the keyboard
          actions: <Widget>[
            FlatButton(
              onPressed: () => FocusScope.of(context).requestFocus(FocusNode()),
              child: Icon(Icons.check),
              shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
            ),
            FlatButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  MyHomePage.routeName,
                  arguments:ChosenTag(_currentMemo.tag)

                );
              },
              child: Icon(Icons.map),
              shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
            ),
          ],
          // Back to memoPage
          leading: FlatButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Icon(Icons.arrow_back_ios),
            shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
          ),
        ),
        body: Column(
            children: <Widget>[
              /*
                 *  Title input field
                 */
              ConstrainedBox(
                constraints: BoxConstraints(maxHeight: 75.0,),
                child: Container(
                    padding: const EdgeInsets.all(16.0),
                    child: new TextField(
                      controller: TextEditingController(text: _currentMemo.title),
                      maxLines: 1,
                      decoration: const InputDecoration(
                        hintText: 'title',
                      ),
                      style: new TextStyle(color: Colors.black),
                      onChanged: (text) {
                        _currentMemo.title = text;
                        _onChanged(_currentMemo);
                        memoContent = _currentMemo;
                      },
                    )
                ),
              ),
              /*
                 *  Body input field
                 */
              ConstrainedBox(
                constraints: BoxConstraints(maxHeight: 350.0,),
                child: Container(
                    padding: const EdgeInsets.all(16.0),
                    child: new TextField(
                      controller: TextEditingController(text: _currentMemo.body),
                      maxLines: 99,
                      decoration: const InputDecoration(
                        hintText: 'body',
                      ),
                      style: new TextStyle(color: Colors.black),
                      onChanged: (text) {
                        _currentMemo.body = text;
                        _onChanged(_currentMemo);
                        memoContent = _currentMemo;
                      },
                    )
                ),
              ),

              /*
                 *  Display a list of tags
                 */
              TagList(_currentMemo, _onChanged)

            ]
        )

    );
  }
}
