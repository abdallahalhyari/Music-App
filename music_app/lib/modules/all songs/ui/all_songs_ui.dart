import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/model/song_model.dart';
import 'package:music_app/modules/song/bloc/song_bloc.dart';
import 'package:music_app/modules/song/ui/song_ui.dart';
import 'package:music_app/theme/colors.dart';
import 'package:music_app/widgets/custom_text_widget.dart';

class AllSongsUi extends StatelessWidget {
  final List<SongModel> songs=[
    SongModel(title: 'Bailando', singer: 'Billy Ray Cyrus', time: '3 : 58'),
    SongModel(title: 'Cuando Me Enamoron', singer: 'Mabel', time: '2 : 46'),
    SongModel(title: 'Dirty Dancer', singer: 'Bazzi', time: '4 : 58'),
    SongModel(title: 'Finally Found You', singer: 'Billy Ray Cyrus', time: '3 : 58'),
    SongModel(title: 'Heart Attack', singer: 'Billy Ray Cyrus', time: '6 : 58'),
    SongModel(title: 'Heartbeat', singer: 'Billy Ray Cyrus', time: '2 : 58'),
    SongModel(title: 'Hero', singer: 'Bazzi', time: '3 : 58'),
    SongModel(title: 'Move To Miami', singer: 'Billy Ray Cyrus', time: '6 : 58'),
    SongModel(title: 'Heart Attack', singer: 'Bazzi', time: '4 : 05'),
    SongModel(title: 'Heartbeat', singer: 'Billy Ray Cyrus', time: '3 : 58')

  ]; 
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ThemeColors.primaryColor,
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          backgroundColor: ThemeColors.primaryColor,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: SizedBox(
              height: 80,
              width: MediaQuery.maybeSizeOf(context)!.width,
              child: Card(
                color: Colors.white.withOpacity(.5),
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        ThemeColors.backColor.withOpacity(.2),
                        ThemeColors.backColor.withOpacity(.6),
                        ThemeColors.backColor.withOpacity(.9)
                      ]),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 48,
                            color: ThemeColors.primaryColor.withOpacity(.7))
                      ]),
                  child: Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 3),
                        child: Container(
                          height: 2,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: ThemeColors.secondaryColor,
                                  blurRadius: 10)
                            ],
                            color: ThemeColors.secondaryColor,
                          ),
                          width: MediaQuery.maybeSizeOf(context)!.width / 2,
                        ),
                      ),
                      InkWell(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BlocProvider<SongBloc>(
                                      create: (context) => SongBloc()..add(initSongEvent()),
                                      child: const SongUi(),
                                    ))),
                        child: Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Row(
                              children: [
                                SizedBox(
                                  height: 50,
                                  width: 60,
                                  child: Image.asset(
                                      'assets/image/song.png',
                                    fit: BoxFit.cover,

                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const CustomTextWidget(text: 'Finally Found You'),
                                const Spacer(),
                                const Icon(Icons.pause,
                                    color: Colors.white, size: 30),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(Icons.skip_next,
                                    color: Colors.white, size: 30),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )),
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 14),
            child: Column(
              children: [
                const SizedBox(
                  height: 70,
                  child: Row(
                    children: [
                      CustomTextWidget(
                        text: 'ALL SONGS',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      Spacer(),
                      Icon(
                        Icons.search,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: songs.length,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) => Container(
                            margin: const EdgeInsets.symmetric(vertical: 6),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 7),
                            decoration: BoxDecoration(
                                color: index == 3
                                    ? Colors.white.withOpacity(.1)
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(11)),
                            child: ListTile(
                              contentPadding: EdgeInsets.zero,
                              title:  CustomTextWidget(
                                  text: songs[index].title,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                              subtitle:  Padding(
                                padding:const EdgeInsets.only(top: 4.0),
                                child: CustomTextWidget(
                                    text:songs[index].singer,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w300),
                              ),
                              trailing:  CustomTextWidget(
                                  text:songs[index].time,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w300),
                              leading: CircleAvatar(
                                backgroundColor: index == 3
                                    ? ThemeColors.secondaryColor
                                    : Colors.white,
                                maxRadius: 17,
                                child: Icon(
                                  index == 3 ? Icons.pause : Icons.play_arrow,
                                  size: 22,
                                  color: index == 3
                                      ? Colors.white
                                      : ThemeColors.secondaryColor,
                                ),
                              ),
                            ),
                          )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
