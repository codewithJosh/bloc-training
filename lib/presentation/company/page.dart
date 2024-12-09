import 'package:company_repository/company_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/controller/blocs/company/bloc.dart';
import 'package:test_project/presentation/company/view.dart';

class CompanyPage extends StatelessWidget {
  const CompanyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => GetCompaniesBloc(
            companyRepository: HTTPCompanyRepository(),
          ),
        ),
      ],
      child: const CompanyView(),
    );
  }
}
