import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:quran/models/detail_surat.dart';
import '../bloc/surat_bloc.dart';
import '../bloc/surat_event.dart';
import '../bloc/surat_state.dart';
import '../services/api_service.dart';

class SuratDetailPage extends StatelessWidget {
  final int nomor;

  const SuratDetailPage({super.key, required this.nomor});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SuratBloc(ApiService())..add(FetchSuratDetail(nomor)),
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
                  HeaderSurat(detailSurat: detailSurat),
                  const SizedBox(height: 20),
                  Text('Ayat:', style: Theme.of(context).textTheme.titleLarge),
                  ...detailSurat.ayat.map((ayat) => Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text('Ayat ${ayat.nomorAyat}'),
                              Text(ayat.teksArab),
                              Text(ayat.teksIndonesia),
                              const SizedBox(
                                height: 5,
                              )
                            ],
                          )

                      //  ListTile(
                      //       title: Text('Ayat ${ayat.nomorAyat}'),
                      //       subtitle: Text(ayat.teksIndonesia),
                      //     ),

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

class HeaderSurat extends StatelessWidget {
  const HeaderSurat({
    super.key,
    required this.detailSurat,
  });

  final DetailSurat detailSurat;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          detailSurat.nama,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Colors.purple,
              ),
        ),
        Text(
          detailSurat.namaLatin,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Colors.purple,
              ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(detailSurat.arti),
        Text('Jumlah ayat : ${detailSurat.jumlahAyat.toString()}'),
        const SizedBox(
          height: 10,
        ),
        HtmlWidget(detailSurat.deskripsi),
      ],
    );
  }
}
