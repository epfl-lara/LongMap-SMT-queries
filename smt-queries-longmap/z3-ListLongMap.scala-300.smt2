; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5232 () Bool)

(assert start!5232)

(declare-fun res!22949 () Bool)

(declare-fun e!24153 () Bool)

(assert (=> start!5232 (=> (not res!22949) (not e!24153))))

(declare-datatypes ((B!790 0))(
  ( (B!791 (val!895 Int)) )
))
(declare-fun b!99 () B!790)

(declare-datatypes ((tuple2!1450 0))(
  ( (tuple2!1451 (_1!736 (_ BitVec 64)) (_2!736 B!790)) )
))
(declare-datatypes ((List!1005 0))(
  ( (Nil!1002) (Cons!1001 (h!1569 tuple2!1450) (t!3838 List!1005)) )
))
(declare-datatypes ((ListLongMap!1027 0))(
  ( (ListLongMap!1028 (toList!529 List!1005)) )
))
(declare-fun lm!264 () ListLongMap!1027)

(declare-fun a!526 () (_ BitVec 64))

(declare-fun contains!480 (List!1005 tuple2!1450) Bool)

(assert (=> start!5232 (= res!22949 (contains!480 (toList!529 lm!264) (tuple2!1451 a!526 b!99)))))

(assert (=> start!5232 e!24153))

(declare-fun e!24154 () Bool)

(declare-fun inv!1700 (ListLongMap!1027) Bool)

(assert (=> start!5232 (and (inv!1700 lm!264) e!24154)))

(assert (=> start!5232 true))

(declare-fun tp_is_empty!1713 () Bool)

(assert (=> start!5232 tp_is_empty!1713))

(declare-fun b!38006 () Bool)

(declare-fun e!24152 () Bool)

(assert (=> b!38006 (= e!24153 (not e!24152))))

(declare-fun res!22950 () Bool)

(assert (=> b!38006 (=> res!22950 e!24152)))

(declare-fun isStrictlySorted!201 (List!1005) Bool)

(assert (=> b!38006 (= res!22950 (not (isStrictlySorted!201 (toList!529 lm!264))))))

(declare-fun containsKey!64 (List!1005 (_ BitVec 64)) Bool)

(assert (=> b!38006 (containsKey!64 (toList!529 lm!264) a!526)))

(declare-datatypes ((Unit!883 0))(
  ( (Unit!884) )
))
(declare-fun lt!13972 () Unit!883)

(declare-fun lemmaContainsTupleThenContainsKey!8 (List!1005 (_ BitVec 64) B!790) Unit!883)

(assert (=> b!38006 (= lt!13972 (lemmaContainsTupleThenContainsKey!8 (toList!529 lm!264) a!526 b!99))))

(declare-fun b!38007 () Bool)

(assert (=> b!38007 (= e!24152 true)))

(declare-datatypes ((Option!100 0))(
  ( (Some!99 (v!1974 B!790)) (None!98) )
))
(declare-fun getValueByKey!94 (List!1005 (_ BitVec 64)) Option!100)

(assert (=> b!38007 (= (getValueByKey!94 (toList!529 lm!264) a!526) (Some!99 b!99))))

(declare-fun lt!13973 () Unit!883)

(declare-fun lemmaContainsTupThenGetReturnValue!21 (List!1005 (_ BitVec 64) B!790) Unit!883)

(assert (=> b!38007 (= lt!13973 (lemmaContainsTupThenGetReturnValue!21 (toList!529 lm!264) a!526 b!99))))

(declare-fun b!38008 () Bool)

(declare-fun tp!5645 () Bool)

(assert (=> b!38008 (= e!24154 tp!5645)))

(assert (= (and start!5232 res!22949) b!38006))

(assert (= (and b!38006 (not res!22950)) b!38007))

(assert (= start!5232 b!38008))

(declare-fun m!30681 () Bool)

(assert (=> start!5232 m!30681))

(declare-fun m!30683 () Bool)

(assert (=> start!5232 m!30683))

(declare-fun m!30685 () Bool)

(assert (=> b!38006 m!30685))

(declare-fun m!30687 () Bool)

(assert (=> b!38006 m!30687))

(declare-fun m!30689 () Bool)

(assert (=> b!38006 m!30689))

(declare-fun m!30691 () Bool)

(assert (=> b!38007 m!30691))

(declare-fun m!30693 () Bool)

(assert (=> b!38007 m!30693))

(check-sat (not start!5232) (not b!38007) (not b!38008) tp_is_empty!1713 (not b!38006))
(check-sat)
