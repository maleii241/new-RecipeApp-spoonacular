import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:untitled7/models/failure.dart';
import 'package:untitled7/models/meal_plan.dart';
import 'package:untitled7/models/similar.dart';
import 'package:untitled7/models/type_model.dart';
import 'package:untitled7/repo/home_page_repo.dart';

part 'home_screen_event.dart';
part 'home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  HomeScreenBloc() : super(HomeScreenInitial());
  final repo = HomePageRepo();
  @override
  Stream<HomeScreenState> mapEventToState(
    HomeScreenEvent event,
  ) async* {
    if (event is LoadHomeScreen) {

        yield HomeScreenLoading();
        final mealplan = await repo.getMealPlanList();
        final breakfast = await repo.getBrackfast('breakfast', 3);
        final lunch = await repo.getBrackfast('lunch', 3);
        final drinks = await repo.getBrackfast('drinks', 3);
        final pizza = await repo.getBrackfast('pizza', 3);
        final burgers = await repo.getBrackfast('burgers', 3);
        final rice = await repo.getBrackfast('noodles', 3);
        final cake = await repo.getBrackfast('cake', 3);
        yield HomeScreenSuccess(
          nutrients: mealplan.nutrient,
          mealPlan: mealplan.list,
          breakfast: breakfast.list,
          lunch: lunch.list,
          drinks: drinks.list,
          pizza: pizza.list,
          burgers: burgers.list,
          rice: rice.list,
          cake: cake.list,
        );
      }
    }
  }

