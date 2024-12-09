import 'dart:developer';

import 'package:company_repository/company_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'event.dart';
part 'state.dart';

class GetCompaniesBloc extends Bloc<GetCompaniesEvent, GetCompaniesState> {
  final CompanyRepository _companyRepository;

  GetCompaniesBloc({
    required HTTPCompanyRepository companyRepository,
  })  : _companyRepository = companyRepository,
        super(GetCompaniesInitial()) {

    on<GetCompanies>((event, emit) async {

      emit(GetCompaniesLoading());

      try {

        final List<Company> companies = await _companyRepository.getCompanies();
        
        emit(GetCompaniesSuccess(companies: companies));

      } catch (e) {
        log(e.toString());
        emit(GetCompaniesFailure(message: e.toString()));
      }
    });

    

  }
}
