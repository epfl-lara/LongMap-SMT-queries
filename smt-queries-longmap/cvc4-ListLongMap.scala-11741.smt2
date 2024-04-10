; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137716 () Bool)

(assert start!137716)

(declare-fun b!1582607 () Bool)

(declare-datatypes ((Unit!52270 0))(
  ( (Unit!52271) )
))
(declare-fun e!883288 () Unit!52270)

(declare-fun Unit!52272 () Unit!52270)

(assert (=> b!1582607 (= e!883288 Unit!52272)))

(declare-fun res!1081167 () Bool)

(declare-fun e!883287 () Bool)

(assert (=> start!137716 (=> (not res!1081167) (not e!883287))))

(declare-fun lt!677116 () Bool)

(assert (=> start!137716 (= res!1081167 lt!677116)))

(declare-fun lt!677117 () Unit!52270)

(assert (=> start!137716 (= lt!677117 e!883288)))

(declare-fun c!146662 () Bool)

(assert (=> start!137716 (= c!146662 lt!677116)))

(declare-datatypes ((B!2790 0))(
  ( (B!2791 (val!19757 Int)) )
))
(declare-datatypes ((tuple2!25682 0))(
  ( (tuple2!25683 (_1!12852 (_ BitVec 64)) (_2!12852 B!2790)) )
))
(declare-datatypes ((List!36877 0))(
  ( (Nil!36874) (Cons!36873 (h!38416 tuple2!25682) (t!51791 List!36877)) )
))
(declare-datatypes ((ListLongMap!22793 0))(
  ( (ListLongMap!22794 (toList!11412 List!36877)) )
))
(declare-fun thiss!185 () ListLongMap!22793)

(declare-fun key!86 () (_ BitVec 64))

(declare-fun containsKey!966 (List!36877 (_ BitVec 64)) Bool)

(assert (=> start!137716 (= lt!677116 (containsKey!966 (toList!11412 thiss!185) key!86))))

(assert (=> start!137716 e!883287))

(declare-fun e!883289 () Bool)

(declare-fun inv!59137 (ListLongMap!22793) Bool)

(assert (=> start!137716 (and (inv!59137 thiss!185) e!883289)))

(assert (=> start!137716 true))

(declare-fun b!1582609 () Bool)

(declare-fun tp!114800 () Bool)

(assert (=> b!1582609 (= e!883289 tp!114800)))

(declare-fun b!1582608 () Bool)

(declare-datatypes ((Option!937 0))(
  ( (Some!936 (v!22464 B!2790)) (None!935) )
))
(declare-fun isDefined!602 (Option!937) Bool)

(declare-fun getValueByKey!828 (List!36877 (_ BitVec 64)) Option!937)

(assert (=> b!1582608 (= e!883287 (not (isDefined!602 (getValueByKey!828 (toList!11412 thiss!185) key!86))))))

(declare-fun b!1582606 () Bool)

(declare-fun lt!677118 () Unit!52270)

(assert (=> b!1582606 (= e!883288 lt!677118)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!551 (List!36877 (_ BitVec 64)) Unit!52270)

(assert (=> b!1582606 (= lt!677118 (lemmaContainsKeyImpliesGetValueByKeyDefined!551 (toList!11412 thiss!185) key!86))))

(assert (=> b!1582606 (isDefined!602 (getValueByKey!828 (toList!11412 thiss!185) key!86))))

(assert (= (and start!137716 c!146662) b!1582606))

(assert (= (and start!137716 (not c!146662)) b!1582607))

(assert (= (and start!137716 res!1081167) b!1582608))

(assert (= start!137716 b!1582609))

(declare-fun m!1452955 () Bool)

(assert (=> start!137716 m!1452955))

(declare-fun m!1452957 () Bool)

(assert (=> start!137716 m!1452957))

(declare-fun m!1452959 () Bool)

(assert (=> b!1582608 m!1452959))

(assert (=> b!1582608 m!1452959))

(declare-fun m!1452961 () Bool)

(assert (=> b!1582608 m!1452961))

(declare-fun m!1452963 () Bool)

(assert (=> b!1582606 m!1452963))

(assert (=> b!1582606 m!1452959))

(assert (=> b!1582606 m!1452959))

(assert (=> b!1582606 m!1452961))

(push 1)

(assert (not b!1582606))

(assert (not b!1582608))

(assert (not start!137716))

(assert (not b!1582609))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

