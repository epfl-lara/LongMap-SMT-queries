; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!138158 () Bool)

(assert start!138158)

(assert (=> start!138158 false))

(declare-fun e!884849 () Bool)

(assert (=> start!138158 e!884849))

(declare-fun b!1585119 () Bool)

(declare-fun tp_is_empty!39325 () Bool)

(declare-fun tp!114804 () Bool)

(assert (=> b!1585119 (= e!884849 (and tp_is_empty!39325 tp!114804))))

(declare-datatypes ((B!2792 0))(
  ( (B!2793 (val!19758 Int)) )
))
(declare-datatypes ((tuple2!25744 0))(
  ( (tuple2!25745 (_1!12883 (_ BitVec 64)) (_2!12883 B!2792)) )
))
(declare-datatypes ((List!36910 0))(
  ( (Nil!36907) (Cons!36906 (h!38467 tuple2!25744) (t!51816 List!36910)) )
))
(declare-fun l!1065 () List!36910)

(get-info :version)

(assert (= (and start!138158 ((_ is Cons!36906) l!1065)) b!1585119))

(check-sat (not b!1585119) tp_is_empty!39325)
(check-sat)
