; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137712 () Bool)

(assert start!137712)

(declare-fun res!1081161 () Bool)

(declare-fun e!883270 () Bool)

(assert (=> start!137712 (=> (not res!1081161) (not e!883270))))

(declare-fun lt!677100 () Bool)

(assert (=> start!137712 (= res!1081161 lt!677100)))

(declare-datatypes ((Unit!52264 0))(
  ( (Unit!52265) )
))
(declare-fun lt!677099 () Unit!52264)

(declare-fun e!883271 () Unit!52264)

(assert (=> start!137712 (= lt!677099 e!883271)))

(declare-fun c!146656 () Bool)

(assert (=> start!137712 (= c!146656 lt!677100)))

(declare-datatypes ((B!2786 0))(
  ( (B!2787 (val!19755 Int)) )
))
(declare-datatypes ((tuple2!25678 0))(
  ( (tuple2!25679 (_1!12850 (_ BitVec 64)) (_2!12850 B!2786)) )
))
(declare-datatypes ((List!36875 0))(
  ( (Nil!36872) (Cons!36871 (h!38414 tuple2!25678) (t!51789 List!36875)) )
))
(declare-datatypes ((ListLongMap!22789 0))(
  ( (ListLongMap!22790 (toList!11410 List!36875)) )
))
(declare-fun thiss!185 () ListLongMap!22789)

(declare-fun key!86 () (_ BitVec 64))

(declare-fun containsKey!964 (List!36875 (_ BitVec 64)) Bool)

(assert (=> start!137712 (= lt!677100 (containsKey!964 (toList!11410 thiss!185) key!86))))

(assert (=> start!137712 e!883270))

(declare-fun e!883269 () Bool)

(declare-fun inv!59135 (ListLongMap!22789) Bool)

(assert (=> start!137712 (and (inv!59135 thiss!185) e!883269)))

(assert (=> start!137712 true))

(declare-fun b!1582584 () Bool)

(declare-datatypes ((Option!935 0))(
  ( (Some!934 (v!22462 B!2786)) (None!933) )
))
(declare-fun isDefined!600 (Option!935) Bool)

(declare-fun getValueByKey!826 (List!36875 (_ BitVec 64)) Option!935)

(assert (=> b!1582584 (= e!883270 (not (isDefined!600 (getValueByKey!826 (toList!11410 thiss!185) key!86))))))

(declare-fun b!1582585 () Bool)

(declare-fun tp!114794 () Bool)

(assert (=> b!1582585 (= e!883269 tp!114794)))

(declare-fun b!1582582 () Bool)

(declare-fun lt!677098 () Unit!52264)

(assert (=> b!1582582 (= e!883271 lt!677098)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!549 (List!36875 (_ BitVec 64)) Unit!52264)

(assert (=> b!1582582 (= lt!677098 (lemmaContainsKeyImpliesGetValueByKeyDefined!549 (toList!11410 thiss!185) key!86))))

(assert (=> b!1582582 (isDefined!600 (getValueByKey!826 (toList!11410 thiss!185) key!86))))

(declare-fun b!1582583 () Bool)

(declare-fun Unit!52266 () Unit!52264)

(assert (=> b!1582583 (= e!883271 Unit!52266)))

(assert (= (and start!137712 c!146656) b!1582582))

(assert (= (and start!137712 (not c!146656)) b!1582583))

(assert (= (and start!137712 res!1081161) b!1582584))

(assert (= start!137712 b!1582585))

(declare-fun m!1452935 () Bool)

(assert (=> start!137712 m!1452935))

(declare-fun m!1452937 () Bool)

(assert (=> start!137712 m!1452937))

(declare-fun m!1452939 () Bool)

(assert (=> b!1582584 m!1452939))

(assert (=> b!1582584 m!1452939))

(declare-fun m!1452941 () Bool)

(assert (=> b!1582584 m!1452941))

(declare-fun m!1452943 () Bool)

(assert (=> b!1582582 m!1452943))

(assert (=> b!1582582 m!1452939))

(assert (=> b!1582582 m!1452939))

(assert (=> b!1582582 m!1452941))

(push 1)

(assert (not b!1582582))

(assert (not b!1582584))

(assert (not start!137712))

(assert (not b!1582585))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

