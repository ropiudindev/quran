abstract class SuratEvent {}

class FetchSuratList extends SuratEvent {}

class FetchSuratDetail extends SuratEvent {
  final int nomor;

  FetchSuratDetail(this.nomor);
}
