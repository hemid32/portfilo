import 'package:flutter/material.dart';

class AnimatedRichText extends StatefulWidget {
  final List<TextSpan> listTextSpan ;
  final int repetitions;
  final bool alwaysRepetition ;

   AnimatedRichText({  this.repetitions = 1,  this.alwaysRepetition = true , required  this.listTextSpan });

  @override
  _AnimatedRichTextState createState() => _AnimatedRichTextState();
}

class _AnimatedRichTextState extends State<AnimatedRichText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<int> _textAnimation;
  int _currentIndex = 0;
  int _currentRepetition = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 5000),
      vsync: this,
    );
    _textAnimation = IntTween(begin: 0, end: getTotalLength()).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.linear,
      ),
    )..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _currentRepetition++;
        if (_currentRepetition == widget.repetitions && !widget.alwaysRepetition) {
          _controller.stop();
        } else {
          Future.delayed(const Duration(seconds: 3), () {
            _controller.reset();
            _currentIndex = 0;
            _controller.forward();
          });
        }
      }
    });
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _textAnimation,
      builder: (BuildContext context, Widget? child) {
        //List<TextSpan> textSpans = getAnimatedTextSpans();

        return RichText(
          text: TextSpan(

            children: getAnimatedTextSpans(),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  int getTotalLength() {
    int totalLength = 0;
    for (TextSpan textSpan in widget.listTextSpan) {
      totalLength += textSpan.text!.length;
    }
    return totalLength;
  }



  List<TextSpan> getAnimatedTextSpans() {
    List<TextSpan> animatedTextSpans = [];
    int currentIndex = 0;

    for (TextSpan textSpan in widget.listTextSpan) {
      int startIndex = currentIndex;
      int endIndex = startIndex + textSpan.text!.length;

      if (_textAnimation.value >= endIndex) {
        animatedTextSpans.add(textSpan);
      } else if (_textAnimation.value > startIndex) {
        TextSpan partialTextSpan = TextSpan(
          text: textSpan.text!.substring(0, _textAnimation.value - startIndex),
          style: textSpan.style,
        );

        animatedTextSpans.add(partialTextSpan);
      }

      currentIndex = endIndex;
    }

    return animatedTextSpans;
  }
}
