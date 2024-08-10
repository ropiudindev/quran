import 'package:flutter_bloc/flutter_bloc.dart';
import '../services/api_service.dart';
import 'surat_event.dart';
import 'surat_state.dart';

class SuratBloc extends Bloc<SuratEvent, SuratState> {
  final ApiService apiService;

  SuratBloc(this.apiService) : super(SuratInitial()) {
    on<FetchSuratList>(_onFetchSuratList);
    on<FetchSuratDetail>(_onFetchSuratDetail);
  }

  Future<void> _onFetchSuratList(
      FetchSuratList event, Emitter<SuratState> emit) async {
    emit(SuratLoading());
    try {
      final suratList = await apiService.fetchSuratList();
      emit(SuratLoaded(suratList));
    } catch (e) {
      emit(SuratError(e.toString()));
    }
  }

  Future<void> _onFetchSuratDetail(
      FetchSuratDetail event, Emitter<SuratState> emit) async {
    emit(SuratLoading());
    try {
      final detailSurat = await apiService.fetchSuratDetail(event.nomor);
      emit(SuratDetailLoaded(detailSurat));
    } catch (e) {
      emit(SuratError(e.toString()));
    }
  }
}
