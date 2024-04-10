; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137982 () Bool)

(assert start!137982)

(assert (=> start!137982 false))

(declare-fun e!884158 () Bool)

(assert (=> start!137982 e!884158))

(assert (=> start!137982 true))

(declare-fun b!1583932 () Bool)

(declare-fun tp_is_empty!39429 () Bool)

(declare-fun tp!115042 () Bool)

(assert (=> b!1583932 (= e!884158 (and tp_is_empty!39429 tp!115042))))

(declare-datatypes ((B!2896 0))(
  ( (B!2897 (val!19810 Int)) )
))
(declare-datatypes ((tuple2!25788 0))(
  ( (tuple2!25789 (_1!12905 (_ BitVec 64)) (_2!12905 B!2896)) )
))
(declare-datatypes ((List!36930 0))(
  ( (Nil!36927) (Cons!36926 (h!38469 tuple2!25788) (t!51844 List!36930)) )
))
(declare-fun l!1251 () List!36930)

(get-info :version)

(assert (= (and start!137982 ((_ is Cons!36926) l!1251)) b!1583932))

(check-sat (not b!1583932) tp_is_empty!39429)
(check-sat)
