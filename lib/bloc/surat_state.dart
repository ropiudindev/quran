import '../models/surat.dart';
import '../models/detail_surat.dart';

abstract class SuratState {}

class SuratInitial extends SuratState {}

class SuratLoading extends SuratState {}

class SuratLoaded extends SuratState {
  final List<Surat> suratList;

  SuratLoaded(this.suratList);
}

class SuratDetailLoaded extends SuratState {
  final DetailSurat detailSurat;

  SuratDetailLoaded(this.detailSurat);
}

class SuratError extends SuratState {
  final String message;

  SuratError(this.message);
}
