import 'package:flutter/material.dart';
import 'package:videoplayer/videoplayer.dart';

var videoList = [
  {
  'name': 'Big buck bunny',
  'media_url' : 'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
  'thumb_url' : 'https://i.ytimg.com/vi/aqz-KE-bpKQ/maxresdefault.jpg',
  },

  {
  'name': 'The first Blender Open Movie from 2006',
  'media_url' : 'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4',
  'thumb_url' : 'https://i.ytimg.com/vi/3AJcfC-Vi8A/maxresdefault.jpg',
  },

  {
  'name': 'For Bigger Blazes',
  'media_url' : 'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4',
  'thumb_url' : 'https://i.ytimg.com/vi/aqz-KE-bpKQ/maxresdefault.jpg',
  }
];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key,}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("widget"),
      ),                                                              
      body: ListView(
        children: videoList
          .map((e) => GestureDetector(
            onTap: ()=>Navigator.push(
              context, 
              MaterialPageRoute(builder: (context)=> VideoPlayer(
                name: e['name']!,
                mediaUrl: e['media_url']!,

              ))
            ),
             child: (e['thumb_url'] != null)?Image.network(e['thumb_url']!): Image.network(e['https://images.unsplash.com/photo-1453728013993-6d66e9c9123a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8bGVuc3xlbnwwfHwwfHw%3D&w=1000&q=80']!),
          )).toList(),
      ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
