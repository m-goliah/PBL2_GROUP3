import 'package:flutter/material.dart';
import 'package:google_place/google_place.dart';
import 'detailPage.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  GooglePlace googlePlace;
  List<AutocompletePrediction> predictions = [];

  @override
  void initState() {
    String apiKey = "AIzaSyAW2IuelHY1Op8I71A5RSKfD4lZAFQ8lhQ";
    googlePlace = GooglePlace(apiKey);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(right: 20, left: 20, top: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  labelText: "Search",
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: 2.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black54,
                      width: 2.0,
                    ),
                  ),
                ),
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    autoCompleteSearch(value);
                  } else {
                    if (predictions.length > 0 && mounted) {
                      setState(() {
                        predictions = [];
                      });
                    }
                  }
                },
              ),
              SizedBox(
                height: 10,
              ),
              RaisedButton(
                  onPressed: (){
                      autoCompleteSearch('7 11');
                  },
                  child: Text('7 11'),
                  color: Colors.blue,
                  textColor: Colors.white
              ),
              RaisedButton(
                  onPressed: (){
                    autoCompleteSearch('lawson');
                  },
                  child: Text('lawson'),
                  color: Colors.blue,
                  textColor: Colors.white
              ),
              RaisedButton(
                  onPressed: (){
                    autoCompleteSearch('九州大学');
                  },
                  child: Text('campus'),
                  color: Colors.blue,
                  textColor: Colors.white
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: predictions.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        child: Icon(
                          Icons.pin_drop,
                          color: Colors.white,
                        ),
                      ),
                      title: Text(predictions[index].description),
                      onTap: () {
                        debugPrint(predictions[index].placeId);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsPage(
                              placeId: predictions[index].placeId,
                              googlePlace: googlePlace,
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                child: Image.asset("assets/powered_by_google.png"),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void autoCompleteSearch(String value) async {
    print("======================");
    var result = await googlePlace.autocomplete.get(value,location: LatLon(33.595874, 130.238100),radius: 111);
    // var result = await googlePlace.search.getNearBySearch(Location(111,111),55,name: "convenience");
    if (result != null && result.predictions != null && mounted) {
      setState(() {
        print("-------------------");
        predictions = result.predictions;
      });
    }
  }
}