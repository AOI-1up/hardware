# ARM アセンブラ演習
カレンダープログラムを作成し、レポートして提出する。

## 演習内容
UNIX の cal コマンドに準ずるプログラムをアセンブラと C 言語で作成する。なお、カレンダー本体・うるう年判定・ツェラーの公式はアセンブラで実装する。

## 応用課題
1. 数文字ずつの出力を改善する ✔
2. １年分のカレンダーを出力する ✖
3. 月曜日を左に出力する ✔
4. 曜日の行を出力する ✔
5. 実行した日を色反転する ✖
6. 祝祭日に色をつける ✖

## プログラム
### Calendar
```
$ cc -mcpu=cortex-a15 -o cal main.c zellar.s monthlen.s isleap.s
$ ./cal 12 2022
   December 2022
Su Mo Tu We Th Fr Sa 
             1  2  3 
 4  5  6  7  8  9 10 
11 12 13 14 15 16 17 
18 19 20 21 22 23 24 
25 26 27 28 29 30 31
```

### AdvCalendar
```
$ cc -mcpu=cortex-a15 -o cal main.c calendar.s date.c wday.s zellar.s montlen.s isleap.s print.s
$ ./cal 1 2023
January 2023
Mo Tu We Th Fr Sa Su
                   1
 2  3  4  5  6  7  8
 9 10 11 12 13 14 15
16 17 18 19 20 21 22
23 24 25 26 27 28 29
30 31
```