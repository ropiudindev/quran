import 'package:json_annotation/json_annotation.dart';

part 'detail_surat.g.dart';

@JsonSerializable()
class DetailSurat {
  final String namaLatin;
  final String arti;
  final String deskripsi;
  final List<Ayat> ayat;

  DetailSurat({
    required this.namaLatin,
    required this.arti,
    required this.deskripsi,
    required this.ayat,
  });

  factory DetailSurat.fromJson(Map<String, dynamic> json) =>
      _$DetailSuratFromJson(json);
  Map<String, dynamic> toJson() => _$DetailSuratToJson(this);
}

@JsonSerializable()
class Ayat {
  final int nomorAyat;
  final String teksIndonesia;

  Ayat({required this.nomorAyat, required this.teksIndonesia});

  factory Ayat.fromJson(Map<String, dynamic> json) => _$AyatFromJson(json);
  Map<String, dynamic> toJson() => _$AyatToJson(this);
}
