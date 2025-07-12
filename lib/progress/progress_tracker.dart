class ProgressTracker {
  static final ProgressTracker _instance = ProgressTracker._internal();

  factory ProgressTracker() => _instance;

  ProgressTracker._internal();

  int solvedQuestions = 0;
  int mockSessions = 0;
  double accuracyRate = 0.0;
  Set<String> coveredCategories = {};
  Duration totalTimeSpent = Duration.zero;

  void updateProgress({
    required int correctAnswers,
    required int totalQuestions,
    required String category,
    required Duration sessionTime,
  }) {
    solvedQuestions += totalQuestions;
    mockSessions += 1;
    accuracyRate =
        ((accuracyRate * (mockSessions - 1)) +
            (correctAnswers / totalQuestions * 100)) /
        mockSessions;

    coveredCategories.add(category);
    totalTimeSpent += sessionTime;
  }

  String get accuracyString => "${accuracyRate.toStringAsFixed(1)}%";

  String get categoryCoverage => "${coveredCategories.length}/7";

  String get timeSpentMinutes => "${totalTimeSpent.inMinutes} min";
}
