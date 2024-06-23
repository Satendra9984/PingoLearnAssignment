part of 'onboarding_cubit.dart';

class OnboardingState extends Equatable {
  final OnBoardingStates onBoardingStates;
  // final bool changed;
  const OnboardingState({
    required this.onBoardingStates,
    // this.changed = false,
  });

  OnboardingState copyWith({
    OnBoardingStates? onBoardingStates,
    bool? changed,
  }) {
    return OnboardingState(
      onBoardingStates: onBoardingStates ?? this.onBoardingStates,
      // changed: changed ?? this.changed,
    );
  }

  @override
  List<Object> get props => [
        onBoardingStates,
        // changed,
      ];
}
