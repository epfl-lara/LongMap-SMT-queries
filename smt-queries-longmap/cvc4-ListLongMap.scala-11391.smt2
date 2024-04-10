; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132504 () Bool)

(assert start!132504)

(declare-fun b!1553958 () Bool)

(declare-fun res!1063542 () Bool)

(declare-fun e!865235 () Bool)

(assert (=> b!1553958 (=> (not res!1063542) (not e!865235))))

(declare-fun a0!49 () (_ BitVec 64))

(declare-fun a!523 () (_ BitVec 64))

(assert (=> b!1553958 (= res!1063542 (not (= a0!49 a!523)))))

(declare-fun b!1553959 () Bool)

(declare-fun e!865236 () Bool)

(declare-fun tp!112143 () Bool)

(assert (=> b!1553959 (= e!865236 tp!112143)))

(declare-fun b!1553960 () Bool)

(declare-fun e!865238 () Bool)

(assert (=> b!1553960 (= e!865238 true)))

(declare-datatypes ((B!2226 0))(
  ( (B!2227 (val!19199 Int)) )
))
(declare-datatypes ((tuple2!24774 0))(
  ( (tuple2!24775 (_1!12398 (_ BitVec 64)) (_2!12398 B!2226)) )
))
(declare-datatypes ((List!36233 0))(
  ( (Nil!36230) (Cons!36229 (h!37675 tuple2!24774) (t!50954 List!36233)) )
))
(declare-datatypes ((ListLongMap!22383 0))(
  ( (ListLongMap!22384 (toList!11207 List!36233)) )
))
(declare-fun lm!249 () ListLongMap!22383)

(declare-datatypes ((Option!820 0))(
  ( (Some!819 (v!22004 B!2226)) (None!818) )
))
(declare-fun isDefined!557 (Option!820) Bool)

(declare-fun getValueByKey!744 (List!36233 (_ BitVec 64)) Option!820)

(assert (=> b!1553960 (isDefined!557 (getValueByKey!744 (toList!11207 lm!249) a0!49))))

(declare-datatypes ((Unit!51765 0))(
  ( (Unit!51766) )
))
(declare-fun lt!669876 () Unit!51765)

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!509 (List!36233 (_ BitVec 64)) Unit!51765)

(assert (=> b!1553960 (= lt!669876 (lemmaContainsKeyImpliesGetValueByKeyDefined!509 (toList!11207 lm!249) a0!49))))

(declare-fun lt!669878 () List!36233)

(declare-fun b!1553962 () Bool)

(declare-fun e!865237 () Bool)

(assert (=> b!1553962 (= e!865237 (= (getValueByKey!744 lt!669878 a0!49) (getValueByKey!744 (toList!11207 lm!249) a0!49)))))

(declare-fun b!1553963 () Bool)

(declare-fun res!1063539 () Bool)

(assert (=> b!1553963 (=> (not res!1063539) (not e!865235))))

(declare-fun containsKey!766 (List!36233 (_ BitVec 64)) Bool)

(assert (=> b!1553963 (= res!1063539 (containsKey!766 (toList!11207 lm!249) a0!49))))

(declare-fun res!1063543 () Bool)

(assert (=> start!132504 (=> (not res!1063543) (not e!865235))))

(declare-fun contains!10152 (ListLongMap!22383 (_ BitVec 64)) Bool)

(assert (=> start!132504 (= res!1063543 (contains!10152 lm!249 a0!49))))

(assert (=> start!132504 e!865235))

(declare-fun inv!57321 (ListLongMap!22383) Bool)

(assert (=> start!132504 (and (inv!57321 lm!249) e!865236)))

(assert (=> start!132504 true))

(declare-fun tp_is_empty!38237 () Bool)

(assert (=> start!132504 tp_is_empty!38237))

(declare-fun b!1553961 () Bool)

(assert (=> b!1553961 (= e!865235 (not e!865238))))

(declare-fun res!1063541 () Bool)

(assert (=> b!1553961 (=> res!1063541 e!865238)))

(declare-fun isStrictlySorted!896 (List!36233) Bool)

(assert (=> b!1553961 (= res!1063541 (not (isStrictlySorted!896 (toList!11207 lm!249))))))

(assert (=> b!1553961 e!865237))

(declare-fun res!1063540 () Bool)

(assert (=> b!1553961 (=> (not res!1063540) (not e!865237))))

(assert (=> b!1553961 (= res!1063540 (containsKey!766 lt!669878 a0!49))))

(declare-fun b!96 () B!2226)

(declare-fun insertStrictlySorted!512 (List!36233 (_ BitVec 64) B!2226) List!36233)

(assert (=> b!1553961 (= lt!669878 (insertStrictlySorted!512 (toList!11207 lm!249) a!523 b!96))))

(declare-fun lt!669877 () Unit!51765)

(declare-fun lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!9 (List!36233 (_ BitVec 64) B!2226 (_ BitVec 64)) Unit!51765)

(assert (=> b!1553961 (= lt!669877 (lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!9 (toList!11207 lm!249) a!523 b!96 a0!49))))

(assert (= (and start!132504 res!1063543) b!1553958))

(assert (= (and b!1553958 res!1063542) b!1553963))

(assert (= (and b!1553963 res!1063539) b!1553961))

(assert (= (and b!1553961 res!1063540) b!1553962))

(assert (= (and b!1553961 (not res!1063541)) b!1553960))

(assert (= start!132504 b!1553959))

(declare-fun m!1432505 () Bool)

(assert (=> b!1553962 m!1432505))

(declare-fun m!1432507 () Bool)

(assert (=> b!1553962 m!1432507))

(declare-fun m!1432509 () Bool)

(assert (=> start!132504 m!1432509))

(declare-fun m!1432511 () Bool)

(assert (=> start!132504 m!1432511))

(assert (=> b!1553960 m!1432507))

(assert (=> b!1553960 m!1432507))

(declare-fun m!1432513 () Bool)

(assert (=> b!1553960 m!1432513))

(declare-fun m!1432515 () Bool)

(assert (=> b!1553960 m!1432515))

(declare-fun m!1432517 () Bool)

(assert (=> b!1553961 m!1432517))

(declare-fun m!1432519 () Bool)

(assert (=> b!1553961 m!1432519))

(declare-fun m!1432521 () Bool)

(assert (=> b!1553961 m!1432521))

(declare-fun m!1432523 () Bool)

(assert (=> b!1553961 m!1432523))

(declare-fun m!1432525 () Bool)

(assert (=> b!1553963 m!1432525))

(push 1)

(assert (not start!132504))

(assert (not b!1553963))

(assert (not b!1553961))

(assert (not b!1553959))

(assert (not b!1553962))

(assert (not b!1553960))

(assert tp_is_empty!38237)

(check-sat)

