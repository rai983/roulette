import 'dart:math';

class RandomUnion {
  // ランダムな数値 例：最大値＝6 の場合 0.0 <= randomValue < 6.0
  double randomValue = 0.0;

  // ランダムな数値の整数部のみ
  int randomValueInt = 0;
  // ランダムな数値の小数点以下
  double randomValueUnderPoint = 0.0;

  /// コンストラクター
  /// 最大値を渡す。例：最大値＝6 の場合 0.0 <= randomValue < 6.0
  RandomUnion(int lessThanValue) {
    randomValue = lessThanValue * Random().nextDouble();
    randomValueInt = randomValue.toInt();
    randomValueUnderPoint = randomValue - randomValueInt;
  }
}
