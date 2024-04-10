; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132426 () Bool)

(assert start!132426)

(declare-fun res!1063300 () Bool)

(declare-fun e!864958 () Bool)

(assert (=> start!132426 (=> (not res!1063300) (not e!864958))))

(declare-datatypes ((B!2208 0))(
  ( (B!2209 (val!19190 Int)) )
))
(declare-datatypes ((tuple2!24756 0))(
  ( (tuple2!24757 (_1!12389 (_ BitVec 64)) (_2!12389 B!2208)) )
))
(declare-datatypes ((List!36224 0))(
  ( (Nil!36221) (Cons!36220 (h!37666 tuple2!24756) (t!50945 List!36224)) )
))
(declare-datatypes ((ListLongMap!22365 0))(
  ( (ListLongMap!22366 (toList!11198 List!36224)) )
))
(declare-fun lm!249 () ListLongMap!22365)

(declare-fun a0!49 () (_ BitVec 64))

(declare-fun contains!10140 (ListLongMap!22365 (_ BitVec 64)) Bool)

(assert (=> start!132426 (= res!1063300 (contains!10140 lm!249 a0!49))))

(assert (=> start!132426 e!864958))

(declare-fun e!864959 () Bool)

(declare-fun inv!57297 (ListLongMap!22365) Bool)

(assert (=> start!132426 (and (inv!57297 lm!249) e!864959)))

(assert (=> start!132426 true))

(declare-fun b!1553533 () Bool)

(assert (=> b!1553533 (= e!864958 false)))

(declare-fun b!1553534 () Bool)

(declare-fun tp!112107 () Bool)

(assert (=> b!1553534 (= e!864959 tp!112107)))

(assert (= (and start!132426 res!1063300) b!1553533))

(assert (= start!132426 b!1553534))

(declare-fun m!1432181 () Bool)

(assert (=> start!132426 m!1432181))

(declare-fun m!1432183 () Bool)

(assert (=> start!132426 m!1432183))

(push 1)

(assert (not start!132426))

(assert (not b!1553534))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

