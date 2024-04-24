; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!88632 () Bool)

(assert start!88632)

(assert (=> start!88632 false))

(declare-fun e!573256 () Bool)

(assert (=> start!88632 e!573256))

(declare-fun b!1018737 () Bool)

(declare-fun tp_is_empty!23629 () Bool)

(declare-fun tp!70865 () Bool)

(assert (=> b!1018737 (= e!573256 (and tp_is_empty!23629 tp!70865))))

(declare-datatypes ((B!1562 0))(
  ( (B!1563 (val!11865 Int)) )
))
(declare-datatypes ((tuple2!15280 0))(
  ( (tuple2!15281 (_1!7651 (_ BitVec 64)) (_2!7651 B!1562)) )
))
(declare-datatypes ((List!21542 0))(
  ( (Nil!21539) (Cons!21538 (h!22745 tuple2!15280) (t!30535 List!21542)) )
))
(declare-fun l!1036 () List!21542)

(get-info :version)

(assert (= (and start!88632 ((_ is Cons!21538) l!1036)) b!1018737))

(check-sat (not b!1018737) tp_is_empty!23629)
(check-sat)
