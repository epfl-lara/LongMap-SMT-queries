; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132450 () Bool)

(assert start!132450)

(declare-fun b!1553610 () Bool)

(declare-fun e!865015 () Bool)

(declare-fun e!865016 () Bool)

(assert (=> b!1553610 (= e!865015 (not e!865016))))

(declare-fun res!1063381 () Bool)

(assert (=> b!1553610 (=> res!1063381 e!865016)))

(declare-datatypes ((B!2222 0))(
  ( (B!2223 (val!19197 Int)) )
))
(declare-datatypes ((tuple2!24842 0))(
  ( (tuple2!24843 (_1!12432 (_ BitVec 64)) (_2!12432 B!2222)) )
))
(declare-datatypes ((List!36276 0))(
  ( (Nil!36273) (Cons!36272 (h!37719 tuple2!24842) (t!50989 List!36276)) )
))
(declare-datatypes ((ListLongMap!22451 0))(
  ( (ListLongMap!22452 (toList!11241 List!36276)) )
))
(declare-fun lm!249 () ListLongMap!22451)

(declare-fun isStrictlySorted!891 (List!36276) Bool)

(assert (=> b!1553610 (= res!1063381 (not (isStrictlySorted!891 (toList!11241 lm!249))))))

(declare-fun e!865014 () Bool)

(assert (=> b!1553610 e!865014))

(declare-fun res!1063384 () Bool)

(assert (=> b!1553610 (=> (not res!1063384) (not e!865014))))

(declare-fun lt!669573 () List!36276)

(declare-fun a0!49 () (_ BitVec 64))

(declare-fun containsKey!762 (List!36276 (_ BitVec 64)) Bool)

(assert (=> b!1553610 (= res!1063384 (containsKey!762 lt!669573 a0!49))))

(declare-fun a!523 () (_ BitVec 64))

(declare-fun b!96 () B!2222)

(declare-fun insertStrictlySorted!511 (List!36276 (_ BitVec 64) B!2222) List!36276)

(assert (=> b!1553610 (= lt!669573 (insertStrictlySorted!511 (toList!11241 lm!249) a!523 b!96))))

(declare-datatypes ((Unit!51578 0))(
  ( (Unit!51579) )
))
(declare-fun lt!669572 () Unit!51578)

(declare-fun lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!7 (List!36276 (_ BitVec 64) B!2222 (_ BitVec 64)) Unit!51578)

(assert (=> b!1553610 (= lt!669572 (lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!7 (toList!11241 lm!249) a!523 b!96 a0!49))))

(declare-fun b!1553611 () Bool)

(declare-datatypes ((Option!820 0))(
  ( (Some!819 (v!21998 B!2222)) (None!818) )
))
(declare-fun getValueByKey!745 (List!36276 (_ BitVec 64)) Option!820)

(assert (=> b!1553611 (= e!865014 (= (getValueByKey!745 lt!669573 a0!49) (getValueByKey!745 (toList!11241 lm!249) a0!49)))))

(declare-fun b!1553612 () Bool)

(declare-fun e!865013 () Bool)

(declare-fun tp!112138 () Bool)

(assert (=> b!1553612 (= e!865013 tp!112138)))

(declare-fun b!1553609 () Bool)

(declare-fun res!1063383 () Bool)

(assert (=> b!1553609 (=> (not res!1063383) (not e!865015))))

(assert (=> b!1553609 (= res!1063383 (not (= a0!49 a!523)))))

(declare-fun res!1063380 () Bool)

(assert (=> start!132450 (=> (not res!1063380) (not e!865015))))

(declare-fun contains!10107 (ListLongMap!22451 (_ BitVec 64)) Bool)

(assert (=> start!132450 (= res!1063380 (contains!10107 lm!249 a0!49))))

(assert (=> start!132450 e!865015))

(declare-fun inv!57319 (ListLongMap!22451) Bool)

(assert (=> start!132450 (and (inv!57319 lm!249) e!865013)))

(assert (=> start!132450 true))

(declare-fun tp_is_empty!38233 () Bool)

(assert (=> start!132450 tp_is_empty!38233))

(declare-fun b!1553613 () Bool)

(assert (=> b!1553613 (= e!865016 true)))

(declare-fun isDefined!558 (Option!820) Bool)

(assert (=> b!1553613 (isDefined!558 (getValueByKey!745 (toList!11241 lm!249) a0!49))))

(declare-fun lt!669574 () Unit!51578)

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!506 (List!36276 (_ BitVec 64)) Unit!51578)

(assert (=> b!1553613 (= lt!669574 (lemmaContainsKeyImpliesGetValueByKeyDefined!506 (toList!11241 lm!249) a0!49))))

(declare-fun b!1553614 () Bool)

(declare-fun res!1063382 () Bool)

(assert (=> b!1553614 (=> (not res!1063382) (not e!865015))))

(assert (=> b!1553614 (= res!1063382 (containsKey!762 (toList!11241 lm!249) a0!49))))

(assert (= (and start!132450 res!1063380) b!1553609))

(assert (= (and b!1553609 res!1063383) b!1553614))

(assert (= (and b!1553614 res!1063382) b!1553610))

(assert (= (and b!1553610 res!1063384) b!1553611))

(assert (= (and b!1553610 (not res!1063381)) b!1553613))

(assert (= start!132450 b!1553612))

(declare-fun m!1431569 () Bool)

(assert (=> start!132450 m!1431569))

(declare-fun m!1431571 () Bool)

(assert (=> start!132450 m!1431571))

(declare-fun m!1431573 () Bool)

(assert (=> b!1553610 m!1431573))

(declare-fun m!1431575 () Bool)

(assert (=> b!1553610 m!1431575))

(declare-fun m!1431577 () Bool)

(assert (=> b!1553610 m!1431577))

(declare-fun m!1431579 () Bool)

(assert (=> b!1553610 m!1431579))

(declare-fun m!1431581 () Bool)

(assert (=> b!1553611 m!1431581))

(declare-fun m!1431583 () Bool)

(assert (=> b!1553611 m!1431583))

(assert (=> b!1553613 m!1431583))

(assert (=> b!1553613 m!1431583))

(declare-fun m!1431585 () Bool)

(assert (=> b!1553613 m!1431585))

(declare-fun m!1431587 () Bool)

(assert (=> b!1553613 m!1431587))

(declare-fun m!1431589 () Bool)

(assert (=> b!1553614 m!1431589))

(check-sat (not b!1553610) tp_is_empty!38233 (not b!1553613) (not start!132450) (not b!1553614) (not b!1553612) (not b!1553611))
(check-sat)
