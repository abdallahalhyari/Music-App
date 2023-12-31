import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:meta/meta.dart';

part 'song_event.dart';
part 'song_state.dart';

class SongBloc extends Bloc<SongEvent, SongState> {
  final player = AudioPlayer();
  Duration? currentDuration=null;
  Duration? actuallyDuration=null;
  SongBloc() : super(SongInitial()) {

    on<initSongEvent>((event, emit) async{
      actuallyDuration = (await player.setAsset(
          'assets/audio/song.mp3'))!;
      player.positionStream.listen((position) async{
        updateIndex(position);
      });

    });


    on<playSongEvent>((event, emit) async{
       player.play();
      emit(playedSongState());
    });

    on<pauseSongEvent>((event, emit) async{
       player.pause();
      emit(pausedSongState());
    });
  }
updateIndex(position){
  currentDuration=position;
  this.emit(IndexSongState());
}

}

