; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!88414 () Bool)

(assert start!88414)

(assert (=> start!88414 false))

(declare-fun e!572358 () Bool)

(assert (=> start!88414 e!572358))

(assert (=> start!88414 true))

(declare-fun b!1017343 () Bool)

(declare-fun tp_is_empty!23647 () Bool)

(declare-fun tp!70892 () Bool)

(assert (=> b!1017343 (= e!572358 (and tp_is_empty!23647 tp!70892))))

(declare-datatypes ((B!1580 0))(
  ( (B!1581 (val!11874 Int)) )
))
(declare-datatypes ((tuple2!15374 0))(
  ( (tuple2!15375 (_1!7698 (_ BitVec 64)) (_2!7698 B!1580)) )
))
(declare-datatypes ((List!21597 0))(
  ( (Nil!21594) (Cons!21593 (h!22791 tuple2!15374) (t!30589 List!21597)) )
))
(declare-fun l!1036 () List!21597)

(get-info :version)

(assert (= (and start!88414 ((_ is Cons!21593) l!1036)) b!1017343))

(check-sat (not b!1017343) tp_is_empty!23647)
(check-sat)
