*&---------------------------------------------------------------------*
*& Report ZHET_P_ODEV1
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zhet_p_odev1.

SELECTION-SCREEN BEGIN OF BLOCK bl0 WITH FRAME TITLE TEXT-001.
PARAMETERS: p_cboxka AS CHECKBOX,
            p_cboxdi AS CHECKBOX,
            p_cboxuc AS CHECKBOX.
SELECTION-SCREEN END OF BLOCK bl0.

SELECTION-SCREEN BEGIN OF BLOCK bl1 WITH FRAME TITLE TEXT-002.
PARAMETERS: p_radal RADIOBUTTON GROUP gr1,
            p_radce RADIOBUTTON GROUP gr1.
SELECTION-SCREEN END OF BLOCK bl1.

SELECTION-SCREEN BEGIN OF BLOCK bl2 WITH FRAME.
PARAMETERS: p_text1 TYPE int4.
SELECTION-SCREEN END OF BLOCK bl2.


DATA: gv_kenar_uzunluk TYPE int4.

LOAD-OF-PROGRAM.

INITIALIZATION.

AT SELECTION-SCREEN OUTPUT.


AT SELECTION-SCREEN.
  gv_kenar_uzunluk = p_text1.

START-OF-SELECTION.


*  IF p_cboxKa eq abap_true.
*    PERFORM kare.
*  ELSEIF p_cboxDi eq abap_true.
*    PERFORM dikdortgen.
*  ELSE.
*    PERFORM ucgen.
*  ENDIF.

  CASE 'X'.
    WHEN p_cboxka.
      PERFORM kare.
    WHEN p_cboxdi.
      PERFORM dikdortgen.
    WHEN p_cboxuc.
      PERFORM ucgen.
    WHEN OTHERS.
      WRITE: / 'Hiçbir seçenek seçilmedi.'.
  ENDCASE.

END-OF-SELECTION.



FORM kare.
  IF p_radal EQ abap_true.
    gv_kenar_uzunluk = gv_kenar_uzunluk * gv_kenar_uzunluk.
    WRITE: 'Şekil alan: ' , gv_kenar_uzunluk.
  ELSE.
    gv_kenar_uzunluk = gv_kenar_uzunluk * 4.
    WRITE: 'Şekil çevre : ' , gv_kenar_uzunluk.
  ENDIF.
ENDFORM.


FORM dikdortgen.
  IF p_radal EQ abap_true.
    gv_kenar_uzunluk = gv_kenar_uzunluk * gv_kenar_uzunluk.
    WRITE: 'Şekil alan: ' , gv_kenar_uzunluk.
  ELSE.
    gv_kenar_uzunluk = gv_kenar_uzunluk * 4.
    WRITE: 'Şekil çevre : ' , gv_kenar_uzunluk.
  ENDIF.
ENDFORM.

FORM ucgen.
  IF p_radal EQ abap_true.
    gv_kenar_uzunluk = gv_kenar_uzunluk * gv_kenar_uzunluk / 2.
    WRITE: 'Şekil alan: ' , gv_kenar_uzunluk.
  ELSE.
    gv_kenar_uzunluk = gv_kenar_uzunluk * 3.
    WRITE: 'Şekil çevre : ' , gv_kenar_uzunluk.
  ENDIF.
ENDFORM.
