// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_surat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailSurat _$DetailSuratFromJson(Map<String, dynamic> json) => DetailSurat(
      namaLatin: json['namaLatin'] as String,
      arti: json['arti'] as String,
      deskripsi: json['deskripsi'] as String,
      ayat: (json['ayat'] as List<dynamic>)
          .map((e) => Ayat.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DetailSuratToJson(DetailSurat instance) =>
    <String, dynamic>{
      'namaLatin': instance.namaLatin,
      'arti': instance.arti,
      'deskripsi': instance.deskripsi,
      'ayat': instance.ayat,
    };

Ayat _$AyatFromJson(Map<String, dynamic> json) => Ayat(
      nomorAyat: (json['nomorAyat'] as num).toInt(),
      teksIndonesia: json['teksIndonesia'] as String,
    );

Map<String, dynamic> _$AyatToJson(Ayat instance) => <String, dynamic>{
      'nomorAyat': instance.nomorAyat,
      'teksIndonesia': instance.teksIndonesia,
    };
