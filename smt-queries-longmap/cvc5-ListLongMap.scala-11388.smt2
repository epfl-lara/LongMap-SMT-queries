; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132422 () Bool)

(assert start!132422)

(declare-fun res!1063294 () Bool)

(declare-fun e!864946 () Bool)

(assert (=> start!132422 (=> (not res!1063294) (not e!864946))))

(declare-datatypes ((B!2204 0))(
  ( (B!2205 (val!19188 Int)) )
))
(declare-datatypes ((tuple2!24752 0))(
  ( (tuple2!24753 (_1!12387 (_ BitVec 64)) (_2!12387 B!2204)) )
))
(declare-datatypes ((List!36222 0))(
  ( (Nil!36219) (Cons!36218 (h!37664 tuple2!24752) (t!50943 List!36222)) )
))
(declare-datatypes ((ListLongMap!22361 0))(
  ( (ListLongMap!22362 (toList!11196 List!36222)) )
))
(declare-fun lm!249 () ListLongMap!22361)

(declare-fun a0!49 () (_ BitVec 64))

(declare-fun contains!10138 (ListLongMap!22361 (_ BitVec 64)) Bool)

(assert (=> start!132422 (= res!1063294 (contains!10138 lm!249 a0!49))))

(assert (=> start!132422 e!864946))

(declare-fun e!864947 () Bool)

(declare-fun inv!57295 (ListLongMap!22361) Bool)

(assert (=> start!132422 (and (inv!57295 lm!249) e!864947)))

(assert (=> start!132422 true))

(declare-fun b!1553521 () Bool)

(assert (=> b!1553521 (= e!864946 false)))

(declare-fun b!1553522 () Bool)

(declare-fun tp!112101 () Bool)

(assert (=> b!1553522 (= e!864947 tp!112101)))

(assert (= (and start!132422 res!1063294) b!1553521))

(assert (= start!132422 b!1553522))

(declare-fun m!1432173 () Bool)

(assert (=> start!132422 m!1432173))

(declare-fun m!1432175 () Bool)

(assert (=> start!132422 m!1432175))

(push 1)

(assert (not start!132422))

(assert (not b!1553522))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

