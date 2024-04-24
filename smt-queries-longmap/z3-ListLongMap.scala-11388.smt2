; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132834 () Bool)

(assert start!132834)

(declare-fun res!1064154 () Bool)

(declare-fun e!866455 () Bool)

(assert (=> start!132834 (=> (not res!1064154) (not e!866455))))

(declare-datatypes ((B!2204 0))(
  ( (B!2205 (val!19188 Int)) )
))
(declare-datatypes ((tuple2!24806 0))(
  ( (tuple2!24807 (_1!12414 (_ BitVec 64)) (_2!12414 B!2204)) )
))
(declare-datatypes ((List!36251 0))(
  ( (Nil!36248) (Cons!36247 (h!37711 tuple2!24806) (t!50964 List!36251)) )
))
(declare-datatypes ((ListLongMap!22423 0))(
  ( (ListLongMap!22424 (toList!11227 List!36251)) )
))
(declare-fun lm!249 () ListLongMap!22423)

(declare-fun a0!49 () (_ BitVec 64))

(declare-fun contains!10181 (ListLongMap!22423 (_ BitVec 64)) Bool)

(assert (=> start!132834 (= res!1064154 (contains!10181 lm!249 a0!49))))

(assert (=> start!132834 e!866455))

(declare-fun e!866456 () Bool)

(declare-fun inv!57295 (ListLongMap!22423) Bool)

(assert (=> start!132834 (and (inv!57295 lm!249) e!866456)))

(assert (=> start!132834 true))

(declare-fun b!1555957 () Bool)

(assert (=> b!1555957 (= e!866455 false)))

(declare-fun b!1555958 () Bool)

(declare-fun tp!112101 () Bool)

(assert (=> b!1555958 (= e!866456 tp!112101)))

(assert (= (and start!132834 res!1064154) b!1555957))

(assert (= start!132834 b!1555958))

(declare-fun m!1434431 () Bool)

(assert (=> start!132834 m!1434431))

(declare-fun m!1434433 () Bool)

(assert (=> start!132834 m!1434433))

(check-sat (not start!132834) (not b!1555958))
(check-sat)
