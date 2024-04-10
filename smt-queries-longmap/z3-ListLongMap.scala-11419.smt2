; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133108 () Bool)

(assert start!133108)

(assert (=> start!133108 false))

(declare-fun e!867665 () Bool)

(assert (=> start!133108 e!867665))

(assert (=> start!133108 true))

(declare-fun b!1557617 () Bool)

(declare-fun tp_is_empty!38397 () Bool)

(declare-fun tp!112542 () Bool)

(assert (=> b!1557617 (= e!867665 (and tp_is_empty!38397 tp!112542))))

(declare-datatypes ((B!2392 0))(
  ( (B!2393 (val!19282 Int)) )
))
(declare-datatypes ((tuple2!24940 0))(
  ( (tuple2!24941 (_1!12481 (_ BitVec 64)) (_2!12481 B!2392)) )
))
(declare-datatypes ((List!36316 0))(
  ( (Nil!36313) (Cons!36312 (h!37758 tuple2!24940) (t!51043 List!36316)) )
))
(declare-fun l!1292 () List!36316)

(get-info :version)

(assert (= (and start!133108 ((_ is Cons!36312) l!1292)) b!1557617))

(check-sat (not b!1557617) tp_is_empty!38397)
(check-sat)
