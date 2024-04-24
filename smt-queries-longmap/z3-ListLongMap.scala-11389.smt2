; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132840 () Bool)

(assert start!132840)

(declare-fun b!1555981 () Bool)

(declare-fun res!1064171 () Bool)

(declare-fun e!866476 () Bool)

(assert (=> b!1555981 (=> (not res!1064171) (not e!866476))))

(declare-datatypes ((B!2210 0))(
  ( (B!2211 (val!19191 Int)) )
))
(declare-datatypes ((tuple2!24812 0))(
  ( (tuple2!24813 (_1!12417 (_ BitVec 64)) (_2!12417 B!2210)) )
))
(declare-datatypes ((List!36254 0))(
  ( (Nil!36251) (Cons!36250 (h!37714 tuple2!24812) (t!50967 List!36254)) )
))
(declare-datatypes ((ListLongMap!22429 0))(
  ( (ListLongMap!22430 (toList!11230 List!36254)) )
))
(declare-fun lm!249 () ListLongMap!22429)

(declare-fun a0!49 () (_ BitVec 64))

(declare-fun containsKey!758 (List!36254 (_ BitVec 64)) Bool)

(assert (=> b!1555981 (= res!1064171 (containsKey!758 (toList!11230 lm!249) a0!49))))

(declare-fun b!1555982 () Bool)

(declare-fun e!866477 () Bool)

(declare-fun tp!112110 () Bool)

(assert (=> b!1555982 (= e!866477 tp!112110)))

(declare-fun res!1064172 () Bool)

(assert (=> start!132840 (=> (not res!1064172) (not e!866476))))

(declare-fun contains!10184 (ListLongMap!22429 (_ BitVec 64)) Bool)

(assert (=> start!132840 (= res!1064172 (contains!10184 lm!249 a0!49))))

(assert (=> start!132840 e!866476))

(declare-fun inv!57303 (ListLongMap!22429) Bool)

(assert (=> start!132840 (and (inv!57303 lm!249) e!866477)))

(assert (=> start!132840 true))

(declare-fun tp_is_empty!38221 () Bool)

(assert (=> start!132840 tp_is_empty!38221))

(declare-fun b!1555983 () Bool)

(declare-fun res!1064169 () Bool)

(assert (=> b!1555983 (=> (not res!1064169) (not e!866476))))

(declare-fun a!523 () (_ BitVec 64))

(assert (=> b!1555983 (= res!1064169 (not (= a0!49 a!523)))))

(declare-fun b!1555984 () Bool)

(assert (=> b!1555984 (= e!866476 (not true))))

(declare-fun e!866475 () Bool)

(assert (=> b!1555984 e!866475))

(declare-fun res!1064170 () Bool)

(assert (=> b!1555984 (=> (not res!1064170) (not e!866475))))

(declare-fun lt!670609 () List!36254)

(assert (=> b!1555984 (= res!1064170 (containsKey!758 lt!670609 a0!49))))

(declare-fun b!96 () B!2210)

(declare-fun insertStrictlySorted!505 (List!36254 (_ BitVec 64) B!2210) List!36254)

(assert (=> b!1555984 (= lt!670609 (insertStrictlySorted!505 (toList!11230 lm!249) a!523 b!96))))

(declare-datatypes ((Unit!51655 0))(
  ( (Unit!51656) )
))
(declare-fun lt!670608 () Unit!51655)

(declare-fun lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!1 (List!36254 (_ BitVec 64) B!2210 (_ BitVec 64)) Unit!51655)

(assert (=> b!1555984 (= lt!670608 (lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!1 (toList!11230 lm!249) a!523 b!96 a0!49))))

(declare-fun b!1555985 () Bool)

(declare-datatypes ((Option!807 0))(
  ( (Some!806 (v!21988 B!2210)) (None!805) )
))
(declare-fun getValueByKey!732 (List!36254 (_ BitVec 64)) Option!807)

(assert (=> b!1555985 (= e!866475 (= (getValueByKey!732 lt!670609 a0!49) (getValueByKey!732 (toList!11230 lm!249) a0!49)))))

(assert (= (and start!132840 res!1064172) b!1555983))

(assert (= (and b!1555983 res!1064169) b!1555981))

(assert (= (and b!1555981 res!1064171) b!1555984))

(assert (= (and b!1555984 res!1064170) b!1555985))

(assert (= start!132840 b!1555982))

(declare-fun m!1434443 () Bool)

(assert (=> b!1555981 m!1434443))

(declare-fun m!1434445 () Bool)

(assert (=> start!132840 m!1434445))

(declare-fun m!1434447 () Bool)

(assert (=> start!132840 m!1434447))

(declare-fun m!1434449 () Bool)

(assert (=> b!1555984 m!1434449))

(declare-fun m!1434451 () Bool)

(assert (=> b!1555984 m!1434451))

(declare-fun m!1434453 () Bool)

(assert (=> b!1555984 m!1434453))

(declare-fun m!1434455 () Bool)

(assert (=> b!1555985 m!1434455))

(declare-fun m!1434457 () Bool)

(assert (=> b!1555985 m!1434457))

(check-sat (not b!1555985) (not start!132840) (not b!1555981) (not b!1555982) (not b!1555984) tp_is_empty!38221)
(check-sat)
