import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../viewmodels/base_view_model.dart';

class BaseView<T extends BaseViewModel> extends StatefulWidget {
  final Widget Function(BuildContext context, T viewModel, Widget? child) builder;
  final T viewModel;
  final Widget? child;
  final Function(T)? onModelReady;

  const BaseView({
    super.key,
    required this.builder,
    required this.viewModel,
    this.child,
    this.onModelReady,
  });

  @override
  State<BaseView<T>> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseViewModel> extends State<BaseView<T>> {
  @override
  void initState() {
    super.initState();
    if (widget.onModelReady != null) {
      widget.onModelReady!(widget.viewModel);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (context) => widget.viewModel,
      child: Consumer<T>(
        builder: widget.builder,
        child: widget.child,
      ),
    );
  }
}