; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!88416 () Bool)

(assert start!88416)

(assert (=> start!88416 false))

(declare-fun e!572442 () Bool)

(assert (=> start!88416 e!572442))

(assert (=> start!88416 true))

(declare-fun b!1017482 () Bool)

(declare-fun tp_is_empty!23649 () Bool)

(declare-fun tp!70894 () Bool)

(assert (=> b!1017482 (= e!572442 (and tp_is_empty!23649 tp!70894))))

(declare-datatypes ((B!1582 0))(
  ( (B!1583 (val!11875 Int)) )
))
(declare-datatypes ((tuple2!15296 0))(
  ( (tuple2!15297 (_1!7659 (_ BitVec 64)) (_2!7659 B!1582)) )
))
(declare-datatypes ((List!21563 0))(
  ( (Nil!21560) (Cons!21559 (h!22757 tuple2!15296) (t!30564 List!21563)) )
))
(declare-fun l!1036 () List!21563)

(get-info :version)

(assert (= (and start!88416 ((_ is Cons!21559) l!1036)) b!1017482))

(check-sat (not b!1017482) tp_is_empty!23649)
(check-sat)
