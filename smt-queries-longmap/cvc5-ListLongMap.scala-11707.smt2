; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136940 () Bool)

(assert start!136940)

(declare-fun res!1079030 () Bool)

(declare-fun e!880975 () Bool)

(assert (=> start!136940 (=> (not res!1079030) (not e!880975))))

(declare-datatypes ((B!2582 0))(
  ( (B!2583 (val!19653 Int)) )
))
(declare-datatypes ((tuple2!25408 0))(
  ( (tuple2!25409 (_1!12715 (_ BitVec 64)) (_2!12715 B!2582)) )
))
(declare-datatypes ((List!36773 0))(
  ( (Nil!36770) (Cons!36769 (h!38312 tuple2!25408) (t!51687 List!36773)) )
))
(declare-fun lt!676482 () List!36773)

(declare-fun isStrictlySorted!1034 (List!36773) Bool)

(assert (=> start!136940 (= res!1079030 (isStrictlySorted!1034 lt!676482))))

(declare-datatypes ((ListLongMap!22747 0))(
  ( (ListLongMap!22748 (toList!11389 List!36773)) )
))
(declare-fun thiss!201 () ListLongMap!22747)

(declare-fun keyValue!4 () tuple2!25408)

(declare-fun insertStrictlySorted!605 (List!36773 (_ BitVec 64) B!2582) List!36773)

(assert (=> start!136940 (= lt!676482 (insertStrictlySorted!605 (toList!11389 thiss!201) (_1!12715 keyValue!4) (_2!12715 keyValue!4)))))

(assert (=> start!136940 e!880975))

(declare-fun e!880976 () Bool)

(declare-fun inv!58944 (ListLongMap!22747) Bool)

(assert (=> start!136940 (and (inv!58944 thiss!201) e!880976)))

(declare-fun tp_is_empty!39127 () Bool)

(assert (=> start!136940 tp_is_empty!39127))

(declare-fun b!1579288 () Bool)

(declare-fun res!1079031 () Bool)

(assert (=> b!1579288 (=> (not res!1079031) (not e!880975))))

(declare-fun containsKey!880 (List!36773 (_ BitVec 64)) Bool)

(assert (=> b!1579288 (= res!1079031 (containsKey!880 lt!676482 (_1!12715 keyValue!4)))))

(declare-fun b!1579289 () Bool)

(assert (=> b!1579289 (= e!880975 false)))

(declare-fun lt!676483 () Bool)

(declare-fun contains!10445 (List!36773 tuple2!25408) Bool)

(assert (=> b!1579289 (= lt!676483 (contains!10445 lt!676482 keyValue!4))))

(declare-fun b!1579290 () Bool)

(declare-fun tp!114315 () Bool)

(assert (=> b!1579290 (= e!880976 tp!114315)))

(assert (= (and start!136940 res!1079030) b!1579288))

(assert (= (and b!1579288 res!1079031) b!1579289))

(assert (= start!136940 b!1579290))

(declare-fun m!1451143 () Bool)

(assert (=> start!136940 m!1451143))

(declare-fun m!1451145 () Bool)

(assert (=> start!136940 m!1451145))

(declare-fun m!1451147 () Bool)

(assert (=> start!136940 m!1451147))

(declare-fun m!1451149 () Bool)

(assert (=> b!1579288 m!1451149))

(declare-fun m!1451151 () Bool)

(assert (=> b!1579289 m!1451151))

(push 1)

(assert (not b!1579290))

(assert (not b!1579289))

(assert tp_is_empty!39127)

(assert (not start!136940))

(assert (not b!1579288))

(check-sat)

(pop 1)

