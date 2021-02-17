import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'dart:async';
import 'package:cupertino_timer/cupertino_timer.dart';
import 'package:opalapp/screens/disabled/Flexibility/Flexibility_page.dart';

class flexibility_pullNeck extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: pullNeck(),
    );
  }
}
class pullNeck extends StatefulWidget {
  @override
  _pullNeckState createState() => _pullNeckState();
}

class _pullNeckState extends State<pullNeck> {
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;
  @override
  hexColor(String colorhexcode) {
    String colornew = '0xff' + colorhexcode;
    colornew = colornew.replaceAll('#', '');
    int colorint = int.parse(colornew);
    return colorint;
  }

  void initState() {
    // VideoPlayerController를 저장하기 위한 변수를 만들고 VideoPlayerController는
    // asset, 파일, 인터넷 등의 영상들을 제어하기 위해 다양한 생성자를 제공.
    _controller = VideoPlayerController.asset(
      'video/pullneck.mp4',
    );

    // 컨트롤러를 초기화하고 추후 사용하기 위해 Future를 변수에 할당합니다.
    _initializeVideoPlayerFuture = _controller.initialize();

    // 비디오를 반복 재생하기 위해 컨트롤러를 사용합니다.
    _controller.setLooping(true);
    _controller.play();

    super.initState();
  }

  @override
  void dispose() {
    // 자원을 반환하기 위해 VideoPlayerController를 dispose 시키세요.
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            //Padding(padding: EdgeInsets.all(10.0))s,
            Container(
              padding: EdgeInsets.only(top: 45.0),
              height: (MediaQuery.of(context).size.height -
                  MediaQuery.of(context).padding.top) *
                  0.4,
              width: 350,
              /*decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30), //모서리를 둥글게
                  border: Border.all(color: Colors.black12, width: 3)),*/
              child: FutureBuilder(
                future: _initializeVideoPlayerFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    // 만약 VideoPlayerController 초기화가 끝나면, 제공된 데이터를 사용하여
                    // VideoPlayer의 종횡비를 제한하세요.
                    return AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      // 영상을 보여주기 위해 VideoPlayer 위젯을 사용합니다.
                      child: VideoPlayer(_controller),
                    );
                  } else {
                    // 만약 VideoPlayerController가 여전히 초기화 중이라면,
                    // 로딩 스피너를 보여줍니다.
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),

            Container(
                margin: const EdgeInsets.only(top: 65.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text('목 앞으로 당기기',
                        style: TextStyle(
                            fontFamily: "Gmarket",
                            fontWeight: FontWeight.bold,
                            fontSize: 33),
                        textAlign: TextAlign.left),
                  ],
                )),

            Container(
                margin: const EdgeInsets.only(top : 65.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text('10 초',
                        style: TextStyle(
                            fontFamily: "Gmarket",
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                            color: Color(hexColor('#0E49B5'))),
                        textAlign: TextAlign.left),
                    Container(
                      margin: EdgeInsets.only(left: 25),
                      width: 150,
                      height: 150,
                      child: CupertinoTimer(
                        //추가된 운동화면 타이머
                        duration: Duration(seconds: 60),
                        startOnInit: true, //무조건 시작
                        timeStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.black,
                        ),
                        ringColor: Color(hexColor('#0E49B5')),
                        ringStroke: 5,
                        valueListener: (timeElapsed) {
                          if (timeElapsed == Duration(seconds: 60))
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => pullNeckRest()));
                          setState(() {
                            // 영상이 재생 중이라면, 일시 중지 시킵니다. 버튼을 누르지 않았을 때
                            if (timeElapsed == Duration(seconds: 60)) {
                              if (_controller.value.isPlaying) {
                                _controller.pause();
                              }
                            }
                          });
                        },
                      ),
                    ),
                  ],
                )),

            //buttons
            Column(
              children: <Widget>[
                Column(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // Container( // 뒤로가기. 이 경우 리스트 화면을 간다.
                    //   child:
                    //   RaisedButton.icon(
                    //     onPressed: () {
                    //       Navigator.push(
                    //           context,
                    //           CupertinoPageRoute(builder: (context) => aerobic())); // 다시 리스트 화면으로 이동한다.
                    //     },
                    //     shape: RoundedRectangleBorder(
                    //         borderRadius: BorderRadius.all(Radius.circular(40.0))),
                    //     color: Colors.white60,
                    //     splashColor: Colors.blue,
                    //     textColor: Colors.black45,
                    //     label: Text('', // 글자를 추가할 경우가 있음 지우지 말것
                    //         style:
                    //         TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
                    //     icon: Icon(Icons.arrow_back_rounded,
                    //         size: 55, color: Colors.black54),
                    //   ),
                    // ),
                    Container(
                      margin: const EdgeInsets.only(top : 65.0),
                      // 완료. 다음
                      height: 60,
                      width: 350,
                      child: RaisedButton.icon(
                        onPressed: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => pullNeckRest()));
                          setState(() {
                            // 영상이 재생 중이라면, 일시 중지 시킵니다. 버튼을 눌렀을 때
                            if (_controller.value.isPlaying) {
                              _controller.pause();
                            }
                          });
                          //Navigator.pushNamed(context, '/first');
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(15.0))),
                        color: Color(hexColor('#0E49B5')),
                        splashColor: Color(hexColor('153E90')),
                        textColor: Colors.white,
                        label: Text('완료',
                            style: TextStyle(
                                fontFamily: "Gmarket",
                                fontWeight: FontWeight.bold,
                                fontSize: 35)),
                        icon: Icon(Icons.arrow_forward_rounded,
                            size: 0, color: Colors.black54),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );

    //floatingActionButtonLocation: FloatingActionButtonLocation.,
  }
}

var list1 = Column(
  crossAxisAlignment: CrossAxisAlignment.stretch,
  mainAxisAlignment: MainAxisAlignment.center,
  children: <Widget>[
    Column(
      children: <Widget>[
        Container(
            padding: EdgeInsets.all(15),
            height: 150,
            width: 350,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.grey,
                width: 4,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            margin: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Column(
                  children: [
                    Text(
                        '''
다음 운동
                        
목 옆으로 당기기 
''',
                        style: TextStyle(
                            fontFamily: "Gmarket",
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                        textAlign: TextAlign.left),
//                  Text(
//                         '''
// 바운스
// ''',
//                         style: TextStyle(
//                             fontFamily: "Gmarket",
//                             fontWeight: FontWeight.bold,
//                             fontSize: 12),
//                         textAlign: TextAlign.left),
                  ],
                ),
                // SizedBox(
                //   width: 80,
                // ),
                Center(child: Image.asset('images/pullneckside.png')),
              ],
            ))
        // ),
      ],
    ),
  ],
);

class pullNeckRest extends StatelessWidget {
  var done = false;
  @override
  hexColor(String colorhexcode) {
    String colornew = '0xff' + colorhexcode;
    colornew = colornew.replaceAll('#', '');
    int colorint = int.parse(colornew);
    return colorint;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                margin: const EdgeInsets.only(top: 20.0, bottom: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text('휴 식',
                        style: TextStyle(
                            fontFamily: "Gmarket",
                            fontWeight: FontWeight.bold,
                            fontSize: 60),
                        textAlign: TextAlign.left),
                  ],
                )),
            Container(
              margin: EdgeInsets.all(10),
              width: 200,
              height: 200,
              child: CupertinoTimer(
                duration: Duration(seconds: 10),
                startOnInit: true, //무조건 시작
                timeStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    color: Colors.black,
                ),
                ringColor: Color(hexColor('#0E49B5')),
                ringStroke: 10,
                valueListener: (timeElapsed) {
                  if (timeElapsed == Duration(seconds: 10))
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SecondScreen()));
                },
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 20.0)),
            Container(
              child: RaisedButton.icon(
                onPressed: () {
                  Navigator.push(context,
                      CupertinoPageRoute(builder: (context) => SecondScreen()));
                  //Navigator.pushNamed(context, '/first');
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                color: Colors.white60,
                splashColor: Color(hexColor('153E90')),
                textColor: Colors.black87,
                padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
                label: Text('넘어가기',
                    style: TextStyle(
                        fontFamily: "Gmarket",
                        fontWeight: FontWeight.bold,
                        fontSize: 35)),
                icon: Icon(Icons.arrow_forward_rounded,
                    size: 0, color: Colors.black54),
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 30.0)),
            list1,
          ],
        ),
      ),
    );
  }
}