import '../model/quiz_model.dart';

class SampleData {
  static final List<QuizModel> quizQuestionList = [
    QuizModel(
        question: 'Which of the following is true regarding Flutter?',
        options: [
          'Flutter is a UI toolkit for creating fast, beautiful, natively compiled mobile applications',
          ' Flutter use one programming language and a single codebase',
          ' Flutter is free and open-source.',
          ' All of the above'
        ],
        answerIndex: 3),
    QuizModel(
        question: 'Flutter developed by?',
        options: ['Oracle', 'Facebook', 'Google', 'IBM'],
        answerIndex: 2),
    QuizModel(
        question: 'Which programming language is used for Flutter development?',
        options: ['Java', 'Swift', 'Dart', 'Python'],
        answerIndex: 2),
    QuizModel(
        question: 'What is the purpose of the Flutter Engine?',
        options: [
          'To compile Dart code to machine code',
          'To provide a library of pre-built widgets',
          'To manage the state of the application',
          'To handle HTTP requests'
        ],
        answerIndex: 0),
    QuizModel(
        question: 'What is a widget in Flutter?',
        options: [
          'A visual element in the user interface',
          'A block of code that performs a specific task',
          'A method for handling user input',
          'A type of data structure'
        ],
        answerIndex: 0),
    QuizModel(
        question:
            'Which widget is used to create a text input field in Flutter?',
        options: [
          'TextField',
          'Text',
          'TextInput',
          'InputField',
        ],
        answerIndex: 0),
    QuizModel(
        question: 'What is the purpose of the setState() method in Flutter?',
        options: [
          'To create a new widget',
          'To manage the state of the application',
          'To handle user input',
          'To define the layout of the user interface',
        ],
        answerIndex: 1),
    QuizModel(
        question: 'Which widget is used to display an image in Flutter?',
        options: [
          'ImageField',
          'ImageWidget',
          'Image',
          'ImageView',
        ],
        answerIndex: 2),
    QuizModel(
        question: 'Which widget is used to create a drawer in Flutter?',
        options: [
          'DrawerWidget',
          'DrawerLayout',
          'Drawer',
          'NavigationDrawer',
        ],
        answerIndex: 2),
    QuizModel(
        question: 'Which widget is used to create a list in Flutter?',
        options: ['ListView', 'ListWidget', 'ListLayout', 'ListContainer'],
        answerIndex: 0),
  ];
}
