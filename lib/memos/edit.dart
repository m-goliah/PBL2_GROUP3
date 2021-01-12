import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:memo_pbl2/memos/samplebutton.dart';

class Edit extends StatelessWidget {
  String _current;
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
                  constraints: BoxConstraints(
                  maxHeight: 300.0,
                ),
                child: Container(
                    padding: const EdgeInsets.all(16.0),
                    child: new TextField(
                      controller: TextEditingController(text: _current),
                      maxLines: 99,
                      style: new TextStyle(color: Colors.black),
                      onChanged: (text) {
                        _current = text;
                        _onChanged(_current);
                      },
                    )
                  ),
                ),
                SampleButton()

              ]
      )

    );
  }
}
