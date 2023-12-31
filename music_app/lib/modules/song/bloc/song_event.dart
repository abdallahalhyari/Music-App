part of 'song_bloc.dart';

@immutable
abstract class SongEvent {}


class playSongEvent extends SongEvent{}

class pauseSongEvent extends SongEvent{}

class initSongEvent extends SongEvent{}