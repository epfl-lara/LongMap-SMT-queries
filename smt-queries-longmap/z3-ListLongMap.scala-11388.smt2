; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132372 () Bool)

(assert start!132372)

(declare-fun res!1063165 () Bool)

(declare-fun e!864748 () Bool)

(assert (=> start!132372 (=> (not res!1063165) (not e!864748))))

(declare-datatypes ((B!2204 0))(
  ( (B!2205 (val!19188 Int)) )
))
(declare-datatypes ((tuple2!24824 0))(
  ( (tuple2!24825 (_1!12423 (_ BitVec 64)) (_2!12423 B!2204)) )
))
(declare-datatypes ((List!36267 0))(
  ( (Nil!36264) (Cons!36263 (h!37710 tuple2!24824) (t!50980 List!36267)) )
))
(declare-datatypes ((ListLongMap!22433 0))(
  ( (ListLongMap!22434 (toList!11232 List!36267)) )
))
(declare-fun lm!249 () ListLongMap!22433)

(declare-fun a0!49 () (_ BitVec 64))

(declare-fun contains!10095 (ListLongMap!22433 (_ BitVec 64)) Bool)

(assert (=> start!132372 (= res!1063165 (contains!10095 lm!249 a0!49))))

(assert (=> start!132372 e!864748))

(declare-fun e!864749 () Bool)

(declare-fun inv!57295 (ListLongMap!22433) Bool)

(assert (=> start!132372 (and (inv!57295 lm!249) e!864749)))

(assert (=> start!132372 true))

(declare-fun b!1553208 () Bool)

(assert (=> b!1553208 (= e!864748 false)))

(declare-fun b!1553209 () Bool)

(declare-fun tp!112102 () Bool)

(assert (=> b!1553209 (= e!864749 tp!112102)))

(assert (= (and start!132372 res!1063165) b!1553208))

(assert (= start!132372 b!1553209))

(declare-fun m!1431281 () Bool)

(assert (=> start!132372 m!1431281))

(declare-fun m!1431283 () Bool)

(assert (=> start!132372 m!1431283))

(check-sat (not start!132372) (not b!1553209))
(check-sat)
