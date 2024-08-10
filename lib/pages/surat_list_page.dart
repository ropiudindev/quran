import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/pages/widgets/card_widget.dart';
import '../bloc/surat_bloc.dart';
import '../bloc/surat_event.dart';
import '../bloc/surat_state.dart';
import '../services/api_service.dart';

class SuratListPage extends StatefulWidget {
  const SuratListPage({super.key});

  @override
  State<SuratListPage> createState() => _SuratListPageState();
}

class _SuratListPageState extends State<SuratListPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SuratBloc(ApiService())..add(FetchSuratList()),
      child: Scaffold(
        appBar: AppBar(title: const Text('Daftar Surat')),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder<SuratBloc, SuratState>(
            builder: (context, state) {
              if (state is SuratLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is SuratLoaded) {
                final suratList = state.suratList;
                return ListView.builder(
                  itemCount: suratList.length,
                  itemBuilder: (context, index) {
                    final surat = suratList[index];
                    return CardWidget(
                      surat: surat,
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/detail',
                          arguments: surat.nomor,
                        );
                      },
                    );
                  },
                );
              } else if (state is SuratError) {
                return Center(child: Text('Error: ${state.message}'));
              } else {
                return const Center(child: Text('No data available'));
              }
            },
          ),
        ),
      ),
    );
  }
}
