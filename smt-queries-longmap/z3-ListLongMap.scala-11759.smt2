; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137946 () Bool)

(assert start!137946)

(assert (=> start!137946 false))

(declare-fun e!883957 () Bool)

(assert (=> start!137946 e!883957))

(assert (=> start!137946 true))

(declare-fun b!1583616 () Bool)

(declare-fun tp_is_empty!39427 () Bool)

(declare-fun tp!115040 () Bool)

(assert (=> b!1583616 (= e!883957 (and tp_is_empty!39427 tp!115040))))

(declare-datatypes ((B!2894 0))(
  ( (B!2895 (val!19809 Int)) )
))
(declare-datatypes ((tuple2!25854 0))(
  ( (tuple2!25855 (_1!12938 (_ BitVec 64)) (_2!12938 B!2894)) )
))
(declare-datatypes ((List!36970 0))(
  ( (Nil!36967) (Cons!36966 (h!38510 tuple2!25854) (t!51876 List!36970)) )
))
(declare-fun l!1251 () List!36970)

(get-info :version)

(assert (= (and start!137946 ((_ is Cons!36966) l!1251)) b!1583616))

(check-sat (not b!1583616) tp_is_empty!39427)
(check-sat)
