import 'package:flutter/material.dart';
import 'package:music_app/modules/all%20songs/ui/all_songs_ui.dart';
import 'package:music_app/theme/colors.dart';

class BottomNavigationUI extends StatefulWidget {
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30,color: Colors.white);
  static  final List<Widget> _widgetOptions = <Widget>[
    AllSongsUi(),
    const Text(
      'Search..',
      style: optionStyle,
    ),
    const Text(
      '',
      style: optionStyle,
    ),
    const Text(
      'Podcasts',
      style: optionStyle,
    ),
    const Text(
      'Settings',
      style: optionStyle,
    ),
  ];

  @override
  State<BottomNavigationUI> createState() => _BottomNavigationUIState();
}

class _BottomNavigationUIState extends State<BottomNavigationUI> {
  int _selectedIndex = 0;
  bool directionIsRight=true;
  double size=12;
  void _onItemTapped(int index) {
  }

  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.maybeSizeOf(context)!.width;
    return Scaffold(
      backgroundColor: ThemeColors.primaryColor,
      body: Center(
        child: BottomNavigationUI._widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Stack(
        children: [
          NavigationBar(
            shadowColor: Colors.white54,
            backgroundColor: ThemeColors.primaryColor,
            height: 60,
            destinations: [
             GestureDetector(
               onTap: (){
                 directionIsRight=false;
                 size=40;
                 setState(() {
                   _selectedIndex=0;
                 });
               },
               child:  Icon(Icons.home_outlined,size: _selectedIndex==0?30:25,color: Colors.white),
             ),
              GestureDetector(
                onTap: (){
                  size=40;
                  if(_selectedIndex>1){
                    directionIsRight=false;
                  }else{
                    directionIsRight=true;
                  }
                  setState(() {
                    _selectedIndex=1;
                  });
                },
                child: Icon(Icons.search,size: _selectedIndex==1?30:25,color: Colors.white),
              ),
              CircleAvatar(radius: 22,backgroundColor: ThemeColors.secondaryColor,child: Icon(Icons.headphones,color: Colors.white)),
              GestureDetector(
                onTap: (){
                  if(_selectedIndex>3){
                    directionIsRight=false;
                  }else{
                    directionIsRight=true;
                  }
                  size=40;
                  setState(() {
                    _selectedIndex=3;
                  });
                },
                child: Icon(Icons.podcasts,size: _selectedIndex==3?30:25,color: Colors.white),
              ),
              GestureDetector(
                onTap: (){
                    directionIsRight=true;

                  size=40;
                  setState(() {
                    _selectedIndex=4;
                  });
                },
                child: Icon(Icons.settings,size: _selectedIndex==4?30:25,color: Colors.white),
              ),
            ],
              indicatorColor: Colors.transparent,
            labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
            selectedIndex: _selectedIndex,
            onDestinationSelected: _onItemTapped,
          ),
          AnimatedPositionedDirectional(
            width: size,
            height: 3,
            bottom: 6,
            start:_selectedIndex==0?width/11.8:_selectedIndex==1?
            width/3.5:
            _selectedIndex==2?
            width/2.1:_selectedIndex==3?
            width/1.47:
            width/1.13,
            duration: const Duration(seconds: 1),
            curve: Curves.fastOutSlowIn,
            onEnd: (){
              setState(() {
                size=13;
              });},
            child:  ColoredBox(
              color: ThemeColors.secondaryColor,

            ),
          ),
        ],
      ),
    );
  }
}

