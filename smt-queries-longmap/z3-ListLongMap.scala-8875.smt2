; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107992 () Bool)

(assert start!107992)

(assert (=> start!107992 false))

(declare-fun e!728201 () Bool)

(assert (=> start!107992 e!728201))

(assert (=> start!107992 true))

(declare-fun b!1275837 () Bool)

(declare-fun tp_is_empty!33163 () Bool)

(declare-fun tp!97949 () Bool)

(assert (=> b!1275837 (= e!728201 (and tp_is_empty!33163 tp!97949))))

(declare-datatypes ((B!2120 0))(
  ( (B!2121 (val!16656 Int)) )
))
(declare-datatypes ((tuple2!21402 0))(
  ( (tuple2!21403 (_1!10712 (_ BitVec 64)) (_2!10712 B!2120)) )
))
(declare-datatypes ((List!28610 0))(
  ( (Nil!28607) (Cons!28606 (h!29824 tuple2!21402) (t!42135 List!28610)) )
))
(declare-fun l!595 () List!28610)

(get-info :version)

(assert (= (and start!107992 ((_ is Cons!28606) l!595)) b!1275837))

(check-sat (not b!1275837) tp_is_empty!33163)
(check-sat)
