; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!88396 () Bool)

(assert start!88396)

(assert (=> start!88396 false))

(declare-fun e!572322 () Bool)

(assert (=> start!88396 e!572322))

(declare-fun b!1017271 () Bool)

(declare-fun tp_is_empty!23629 () Bool)

(declare-fun tp!70865 () Bool)

(assert (=> b!1017271 (= e!572322 (and tp_is_empty!23629 tp!70865))))

(declare-datatypes ((B!1562 0))(
  ( (B!1563 (val!11865 Int)) )
))
(declare-datatypes ((tuple2!15356 0))(
  ( (tuple2!15357 (_1!7689 (_ BitVec 64)) (_2!7689 B!1562)) )
))
(declare-datatypes ((List!21588 0))(
  ( (Nil!21585) (Cons!21584 (h!22782 tuple2!15356) (t!30580 List!21588)) )
))
(declare-fun l!1036 () List!21588)

(get-info :version)

(assert (= (and start!88396 ((_ is Cons!21584) l!1036)) b!1017271))

(check-sat (not b!1017271) tp_is_empty!23629)
(check-sat)
