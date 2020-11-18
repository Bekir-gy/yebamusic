import 'dart:js_util';
//deneme
import 'package:flutter/material.dart';
import 'package:yebamusic/main.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Song> _songs;
  MusicFinder audioPlayer;

  @override
  void initState() {
    super.initState();
    initPlayer();
  }

  void initPlayer() async {
    audioPlayer = new MusicFinder();
    var songs = await MusicFinder.allSongs();
    songs = new List.from(songs);

    setState(() {
      _songs = songs;
    });
  }

  Future _playLocal(String url) async {
    final result = await audioPlayer.play(url, isLocal: true);
    //if (result == 1) setState(() => playerState = PlayerState.playing);
  }

  @override
  Widget build(BuildContext context) {
    Widget home() {
      return new Scaffold(
        appBar: new AppBar(
          title: new Text("YEBA Music Player"),
        ),
        body: new ListView.builder(
          itemCount: _songs.length,
          itemBuilder: (context, int index) {
            return new ListTile(
              leading: new CircleAvatar(
                child: new Text(_songs[index].title[0]),
              ),
              title: new Text(_songs[index].title),
              onTap: () => _playLocal(_songs[index].uri),
            );
          },
        ),
      );
    }

    return MaterialApp(
      home: home(),
    );
  }
}
