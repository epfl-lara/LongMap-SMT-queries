; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137378 () Bool)

(assert start!137378)

(declare-fun res!1079944 () Bool)

(declare-fun e!882520 () Bool)

(assert (=> start!137378 (=> (not res!1079944) (not e!882520))))

(declare-datatypes ((B!2582 0))(
  ( (B!2583 (val!19653 Int)) )
))
(declare-datatypes ((tuple2!25468 0))(
  ( (tuple2!25469 (_1!12745 (_ BitVec 64)) (_2!12745 B!2582)) )
))
(declare-datatypes ((List!36805 0))(
  ( (Nil!36802) (Cons!36801 (h!38362 tuple2!25468) (t!51711 List!36805)) )
))
(declare-fun lt!677390 () List!36805)

(declare-fun isStrictlySorted!1022 (List!36805) Bool)

(assert (=> start!137378 (= res!1079944 (isStrictlySorted!1022 lt!677390))))

(declare-datatypes ((ListLongMap!22815 0))(
  ( (ListLongMap!22816 (toList!11423 List!36805)) )
))
(declare-fun thiss!201 () ListLongMap!22815)

(declare-fun keyValue!4 () tuple2!25468)

(declare-fun insertStrictlySorted!606 (List!36805 (_ BitVec 64) B!2582) List!36805)

(assert (=> start!137378 (= lt!677390 (insertStrictlySorted!606 (toList!11423 thiss!201) (_1!12745 keyValue!4) (_2!12745 keyValue!4)))))

(assert (=> start!137378 e!882520))

(declare-fun e!882521 () Bool)

(declare-fun inv!58954 (ListLongMap!22815) Bool)

(assert (=> start!137378 (and (inv!58954 thiss!201) e!882521)))

(declare-fun tp_is_empty!39127 () Bool)

(assert (=> start!137378 tp_is_empty!39127))

(declare-fun b!1581778 () Bool)

(declare-fun res!1079945 () Bool)

(assert (=> b!1581778 (=> (not res!1079945) (not e!882520))))

(declare-fun containsKey!881 (List!36805 (_ BitVec 64)) Bool)

(assert (=> b!1581778 (= res!1079945 (containsKey!881 lt!677390 (_1!12745 keyValue!4)))))

(declare-fun b!1581779 () Bool)

(assert (=> b!1581779 (= e!882520 false)))

(declare-fun lt!677391 () Bool)

(declare-fun contains!10490 (List!36805 tuple2!25468) Bool)

(assert (=> b!1581779 (= lt!677391 (contains!10490 lt!677390 keyValue!4))))

(declare-fun b!1581780 () Bool)

(declare-fun tp!114315 () Bool)

(assert (=> b!1581780 (= e!882521 tp!114315)))

(assert (= (and start!137378 res!1079944) b!1581778))

(assert (= (and b!1581778 res!1079945) b!1581779))

(assert (= start!137378 b!1581780))

(declare-fun m!1453455 () Bool)

(assert (=> start!137378 m!1453455))

(declare-fun m!1453457 () Bool)

(assert (=> start!137378 m!1453457))

(declare-fun m!1453459 () Bool)

(assert (=> start!137378 m!1453459))

(declare-fun m!1453461 () Bool)

(assert (=> b!1581778 m!1453461))

(declare-fun m!1453463 () Bool)

(assert (=> b!1581779 m!1453463))

(check-sat (not start!137378) tp_is_empty!39127 (not b!1581778) (not b!1581780) (not b!1581779))
(check-sat)
