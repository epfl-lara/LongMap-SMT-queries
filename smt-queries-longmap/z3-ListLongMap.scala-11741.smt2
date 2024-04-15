; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137678 () Bool)

(assert start!137678)

(declare-fun b!1582272 () Bool)

(declare-fun e!883072 () Bool)

(declare-fun tp!114795 () Bool)

(assert (=> b!1582272 (= e!883072 tp!114795)))

(declare-fun b!1582271 () Bool)

(declare-fun e!883073 () Bool)

(declare-datatypes ((B!2786 0))(
  ( (B!2787 (val!19755 Int)) )
))
(declare-datatypes ((tuple2!25746 0))(
  ( (tuple2!25747 (_1!12884 (_ BitVec 64)) (_2!12884 B!2786)) )
))
(declare-datatypes ((List!36916 0))(
  ( (Nil!36913) (Cons!36912 (h!38456 tuple2!25746) (t!51822 List!36916)) )
))
(declare-datatypes ((ListLongMap!22857 0))(
  ( (ListLongMap!22858 (toList!11444 List!36916)) )
))
(declare-fun thiss!185 () ListLongMap!22857)

(declare-fun key!86 () (_ BitVec 64))

(declare-datatypes ((Option!937 0))(
  ( (Some!936 (v!22458 B!2786)) (None!935) )
))
(declare-fun isDefined!602 (Option!937) Bool)

(declare-fun getValueByKey!829 (List!36916 (_ BitVec 64)) Option!937)

(assert (=> b!1582271 (= e!883073 (not (isDefined!602 (getValueByKey!829 (toList!11444 thiss!185) key!86))))))

(declare-fun b!1582270 () Bool)

(declare-datatypes ((Unit!52072 0))(
  ( (Unit!52073) )
))
(declare-fun e!883071 () Unit!52072)

(declare-fun Unit!52074 () Unit!52072)

(assert (=> b!1582270 (= e!883071 Unit!52074)))

(declare-fun b!1582269 () Bool)

(declare-fun lt!676817 () Unit!52072)

(assert (=> b!1582269 (= e!883071 lt!676817)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!547 (List!36916 (_ BitVec 64)) Unit!52072)

(assert (=> b!1582269 (= lt!676817 (lemmaContainsKeyImpliesGetValueByKeyDefined!547 (toList!11444 thiss!185) key!86))))

(assert (=> b!1582269 (isDefined!602 (getValueByKey!829 (toList!11444 thiss!185) key!86))))

(declare-fun res!1081032 () Bool)

(assert (=> start!137678 (=> (not res!1081032) (not e!883073))))

(declare-fun lt!676815 () Bool)

(assert (=> start!137678 (= res!1081032 lt!676815)))

(declare-fun lt!676816 () Unit!52072)

(assert (=> start!137678 (= lt!676816 e!883071)))

(declare-fun c!146567 () Bool)

(assert (=> start!137678 (= c!146567 lt!676815)))

(declare-fun containsKey!962 (List!36916 (_ BitVec 64)) Bool)

(assert (=> start!137678 (= lt!676815 (containsKey!962 (toList!11444 thiss!185) key!86))))

(assert (=> start!137678 e!883073))

(declare-fun inv!59135 (ListLongMap!22857) Bool)

(assert (=> start!137678 (and (inv!59135 thiss!185) e!883072)))

(assert (=> start!137678 true))

(assert (= (and start!137678 c!146567) b!1582269))

(assert (= (and start!137678 (not c!146567)) b!1582270))

(assert (= (and start!137678 res!1081032) b!1582271))

(assert (= start!137678 b!1582272))

(declare-fun m!1452055 () Bool)

(assert (=> b!1582271 m!1452055))

(assert (=> b!1582271 m!1452055))

(declare-fun m!1452057 () Bool)

(assert (=> b!1582271 m!1452057))

(declare-fun m!1452059 () Bool)

(assert (=> b!1582269 m!1452059))

(assert (=> b!1582269 m!1452055))

(assert (=> b!1582269 m!1452055))

(assert (=> b!1582269 m!1452057))

(declare-fun m!1452061 () Bool)

(assert (=> start!137678 m!1452061))

(declare-fun m!1452063 () Bool)

(assert (=> start!137678 m!1452063))

(check-sat (not b!1582271) (not start!137678) (not b!1582269) (not b!1582272))
(check-sat)
