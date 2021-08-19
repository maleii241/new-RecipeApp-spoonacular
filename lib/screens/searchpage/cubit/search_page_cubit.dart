import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:untitled7/models/search_autocomplete_model.dart';
import 'package:untitled7/repo/search_repo.dart';

part 'search_page_state.dart';

class SearchPageCubit extends Cubit<SearchPageState> {
  SearchPageCubit() : super(SearchPageState.initial());
  final repo = SearchRepo();
  void textChange(String text) async {
    emit(state.copyWith(status: Status.loading, searchText: text));
    final list = await repo.getAutoCompleteList(text);
    emit(state.copyWith(status: Status.success, searchList: list.list));
  }
}
