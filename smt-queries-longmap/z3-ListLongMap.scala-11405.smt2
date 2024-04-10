; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132808 () Bool)

(assert start!132808)

(assert (=> start!132808 false))

(declare-fun e!866417 () Bool)

(assert (=> start!132808 e!866417))

(declare-fun b!1555760 () Bool)

(declare-fun tp_is_empty!38319 () Bool)

(declare-fun tp!112329 () Bool)

(assert (=> b!1555760 (= e!866417 (and tp_is_empty!38319 tp!112329))))

(declare-datatypes ((B!2308 0))(
  ( (B!2309 (val!19240 Int)) )
))
(declare-datatypes ((tuple2!24856 0))(
  ( (tuple2!24857 (_1!12439 (_ BitVec 64)) (_2!12439 B!2308)) )
))
(declare-datatypes ((List!36274 0))(
  ( (Nil!36271) (Cons!36270 (h!37716 tuple2!24856) (t!50995 List!36274)) )
))
(declare-fun l!1177 () List!36274)

(get-info :version)

(assert (= (and start!132808 ((_ is Cons!36270) l!1177)) b!1555760))

(check-sat (not b!1555760) tp_is_empty!38319)
(check-sat)
