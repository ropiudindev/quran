// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'surat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Surat _$SuratFromJson(Map<String, dynamic> json) => Surat(
      nomor: (json['nomor'] as num).toInt(),
      nama: json['nama'] as String,
      jumlahAyat: (json['jumlahAyat'] as num).toInt(),
    );

Map<String, dynamic> _$SuratToJson(Surat instance) => <String, dynamic>{
      'nomor': instance.nomor,
      'nama': instance.nama,
      'jumlahAyat': instance.jumlahAyat,
    };
