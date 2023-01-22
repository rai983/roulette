import 'package:flutter/material.dart';
import 'package:practice/screens/add_roulette_screen.dart';
import 'package:practice/widgets/stoppoint.dart';
import 'package:roulette/roulette.dart';
import 'package:practice/screens/pra.dart';
import 'package:provider/provider.dart';

class RouletteScreen extends StatefulWidget {
  static const String id = 'roulette_screen';
  const RouletteScreen({Key? key}) : super(key: key);

  @override
  State<RouletteScreen> createState() => _RouletteScreenState();
}

class _RouletteScreenState extends State<RouletteScreen>
    //オフスクリーン時に不要なアニメーションでリソースを消費しないようにするための設定
    with
        SingleTickerProviderStateMixin {
  String turnButton = "ターン";
  late RouletteController _controller;

  @override
  void initState() {
    _controller = RouletteController(
        group: RouletteGroup([
          const RouletteUnit.text(addProvider.Item.toString(),
              color: Colors.grey),
          const RouletteUnit.text("ssss", color: Colors.pink),
          const RouletteUnit.text("ssss", color: Colors.yellow),
          const RouletteUnit.text("ssss", color: Colors.black),
          const RouletteUnit.text("ssss", color: Colors.red),
          const RouletteUnit.text("ssss", color: Colors.blue),
        ]),
        vsync: this);
    super.initState();
  }

  //時計回り
  bool _clockwise = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        child: Icon(Icons.add),
        onPressed: () {
          //   // 画面遷移
          Navigator.pushNamed(context, AddRouletteScreen.id);
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SafeArea(
            child: Container(
              padding:
                  EdgeInsets.only(top: 10, right: 30, left: 30, bottom: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CircleAvatar(
                    child: Icon(
                      Icons.add,
                      size: 30.0,
                      color: Colors.lightBlueAccent,
                    ),
                    backgroundColor: Colors.red,
                    radius: 30.0,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'numbers',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '5個',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              //horizontalは左右のこと
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              alignment: Alignment.center,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Column(
                    children: [
                      Container(
                        child: ElevatedButton(
                          // //コントローラーで回す
                          // onPressed: () => _controller.rollTo(
                          //   3,//出来レースここで指定することで
                          //   clockwise: _clockwise,
                          //   //最終位置
                          //   offset: Random().nextDouble(),
                          // ),
                          // child: Text(turnButton),
                          // Run the animation with rollTo method
                          onPressed: () {
                            // 結果を先に生成する 0.0 <= result < 6.0
                            var result = RandomUnion(6);
                            // 結果を仕込んでルーレットを回す
                            _controller
                                .rollTo(
                                  result.randomValueInt, // ランダム値の整数部を結果とする
                                  clockwise: _clockwise,
                                  offset: result
                                      .randomValueUnderPoint, // ランダム値の小数点以下をオフセットとする
                                )
                                .then((_) => {
                                      // ルーレットが止まった時の処理
                                      debugPrint(result.randomValue.toString())
                                    });
                          },
                          child: const Icon(Icons.refresh_rounded),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "右回り ",
                            style: TextStyle(fontSize: 20.0),
                          ),
                          Switch(
                            value: _clockwise,
                            onChanged: (onChanged) {
                              setState(
                                () {
                                  _controller.resetAnimation();
                                  _clockwise = !_clockwise;
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      SizedBox(
                        width: 250,
                        height: 250,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 40),
                          child: Roulette(
                            controller: _controller,
                            style: const RouletteStyle(
                              //中心の丸の色
                              centerStickerColor: Colors.black,
                              //区切りの厚さ
                              dividerThickness: 3,
                            ),
                          ),
                        ),
                      ),
                      const Icon(
                        Icons.favorite,
                        color: Colors.pink,
                        size: 24.0,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
