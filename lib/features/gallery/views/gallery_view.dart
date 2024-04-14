import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:promina_task/features/gallery/view_model/gallery_cubit.dart';

import 'widgets/gallery_view_body.dart';

class GalleryView extends StatelessWidget {
  const GalleryView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GalleryCubit(),
      child: const Scaffold(
        body: SafeArea(child: GalleryViewBody()),
      ),
    );
  }
}
