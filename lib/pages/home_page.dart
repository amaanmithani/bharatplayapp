

import 'dart:convert';
import 'dart:developer';

import 'package:alan_voice/alan_voice.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:velocity_x/velocity_x.dart';

import '../model/radio.dart';
import '../utils/ai_util.dart';



class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
    List<MyRadio> radios= [];
     late MyRadio _selectedRadio;
     late Color _selectedColor;
    bool _isPlaying = false;
    final sugg = [
      "Play",
      "Stop",
      "Play Country music",
      "Play Bollywood music",
      "Play 107 FM",
      "Play Hiphop",
      "Play English songs",
      "Play next",
      "Play 104 FM",
      "Play Radio City",
      "Pause",
      "Play Previous",
      "Play Punjabi"
    ];

    final AudioPlayer _audioPlayer = AudioPlayer();



  // List <MyRadio> radios =[];

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    setupAlan();
    fetchRadios();

    _audioPlayer.onPlayerStateChanged.listen((event) {
      if(event== PlayerState.PLAYING){
        _isPlaying =true;
      }else{
        _isPlaying = false;
      }
      setState(() {

      });
    });

   }

   setupAlan(){
     AlanVoice.addButton(
         "6e8899546e80c8380655d90d12d57e3f2e956eca572e1d8b807a3e2338fdd0dc/stage",
         buttonAlign: AlanVoice.BUTTON_ALIGN_LEFT);
     AlanVoice.callbacks.add((command) => _handleCommand(command.data) );
   }

   _handleCommand(Map<String,dynamic> response){
    switch(response ["command"]){

      case "play":
        _playMusic(_selectedRadio.url);
        break;

      case "play_channel":
        final id = response["id"];
        // _audioPlayer.pause();
        MyRadio newRadio = radios.firstWhere((element) => element.id == id);
        radios.remove(newRadio);
        radios.insert(0, newRadio);
        _playMusic(newRadio.url);
        break;

      case "play_love":
        final id = response["id"];
        // _audioPlayer.pause();
        MyRadio newRadio = radios.firstWhere((element) => element.id == 7);
        radios.remove(newRadio);
        radios.insert(0, newRadio);
        _playMusic(newRadio.url);
        break;

      case "play_hip":
        final id = response["id"];
        // _audioPlayer.pause();
        MyRadio newRadio = radios.firstWhere((element) => element.id == 3);
        radios.remove(newRadio);
        radios.insert(0, newRadio);
        _playMusic(newRadio.url);
        break;



      case "play_bom":
        final id = response["id"];
        // _audioPlayer.pause();
        MyRadio newRadio = radios.firstWhere((element) => element.id == 4);
        radios.remove(newRadio);
        radios.insert(0, newRadio);
        _playMusic(newRadio.url);
        break;




      // case "play_jazz":
      //   final id = response["id"];
      //   // _audioPlayer.pause();
      //   MyRadio newRadio = radios.firstWhere((element) => element.id == 5);
      //   radios.remove(newRadio);
      //   radios.insert(0, newRadio);
      //   _playMusic(newRadio.url);
      //   break;

      case "play_country":
        final id = response["id"];
        // _audioPlayer.pause();
        MyRadio newRadio = radios.firstWhere((element) => element.id == 6);
        radios.remove(newRadio);
        radios.insert(0, newRadio);
        _playMusic(newRadio.url);
        break;

      case "play_ninetyone":
        final id = response["id"];
        // _audioPlayer.pause();
        MyRadio newRadio = radios.firstWhere((element) => element.id == 1);
        radios.remove(newRadio);
        radios.insert(0, newRadio);
        _playMusic(newRadio.url);
        break;


        case "play_punjab":
        final id = response["id"];
        // _audioPlayer.pause();
        MyRadio newRadio = radios.firstWhere((element) => element.id == 5);
        radios.remove(newRadio);
        radios.insert(0, newRadio);
        _playMusic(newRadio.url);
        break;




      case "play_ndtv":
        final id = response["id"];
        // _audioPlayer.pause();
        MyRadio newRadio = radios.firstWhere((element) => element.id == 2);
        radios.remove(newRadio);
        radios.insert(0, newRadio);
        _playMusic(newRadio.url);
        break;

      case "play_rockingretro":
        final id = response["id"];
        // _audioPlayer.pause();
        MyRadio newRadio = radios.firstWhere((element) => element.id == 8);
        radios.remove(newRadio);
        radios.insert(0, newRadio);
        _playMusic(newRadio.url);
        break;




      case "play_bollywood":
        final id = response["id"];
        // _audioPlayer.pause();
        MyRadio newRadio = radios.firstWhere((element) => element.id == 1);
        radios.remove(newRadio);
        radios.insert(0, newRadio);
        _playMusic(newRadio.url);
        break;

      case "play_genre":
        final id = response["id"];
        // _audioPlayer.pause();
        MyRadio newRadio = radios.firstWhere((element) => element.id == id);
        radios.remove(newRadio);
        radios.insert(0, newRadio);
        _playMusic(newRadio.url);
        break;

      case "play_lang":
        final id = response["id"];
        // _audioPlayer.pause();
        MyRadio newRadio = radios.firstWhere((element) => element.id == id);
        radios.remove(newRadio);
        radios.insert(0, newRadio);
        _playMusic(newRadio.url);
        break;

      case "stop":
        _audioPlayer.stop();
        break;
      case "next":
        final index = _selectedRadio.id;
        MyRadio newRadio;
        if (index + 1 > radios.length) {
          newRadio = radios.firstWhere((element) => element.id == 1);
          radios.remove(newRadio);
          radios.insert(0, newRadio);
        } else {
          newRadio = radios.firstWhere((element) => element.id == index + 1);
          radios.remove(newRadio);
          radios.insert(0, newRadio);
        }
        _playMusic(newRadio.url);
        break;
      case "prev":
        final index = _selectedRadio.id;
        MyRadio newRadio;
        if (index - 1 <= 0) {
          newRadio = radios.firstWhere((element) => element.id == 1);
          radios.remove(newRadio);
          radios.insert(0, newRadio);
        } else {
          newRadio = radios.firstWhere((element) => element.id == index - 1);
          radios.remove(newRadio);
          radios.insert(0, newRadio);
        }
        _playMusic(newRadio.url);
        break;
      default:
        print("Command was ${response["command"]}");
        break;
    }


   }

  fetchRadios() async {
    final radioJson = await rootBundle.loadString("assets/radio.json");
    List<dynamic> myMap = json.decode(radioJson);
   radios = MyRadioList.myFunc(myMap);

   _selectedRadio = radios[0];
   //  print(radioJson);
   print(radios[0].name);
   print(_selectedRadio);
   setState(() {

   });

  }

    _playMusic(String url) {
      _audioPlayer.play(url);
      _selectedRadio = radios.firstWhere((element) => element.url == url);
      print(_selectedRadio.name);
      setState(() {});
    }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Container(
          color: AIColors.primaryColor1,
          child:
              [
                100.heightBox,
                "All Channels".text.white.semiBold.make().px16(),
                20.heightBox,
                ListView(
                  padding: Vx.m0,
                  shrinkWrap: true,
                  children: radios
                      .map((e) => ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(e.icon),
                    ),
                    title: "${e.name} FM".text.white.make(),
                    subtitle: e.tagline.text.white.make(),
                  ))
                      .toList(),
                ).expand()

          ].vStack(crossAlignment: CrossAxisAlignment.start)
                ,
        ),
      ),
      body: Stack(children: [
          VxAnimatedBox()
          .size(context.screenWidth, context.screenHeight)
          .withGradient(
        LinearGradient(
          colors: [
            AIColors.primaryColor1,
            AIColors.primaryColor2,
            AIColors.primaryColor3
            ,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      )
          .make(),
      [
        AppBar(
          title: "BharatPlay".text.xl4.bold.red800.make().shimmer(
              primaryColor: Vx.purple300, secondaryColor: Colors.red),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          centerTitle: true,).h(100.0).p16(),

        "Start with - Hey Alan 👇".text.italic.semiBold.blue500.make(),
        10.heightBox,
        VxSwiper.builder(itemCount: sugg.length,
            height: 50.0,
            viewportFraction: 0.35,
            autoPlayAnimationDuration: 3.seconds,

            autoPlayCurve: Curves.linear,
            enableInfiniteScroll: true,
            autoPlay: true,
            itemBuilder: (context, index){
          final s = sugg[index];
          return Chip(
            label: s.text.make(),
            backgroundColor: Vx.randomColor,
          );
            })
      ].vStack(),
        20.heightBox,
        radios!=null? VxSwiper.builder(itemCount: radios.length, aspectRatio: 1.0,

            enlargeCenterPage: true,
            onPageChanged: (index){
          _selectedRadio =radios[index];
          setState(() {

          });
            },
            itemBuilder: (context, index){

          final rad = radios.isEmpty ? MyRadio.defaultRadio() : radios[index];
          return VxBox(
            child: ZStack([
              Positioned(
                top: 0.0,
                right: 0.0,
                child: VxBox(
                  child:
                  rad.category.text.uppercase.white.make(),
                ).height(60).black.alignCenter.withRounded(value: 10.0).make(),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: VStack([
                  rad.name.text.xl5.white.bold.make(),
                  5.heightBox,
                  rad.tagline.text.sm.white.semiBold.make(),
                  ],
                  crossAlignment: CrossAxisAlignment.center,
                )
              ),
              Align(alignment: Alignment.center,
              child: [
                Icon(CupertinoIcons.play_circle, color: Colors.white),10.heightBox,
                "Double tap to play".text.gray300.make()
              ].vStack())

            ],
            clip: Clip.antiAlias,)).clip(Clip.antiAlias)
              .bgImage(DecorationImage(image: NetworkImage(rad.image),
            fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.3),
                  BlendMode.darken)
          )).border(color: Colors.black, width: 5.0)
              .withRounded(value: 60)
              .make()
          .onInkDoubleTap(() {
            _playMusic(rad.url);
          })
              .p16();
          },).centered():Center(child: CircularProgressIndicator(),),
        Align(
          alignment: Alignment.bottomCenter,
          child: [
            if(_isPlaying)
              "Playing Now - ${_selectedRadio.name} FM".text.makeCentered(),
            Icon(
            _isPlaying? CupertinoIcons.stop_circle: CupertinoIcons.play_circle,
            color: Colors.white,
            size: 50.0,
          ).onInkTap(() {
            if (_isPlaying){
              _audioPlayer.stop();
            }else{
              _playMusic(_selectedRadio.url);
            }
            })
          ].vStack(),
        ).pOnly(bottom: context.percentHeight * 12)


      ],
        fit: StackFit.expand ,
      ),

);
}
}
