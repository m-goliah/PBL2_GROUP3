import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:memo_pbl2/memos/edit.dart';
import 'package:memo_pbl2/memos/memo.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_place_picker/google_maps_place_picker.dart';
import 'edit.dart';
/*
 *  Display the tags of the memo class in a horizontal list
 */

class TagList extends StatefulWidget {
  Memo _currentMemo;
  Function onChanged;
  static final _kGooglePlex = LatLng(33.57442265069955, 130.2474225493839);
  TagList(this._currentMemo, this.onChanged);
  @override
  _ChangeFormState createState() => _ChangeFormState();
}

class _ChangeFormState extends State<TagList> {
  /*
   *  Reverses the color of a button when it is pressed.
   */
  void _handlePressed(String key) {
    setState(() {
      widget._currentMemo.tag.forEach((curkey, value) {
        if(curkey==key){
          widget._currentMemo.tag[curkey] = !widget._currentMemo.tag[curkey];
        }
        else{
          widget._currentMemo.tag[curkey] = false;
        }
      });

      widget.onChanged(widget._currentMemo);
    });
    if(key=="カスタマイズ"){
      Navigator.push(context, MaterialPageRoute(builder: (context){
        return PlacePicker(
          apiKey: 'AIzaSyABKBCqeZAXZ6f_HTWSO5JwJ74hW0k4tAU',
          initialPosition: TagList._kGooglePlex,
          useCurrentLocation: true,
          selectInitialPosition: true,
          onPlacePicked: (result) {
            Edit.selectedPlace = result;
            Navigator.of(context).pop();
            setState(() {});
          },
        );
      }));
    }

  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 20.0),
        height: 50.0,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.all(8),
          itemCount: widget._currentMemo.tag.length,
          itemBuilder: (BuildContext context, int index) {

            String key = widget._currentMemo.tag.keys.elementAt(index);

            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: RaisedButton(
                color:
                widget._currentMemo.tag[key] == true ? Colors.blue : Colors.white,
                onPressed: () => _handlePressed(key),
                child: Text(key,
                    style: TextStyle(
                        color: widget._currentMemo.tag[key] == true
                            ? Colors.white
                            : Colors.black,
                        fontSize: 20.0)),
                shape: StadiumBorder(),
              ),
            );
          },
        )
    );
  }
}