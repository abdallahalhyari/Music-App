part of 'song_bloc.dart';

@immutable
abstract class SongState {}

class SongInitial extends SongState {}

class playedSongState extends SongState{}

class pausedSongState extends SongState{}

class IndexSongState extends SongState{}