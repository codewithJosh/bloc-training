import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/controller/blocs/company/bloc.dart';

class CompanyView extends StatefulWidget {
  const CompanyView({super.key});

  @override
  State<CompanyView> createState() => _CompanyViewState();
}

class _CompanyViewState extends State<CompanyView> {
  String message = 'Welcome user';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          BlocBuilder<GetCompaniesBloc, GetCompaniesState>(
            builder: (_, state) {
              if (state is GetCompaniesLoading) {
                message = 'Loading...';
              }
              if (state is GetCompaniesSuccess) {
                message = state.companies.toString();
              }
              if (state is GetCompaniesFailure) {
                message = state.message;
              }
              return Text(
                message,
              );
            },
          ),
          ElevatedButton(
            onPressed: () {
              context.read<GetCompaniesBloc>().add(GetCompanies());
            },
            child: const Text(
              'Get Companies',
            ),
          )
        ],
      )),
    );
  }
}
