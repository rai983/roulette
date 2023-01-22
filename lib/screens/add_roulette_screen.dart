import 'package:flutter/material.dart';
import 'package:practice/save/list_add.dart';
import 'package:practice/screens/pra.dart';
import 'package:provider/provider.dart';

class AddRouletteScreen extends StatefulWidget {
  static const String id = 'roulette_add_screen';

  @override
  State<AddRouletteScreen> createState() => _AddRouletteScreenState();
}

//サンプル追加　Provider
class Mypp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AddProvider>(
          create: (context) => AddProvider(),
        ),
      ],
      child: MaterialApp(
        title: '練習',
        theme: ThemeData(
          primarySwatch: Colors.brown,
        ),
      ),
    );
  }
}

class _AddRouletteScreenState extends State<AddRouletteScreen> {
  //追加するとき用
  List<Item> itemsList = [];
  @override
  void dispose() {
    itemsList.forEach((element) {
      element.dispose();
    });
    super.dispose();
  }

  // void add() {
  //   setState(() {
  //     itemsList.add(Item.create(""));
  //   });
  // }

  //バツのアイコンボタンを押したとき消す

  void remove(int id) {
    final removedItem = itemsList.firstWhere((element) => element.id == id);
    setState(() {
      itemsList.removeWhere((element) => element.id == id);
    });

    // itemのcontrollerをすぐdisposeすると怒られるので
    // 少し時間をおいてからdipose()
    Future.delayed(Duration(seconds: 1)).then((value) {
      removedItem.dispose();
    });
  }

  @override
  Widget build(BuildContext context) {
    //サンプル追加provider
    final AddProvider addProvider =
        Provider.of<AddProvider>(context, listen: true);
    //ここまで
    return Scaffold(
      appBar: AppBar(
        title: Text('追加画面'),
      ),
      //追加
      body: Container(
        padding: EdgeInsets.all(32),
        child: ListView(
          children: [
            Text(itemsList.toString()),
            ...itemsList.map(
              (item) => textFieldItem(item),
            ),
            ElevatedButton(
              onPressed: () {
                //add();
                addProvider.add;
              },
              child: Text(
                "追加",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                "遷移",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget textFieldItem(
    Item item,
  ) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            autofocus: true,
            decoration: InputDecoration(
              hintStyle: TextStyle(fontSize: 20),
              hintText: 'ここに名前を入れて',
            ),
            controller: item.controller,
            onChanged: (text) {
              setState(
                () {
                  itemsList = itemsList
                      .map((e) => e.id == item.id ? item.change(text) : e)
                      .toList();
                },
              );
            },
          ),
        ),
        IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            remove(item.id);
          },
        )
      ],
    );
  }
}
