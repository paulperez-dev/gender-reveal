import 'package:auto_size_text/auto_size_text.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gender_reveal/extensions/extensions.dart';
import 'package:gender_reveal/home/bloc/home_bloc.dart';
import 'package:gender_reveal/l10n/l10n.dart';
import 'package:gender_reveal/models/question.dart';
import 'package:gender_reveal/reveal/reveal_screen.dart';
import 'package:revel_ui/revel_ui.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const routeName = '/home_screen';
  static final route = MaterialPageRoute<void>(
    builder: (context) => BlocProvider(
      create: (context) => HomeBloc()..add(HomeLoadQuestionsEvent()),
      child: const HomeScreen(),
    ),
  );

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final confettiController = ConfettiController(
    duration: const Duration(seconds: 1),
  );

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      backgroundColor: RUIColors.background,
      body: SizedBox(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            const RUIImageBackground(),
            BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state.tests.isEmpty) {
                  return const SmallLoader();
                }
                if (state.testCompleted) {
                  confettiController.play();
                }
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      _GameTitle(l10n: l10n),
                      _GameGrid(state: state),
                      if (!state.showQuestionCard && !state.testCompleted)
                        _GameInstructions(l10n: l10n),
                      if (state.showQuestionCard)
                        _QuestionCard(test: state.tests[state.testId]),
                      if (state.testCompleted) _NextButton(l10n: l10n),
                    ],
                  ),
                );
              },
            ),
            _Confetti(confettiController: confettiController),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    confettiController.dispose();
    super.dispose();
  }
}

class _GameTitle extends StatelessWidget {
  const _GameTitle({
    required this.l10n,
  });

  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: RUISpacing.xxxlg),
      child: SizedBox(
        width: 350,
        child: AutoSizeText(
          l10n.gameTitle,
          style: RUITextStyle.displayMedium,
          maxLines: 1,
          textAlign: TextAlign.start,
        ),
      ),
    );
  }
}

class _GameGrid extends StatelessWidget {
  const _GameGrid({required this.state});

  final HomeState state;

  @override
  Widget build(BuildContext context) {
    /// * I prefer better readability. Performance impact is negligible.
    Widget _mapPearls(Test test) {
      final pearlStatus = HomeBloc.flipControllers[test.id].controller?.status;
      final wasRevealed = pearlStatus == AnimationStatus.completed;

      void onTap() => context
          .read<HomeBloc>()
          .add(HomeShowQuestionCardEvent(testId: test.id));

      return RUIPearl(
        pearlGender: test.pearlGender,
        controller: HomeBloc.flipControllers[test.id],
        wasRevealed: wasRevealed,
        onTap: onTap,
      );
    }

    return RUICard(
      child: Stack(
        alignment: Alignment.center,
        children: [
          const RUIGrid(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: state.tests.getRange(0, 3).map(_mapPearls).toList(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: RUISpacing.xlg,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: state.tests.getRange(3, 6).map(_mapPearls).toList(),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: state.tests.getRange(6, 9).map(_mapPearls).toList(),
              ),
            ],
          ),
          if (state.testCompleted) const DiagonalLine(),
        ],
      ),
    );
  }
}

class _GameInstructions extends StatelessWidget {
  const _GameInstructions({
    required this.l10n,
  });

  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    return RUICard(
      color: RUIColors.softPink.withOpacity(0.8),
      margin: EdgeInsets.zero,
      padding: const EdgeInsets.symmetric(
        horizontal: RUISpacing.md,
        vertical: RUISpacing.xlg,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const FaIcon(
            FontAwesomeIcons.circleInfo,
            color: RUIColors.walnutBrown,
          ),
          const SizedBox(width: RUISpacing.md),
          Expanded(
            child: AutoSizeText(
              l10n.gameInstructions,
              maxLines: 2,
              minFontSize: 8,
              maxFontSize: 18,
              style: context.textTheme.titleMedium,
            ),
          ),
        ],
      ),
    );
  }
}

class _QuestionCard extends StatefulWidget {
  const _QuestionCard({required this.test});

  final Test test;

  @override
  State<_QuestionCard> createState() => _QuestionCardState();
}

class _QuestionCardState extends State<_QuestionCard>
    with TickerProviderStateMixin {
  String text = '';
  String selectedAnswer = '';
  bool badAnswer = true;
  bool hasResponded = false;
  Response response = Response.notAnswered;

  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 200),
    vsync: this,
  )..forward();
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  );
  late final AnimationController _offsetController = AnimationController(
    duration: const Duration(milliseconds: 400),
    vsync: this,
  )..forward();
  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: const Offset(0, 1),
    end: Offset.zero,
  ).animate(
    CurvedAnimation(
      parent: _offsetController,
      curve: Curves.elasticOut,
    ),
  );

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    if (!widget.test.answers.contains(selectedAnswer)) {
      selectedAnswer = '';
      badAnswer = true;
      hasResponded = false;
      response = Response.notAnswered;
      text = l10n.buttonConfirm;
      _controller
        ..reset()
        ..forward();
      _offsetController
        ..reset()
        ..forward();
    }
    return FadeTransition(
      opacity: _animation,
      child: SlideTransition(
        position: _offsetAnimation,
        child: RUICard(
          color: RUIColors.softPink.withOpacity(0.8),
          margin: const EdgeInsets.only(bottom: RUISpacing.lg),
          padding: const EdgeInsets.symmetric(
            horizontal: RUISpacing.md,
            vertical: RUISpacing.xlg,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(
                widget.test.question,
                maxLines: 2,
                maxFontSize: 24,
                style: RUITextStyle.titleMedium,
              ),
              const SizedBox(width: RUISpacing.md),
              ...widget.test.answers.map(
                (answer) {
                  final correctAnswer = widget.test.correctAnswer;

                  return RUIRadioListTile(
                    label: answer,
                    correctAnswerMessage: l10n.correctAnswerMessage,
                    currentValue: answer,
                    selectedAnswer: selectedAnswer,
                    hasResponded: hasResponded,
                    isCorrectAnswer:
                        correctAnswer.compareTo(selectedAnswer).isZero,
                    onChanged: (value) {
                      if (!hasResponded) {
                        setState(() {
                          selectedAnswer = value;
                        });
                      }
                    },
                  );
                },
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(RUISpacing.spaceUnit),
                  child: OutlinedButton(
                    style:
                        RUITheme.themeData.elevatedButtonTheme.style!.copyWith(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (states) => RUIColors.background,
                      ),
                    ),
                    onPressed: () {
                      if (response == Response.isCorrect) {
                        context
                            .read<HomeBloc>()
                            .add(HomeClosedQuestionCardEvent());
                        setState(() {});
                        return;
                      }
                      if (response == Response.isWrong) {
                        selectedAnswer = '';
                        badAnswer = true;
                        hasResponded = false;
                        response = Response.notAnswered;
                        text = l10n.buttonConfirm;
                        setState(() {});
                        return;
                      }
                      if (!widget.test.answers.contains(selectedAnswer)) {
                        return;
                      }

                      hasResponded = true;
                      if (selectedAnswer
                          .compareTo(widget.test.correctAnswer)
                          .isZero) {
                        response = Response.isCorrect;
                        text = l10n.buttonClose;
                        if (HomeBloc.flipControllers[widget.test.id].state
                                ?.isFront ??
                            false) {
                          HomeBloc.flipControllers[widget.test.id].toggleCard();

                          context.read<HomeBloc>().add(
                                HomeCountCorrectAnswerEvent(
                                  id: widget.test.id,
                                ),
                              );
                          final correctAnswers = context
                              .read<HomeBloc>()
                              .state
                              .correctPearlCounter;
                          if (correctAnswers + 1 == 3) {
                            context.read<HomeBloc>().add(
                                  HomeClosedQuestionCardEvent(),
                                );
                          }
                        }
                        setState(() {});
                      } else {
                        badAnswer = true;
                        response = Response.isWrong;
                        text = l10n.buttonRetry;
                      }
                      setState(() {});
                    },
                    child: Text(
                      text,
                      style: context.textTheme.headlineSmall,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _NextButton extends StatelessWidget {
  const _NextButton({
    required this.l10n,
  });

  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => context.navigator.pushReplacement(
        RevealScreen.route,
      ),
      style: ElevatedButton.styleFrom(backgroundColor: RUIColors.lightBlue),
      child: Text(
        l10n.buttonNext,
        style: context.textTheme.headlineLarge,
      ),
    );
  }
}

class _Confetti extends StatelessWidget {
  const _Confetti({required this.confettiController});

  final ConfettiController confettiController;

  @override
  Widget build(BuildContext context) {
    final path = Path()
      ..addOval(
        Rect.fromCircle(
          center: Offset.zero,
          radius: 10,
        ),
      );

    return Align(
      alignment: Alignment.topCenter,
      heightFactor: 0.5,
      widthFactor: 0.5,
      child: ConfettiWidget(
        confettiController: confettiController,
        emissionFrequency: 0.05,
        blastDirectionality: BlastDirectionality.explosive,
        gravity: 0.05,
        colors: const [
          RUIColors.soulBlue,
          RUIColors.lightBlue,
        ],
        createParticlePath: (_) => path,
      ),
    );
  }
}
