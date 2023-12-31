import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:music_app/modules/song/bloc/song_bloc.dart';
import 'package:music_app/theme/colors.dart';
import 'package:music_app/widgets/custom_button_widget.dart';
import 'package:music_app/widgets/custom_text_widget.dart';

class SongUi extends StatelessWidget {
  const SongUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ThemeColors.primaryColor,
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          backgroundColor: ThemeColors.primaryColor,
          body: Stack(
            children: [
              Image.asset(
                'assets/image/song_background.png',
                height: MediaQuery.sizeOf(context).height,
                width: MediaQuery.sizeOf(context).width,
                fit: BoxFit.cover,
              ),
              BlocBuilder<SongBloc, SongState>(
                builder: (context, state) {
                  SongBloc songBloc = context.read<SongBloc>();
                  return Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        height: 40,
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () => Navigator.pop(context),
                              child: const Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white,
                              ),
                            ),
                            const Spacer(),
                            const CustomTextWidget(
                              text: 'Now PLAYING',
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            const Spacer(),
                            const Icon(
                              Icons.search,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: MediaQuery.sizeOf(context).height / 12),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset(
                            'assets/image/wave.png',
                            fit: BoxFit.cover,
                          ),
                          Image.asset(
                            'assets/image/cover.png',
                            fit: BoxFit.cover,
                            height: 200,
                          )
                        ],
                      ),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const CustomButtonWidget(
                            text: 'FOLLOW',
                            icon: FontAwesomeIcons.heart,
                          ),
                          CustomButtonWidget(
                              text: 'SHUFFLE PLAY',
                              enableBorder: false,
                              icon: FontAwesomeIcons.shuffle,
                              buttonColor: ThemeColors.secondaryColor),
                        ],
                      ),
                      const Spacer(),
                      const CustomTextWidget(
                          text: 'Finally Found You',
                          fontWeight: FontWeight.bold,
                          fontSize: 19),
                      const SizedBox(height: 12),
                      const CustomTextWidget(
                        text: 'enrique iglesias',
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CustomTextWidget(
                                text: toDuration(
                                    songBloc.currentDuration ?? Duration()),
                                fontSize: 14),
                            Expanded(
                                child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: songBloc.currentDuration != null
                                  ? LinearProgressIndicator(
                                      value: ((songBloc.currentDuration!
                                                      .inSeconds +
                                                  songBloc.currentDuration!
                                                          .inMinutes *
                                                      60) /
                                              (songBloc.actuallyDuration!
                                                      .inSeconds +
                                                  songBloc.actuallyDuration!
                                                          .inMinutes *
                                                      60)) %
                                          100,
                                      color: ThemeColors.secondaryColor
                                          .withOpacity(.6),
                                      backgroundColor:
                                          Colors.white.withOpacity(.6))
                                  : const SizedBox(),
                            )),
                            CustomTextWidget(
                                text: toDuration(
                                    songBloc.actuallyDuration ?? const Duration()),
                                fontSize: 14)
                          ],
                        ),
                      ),
                      const SizedBox(height: 25),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.skip_previous,
                              color: Colors.white, size: 30),
                          const SizedBox(width: 15),
                          const Icon(Icons.fast_rewind,
                              color: Colors.white, size: 30),
                          const SizedBox(width: 15),
                          CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 40,
                              child: InkWell(
                                onTap: () {
                                  if (songBloc.player.playing) {
                                    songBloc.add(pauseSongEvent());
                                  } else {
                                    songBloc.add(playSongEvent());
                                  }
                                },
                                child: Icon(
                                    songBloc.player.playing == true
                                        ? Icons.pause
                                        : Icons.play_arrow,
                                    color: ThemeColors.backColor,
                                    size: 50),
                              )),
                          const SizedBox(width: 15),
                          const Icon(Icons.fast_forward,
                              color: Colors.white, size: 30),
                          const SizedBox(width: 15),
                          const Icon(Icons.skip_next,
                              color: Colors.white, size: 30),
                        ],
                      ),
                      const SizedBox(height: 20)
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

String toDuration(Duration duration) {
  String negativeSign = duration.isNegative ? '-' : '';
  String twoDigits(int n) => n.toString().padLeft(2, "0");
  String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60).abs());
  String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60).abs());
  return "$negativeSign${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
}
