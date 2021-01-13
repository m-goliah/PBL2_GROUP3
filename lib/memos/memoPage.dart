import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:memo_pbl2/memos/edit.dart';
import 'package:memo_pbl2/memos/memo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Memo App',
      theme: ThemeData(
        primaryColor: Colors.blueGrey,
      ),
      home: MemoList(),
    );
  }
}

class MemoListState extends State<MemoList> {
  var _memoList = new List<Memo>();
  var _currentIndex = -1;
  bool _loading = true;
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  void initState() {
    super.initState();
    this.loadMemoList();
  }

  @override
  Widget build(BuildContext context) {
    final title = "Home";
    if (_loading) {
      return Scaffold(
          appBar: AppBar(
            title: Text(title),
          ),
          body: CircularProgressIndicator());
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: _buildList(),
      floatingActionButton: FloatingActionButton(
        onPressed: _addMemo,
        tooltip: 'New Memo',
        child: Icon(Icons.add),
      ),
    );
  }

  void loadMemoList() {
    // SharedPreferences.getInstance().then((prefs) {
    //   // const title_key = "memo-title-list";
    //   const key = "memo-list___";

    //   if (prefs.containsKey(key)) {
    //     // List _memotitleList = prefs.getStringList(title_key);
    //     var _jsonfile = prefs.getStringList(key);
    //     _memoList = _jsonfile.map((f) => Memo.fromJson(json.decode(f))).toList();
    //     // if (_memotitleList.length == _memobodyList.length) {
    //     //   for (int i = 0; i < _memobodyList.length; i++) {
    //     //     String _title = _memotitleList[i];
    //     //     String _body = _memobodyList[i];
    //     //     _memoList.add(new Memo.load(_title, _body));
    //     //   }
    //     // }
    //   }
    setState(() {
      _loading = false;
    });
    // });
  }

  void _addMemo() {
    setState(() {
      _memoList.add(new Memo.add());
      _currentIndex = _memoList.length - 1;
      storeMemoList();
      Navigator.of(context).push(MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return new Edit(_memoList[_currentIndex], _onChanged);
        },
      ));
    });
  }

  void _onChanged(Memo memo) {
    setState(() {
      _memoList[_currentIndex] = memo;
      storeMemoList();
    });
  }

  void storeMemoList() async {
    final prefs = await SharedPreferences.getInstance();
    // const title_key = "memo-title-list";
    const key = "memo-list___";

    List _memotitleList = new List<String>();
    List _memobodyList = new List<String>();

    for (Memo memo in _memoList) {
      _memotitleList.add(memo.title);
      _memobodyList.add(memo.body);
    }

    final String encodedData = Memo.encode(_memoList);

    // List<String> _jsonfile =
    //     _memoList.map((f) => json.encode(f.toJson())).toList();

    final _success = await prefs.setString(key, encodedData);

    if (_success) {
      debugPrint("Failed to store value");
    }
  }

  Widget _buildList() {
    final itemCount = _memoList.length == 0 ? 0 : _memoList.length * 2 - 1;
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: itemCount,
        itemBuilder: /*1*/ (context, i) {
          if (i.isOdd) return Divider(height: 2);
          final index = (i / 2).floor();
          final memo = _memoList[index];
          return _buildWrappedRow(memo.title, index);
        });
  }

  Widget _buildWrappedRow(String content, int index) {
    return Dismissible(
      background: Container(color: Colors.red),
      key: Key(content),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        setState(() {
          _memoList.removeAt(index);
          storeMemoList();
        });
      },
      child: _buildRow(content, index),
    );
  }

  Widget _buildRow(String content, int index) {
    return ListTile(
      title: Text(
        content,
        style: _biggerFont,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      onTap: () {
        _currentIndex = index;
        Navigator.of(context)
            .push(MaterialPageRoute<void>(builder: (BuildContext context) {
          return new Edit(_memoList[_currentIndex], _onChanged);
        }));
      },
    );
  }
}

class MemoList extends StatefulWidget {
  @override
  MemoListState createState() => MemoListState();
}
