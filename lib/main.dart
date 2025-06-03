import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(MaterialApp(home: TetrisGame()));
}

class TetrisGame extends StatefulWidget {
  @override
  _TetrisGameState createState() => _TetrisGameState();
}

class _TetrisGameState extends State<TetrisGame> {
  List<List<bool>> grid = List.generate(20, (_) => List.filled(10, false));
  int blockX = 4;
  int blockY = 0;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(milliseconds: 500), (_) {
      setState(() {
        blockY++;
        if (blockY >= 20 || grid[blockY][blockX]) {
          blockY--;
          grid[blockY][blockX] = true;
          blockX = 4;
          blockY = 0;
        }
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Widget buildCell(bool filled) {
    return Container(
      margin: EdgeInsets.all(1),
      color: filled ? Colors.blue : Colors.grey[300],
    );
  }

  @override
  Widget build(BuildContext context) {
    List<List<bool>> tempGrid = List.generate(20, (y) {
      return List.generate(10, (x) {
        if (x == blockX && y == blockY) return true;
        return grid[y][x];
      });
    });

    return Scaffold(
      appBar: AppBar(title: Text('Mini Tetris')),
      body: Column(
        children: tempGrid.map((row) {
          return Expanded(
            child: Row(
              children: row.map((cell) => Expanded(child: buildCell(cell))).toList(),
            ),
          );
        }).toList(),
      ),
    );
  }
}
