; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133512 () Bool)

(assert start!133512)

(assert (=> start!133512 false))

(declare-fun e!869162 () Bool)

(assert (=> start!133512 e!869162))

(declare-fun b!1560041 () Bool)

(declare-fun tp_is_empty!38389 () Bool)

(declare-fun tp!112530 () Bool)

(assert (=> b!1560041 (= e!869162 (and tp_is_empty!38389 tp!112530))))

(declare-datatypes ((B!2384 0))(
  ( (B!2385 (val!19278 Int)) )
))
(declare-datatypes ((tuple2!24986 0))(
  ( (tuple2!24987 (_1!12504 (_ BitVec 64)) (_2!12504 B!2384)) )
))
(declare-datatypes ((List!36341 0))(
  ( (Nil!36338) (Cons!36337 (h!37801 tuple2!24986) (t!51060 List!36341)) )
))
(declare-fun l!1292 () List!36341)

(get-info :version)

(assert (= (and start!133512 ((_ is Cons!36337) l!1292)) b!1560041))

(check-sat (not b!1560041) tp_is_empty!38389)
(check-sat)
