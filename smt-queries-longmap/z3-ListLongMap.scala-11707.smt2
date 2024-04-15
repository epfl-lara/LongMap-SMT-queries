; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136906 () Bool)

(assert start!136906)

(declare-fun res!1078902 () Bool)

(declare-fun e!880777 () Bool)

(assert (=> start!136906 (=> (not res!1078902) (not e!880777))))

(declare-datatypes ((B!2582 0))(
  ( (B!2583 (val!19653 Int)) )
))
(declare-datatypes ((tuple2!25476 0))(
  ( (tuple2!25477 (_1!12749 (_ BitVec 64)) (_2!12749 B!2582)) )
))
(declare-datatypes ((List!36814 0))(
  ( (Nil!36811) (Cons!36810 (h!38354 tuple2!25476) (t!51720 List!36814)) )
))
(declare-fun lt!676200 () List!36814)

(declare-fun isStrictlySorted!1032 (List!36814) Bool)

(assert (=> start!136906 (= res!1078902 (isStrictlySorted!1032 lt!676200))))

(declare-datatypes ((ListLongMap!22815 0))(
  ( (ListLongMap!22816 (toList!11423 List!36814)) )
))
(declare-fun thiss!201 () ListLongMap!22815)

(declare-fun keyValue!4 () tuple2!25476)

(declare-fun insertStrictlySorted!606 (List!36814 (_ BitVec 64) B!2582) List!36814)

(assert (=> start!136906 (= lt!676200 (insertStrictlySorted!606 (toList!11423 thiss!201) (_1!12749 keyValue!4) (_2!12749 keyValue!4)))))

(assert (=> start!136906 e!880777))

(declare-fun e!880778 () Bool)

(declare-fun inv!58944 (ListLongMap!22815) Bool)

(assert (=> start!136906 (and (inv!58944 thiss!201) e!880778)))

(declare-fun tp_is_empty!39127 () Bool)

(assert (=> start!136906 tp_is_empty!39127))

(declare-fun b!1578975 () Bool)

(declare-fun res!1078901 () Bool)

(assert (=> b!1578975 (=> (not res!1078901) (not e!880777))))

(declare-fun containsKey!878 (List!36814 (_ BitVec 64)) Bool)

(assert (=> b!1578975 (= res!1078901 (containsKey!878 lt!676200 (_1!12749 keyValue!4)))))

(declare-fun b!1578976 () Bool)

(assert (=> b!1578976 (= e!880777 false)))

(declare-fun lt!676199 () Bool)

(declare-fun contains!10400 (List!36814 tuple2!25476) Bool)

(assert (=> b!1578976 (= lt!676199 (contains!10400 lt!676200 keyValue!4))))

(declare-fun b!1578977 () Bool)

(declare-fun tp!114316 () Bool)

(assert (=> b!1578977 (= e!880778 tp!114316)))

(assert (= (and start!136906 res!1078902) b!1578975))

(assert (= (and b!1578975 res!1078901) b!1578976))

(assert (= start!136906 b!1578977))

(declare-fun m!1450263 () Bool)

(assert (=> start!136906 m!1450263))

(declare-fun m!1450265 () Bool)

(assert (=> start!136906 m!1450265))

(declare-fun m!1450267 () Bool)

(assert (=> start!136906 m!1450267))

(declare-fun m!1450269 () Bool)

(assert (=> b!1578975 m!1450269))

(declare-fun m!1450271 () Bool)

(assert (=> b!1578976 m!1450271))

(check-sat (not start!136906) (not b!1578975) (not b!1578976) (not b!1578977) tp_is_empty!39127)
(check-sat)
