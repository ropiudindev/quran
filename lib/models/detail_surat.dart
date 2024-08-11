import 'package:json_annotation/json_annotation.dart';

part 'detail_surat.g.dart';

@JsonSerializable(explicitToJson: true)
class DetailSurat {
  final int nomor;
  final String nama;
  final String namaLatin;
  final int jumlahAyat;
  final String tempatTurun;
  final String arti;
  final String deskripsi;
  final AudioFull audioFull;
  final List<Ayat> ayat;

  DetailSurat({
    required this.nomor,
    required this.nama,
    required this.namaLatin,
    required this.jumlahAyat,
    required this.tempatTurun,
    required this.arti,
    required this.deskripsi,
    required this.audioFull,
    required this.ayat,
  });

  factory DetailSurat.fromJson(Map<String, dynamic> json) =>
      _$DetailSuratFromJson(json);

  Map<String, dynamic> toJson() => _$DetailSuratToJson(this);
}

@JsonSerializable()
class AudioFull {
  @JsonKey(name: '01')
  final String? audio01;

  AudioFull({
    this.audio01,
  });

  factory AudioFull.fromJson(Map<String, dynamic> json) =>
      _$AudioFullFromJson(json);

  Map<String, dynamic> toJson() => _$AudioFullToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Ayat {
  final int nomorAyat;
  final String teksArab;
  final String teksLatin;
  final String teksIndonesia;
  final Audio audio;

  Ayat({
    required this.nomorAyat,
    required this.teksArab,
    required this.teksLatin,
    required this.teksIndonesia,
    required this.audio,
  });

  factory Ayat.fromJson(Map<String, dynamic> json) => _$AyatFromJson(json);

  Map<String, dynamic> toJson() => _$AyatToJson(this);
}

@JsonSerializable()
class Audio {
  @JsonKey(name: '01')
  final String? audio01;

  Audio({
    this.audio01,
  });

  factory Audio.fromJson(Map<String, dynamic> json) => _$AudioFromJson(json);

  Map<String, dynamic> toJson() => _$AudioToJson(this);
}
