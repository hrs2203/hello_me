import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/Board.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("HomePage")),
      body: ListView(
        children: <Widget>[
          _buildListTile(context, "Random Puzzle", PuzzlePage()),
        ],
      ),
    );
  }

  ListTile _buildListTile(BuildContext context, String text, Widget child) {
    return ListTile(
      title: Text(text),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => child),
        );
      },
    );
  }
}

class PuzzlePage extends StatelessWidget {
  @override
  // Widget build(BuildContext context) {
  //   return ChangeNotifierProvider<Board>(
  //     create: (_) => Board(),
  //     child: MaterialApp(
  //       home: SafeArea(
  //         child: Scaffold(
  //           appBar: _buildPuzzlePageAppBar(context),
  //           body: Container(child: Text("data")),
  //           bottomNavigationBar: HintBar(),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: ChangeNotifierProvider<Board>(
          create: (_) => Board(),
          child: Scaffold(
            appBar: _buildPuzzlePageAppBar(context),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: GridPuzzle()),
                Expanded(child: HintBar())
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppBar _buildPuzzlePageAppBar(BuildContext context) {
    return AppBar(
      leading: FlatButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(Icons.arrow_back, color: Colors.white),
      ),
      title: Text("PuzzlePage"),
    );
  }
}

class GridPuzzle extends StatefulWidget {
  @override
  _GridPuzzleState createState() => _GridPuzzleState();
}

class _GridPuzzleState extends State<GridPuzzle> {
  @override
  Widget build(BuildContext context) {
    Board boardState = Provider.of<Board>(context, listen: false);

    List<Widget> items = [];
    for (var i = 0; i < 4; i++) {
      for (var j = 0; j < 4; j++) {
        items.add(_buildGridItem(boardState, i, j));
      }
    }

    return GridView.count(
      padding: const EdgeInsets.all(8.0),
      crossAxisCount: 4,
      children: items,
    );
  }

  // Widget _buildGridItem(Board boardState, int i, int j) {
  //   return Text('s');
  // }

  TextFormField _buildGridItem(Board boardState, int i, int j) {
    return TextFormField(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(2.0),
        hintText: boardState.board[i][j],
        border: const OutlineInputBorder(),
      ),
      onTap: () {
        boardState.actInd = [i, j];
      },
    );
  }
}

class HintBar extends StatefulWidget {
  @override
  _HintBarState createState() => _HintBarState();
}

class _HintBarState extends State<HintBar> {
  @override
  Widget build(BuildContext context) {
    Board boardState = Provider.of<Board>(context);
    return Container(
      child: Center(
        child: Text(' ${boardState.actInd[0]}, ${boardState.actInd[1]}'),
      ),
    );
  }
}
