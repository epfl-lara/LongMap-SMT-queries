; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133098 () Bool)

(assert start!133098)

(assert (=> start!133098 false))

(declare-fun e!867647 () Bool)

(assert (=> start!133098 e!867647))

(assert (=> start!133098 true))

(declare-fun b!1557631 () Bool)

(declare-fun tp_is_empty!38413 () Bool)

(declare-fun tp!112576 () Bool)

(assert (=> b!1557631 (= e!867647 (and tp_is_empty!38413 tp!112576))))

(declare-datatypes ((B!2408 0))(
  ( (B!2409 (val!19290 Int)) )
))
(declare-datatypes ((tuple2!25028 0))(
  ( (tuple2!25029 (_1!12525 (_ BitVec 64)) (_2!12525 B!2408)) )
))
(declare-datatypes ((List!36369 0))(
  ( (Nil!36366) (Cons!36365 (h!37812 tuple2!25028) (t!51088 List!36369)) )
))
(declare-fun l!1292 () List!36369)

(get-info :version)

(assert (= (and start!133098 ((_ is Cons!36365) l!1292)) b!1557631))

(check-sat (not b!1557631) tp_is_empty!38413)
(check-sat)
