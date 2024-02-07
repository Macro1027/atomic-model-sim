dnl
include(`foreach.m4')dnl
dnl
include(`datatypes.m4')dnl
dnl
include(`common.m4')dnl
dnl
dnl This is what a subroutine looks like.
dnl First arg is name of quantity (property/parameter)
dnl Second arg is list of optional args
dnl Third arg is type of property(character/logical etc.)
dnl Fourth arg is whether scalar; assumed-size array, assumed-shape array, assumed size, matrix, or assumed-shape matrix.
define(`TOHWM4_QuantitySub',`dnl
  subroutine `$1'`$3'`$4' &
    (xf, value,dnl
ifelse(`$4', `ArrSi', `nitems, ', `$4', `MatSi', `nrows, ncols, ')`'dnl
 TOHWM4_dummyarglist(`$2')`'dnl
ifelse(`$3',`Lg',`',`, units')`'dnl
ifelse(substr($3,0,4),`Real',`, fmt)', substr($3,0,5), `Cmplx', `, fmt)',`)')

    type(xmlf_t), intent(inout)              :: xf
    TOHWM4_declarationtype(`$3'), intent(in) dnl
ifelse(substr($4,0,3), `Arr', `, dimension(:)', substr($4,0,3), `Mat', `, dimension(:,:)') dnl
 :: value
ifelse(`$4', `ArrSi', `dnl
    integer, intent(in) :: nitems
', `$4', `MatSi', `dnl
    integer, intent(in) :: nrows
    integer, intent(in) :: ncols
')dnl
dnl
m4_foreach(`x', `$2', `TOHWM4_dummyargdecl(x)')
dnl
ifelse(`$3',`Lg',`',`dnl
    character(len=*), intent(in) dnl
ifelse(`$3', `Ch', `, optional') dnl
 :: units
')dnl
ifelse(substr($3,0,4),`Real',`dnl 
    character(len=*), intent(in), optional :: fmt
', substr($3,0,5), `Cmplx',`dnl
    character(len=*), intent(in), optional :: fmt
')dnl

#ifndef DUMMYLIB
    call xml_NewElement(xf, "$1")
dnl
m4_foreach(`x', `$2', `TOHWM4_dummyarguse(x)')
dnl
    call stmAddValue(xf=xf`'dnl
ifelse($4, `ArrSi', `, value=value(:nitems)', $4, `MatSi', `, value=value(:nrows, :ncols)', `, value=value')`'dnl
ifelse(`$3',`Lg',`',`, units=units')`'dnl
ifelse(substr($3,0,4),`Real',`, fmt=fmt',substr($3,0,5),`Cmplx',`, fmt=fmt',`')`'dnl
)
dnl
    call xml_EndElement(xf, "$1")
#endif
 
  end subroutine `$1'`$3'`$4'
')dnl
dnl
define(`TOHWM4_wcml_quantity',`dnl
dnl
include(`foreach.m4')dnl
! This file is AUTOGENERATED!!!!
! Do not edit this file; edit m_wcml_quantity.m4 and regenerate.
!
!
module m_wcml_$1

  use fox_m_fsys_realtypes, only: sp, dp
  use FoX_wxml, only: xmlf_t

#ifndef DUMMYLIB
  use FoX_wxml, only: xml_NewElement, xml_AddAttribute
  use FoX_wxml, only: xml_EndElement
  use m_wcml_stml, only: stmAddValue

! Fix for pgi, requires this explicitly:
  use m_wxml_overloads
#endif

  implicit none
  private

  interface cmlAdd$1
m4_foreach(`x', TOHWM4_types, `TOHWM4_interfacelist($1, x)')
  end interface

  public :: cmlAdd$1

contains

m4_foreach(`x', TOHWM4_types, `TOHWM4_QuantitySub($1, `$2', x, `Sca')
')
m4_foreach(`x', TOHWM4_types, `TOHWM4_QuantitySub($1, `$2', x, `ArrSi')
')
m4_foreach(`x', TOHWM4_types, `TOHWM4_QuantitySub($1, `$2', x, `ArrSh')
')
m4_foreach(`x', TOHWM4_types, `TOHWM4_QuantitySub($1, `$2', x, `MatSi')
')
m4_foreach(`x', TOHWM4_types, `TOHWM4_QuantitySub($1, `$2', x, `MatSh')
')
dnl
end module m_wcml_$1
')dnl
