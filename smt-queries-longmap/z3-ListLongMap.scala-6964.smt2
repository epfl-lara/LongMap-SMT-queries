; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!88174 () Bool)

(assert start!88174)

(assert (=> start!88174 false))

(declare-fun e!572217 () Bool)

(assert (=> start!88174 e!572217))

(assert (=> start!88174 true))

(declare-fun tp_is_empty!23557 () Bool)

(assert (=> start!88174 tp_is_empty!23557))

(declare-fun b!1016956 () Bool)

(declare-fun tp!70674 () Bool)

(assert (=> b!1016956 (= e!572217 (and tp_is_empty!23557 tp!70674))))

(declare-datatypes ((B!1490 0))(
  ( (B!1491 (val!11829 Int)) )
))
(declare-datatypes ((tuple2!15208 0))(
  ( (tuple2!15209 (_1!7615 (_ BitVec 64)) (_2!7615 B!1490)) )
))
(declare-datatypes ((List!21473 0))(
  ( (Nil!21470) (Cons!21469 (h!22676 tuple2!15208) (t!30466 List!21473)) )
))
(declare-fun l!1114 () List!21473)

(get-info :version)

(assert (= (and start!88174 ((_ is Cons!21469) l!1114)) b!1016956))

(check-sat (not b!1016956) tp_is_empty!23557)
(check-sat)
