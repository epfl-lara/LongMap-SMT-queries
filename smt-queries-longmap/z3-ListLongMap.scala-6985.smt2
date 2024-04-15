; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!88574 () Bool)

(assert start!88574)

(assert (=> start!88574 false))

(declare-fun e!572813 () Bool)

(assert (=> start!88574 e!572813))

(declare-fun b!1018078 () Bool)

(declare-fun tp_is_empty!23683 () Bool)

(declare-fun tp!70993 () Bool)

(assert (=> b!1018078 (= e!572813 (and tp_is_empty!23683 tp!70993))))

(declare-datatypes ((B!1616 0))(
  ( (B!1617 (val!11892 Int)) )
))
(declare-datatypes ((tuple2!15410 0))(
  ( (tuple2!15411 (_1!7716 (_ BitVec 64)) (_2!7716 B!1616)) )
))
(declare-datatypes ((List!21615 0))(
  ( (Nil!21612) (Cons!21611 (h!22809 tuple2!15410) (t!30607 List!21615)) )
))
(declare-fun l!996 () List!21615)

(get-info :version)

(assert (= (and start!88574 ((_ is Cons!21611) l!996)) b!1018078))

(check-sat (not b!1018078) tp_is_empty!23683)
(check-sat)
