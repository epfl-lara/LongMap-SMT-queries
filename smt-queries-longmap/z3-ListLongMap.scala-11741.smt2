; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137714 () Bool)

(assert start!137714)

(declare-fun b!1582594 () Bool)

(declare-datatypes ((Unit!52267 0))(
  ( (Unit!52268) )
))
(declare-fun e!883279 () Unit!52267)

(declare-fun lt!677107 () Unit!52267)

(assert (=> b!1582594 (= e!883279 lt!677107)))

(declare-datatypes ((B!2788 0))(
  ( (B!2789 (val!19756 Int)) )
))
(declare-datatypes ((tuple2!25680 0))(
  ( (tuple2!25681 (_1!12851 (_ BitVec 64)) (_2!12851 B!2788)) )
))
(declare-datatypes ((List!36876 0))(
  ( (Nil!36873) (Cons!36872 (h!38415 tuple2!25680) (t!51790 List!36876)) )
))
(declare-datatypes ((ListLongMap!22791 0))(
  ( (ListLongMap!22792 (toList!11411 List!36876)) )
))
(declare-fun thiss!185 () ListLongMap!22791)

(declare-fun key!86 () (_ BitVec 64))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!550 (List!36876 (_ BitVec 64)) Unit!52267)

(assert (=> b!1582594 (= lt!677107 (lemmaContainsKeyImpliesGetValueByKeyDefined!550 (toList!11411 thiss!185) key!86))))

(declare-datatypes ((Option!936 0))(
  ( (Some!935 (v!22463 B!2788)) (None!934) )
))
(declare-fun isDefined!601 (Option!936) Bool)

(declare-fun getValueByKey!827 (List!36876 (_ BitVec 64)) Option!936)

(assert (=> b!1582594 (isDefined!601 (getValueByKey!827 (toList!11411 thiss!185) key!86))))

(declare-fun res!1081164 () Bool)

(declare-fun e!883278 () Bool)

(assert (=> start!137714 (=> (not res!1081164) (not e!883278))))

(declare-fun lt!677108 () Bool)

(assert (=> start!137714 (= res!1081164 lt!677108)))

(declare-fun lt!677109 () Unit!52267)

(assert (=> start!137714 (= lt!677109 e!883279)))

(declare-fun c!146659 () Bool)

(assert (=> start!137714 (= c!146659 lt!677108)))

(declare-fun containsKey!965 (List!36876 (_ BitVec 64)) Bool)

(assert (=> start!137714 (= lt!677108 (containsKey!965 (toList!11411 thiss!185) key!86))))

(assert (=> start!137714 e!883278))

(declare-fun e!883280 () Bool)

(declare-fun inv!59136 (ListLongMap!22791) Bool)

(assert (=> start!137714 (and (inv!59136 thiss!185) e!883280)))

(assert (=> start!137714 true))

(declare-fun b!1582595 () Bool)

(declare-fun Unit!52269 () Unit!52267)

(assert (=> b!1582595 (= e!883279 Unit!52269)))

(declare-fun b!1582597 () Bool)

(declare-fun tp!114797 () Bool)

(assert (=> b!1582597 (= e!883280 tp!114797)))

(declare-fun b!1582596 () Bool)

(assert (=> b!1582596 (= e!883278 (not (isDefined!601 (getValueByKey!827 (toList!11411 thiss!185) key!86))))))

(assert (= (and start!137714 c!146659) b!1582594))

(assert (= (and start!137714 (not c!146659)) b!1582595))

(assert (= (and start!137714 res!1081164) b!1582596))

(assert (= start!137714 b!1582597))

(declare-fun m!1452945 () Bool)

(assert (=> b!1582594 m!1452945))

(declare-fun m!1452947 () Bool)

(assert (=> b!1582594 m!1452947))

(assert (=> b!1582594 m!1452947))

(declare-fun m!1452949 () Bool)

(assert (=> b!1582594 m!1452949))

(declare-fun m!1452951 () Bool)

(assert (=> start!137714 m!1452951))

(declare-fun m!1452953 () Bool)

(assert (=> start!137714 m!1452953))

(assert (=> b!1582596 m!1452947))

(assert (=> b!1582596 m!1452947))

(assert (=> b!1582596 m!1452949))

(check-sat (not start!137714) (not b!1582596) (not b!1582594) (not b!1582597))
(check-sat)
