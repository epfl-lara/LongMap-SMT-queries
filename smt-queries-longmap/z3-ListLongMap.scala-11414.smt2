; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133404 () Bool)

(assert start!133404)

(declare-fun res!1065942 () Bool)

(declare-fun e!868840 () Bool)

(assert (=> start!133404 (=> (not res!1065942) (not e!868840))))

(declare-datatypes ((B!2360 0))(
  ( (B!2361 (val!19266 Int)) )
))
(declare-datatypes ((tuple2!24962 0))(
  ( (tuple2!24963 (_1!12492 (_ BitVec 64)) (_2!12492 B!2360)) )
))
(declare-datatypes ((List!36329 0))(
  ( (Nil!36326) (Cons!36325 (h!37789 tuple2!24962) (t!51048 List!36329)) )
))
(declare-datatypes ((ListLongMap!22471 0))(
  ( (ListLongMap!22472 (toList!11251 List!36329)) )
))
(declare-fun lm!250 () ListLongMap!22471)

(declare-fun a0!50 () (_ BitVec 64))

(declare-fun contains!10232 (ListLongMap!22471 (_ BitVec 64)) Bool)

(assert (=> start!133404 (= res!1065942 (contains!10232 lm!250 a0!50))))

(assert (=> start!133404 e!868840))

(declare-fun e!868841 () Bool)

(declare-fun inv!57449 (ListLongMap!22471) Bool)

(assert (=> start!133404 (and (inv!57449 lm!250) e!868841)))

(assert (=> start!133404 true))

(declare-fun b!1559533 () Bool)

(assert (=> b!1559533 (= e!868840 false)))

(declare-fun b!1559534 () Bool)

(declare-fun tp!112467 () Bool)

(assert (=> b!1559534 (= e!868841 tp!112467)))

(assert (= (and start!133404 res!1065942) b!1559533))

(assert (= start!133404 b!1559534))

(declare-fun m!1436609 () Bool)

(assert (=> start!133404 m!1436609))

(declare-fun m!1436611 () Bool)

(assert (=> start!133404 m!1436611))

(check-sat (not start!133404) (not b!1559534))
(check-sat)
