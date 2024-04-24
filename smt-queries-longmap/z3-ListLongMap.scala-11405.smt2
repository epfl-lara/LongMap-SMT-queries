; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133218 () Bool)

(assert start!133218)

(assert (=> start!133218 false))

(declare-fun e!867923 () Bool)

(assert (=> start!133218 e!867923))

(declare-fun b!1558193 () Bool)

(declare-fun tp_is_empty!38317 () Bool)

(declare-fun tp!112326 () Bool)

(assert (=> b!1558193 (= e!867923 (and tp_is_empty!38317 tp!112326))))

(declare-datatypes ((B!2306 0))(
  ( (B!2307 (val!19239 Int)) )
))
(declare-datatypes ((tuple2!24908 0))(
  ( (tuple2!24909 (_1!12465 (_ BitVec 64)) (_2!12465 B!2306)) )
))
(declare-datatypes ((List!36302 0))(
  ( (Nil!36299) (Cons!36298 (h!37762 tuple2!24908) (t!51015 List!36302)) )
))
(declare-fun l!1177 () List!36302)

(get-info :version)

(assert (= (and start!133218 ((_ is Cons!36298) l!1177)) b!1558193))

(check-sat (not b!1558193) tp_is_empty!38317)
(check-sat)
