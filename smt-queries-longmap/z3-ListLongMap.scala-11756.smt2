; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137904 () Bool)

(assert start!137904)

(assert (=> start!137904 false))

(declare-fun e!883774 () Bool)

(assert (=> start!137904 e!883774))

(assert (=> start!137904 true))

(declare-fun b!1583286 () Bool)

(declare-fun tp_is_empty!39409 () Bool)

(declare-fun tp!115004 () Bool)

(assert (=> b!1583286 (= e!883774 (and tp_is_empty!39409 tp!115004))))

(declare-datatypes ((B!2876 0))(
  ( (B!2877 (val!19800 Int)) )
))
(declare-datatypes ((tuple2!25836 0))(
  ( (tuple2!25837 (_1!12929 (_ BitVec 64)) (_2!12929 B!2876)) )
))
(declare-datatypes ((List!36961 0))(
  ( (Nil!36958) (Cons!36957 (h!38501 tuple2!25836) (t!51867 List!36961)) )
))
(declare-fun l!1251 () List!36961)

(get-info :version)

(assert (= (and start!137904 ((_ is Cons!36957) l!1251)) b!1583286))

(check-sat (not b!1583286) tp_is_empty!39409)
(check-sat)
