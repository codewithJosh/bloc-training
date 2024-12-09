part of 'bloc.dart';

abstract class GetCompaniesState extends Equatable {
  const GetCompaniesState();

  @override
  List<Object> get props => [];
}

class GetCompaniesInitial extends GetCompaniesState {}

class GetCompaniesLoading extends GetCompaniesState {}

class GetCompaniesSuccess extends GetCompaniesState {
  final List<Company> companies;

  const GetCompaniesSuccess({
    required this.companies,
  });
}

class GetCompaniesFailure extends GetCompaniesState {
  final String message;

  const GetCompaniesFailure({
    required this.message,
  });
}
