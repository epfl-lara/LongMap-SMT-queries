; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!88398 () Bool)

(assert start!88398)

(assert (=> start!88398 false))

(declare-fun e!572406 () Bool)

(assert (=> start!88398 e!572406))

(declare-fun b!1017410 () Bool)

(declare-fun tp_is_empty!23631 () Bool)

(declare-fun tp!70867 () Bool)

(assert (=> b!1017410 (= e!572406 (and tp_is_empty!23631 tp!70867))))

(declare-datatypes ((B!1564 0))(
  ( (B!1565 (val!11866 Int)) )
))
(declare-datatypes ((tuple2!15278 0))(
  ( (tuple2!15279 (_1!7650 (_ BitVec 64)) (_2!7650 B!1564)) )
))
(declare-datatypes ((List!21554 0))(
  ( (Nil!21551) (Cons!21550 (h!22748 tuple2!15278) (t!30555 List!21554)) )
))
(declare-fun l!1036 () List!21554)

(get-info :version)

(assert (= (and start!88398 ((_ is Cons!21550) l!1036)) b!1017410))

(check-sat (not b!1017410) tp_is_empty!23631)
(check-sat)
