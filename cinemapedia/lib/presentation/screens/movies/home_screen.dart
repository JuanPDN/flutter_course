import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:cinemapedia/presentation/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      body: const _HomeView(),
      bottomNavigationBar: const CustomNavigationBar(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(populaMoviesProvider.notifier).loadNextPage();
    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
    ref.read(upComingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final popularMovies = ref.watch(populaMoviesProvider);
    final topRatedMovies = ref.watch(topRatedMoviesProvider);
    final upComingMovies = ref.watch(upComingMoviesProvider);
    final slideShowMovies = ref.watch(moviesSlideshowProvider);

    return CustomScrollView(slivers: [
      const SliverAppBar(
        floating: true,
        flexibleSpace: FlexibleSpaceBar(
          titlePadding: EdgeInsets.zero,
          title: CustomAppbar(),
        ),
      ),
      SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
        return Column(
          children: [
            //const CustomAppbar(),
            MoviesSlideShow(movies: slideShowMovies),
            MovieHorizontalListView(
              loadNextPage: () =>
                  ref.read(nowPlayingMoviesProvider.notifier).loadNextPage(),
              movies: nowPlayingMovies,
              title: 'En cines',
              subTitle: 'Lunes 22',
            ),
            MovieHorizontalListView(
              loadNextPage: () =>
                  ref.read(upComingMoviesProvider.notifier).loadNextPage(),
              movies: upComingMovies,
              title: 'Proximamente',
              subTitle: 'En este mes',
            ),
            MovieHorizontalListView(
              loadNextPage: () =>
                  ref.read(populaMoviesProvider.notifier).loadNextPage(),
              movies: popularMovies,
              title: 'Populares',
            ),
            MovieHorizontalListView(
              loadNextPage: () =>
                  ref.read(topRatedMoviesProvider.notifier).loadNextPage(),
              movies: topRatedMovies,
              title: 'Mejor Calificadas',
              subTitle: 'Desde Siempre',
            ),
            const SizedBox(
              height: 50,
            )
          ],
        );
      }, childCount: 1))
    ]);
  }
}
