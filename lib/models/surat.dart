import 'package:json_annotation/json_annotation.dart';

part 'surat.g.dart';

@JsonSerializable()
class Surat {
  final int nomor;
  final String nama;
  final int jumlahAyat;

  Surat({required this.nomor, required this.nama, required this.jumlahAyat});

  factory Surat.fromJson(Map<String, dynamic> json) => _$SuratFromJson(json);
  Map<String, dynamic> toJson() => _$SuratToJson(this);
}
