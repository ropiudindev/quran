import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:quran/models/detail_surat.dart';
import '../bloc/surat_bloc.dart';
import '../bloc/surat_event.dart';
import '../bloc/surat_state.dart';
import '../services/api_service.dart';

class SuratDetailPage extends StatefulWidget {
  final int nomor;

  const SuratDetailPage({super.key, required this.nomor});

  @override
  State<SuratDetailPage> createState() => _SuratDetailPageState();
}

class _SuratDetailPageState extends State<SuratDetailPage> {
  final audioPlayer = AudioPlayer();
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    audioPlayer.onPlayerComplete.listen((_) {
      setState(() {
        isPlaying = false;
      });
    });
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    isPlaying = false;
    super.dispose();
  }

  void _playPause(String currentFile) async {
    if (isPlaying) {
      await audioPlayer.pause();
    } else {
      await audioPlayer.play(UrlSource(currentFile));
    }

    setState(() {
      isPlaying = !isPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SuratBloc(ApiService())..add(FetchSuratDetail(widget.nomor)),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Detail Surat'),
          backgroundColor: Colors.purple,
        ),
        body: BlocBuilder<SuratBloc, SuratState>(
          builder: (context, state) {
            if (state is SuratLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is SuratDetailLoaded) {
              final detailSurat = state.detailSurat;
              return ListView(
                padding: const EdgeInsets.all(8),
                children: [
                  HeaderSurat(
                    detailSurat: detailSurat,
                    isPlaying: isPlaying,
                    onTap: () async {
                      _playPause(
                        detailSurat.audioFull.audio01 ?? '',
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  Text('Ayat:', style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 10),
                  ...detailSurat.ayat.map(
                    (ayat) => AyatWidget(
                      ayat: ayat,
                    ),
                  ),
                ],
              );
            } else if (state is SuratError) {
              return Center(child: Text('Error: ${state.message}'));
            } else {
              return const Center(child: Text('No data available'));
            }
          },
        ),
      ),
    );
  }
}

class AyatWidget extends StatelessWidget {
  final Ayat ayat;
  const AyatWidget({
    super.key,
    required this.ayat,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(
              color: const Color.fromRGBO(220, 233, 245, 1),
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Ayat ${ayat.nomorAyat}',
                textAlign: TextAlign.end,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                ayat.teksArab,
                textAlign: TextAlign.end,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Colors.purple,
                    ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                ayat.teksIndonesia,
                textAlign: TextAlign.start,
              ),
              const SizedBox(
                height: 5,
              )
            ],
          ),
        ),
        const SizedBox(
          height: 10.0,
        )
      ],
    );
  }
}

class HeaderSurat extends StatefulWidget {
  const HeaderSurat({
    super.key,
    required this.detailSurat,
    required this.onTap,
    required this.isPlaying,
  });

  final DetailSurat detailSurat;
  final Function() onTap;
  final bool isPlaying;

  @override
  State<HeaderSurat> createState() => _HeaderSuratState();
}

class _HeaderSuratState extends State<HeaderSurat> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.detailSurat.nama,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Colors.purple,
              ),
        ),
        Text(
          widget.detailSurat.namaLatin,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Colors.purple,
              ),
        ),
        const SizedBox(
          height: 10,
        ),
        GestureDetector(
          onTap: widget.onTap,
          child: Container(
            width: 37,
            height: 37,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color.fromRGBO(221, 40, 81, 0.18),
            ),
            child: Center(
              child: Icon(
                !widget.isPlaying ? Icons.play_arrow : Icons.pause_circle,
                color: Colors.purple,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(widget.detailSurat.arti),
        Text('Jumlah ayat : ${widget.detailSurat.jumlahAyat.toString()}'),
        const SizedBox(
          height: 10,
        ),
        HtmlWidget(widget.detailSurat.deskripsi),
      ],
    );
  }
}
