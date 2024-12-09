part of 'bloc.dart';

abstract class GetCompaniesEvent extends Equatable {
  const GetCompaniesEvent();

  @override
  List<Object> get props => [];
}

class GetCompanies extends GetCompaniesEvent {}
