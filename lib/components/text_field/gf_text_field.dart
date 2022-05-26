import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GFTextField extends FormField<String>{
  GFTextField({
    Key? key,
    this.controller,
    this.initialValue,
    this.focusNode,
    this.decoration=const InputDecoration(),
    this.keyboardType=TextInputType.text,
    this.textCapitalization=TextCapitalization.none,
    this.textInputAction,
    this.style=const TextStyle(),
    this.strutStyle=const StrutStyle(),
    this.textDirection=TextDirection.ltr,
    this.textAlign=TextAlign.start,
    this.textAlignVertical=TextAlignVertical.center,
    this.autofocus=false,
    this.readOnly=false,
    this.toolbarOptions=const ToolbarOptions(copy: true,cut: true,paste: true,selectAll: true),
    this.showCursor,
    this.obscuringCharacter='.',
    this.obscureText=false,
    this.autocorrect=true,
    this.smartDashesType,
    this.smartQuotesType,
    this.enableSuggestions=true,
    this.autovalidate=true,
    this.maxLengthEnforced=MaxLengthEnforcement.none,
    this.maxLines=1,
    this.minLines=1,
    this.expands=false,
    this.maxLength,
    this.onChanged,
    this.onTap,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onSaved,
    this.validator,
    this.inputFormatters,
    this.enabled=true,
    this.cursorWidth=2.0,
    this.cursorHeight,
    this.cursorRadius,
    this.cursorColor,
    this.color,
    this.borderradius,
    this.keyboardAppearance,
    this.scrollPadding=const EdgeInsets.all(20),
    this.enableInteractiveSelection=true,
    this.buildCounter,
    this.scrollPhysics,
    this.autofillHints,
    this.autovalidateMode=AutovalidateMode.disabled
  }) : super(key:key,builder: (FormFieldState<String> field){
    final InputDecoration effectiveDecoration = (decoration ??
        const InputDecoration())
        .applyDefaults(Theme.of(field.context).inputDecorationTheme);
    // void onChangedHandler(String value) {
    //   if (onChanged != null) {
    //     onChanged(value);
    //   }
    //   field.didChange(value);
    // }
    return _GfTextFieldState(
        state: field,
           controller: controller,
          focusNode: focusNode,
          decoration:effectiveDecoration,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          style: style,
          strutStyle: strutStyle,
          initialValuex: initialValue??'',
          autovalidate: autovalidate,
          onSavedx: onSaved,
          validator: validator,
          color: color,
          borderradius: borderradius,
          autovalidateMode: autovalidateMode,
          textAlign: textAlign??TextAlign.start,
          textAlignVertical: textAlignVertical,
          textDirection: textDirection,
          textCapitalization: textCapitalization,
          autofocus: autofocus,
          toolbarOptions: toolbarOptions,
          readOnly: readOnly??false,
          showCursor: showCursor,
          obscuringCharacter: obscuringCharacter,
          obscureText: obscureText,
          autocorrect: autocorrect,
          smartDashesType: smartDashesType ??
              (obscureText
                  ? SmartDashesType.disabled
                  : SmartDashesType.enabled),
          smartQuotesType: smartQuotesType ??
              (obscureText
                  ? SmartQuotesType.disabled
                  : SmartQuotesType.enabled),
          enableSuggestions: enableSuggestions,
          maxLengthEnforced: maxLengthEnforced,
          maxLines: maxLines,
          minLines: minLines,
          expands: (maxLines==null && minLines==null)||false,
          maxLength: maxLength,
          onChanged: onChanged,
          onTap: onTap,
          onEditingComplete: onEditingComplete,
          onFieldSubmitted: onFieldSubmitted,
          inputFormatters: inputFormatters,
          enabled: enabled,
          cursorWidth: cursorWidth??1,
          cursorHeight: cursorHeight,
          cursorRadius: cursorRadius,
          cursorColor: cursorColor,
          scrollPadding: scrollPadding,
          scrollPhysics: scrollPhysics,
          keyboardAppearance: keyboardAppearance,
          enableInteractiveSelection: enableInteractiveSelection,
          buildCounter: buildCounter,
          autofillHints: autofillHints,

    );
      });


  final TextEditingController? controller;
  @override
  final String? initialValue;
  final FocusNode? focusNode;
  final InputDecoration? decoration;
  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization ;
  final TextInputAction? textInputAction;
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextDirection? textDirection;
  final TextAlign? textAlign ;
  final TextAlignVertical? textAlignVertical;
  final bool autofocus ;
  final bool? readOnly ;
  final ToolbarOptions? toolbarOptions;
  final bool? showCursor;
  final String obscuringCharacter;
  final bool obscureText;
  final bool autocorrect;
  final SmartDashesType? smartDashesType;
  final SmartQuotesType? smartQuotesType;
  final bool enableSuggestions;
  final bool? autovalidate;
  final MaxLengthEnforcement maxLengthEnforced;
  final int? maxLines;
  final int? minLines;
  final bool expands;
  final int? maxLength;
  final ValueChanged<String>? onChanged;
  final GestureTapCallback? onTap;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onFieldSubmitted;
  @override
  final FormFieldSetter<String>? onSaved;
  @override
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormatters;
  @override
  final bool enabled;
  final double? cursorWidth ;
  final double? cursorHeight;
  final Radius? cursorRadius;
  final Color? cursorColor;
  final Color? color;
  final Radius? borderradius;
  final Brightness? keyboardAppearance;
  final EdgeInsets scrollPadding ;
  final bool enableInteractiveSelection;
  final InputCounterWidgetBuilder? buildCounter;
  final ScrollPhysics? scrollPhysics;
  final Iterable<String>? autofillHints;
  @override
  final AutovalidateMode autovalidateMode;


}

class _GfTextFieldState extends StatefulWidget {

  const _GfTextFieldState({
    required this.state,
    this.controller,
    this.initialValuex = '',
    this.focusNode,
    this.decoration = const InputDecoration(hintText: 'Default style'),
    this.keyboardType = TextInputType.text,
    this.textCapitalization = TextCapitalization.none,
    this.textInputAction,
    this.style = const TextStyle(),
    this.strutStyle = const StrutStyle(),
    this.textDirection = TextDirection.ltr,
    this.textAlign = TextAlign.start,
    this.textAlignVertical = TextAlignVertical.center,
    this.autofocus = false,
    this.readOnly = false,
    this.toolbarOptions = const ToolbarOptions(
        copy: true, cut: true, paste: true, selectAll: true),
    this.showCursor,
    this.obscuringCharacter = '.',
    this.obscureText = false,
    this.autocorrect = true,
    this.smartDashesType,
    this.smartQuotesType,
    this.enableSuggestions = true,
    this.autovalidate = true,
    this.maxLengthEnforced = MaxLengthEnforcement.none,
    this.maxLines = 1,
    this.minLines = 1,
    this.expands = true,
    this.maxLength,
    this.onChanged,
    this.onTap,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onSavedx,
    this.validator,
    this.inputFormatters,
    this.enabled = true,
    this.cursorWidth = 2.0,
    this.cursorHeight,
    this.cursorRadius,
    this.cursorColor,
    this.color,
    this.borderradius,
    this.keyboardAppearance,
    this.scrollPadding = const EdgeInsets.all(20),
    this.enableInteractiveSelection = true,
    this.buildCounter,
    this.scrollPhysics,
    this.autofillHints,
    this.autovalidateMode = AutovalidateMode.disabled
  });

  final FormFieldState<String> state;
  final TextEditingController? controller;
  final String initialValuex;
  final FocusNode? focusNode;
  final InputDecoration? decoration;
  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization;
  final TextInputAction? textInputAction;
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextDirection? textDirection;
  final TextAlign? textAlign;
  final TextAlignVertical? textAlignVertical;
  final bool autofocus;
  final bool? readOnly;
  final ToolbarOptions? toolbarOptions;
  final bool? showCursor;
  final String obscuringCharacter;
  final bool obscureText;
  final bool autocorrect;
  final SmartDashesType? smartDashesType;
  final SmartQuotesType? smartQuotesType;
  final bool enableSuggestions;
  final bool? autovalidate;
  final MaxLengthEnforcement maxLengthEnforced;
  final int? maxLines;
  final int? minLines;
  final bool expands;
  final int? maxLength;
  final ValueChanged<String>? onChanged;
  final GestureTapCallback? onTap;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onFieldSubmitted;
  final FormFieldSetter<String>? onSavedx;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormatters;
  final bool enabled;
  final double? cursorWidth;

  final double? cursorHeight;
  final Radius? cursorRadius;
  final Color? cursorColor;
  final Color? color;
  final Radius? borderradius;
  final Brightness? keyboardAppearance;
  final EdgeInsets scrollPadding;

  final bool enableInteractiveSelection;
  final InputCounterWidgetBuilder? buildCounter;
  final ScrollPhysics? scrollPhysics;
  final Iterable<String>? autofillHints;
  final AutovalidateMode autovalidateMode;

  @override
  State<_GfTextFieldState> createState() => _GfTextFieldStateState();
}

class _GfTextFieldStateState extends State<_GfTextFieldState>{

  TextEditingController controller=TextEditingController();


  @override
  void initState(){

    controller.text=widget.state.value.toString();
    super.initState();
  }

        @override
        Widget build(BuildContext context) =>
           Container(
            child: TextField(
              controller: widget.controller??controller,
              focusNode: widget.focusNode,
              decoration: widget.decoration,
              keyboardType: widget.keyboardType,
              textInputAction: widget.textInputAction,
              style: widget.style,
              strutStyle: widget.strutStyle,
              textAlign: widget.textAlign ?? TextAlign.start,
              textAlignVertical: widget.textAlignVertical,
              textDirection: widget.textDirection,
              textCapitalization: widget.textCapitalization,
              autofocus: widget.autofocus,
              toolbarOptions: widget.toolbarOptions,
              readOnly: widget.readOnly ?? false,
              showCursor: widget.showCursor,
              obscuringCharacter: widget.obscuringCharacter,
              obscureText: widget.obscureText,
              autocorrect: widget.autocorrect,
              smartDashesType: widget.smartDashesType ??
                  (widget.obscureText
                      ? SmartDashesType.disabled
                      : SmartDashesType.enabled),
              smartQuotesType: widget.smartQuotesType ??
                  (widget.obscureText
                      ? SmartQuotesType.disabled
                      : SmartQuotesType.enabled),
              enableSuggestions: widget.enableSuggestions,
              maxLengthEnforcement: widget.maxLengthEnforced,
              maxLines: widget.maxLines,
              minLines: widget.minLines,
              expands: (widget.maxLines != null && widget.minLines != null) || true,
              maxLength: widget.maxLength,
              onChanged: widget.onChanged,
              onTap: widget.onTap,
              onEditingComplete: widget.onEditingComplete,
              onSubmitted: widget.onFieldSubmitted,
              inputFormatters: widget.inputFormatters,
              enabled: (widget.maxLines==null&&widget.minLines==null)||false,
              cursorWidth: widget.cursorWidth ?? 1,
              cursorHeight: widget.cursorHeight,
              cursorRadius: widget.cursorRadius,
              cursorColor: widget.cursorColor,
              scrollPadding: widget.scrollPadding,
              scrollPhysics: widget.scrollPhysics,
              keyboardAppearance: widget.keyboardAppearance,
              enableInteractiveSelection: widget.enableInteractiveSelection,
              buildCounter: widget.buildCounter,
              autofillHints: widget.autofillHints,
            ),
          );
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

    }
