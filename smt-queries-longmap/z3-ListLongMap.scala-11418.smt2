; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133050 () Bool)

(assert start!133050)

(assert (=> start!133050 false))

(declare-fun e!867455 () Bool)

(assert (=> start!133050 e!867455))

(declare-fun b!1557292 () Bool)

(declare-fun tp_is_empty!38389 () Bool)

(declare-fun tp!112531 () Bool)

(assert (=> b!1557292 (= e!867455 (and tp_is_empty!38389 tp!112531))))

(declare-datatypes ((B!2384 0))(
  ( (B!2385 (val!19278 Int)) )
))
(declare-datatypes ((tuple2!25004 0))(
  ( (tuple2!25005 (_1!12513 (_ BitVec 64)) (_2!12513 B!2384)) )
))
(declare-datatypes ((List!36357 0))(
  ( (Nil!36354) (Cons!36353 (h!37800 tuple2!25004) (t!51076 List!36357)) )
))
(declare-fun l!1292 () List!36357)

(get-info :version)

(assert (= (and start!133050 ((_ is Cons!36353) l!1292)) b!1557292))

(check-sat (not b!1557292) tp_is_empty!38389)
(check-sat)
