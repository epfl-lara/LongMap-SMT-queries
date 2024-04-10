; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133150 () Bool)

(assert start!133150)

(assert (=> start!133150 false))

(declare-fun e!867848 () Bool)

(assert (=> start!133150 e!867848))

(assert (=> start!133150 true))

(declare-fun b!1557947 () Bool)

(declare-fun tp_is_empty!38415 () Bool)

(declare-fun tp!112578 () Bool)

(assert (=> b!1557947 (= e!867848 (and tp_is_empty!38415 tp!112578))))

(declare-datatypes ((B!2410 0))(
  ( (B!2411 (val!19291 Int)) )
))
(declare-datatypes ((tuple2!24958 0))(
  ( (tuple2!24959 (_1!12490 (_ BitVec 64)) (_2!12490 B!2410)) )
))
(declare-datatypes ((List!36325 0))(
  ( (Nil!36322) (Cons!36321 (h!37767 tuple2!24958) (t!51052 List!36325)) )
))
(declare-fun l!1292 () List!36325)

(get-info :version)

(assert (= (and start!133150 ((_ is Cons!36321) l!1292)) b!1557947))

(check-sat (not b!1557947) tp_is_empty!38415)
(check-sat)
