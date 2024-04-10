; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137660 () Bool)

(assert start!137660)

(assert (=> start!137660 false))

(declare-fun e!883151 () Bool)

(assert (=> start!137660 e!883151))

(assert (=> start!137660 true))

(declare-fun b!1582450 () Bool)

(declare-fun tp_is_empty!39309 () Bool)

(declare-fun tp!114743 () Bool)

(assert (=> b!1582450 (= e!883151 (and tp_is_empty!39309 tp!114743))))

(declare-datatypes ((B!2764 0))(
  ( (B!2765 (val!19744 Int)) )
))
(declare-datatypes ((tuple2!25656 0))(
  ( (tuple2!25657 (_1!12839 (_ BitVec 64)) (_2!12839 B!2764)) )
))
(declare-datatypes ((List!36864 0))(
  ( (Nil!36861) (Cons!36860 (h!38403 tuple2!25656) (t!51778 List!36864)) )
))
(declare-fun l!1356 () List!36864)

(get-info :version)

(assert (= (and start!137660 ((_ is Cons!36860) l!1356)) b!1582450))

(check-sat (not b!1582450) tp_is_empty!39309)
(check-sat)
