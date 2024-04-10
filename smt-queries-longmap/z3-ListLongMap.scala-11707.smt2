; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136942 () Bool)

(assert start!136942)

(declare-fun res!1079037 () Bool)

(declare-fun e!880982 () Bool)

(assert (=> start!136942 (=> (not res!1079037) (not e!880982))))

(declare-datatypes ((B!2584 0))(
  ( (B!2585 (val!19654 Int)) )
))
(declare-datatypes ((tuple2!25410 0))(
  ( (tuple2!25411 (_1!12716 (_ BitVec 64)) (_2!12716 B!2584)) )
))
(declare-datatypes ((List!36774 0))(
  ( (Nil!36771) (Cons!36770 (h!38313 tuple2!25410) (t!51688 List!36774)) )
))
(declare-fun lt!676489 () List!36774)

(declare-fun isStrictlySorted!1035 (List!36774) Bool)

(assert (=> start!136942 (= res!1079037 (isStrictlySorted!1035 lt!676489))))

(declare-datatypes ((ListLongMap!22749 0))(
  ( (ListLongMap!22750 (toList!11390 List!36774)) )
))
(declare-fun thiss!201 () ListLongMap!22749)

(declare-fun keyValue!4 () tuple2!25410)

(declare-fun insertStrictlySorted!606 (List!36774 (_ BitVec 64) B!2584) List!36774)

(assert (=> start!136942 (= lt!676489 (insertStrictlySorted!606 (toList!11390 thiss!201) (_1!12716 keyValue!4) (_2!12716 keyValue!4)))))

(assert (=> start!136942 e!880982))

(declare-fun e!880981 () Bool)

(declare-fun inv!58945 (ListLongMap!22749) Bool)

(assert (=> start!136942 (and (inv!58945 thiss!201) e!880981)))

(declare-fun tp_is_empty!39129 () Bool)

(assert (=> start!136942 tp_is_empty!39129))

(declare-fun b!1579297 () Bool)

(declare-fun res!1079036 () Bool)

(assert (=> b!1579297 (=> (not res!1079036) (not e!880982))))

(declare-fun containsKey!881 (List!36774 (_ BitVec 64)) Bool)

(assert (=> b!1579297 (= res!1079036 (containsKey!881 lt!676489 (_1!12716 keyValue!4)))))

(declare-fun b!1579298 () Bool)

(assert (=> b!1579298 (= e!880982 false)))

(declare-fun lt!676488 () Bool)

(declare-fun contains!10446 (List!36774 tuple2!25410) Bool)

(assert (=> b!1579298 (= lt!676488 (contains!10446 lt!676489 keyValue!4))))

(declare-fun b!1579299 () Bool)

(declare-fun tp!114318 () Bool)

(assert (=> b!1579299 (= e!880981 tp!114318)))

(assert (= (and start!136942 res!1079037) b!1579297))

(assert (= (and b!1579297 res!1079036) b!1579298))

(assert (= start!136942 b!1579299))

(declare-fun m!1451153 () Bool)

(assert (=> start!136942 m!1451153))

(declare-fun m!1451155 () Bool)

(assert (=> start!136942 m!1451155))

(declare-fun m!1451157 () Bool)

(assert (=> start!136942 m!1451157))

(declare-fun m!1451159 () Bool)

(assert (=> b!1579297 m!1451159))

(declare-fun m!1451161 () Bool)

(assert (=> b!1579298 m!1451161))

(check-sat (not start!136942) (not b!1579299) (not b!1579297) (not b!1579298) tp_is_empty!39129)
(check-sat)
