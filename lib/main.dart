import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interactive_video/bloc/app_bloc.dart';
import 'package:interactive_video/data/data.dart';
import 'package:interactive_video/models/entity/entity.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppBloc(
        Data(),
      )..add(InitializeSession()),
      child: MaterialApp(
        title: 'Interactive Video',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(
      Uri.parse(''),
    )..initialize().then((value) {
        setState(() {});
      });
    startPositionStream();
  }

  // void videoListener() {
  //   _controller.position.asStream().listen((event) async {
  //     print('//');
  //     if (mounted) {
  //       context.read<AppBloc>().add(
  //             RuntimeBroker(
  //               position: (event?.inSeconds ?? 0).toDouble(),
  //             ),
  //           );
  //     }
  //   });
  // }

  void startPositionStream() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      final position = await _controller.position;
      if (mounted) {
        context.read<AppBloc>().add(
              RuntimeBroker(
                position: (position?.inSeconds ?? 0).toDouble(),
              ),
            );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Interactive Video'),
      ),
      body: BlocConsumer<AppBloc, AppState>(
        listener: (context, state) async {
          final activeVideo =
              state.session?.entities[state.currentIndex].mediaLink;
          if (_controller.dataSource != activeVideo) {
            _controller = VideoPlayerController.networkUrl(
              Uri.parse(
                activeVideo ?? '',
              ),
            );

            await _controller.initialize();
            _controller.play();
          }
        },
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 300,
                width: MediaQuery.of(context).size.width,
                child: VideoPlayer(_controller),
              ),
              if (state.showChoices &&
                  (state.session?.entities[state.currentIndex].choices ??
                          <Entity>[])
                      .isNotEmpty)
                Row(
                  children: (state.session!.entities[state.currentIndex])
                      .choices!
                      .asMap()
                      .entries
                      .map(
                        (e) => ElevatedButton(
                          onPressed: () {
                            context
                                .read<AppBloc>()
                                .add(ChoiceSelection(entity: e.value));
                          },
                          child: Text(
                            e.value.title,
                          ),
                        ),
                      )
                      .toList(),
                ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(state.currentPosition.toString()),
                    Text(state.currentVideoSeek.toString()),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
