; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133056 () Bool)

(assert start!133056)

(assert (=> start!133056 false))

(declare-fun e!867464 () Bool)

(assert (=> start!133056 e!867464))

(assert (=> start!133056 true))

(declare-fun b!1557301 () Bool)

(declare-fun tp_is_empty!38395 () Bool)

(declare-fun tp!112540 () Bool)

(assert (=> b!1557301 (= e!867464 (and tp_is_empty!38395 tp!112540))))

(declare-datatypes ((B!2390 0))(
  ( (B!2391 (val!19281 Int)) )
))
(declare-datatypes ((tuple2!25010 0))(
  ( (tuple2!25011 (_1!12516 (_ BitVec 64)) (_2!12516 B!2390)) )
))
(declare-datatypes ((List!36360 0))(
  ( (Nil!36357) (Cons!36356 (h!37803 tuple2!25010) (t!51079 List!36360)) )
))
(declare-fun l!1292 () List!36360)

(get-info :version)

(assert (= (and start!133056 ((_ is Cons!36356) l!1292)) b!1557301))

(check-sat (not b!1557301) tp_is_empty!38395)
(check-sat)
