; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!138420 () Bool)

(assert start!138420)

(assert (=> start!138420 false))

(declare-fun e!885712 () Bool)

(assert (=> start!138420 e!885712))

(assert (=> start!138420 true))

(declare-fun b!1586436 () Bool)

(declare-fun tp_is_empty!39427 () Bool)

(declare-fun tp!115040 () Bool)

(assert (=> b!1586436 (= e!885712 (and tp_is_empty!39427 tp!115040))))

(declare-datatypes ((B!2894 0))(
  ( (B!2895 (val!19809 Int)) )
))
(declare-datatypes ((tuple2!25846 0))(
  ( (tuple2!25847 (_1!12934 (_ BitVec 64)) (_2!12934 B!2894)) )
))
(declare-datatypes ((List!36961 0))(
  ( (Nil!36958) (Cons!36957 (h!38518 tuple2!25846) (t!51867 List!36961)) )
))
(declare-fun l!1251 () List!36961)

(get-info :version)

(assert (= (and start!138420 ((_ is Cons!36957) l!1251)) b!1586436))

(check-sat (not b!1586436) tp_is_empty!39427)
(check-sat)
