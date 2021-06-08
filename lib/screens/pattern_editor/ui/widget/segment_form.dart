import 'package:flutter/material.dart';

class SegmentForm extends StatefulWidget {
  @override
  _SegmentFormState createState() => _SegmentFormState();
}

class _SegmentFormState extends State<SegmentForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        border: Border.all(width: 1, color: Colors.grey[350]),
        color: Colors.white,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(14)),
        child: SizedBox(
          width: 306,
          child: Row(
            children: List.generate(12, (index) => Segment()),
          ),
        ),
      ),
    );
    // return Container(
    //   decoration: BoxDecoration(
    //     borderRadius: BorderRadius.all(Radius.circular(15)),
    //     border: Border.all(width: 1, color: Colors.grey[350]),
    //     color: Colors.white,
    //   ),
    //   child: Row(
    //     children: [
    //       Segment(),
    //       Segment(),
    //       Segment(),
    //       Segment(),
    //       Segment(),
    //     ],
    //   ),
    // );
  }
}

enum SelectionState { full, halfLeft, halfRight, none }

class Segment extends StatefulWidget {
  @override
  _SegmentState createState() => _SegmentState();
}

class _SegmentState extends State<Segment> {
  final double SEGMENT_WIDTH = 25;
  final double SEGMENT_HEIGHT = 120;
  final BorderSide BORDER = BorderSide(color: Colors.grey, width: 0.25);

  SelectionState selectionState = SelectionState.none;

  _getSegmentColor() {
    switch (selectionState) {
      case SelectionState.none:
        return Colors.black;
      default:
        return Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => selectionState = (selectionState == SelectionState.full) ? SelectionState.none : SelectionState.full),
      onDoubleTap: () =>
          setState(() => selectionState = (selectionState == SelectionState.halfLeft) ? SelectionState.halfRight : SelectionState.halfLeft),
      child: selectionState == SelectionState.halfLeft || selectionState == SelectionState.halfRight
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                    decoration: BoxDecoration(
                      color: selectionState == SelectionState.halfLeft ? _getSegmentColor() : Colors.black,
                      border: Border(left: BORDER, top: BORDER, bottom: BORDER),
                    ),
                    child: SizedBox(height: SEGMENT_HEIGHT, width: SEGMENT_WIDTH / 2)),
                Container(
                    decoration: BoxDecoration(
                      color: selectionState == SelectionState.halfRight ? _getSegmentColor() : Colors.black,
                      border: Border(right: BORDER, top: BORDER, bottom: BORDER),
                    ),
                    child: SizedBox(height: SEGMENT_HEIGHT, width: SEGMENT_WIDTH / 2)),
              ],
            )
          : Container(
              decoration: BoxDecoration(
                color: _getSegmentColor(),
                border: Border.symmetric(vertical: BORDER),
              ),
              child: SizedBox(
                height: SEGMENT_HEIGHT,
                width: SEGMENT_WIDTH,
              ),
            ),
    );
  }
}
