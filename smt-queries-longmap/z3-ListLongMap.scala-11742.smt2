; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137684 () Bool)

(assert start!137684)

(assert (=> start!137684 false))

(declare-fun e!883094 () Bool)

(assert (=> start!137684 e!883094))

(declare-fun b!1582299 () Bool)

(declare-fun tp_is_empty!39325 () Bool)

(declare-fun tp!114804 () Bool)

(assert (=> b!1582299 (= e!883094 (and tp_is_empty!39325 tp!114804))))

(declare-datatypes ((B!2792 0))(
  ( (B!2793 (val!19758 Int)) )
))
(declare-datatypes ((tuple2!25752 0))(
  ( (tuple2!25753 (_1!12887 (_ BitVec 64)) (_2!12887 B!2792)) )
))
(declare-datatypes ((List!36919 0))(
  ( (Nil!36916) (Cons!36915 (h!38459 tuple2!25752) (t!51825 List!36919)) )
))
(declare-fun l!1065 () List!36919)

(get-info :version)

(assert (= (and start!137684 ((_ is Cons!36915) l!1065)) b!1582299))

(check-sat (not b!1582299) tp_is_empty!39325)
(check-sat)
