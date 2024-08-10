import 'package:json_annotation/json_annotation.dart';

part 'surat.g.dart';

@JsonSerializable()
class Surat {
  final int nomor;
  final String nama;
  final String namaLatin;
  final int jumlahAyat;
  final String deskripsi;

  Surat({
    required this.nomor,
    required this.nama,
    required this.jumlahAyat,
    required this.namaLatin,
    required this.deskripsi,
  });

  factory Surat.fromJson(Map<String, dynamic> json) => _$SuratFromJson(json);
  Map<String, dynamic> toJson() => _$SuratToJson(this);
}
