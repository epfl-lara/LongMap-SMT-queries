; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133518 () Bool)

(assert start!133518)

(assert (=> start!133518 false))

(declare-fun e!869171 () Bool)

(assert (=> start!133518 e!869171))

(assert (=> start!133518 true))

(declare-fun b!1560050 () Bool)

(declare-fun tp_is_empty!38395 () Bool)

(declare-fun tp!112539 () Bool)

(assert (=> b!1560050 (= e!869171 (and tp_is_empty!38395 tp!112539))))

(declare-datatypes ((B!2390 0))(
  ( (B!2391 (val!19281 Int)) )
))
(declare-datatypes ((tuple2!24992 0))(
  ( (tuple2!24993 (_1!12507 (_ BitVec 64)) (_2!12507 B!2390)) )
))
(declare-datatypes ((List!36344 0))(
  ( (Nil!36341) (Cons!36340 (h!37804 tuple2!24992) (t!51063 List!36344)) )
))
(declare-fun l!1292 () List!36344)

(get-info :version)

(assert (= (and start!133518 ((_ is Cons!36340) l!1292)) b!1560050))

(check-sat (not b!1560050) tp_is_empty!38395)
(check-sat)
