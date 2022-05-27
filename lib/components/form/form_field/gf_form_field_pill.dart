

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:getwidget/components/text_field/gf_text_field.dart';
import 'package:getwidget/types/gf_form_field_type.dart';

class GfFormFieldPill extends StatefulWidget{
  const GfFormFieldPill({
    Key? key,
    required this.gfFormFieldType,
    required this.editingbordercolor,
    required this.idlebordercolor,
    required this.borderwidth,
    required this.hintText,
    this.backgroundcolor,
    this.normalbordercolor=Colors.grey,
    this.focusedbordercolor=Colors.green,
    this.errorbordercolor=Colors.red,
    this.disabledbordercolor=Colors.black,
    this.iconPrefix,
    this.paddingvertical=3,
    this.paddinghorizontal=4,
    this.marginvertical=3,
    this.marginhorizontal=4,
    this.controller,
    this.initialValue='',
    this.focusNode,
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

  }) :super(key: key);
  final GfFormFieldType gfFormFieldType;
  final Color normalbordercolor;
  final Color editingbordercolor;
  final Color focusedbordercolor;
  final Color errorbordercolor;
  final Color idlebordercolor;
  final Color disabledbordercolor;
  final double borderwidth;
  final double paddingvertical;
  final double paddinghorizontal;
  final double marginvertical;
  final double marginhorizontal;
  final Color? backgroundcolor;
  final String hintText;
  final Widget? iconPrefix;
  final TextEditingController? controller;
  final String initialValue;
  final FocusNode? focusNode;
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
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormatters;
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
  final AutovalidateMode autovalidateMode;


  @override
  _GfFormFieldPillState createState()=> _GfFormFieldPillState();
}

class _GfFormFieldPillState extends State<GfFormFieldPill> with AutomaticKeepAliveClientMixin{


  @override
  Widget build(BuildContext context) {
    super.build(context);
    return getFormWidget(widget.gfFormFieldType);}


 Widget getFormWidget(GfFormFieldType type){
   Widget retwidget=Container();
   switch(type){
     case GfFormFieldType.Name:
       retwidget= Container(
           margin: EdgeInsets.symmetric(vertical: widget.marginvertical,
               horizontal: widget.marginhorizontal),
           padding: EdgeInsets.symmetric(vertical: widget.paddingvertical,
               horizontal: widget.paddinghorizontal),
           child:
           GFTextField(
               decoration: InputDecoration(
                 filled:widget.backgroundcolor!=null||false,
                 // icon: widget.iconPrefix,
                 prefixIcon: widget.iconPrefix,
                 // prefix: widget.iconPrefix,
                 fillColor: widget.backgroundcolor,
                 hintText: widget.hintText,
                 border: OutlineInputBorder(
                   borderSide: BorderSide(
                     color: widget.normalbordercolor,
                     width: widget.borderwidth,
                   ),
                   borderRadius: BorderRadius.circular(50),
                 ),
                 focusedBorder: OutlineInputBorder(
                   borderSide: BorderSide(
                     color: widget.editingbordercolor,
                     width: widget.borderwidth,
                   ),
                   borderRadius: BorderRadius.circular(50),
                 ),
                 disabledBorder: OutlineInputBorder(
                   borderSide: BorderSide(
                     color: widget.disabledbordercolor,
                     width: widget.borderwidth,
                   ),
                   borderRadius: BorderRadius.circular(50),
                 ),
                 errorBorder: OutlineInputBorder(
                   borderSide: BorderSide(
                     color: widget.errorbordercolor,
                     width: widget.borderwidth,
                   ),
                   borderRadius: BorderRadius.circular(50),
                 ),
                 enabledBorder: OutlineInputBorder(
                   borderSide: BorderSide(
                     color: widget.idlebordercolor,
                     width: widget.borderwidth,
                   ),
                   borderRadius: BorderRadius.circular(50),
                 ),
                 focusedErrorBorder: OutlineInputBorder(
                   borderSide: BorderSide(
                     color: widget.errorbordercolor,
                     width: widget.borderwidth,
                   ),
                   borderRadius: BorderRadius.circular(50),
                 ),
               ),
               controller: widget.controller,
               initialValue: widget.initialValue,
               focusNode: widget.focusNode,
               keyboardType: TextInputType.name,
               textCapitalization: TextCapitalization.words,
               textInputAction: widget.textInputAction,
               style: widget.style,
               strutStyle: widget.strutStyle,
               textDirection: widget.textDirection,
               textAlign: widget.textAlign,
               textAlignVertical: widget.textAlignVertical,
               autofocus: widget.autofocus,
               readOnly: widget.readOnly,
               toolbarOptions: widget.toolbarOptions,
               showCursor: widget.showCursor,
               obscuringCharacter: widget.obscuringCharacter,
               obscureText: widget.obscureText,
               autocorrect: widget.autocorrect,
               smartDashesType: widget.smartDashesType,
               smartQuotesType: widget.smartQuotesType,
               enableSuggestions: widget.enableSuggestions,
               autovalidate: widget.autovalidate,
               maxLengthEnforced: widget.maxLengthEnforced,
               maxLines: widget.maxLines,
               minLines: widget.minLines,
               expands: widget.expands,
               maxLength: widget.maxLength,
               onChanged: widget.onChanged,
               onTap: widget.onTap,
               onEditingComplete: widget.onEditingComplete,
               onFieldSubmitted: widget.onFieldSubmitted,
               onSaved: widget.onSaved,
               validator: (value) {
                 if (value == null || value.isEmpty) {
                   return 'Please enter Name';
                 }
                 else if(value.length<6 ){
                   return 'Name should be 6 characters or more';
                 }
                 return null;
               },
               inputFormatters: widget.inputFormatters,
               enabled: widget.enabled,
               cursorWidth: widget.cursorWidth,
               cursorHeight: widget.cursorHeight,
               cursorRadius: widget.cursorRadius,
               cursorColor: widget.cursorColor,
               color: widget.color,
               borderradius: widget.borderradius,
               keyboardAppearance: widget.keyboardAppearance,
               scrollPadding: widget.scrollPadding,
               enableInteractiveSelection: widget.enableInteractiveSelection,
               buildCounter: widget.buildCounter,
               scrollPhysics: widget.scrollPhysics,
               autofillHints: widget.autofillHints,
               autovalidateMode: widget.autovalidateMode
           )
       );
       break;
     case GfFormFieldType.Password:
       retwidget= Container(
           margin: EdgeInsets.symmetric(vertical: widget.marginvertical,
               horizontal: widget.marginhorizontal),
           padding: EdgeInsets.symmetric(vertical: widget.paddingvertical,
               horizontal: widget.paddinghorizontal),
           child:
           GFTextField(
               decoration: InputDecoration(
                 filled:widget.backgroundcolor!=null||false,
                 // icon: widget.iconPrefix,
                 prefixIcon: widget.iconPrefix,
                 // prefix: widget.iconPrefix,
                 fillColor: widget.backgroundcolor,
                 hintText: widget.hintText??'Name',
                 border: OutlineInputBorder(
                   borderSide: BorderSide(
                     color: widget.normalbordercolor,
                     width: widget.borderwidth,
                   ),
                   borderRadius: BorderRadius.circular(50),
                 ),
                 focusedBorder: OutlineInputBorder(
                   borderSide: BorderSide(
                     color: widget.editingbordercolor,
                     width: widget.borderwidth,
                   ),
                   borderRadius: BorderRadius.circular(50),
                 ),
                 disabledBorder: OutlineInputBorder(
                   borderSide: BorderSide(
                     color: widget.disabledbordercolor,
                     width: widget.borderwidth,
                   ),
                   borderRadius: BorderRadius.circular(50),
                 ),
                 errorBorder: OutlineInputBorder(
                   borderSide: BorderSide(
                     color: widget.errorbordercolor,
                     width: widget.borderwidth,
                   ),
                   borderRadius: BorderRadius.circular(50),
                 ),
                 enabledBorder: OutlineInputBorder(
                   borderSide: BorderSide(
                     color: widget.idlebordercolor,
                     width: widget.borderwidth,
                   ),
                   borderRadius: BorderRadius.circular(50),
                 ),
                 focusedErrorBorder: OutlineInputBorder(
                   borderSide: BorderSide(
                     color: widget.errorbordercolor,
                     width: widget.borderwidth,
                   ),
                   borderRadius: BorderRadius.circular(50),
                 ),
               ),
               controller: widget.controller,
               initialValue: widget.initialValue,
               focusNode: widget.focusNode,
               keyboardType: TextInputType.visiblePassword,
               textCapitalization: TextCapitalization.none,
               textInputAction: widget.textInputAction,
               style: widget.style,
               strutStyle: widget.strutStyle,
               textDirection: widget.textDirection,
               textAlign: widget.textAlign,
               textAlignVertical: widget.textAlignVertical,
               autofocus: widget.autofocus,
               readOnly: widget.readOnly,
               toolbarOptions: widget.toolbarOptions,
               showCursor: widget.showCursor,
               obscuringCharacter: widget.obscuringCharacter,
               obscureText: true,
               autocorrect: widget.autocorrect,
               smartDashesType: widget.smartDashesType,
               smartQuotesType: widget.smartQuotesType,
               enableSuggestions: widget.enableSuggestions,
               autovalidate: widget.autovalidate,
               maxLengthEnforced: widget.maxLengthEnforced,
               maxLines: widget.maxLines,
               minLines: widget.minLines,
               expands: widget.expands,
               maxLength: widget.maxLength,
               onChanged: widget.onChanged,
               onTap: widget.onTap,
               onEditingComplete: widget.onEditingComplete,
               onFieldSubmitted: widget.onFieldSubmitted,
               onSaved: widget.onSaved,
               validator: (value) {
                 if (value == null || value.isEmpty) {
                   return 'Please enter password';
                 }
                 else if(value.length<6 ){
                   return 'Password should be 6 characters or more';
                 }
                 return null;
               },
               inputFormatters: widget.inputFormatters,
               enabled: widget.enabled,
               cursorWidth: widget.cursorWidth,
               cursorHeight: widget.cursorHeight,
               cursorRadius: widget.cursorRadius,
               cursorColor: widget.cursorColor,
               color: widget.color,
               borderradius: widget.borderradius,
               keyboardAppearance: widget.keyboardAppearance,
               scrollPadding: widget.scrollPadding,
               enableInteractiveSelection: widget.enableInteractiveSelection,
               buildCounter: widget.buildCounter,
               scrollPhysics: widget.scrollPhysics,
               autofillHints: widget.autofillHints,
               autovalidateMode: widget.autovalidateMode
           )
       );
       break;
     case GfFormFieldType.email:
       retwidget= Container(
           margin: EdgeInsets.symmetric(vertical: widget.marginvertical,
               horizontal: widget.marginhorizontal),
           padding: EdgeInsets.symmetric(vertical: widget.paddingvertical,
               horizontal: widget.paddinghorizontal),
           child:

           GFTextField(
               decoration: InputDecoration(
                 filled:widget.backgroundcolor!=null||false,
                 // icon: widget.iconPrefix,
                 prefixIcon: widget.iconPrefix,
                 // prefix: widget.iconPrefix,
                 fillColor: widget.backgroundcolor,
                 hintText: widget.hintText??'email',
                 border: OutlineInputBorder(
                   borderSide: BorderSide(
                     color: widget.normalbordercolor,
                     width: widget.borderwidth,
                   ),
                   borderRadius: BorderRadius.circular(50),
                 ),
                 focusedBorder: OutlineInputBorder(
                   borderSide: BorderSide(
                     color: widget.editingbordercolor,
                     width: widget.borderwidth,
                   ),
                   borderRadius: BorderRadius.circular(50),
                 ),
                 disabledBorder: OutlineInputBorder(
                   borderSide: BorderSide(
                     color: widget.disabledbordercolor,
                     width: widget.borderwidth,
                   ),
                   borderRadius: BorderRadius.circular(50),
                 ),
                 errorBorder: OutlineInputBorder(
                   borderSide: BorderSide(
                     color: widget.errorbordercolor,
                     width: widget.borderwidth,
                   ),
                   borderRadius: BorderRadius.circular(50),
                 ),
                 enabledBorder: OutlineInputBorder(
                   borderSide: BorderSide(
                     color: widget.idlebordercolor,
                     width: widget.borderwidth,
                   ),
                   borderRadius: BorderRadius.circular(50),
                 ),
                 focusedErrorBorder: OutlineInputBorder(
                   borderSide: BorderSide(
                     color: widget.errorbordercolor,
                     width: widget.borderwidth,
                   ),
                   borderRadius: BorderRadius.circular(50),
                 ),
               ),
               controller: widget.controller,
               initialValue: widget.initialValue,
               focusNode: widget.focusNode,
               keyboardType: TextInputType.emailAddress,
               textCapitalization: TextCapitalization.none,
               textInputAction: widget.textInputAction,
               style: widget.style,
               strutStyle: widget.strutStyle,
               textDirection: widget.textDirection,
               textAlign: widget.textAlign,
               textAlignVertical: widget.textAlignVertical,
               autofocus: widget.autofocus,
               readOnly: widget.readOnly,
               toolbarOptions: widget.toolbarOptions,
               showCursor: widget.showCursor,
               obscuringCharacter: widget.obscuringCharacter,
               obscureText: widget.obscureText,
               autocorrect: widget.autocorrect,
               smartDashesType: widget.smartDashesType,
               smartQuotesType: widget.smartQuotesType,
               enableSuggestions: widget.enableSuggestions,
               autovalidate: widget.autovalidate,
               maxLengthEnforced: widget.maxLengthEnforced,
               maxLines: widget.maxLines,
               minLines: widget.minLines,
               expands: widget.expands,
               maxLength: widget.maxLength,
               onChanged: widget.onChanged,
               onTap: widget.onTap,
               onEditingComplete: widget.onEditingComplete,
               onFieldSubmitted: widget.onFieldSubmitted,
               onSaved: widget.onSaved,
               validator: (value) {
                 if (value == null || value.isEmpty) {
                   return 'Please enter Email id';
                 }
                 else if(value.length<10 && (!value.contains('@')&& !value.contains('.'))){
                   return 'Check your email';
                 }
                 return null;
               },
               inputFormatters: widget.inputFormatters,
               enabled: widget.enabled,
               cursorWidth: widget.cursorWidth,
               cursorHeight: widget.cursorHeight,
               cursorRadius: widget.cursorRadius,
               cursorColor: widget.cursorColor,
               color: widget.color,
               borderradius: widget.borderradius,
               keyboardAppearance: widget.keyboardAppearance,
               scrollPadding: widget.scrollPadding,
               enableInteractiveSelection: widget.enableInteractiveSelection,
               buildCounter: widget.buildCounter,
               scrollPhysics: widget.scrollPhysics,
               autofillHints: widget.autofillHints,
               autovalidateMode: widget.autovalidateMode
           )
       );
       break;
     case GfFormFieldType.Phone:
       retwidget= Container(
           margin: EdgeInsets.symmetric(vertical: widget.marginvertical,
               horizontal: widget.marginhorizontal),
           padding: EdgeInsets.symmetric(vertical: widget.paddingvertical,
               horizontal: widget.paddinghorizontal),
           child:

           GFTextField(
               decoration: InputDecoration(
                 filled:widget.backgroundcolor!=null||false,
                 // icon: widget.iconPrefix,
                 prefixIcon: widget.iconPrefix,
                 // prefix: widget.iconPrefix,
                 fillColor: widget.backgroundcolor,
                 hintText: widget.hintText,
                 border: OutlineInputBorder(
                   borderSide: BorderSide(
                     color: widget.normalbordercolor,
                     width: widget.borderwidth,
                   ),
                   borderRadius: BorderRadius.circular(50),
                 ),
                 focusedBorder: OutlineInputBorder(
                   borderSide: BorderSide(
                     color: widget.editingbordercolor,
                     width: widget.borderwidth,
                   ),
                   borderRadius: BorderRadius.circular(50),
                 ),
                 disabledBorder: OutlineInputBorder(
                   borderSide: BorderSide(
                     color: widget.disabledbordercolor,
                     width: widget.borderwidth,
                   ),
                   borderRadius: BorderRadius.circular(50),
                 ),
                 errorBorder: OutlineInputBorder(
                   borderSide: BorderSide(
                     color: widget.errorbordercolor,
                     width: widget.borderwidth,
                   ),
                   borderRadius: BorderRadius.circular(50),
                 ),
                 enabledBorder: OutlineInputBorder(
                   borderSide: BorderSide(
                     color: widget.idlebordercolor,
                     width: widget.borderwidth,
                   ),
                   borderRadius: BorderRadius.circular(50),
                 ),
                 focusedErrorBorder: OutlineInputBorder(
                   borderSide: BorderSide(
                     color: widget.errorbordercolor,
                     width: widget.borderwidth,
                   ),
                   borderRadius: BorderRadius.circular(50),
                 ),
               ),
               controller: widget.controller,
               initialValue: widget.initialValue,
               focusNode: widget.focusNode,
               keyboardType: TextInputType.phone,
               textCapitalization: TextCapitalization.none,
               textInputAction: widget.textInputAction,
               style: widget.style,
               strutStyle: widget.strutStyle,
               textDirection: widget.textDirection,
               textAlign: widget.textAlign,
               textAlignVertical: widget.textAlignVertical,
               autofocus: widget.autofocus,
               readOnly: widget.readOnly,
               toolbarOptions: widget.toolbarOptions,
               showCursor: widget.showCursor,
               obscuringCharacter: widget.obscuringCharacter,
               obscureText: widget.obscureText,
               autocorrect: widget.autocorrect,
               smartDashesType: widget.smartDashesType,
               smartQuotesType: widget.smartQuotesType,
               enableSuggestions: widget.enableSuggestions,
               autovalidate: widget.autovalidate,
               maxLengthEnforced: widget.maxLengthEnforced,
               maxLines: widget.maxLines,
               minLines: widget.minLines,
               expands: widget.expands,
               maxLength: widget.maxLength,
               onChanged: widget.onChanged,
               onTap: widget.onTap,
               onEditingComplete: widget.onEditingComplete,
               onFieldSubmitted: widget.onFieldSubmitted,
               onSaved: widget.onSaved,
               validator: (value) {
                 if (value == null || value.isEmpty) {
                   return 'Please enter phone number';
                 }
                 else if(value.length<10 ){
                   return 'Enter your 10 digit phone number';
                 }
                 return null;
               },
               inputFormatters: widget.inputFormatters,
               enabled: widget.enabled,
               cursorWidth: widget.cursorWidth,
               cursorHeight: widget.cursorHeight,
               cursorRadius: widget.cursorRadius,
               cursorColor: widget.cursorColor,
               color: widget.color,
               borderradius: widget.borderradius,
               keyboardAppearance: widget.keyboardAppearance,
               scrollPadding: widget.scrollPadding,
               enableInteractiveSelection: widget.enableInteractiveSelection,
               buildCounter: widget.buildCounter,
               scrollPhysics: widget.scrollPhysics,
               autofillHints: widget.autofillHints,
               autovalidateMode: widget.autovalidateMode
           )
       );
       break;
   }
   return retwidget;
 }



  @override
  bool get wantKeepAlive => true;
}