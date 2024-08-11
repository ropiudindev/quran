// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_surat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailSurat _$DetailSuratFromJson(Map<String, dynamic> json) => DetailSurat(
      nomor: (json['nomor'] as num).toInt(),
      nama: json['nama'] as String,
      namaLatin: json['namaLatin'] as String,
      jumlahAyat: (json['jumlahAyat'] as num).toInt(),
      tempatTurun: json['tempatTurun'] as String,
      arti: json['arti'] as String,
      deskripsi: json['deskripsi'] as String,
      audioFull: AudioFull.fromJson(json['audioFull'] as Map<String, dynamic>),
      ayat: (json['ayat'] as List<dynamic>)
          .map((e) => Ayat.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DetailSuratToJson(DetailSurat instance) =>
    <String, dynamic>{
      'nomor': instance.nomor,
      'nama': instance.nama,
      'namaLatin': instance.namaLatin,
      'jumlahAyat': instance.jumlahAyat,
      'tempatTurun': instance.tempatTurun,
      'arti': instance.arti,
      'deskripsi': instance.deskripsi,
      'audioFull': instance.audioFull.toJson(),
      'ayat': instance.ayat.map((e) => e.toJson()).toList(),
    };

AudioFull _$AudioFullFromJson(Map<String, dynamic> json) => AudioFull(
      audio01: json['01'] as String?,
    );

Map<String, dynamic> _$AudioFullToJson(AudioFull instance) => <String, dynamic>{
      '01': instance.audio01,
    };

Ayat _$AyatFromJson(Map<String, dynamic> json) => Ayat(
      nomorAyat: (json['nomorAyat'] as num).toInt(),
      teksArab: json['teksArab'] as String,
      teksLatin: json['teksLatin'] as String,
      teksIndonesia: json['teksIndonesia'] as String,
      audio: Audio.fromJson(json['audio'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AyatToJson(Ayat instance) => <String, dynamic>{
      'nomorAyat': instance.nomorAyat,
      'teksArab': instance.teksArab,
      'teksLatin': instance.teksLatin,
      'teksIndonesia': instance.teksIndonesia,
      'audio': instance.audio.toJson(),
    };

Audio _$AudioFromJson(Map<String, dynamic> json) => Audio(
      audio01: json['01'] as String?,
    );

Map<String, dynamic> _$AudioToJson(Audio instance) => <String, dynamic>{
      '01': instance.audio01,
    };
