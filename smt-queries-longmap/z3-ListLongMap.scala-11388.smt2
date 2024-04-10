; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132424 () Bool)

(assert start!132424)

(declare-fun res!1063297 () Bool)

(declare-fun e!864952 () Bool)

(assert (=> start!132424 (=> (not res!1063297) (not e!864952))))

(declare-datatypes ((B!2206 0))(
  ( (B!2207 (val!19189 Int)) )
))
(declare-datatypes ((tuple2!24754 0))(
  ( (tuple2!24755 (_1!12388 (_ BitVec 64)) (_2!12388 B!2206)) )
))
(declare-datatypes ((List!36223 0))(
  ( (Nil!36220) (Cons!36219 (h!37665 tuple2!24754) (t!50944 List!36223)) )
))
(declare-datatypes ((ListLongMap!22363 0))(
  ( (ListLongMap!22364 (toList!11197 List!36223)) )
))
(declare-fun lm!249 () ListLongMap!22363)

(declare-fun a0!49 () (_ BitVec 64))

(declare-fun contains!10139 (ListLongMap!22363 (_ BitVec 64)) Bool)

(assert (=> start!132424 (= res!1063297 (contains!10139 lm!249 a0!49))))

(assert (=> start!132424 e!864952))

(declare-fun e!864953 () Bool)

(declare-fun inv!57296 (ListLongMap!22363) Bool)

(assert (=> start!132424 (and (inv!57296 lm!249) e!864953)))

(assert (=> start!132424 true))

(declare-fun b!1553527 () Bool)

(assert (=> b!1553527 (= e!864952 false)))

(declare-fun b!1553528 () Bool)

(declare-fun tp!112104 () Bool)

(assert (=> b!1553528 (= e!864953 tp!112104)))

(assert (= (and start!132424 res!1063297) b!1553527))

(assert (= start!132424 b!1553528))

(declare-fun m!1432177 () Bool)

(assert (=> start!132424 m!1432177))

(declare-fun m!1432179 () Bool)

(assert (=> start!132424 m!1432179))

(check-sat (not start!132424) (not b!1553528))
(check-sat)
