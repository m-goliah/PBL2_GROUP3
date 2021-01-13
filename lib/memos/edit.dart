import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:memo_pbl2/memos/memo.dart';
import 'package:memo_pbl2/memos/samplebutton.dart';

class Edit extends StatelessWidget {
  Memo _current;
  Function _onChanged;

  Edit(this._current, this._onChanged);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Edit'),
        actions: <Widget>[
          FlatButton(
            onPressed: () => FocusScope.of(context).requestFocus(FocusNode()),
            child: Icon(Icons.check),
            shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
          ),
        ],
        leading: FlatButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Icon(Icons.arrow_back_ios),
          shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
        ),
      ),
      body: Column(
              children: <Widget>[
                ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: 75.0,),
                  child: Container(
                      padding: const EdgeInsets.all(16.0),
                      child: new TextField(
                        controller: TextEditingController(text: _current.title),
                        maxLines: 1,
                         decoration: const InputDecoration(
                          hintText: 'title',
                        ),
                        style: new TextStyle(color: Colors.black),
                        onChanged: (text) {
                          _current.title = text;
                          _onChanged(_current);
                        },
                      )
                  ),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: 225.0,),
                  child: Container(
                      padding: const EdgeInsets.all(16.0),
                      child: new TextField(
                        controller: TextEditingController(text: _current.body),
                        maxLines: 99,
                        decoration: const InputDecoration(
                          hintText: 'body',
                        ),
                        style: new TextStyle(color: Colors.black),
                        onChanged: (text) {
                          _current.body = text;
                          _onChanged(_current);
                        },
                      )
                    ),
                  ),

                SampleButton(_current, _onChanged)

              ]
      )

    );
  }
}
