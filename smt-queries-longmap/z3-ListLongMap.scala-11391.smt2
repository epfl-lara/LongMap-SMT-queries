; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132912 () Bool)

(assert start!132912)

(declare-fun b!1556358 () Bool)

(declare-fun res!1064369 () Bool)

(declare-fun e!866723 () Bool)

(assert (=> b!1556358 (=> (not res!1064369) (not e!866723))))

(declare-fun a0!49 () (_ BitVec 64))

(declare-fun a!523 () (_ BitVec 64))

(assert (=> b!1556358 (= res!1064369 (not (= a0!49 a!523)))))

(declare-fun b!1556359 () Bool)

(declare-fun e!866722 () Bool)

(assert (=> b!1556359 (= e!866723 (not e!866722))))

(declare-fun res!1064371 () Bool)

(assert (=> b!1556359 (=> res!1064371 e!866722)))

(declare-datatypes ((B!2222 0))(
  ( (B!2223 (val!19197 Int)) )
))
(declare-datatypes ((tuple2!24824 0))(
  ( (tuple2!24825 (_1!12423 (_ BitVec 64)) (_2!12423 B!2222)) )
))
(declare-datatypes ((List!36260 0))(
  ( (Nil!36257) (Cons!36256 (h!37720 tuple2!24824) (t!50973 List!36260)) )
))
(declare-datatypes ((ListLongMap!22441 0))(
  ( (ListLongMap!22442 (toList!11236 List!36260)) )
))
(declare-fun lm!249 () ListLongMap!22441)

(declare-fun isStrictlySorted!882 (List!36260) Bool)

(assert (=> b!1556359 (= res!1064371 (not (isStrictlySorted!882 (toList!11236 lm!249))))))

(declare-fun e!866720 () Bool)

(assert (=> b!1556359 e!866720))

(declare-fun res!1064373 () Bool)

(assert (=> b!1556359 (=> (not res!1064373) (not e!866720))))

(declare-fun lt!670766 () List!36260)

(declare-fun containsKey!764 (List!36260 (_ BitVec 64)) Bool)

(assert (=> b!1556359 (= res!1064373 (containsKey!764 lt!670766 a0!49))))

(declare-fun b!96 () B!2222)

(declare-fun insertStrictlySorted!511 (List!36260 (_ BitVec 64) B!2222) List!36260)

(assert (=> b!1556359 (= lt!670766 (insertStrictlySorted!511 (toList!11236 lm!249) a!523 b!96))))

(declare-datatypes ((Unit!51672 0))(
  ( (Unit!51673) )
))
(declare-fun lt!670768 () Unit!51672)

(declare-fun lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!7 (List!36260 (_ BitVec 64) B!2222 (_ BitVec 64)) Unit!51672)

(assert (=> b!1556359 (= lt!670768 (lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!7 (toList!11236 lm!249) a!523 b!96 a0!49))))

(declare-fun b!1556360 () Bool)

(declare-fun e!866721 () Bool)

(declare-fun tp!112137 () Bool)

(assert (=> b!1556360 (= e!866721 tp!112137)))

(declare-fun b!1556361 () Bool)

(declare-datatypes ((Option!813 0))(
  ( (Some!812 (v!21994 B!2222)) (None!811) )
))
(declare-fun getValueByKey!738 (List!36260 (_ BitVec 64)) Option!813)

(assert (=> b!1556361 (= e!866720 (= (getValueByKey!738 lt!670766 a0!49) (getValueByKey!738 (toList!11236 lm!249) a0!49)))))

(declare-fun res!1064372 () Bool)

(assert (=> start!132912 (=> (not res!1064372) (not e!866723))))

(declare-fun contains!10193 (ListLongMap!22441 (_ BitVec 64)) Bool)

(assert (=> start!132912 (= res!1064372 (contains!10193 lm!249 a0!49))))

(assert (=> start!132912 e!866723))

(declare-fun inv!57319 (ListLongMap!22441) Bool)

(assert (=> start!132912 (and (inv!57319 lm!249) e!866721)))

(assert (=> start!132912 true))

(declare-fun tp_is_empty!38233 () Bool)

(assert (=> start!132912 tp_is_empty!38233))

(declare-fun b!1556362 () Bool)

(assert (=> b!1556362 (= e!866722 true)))

(declare-fun isDefined!553 (Option!813) Bool)

(assert (=> b!1556362 (isDefined!553 (getValueByKey!738 (toList!11236 lm!249) a0!49))))

(declare-fun lt!670767 () Unit!51672)

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!507 (List!36260 (_ BitVec 64)) Unit!51672)

(assert (=> b!1556362 (= lt!670767 (lemmaContainsKeyImpliesGetValueByKeyDefined!507 (toList!11236 lm!249) a0!49))))

(declare-fun b!1556363 () Bool)

(declare-fun res!1064370 () Bool)

(assert (=> b!1556363 (=> (not res!1064370) (not e!866723))))

(assert (=> b!1556363 (= res!1064370 (containsKey!764 (toList!11236 lm!249) a0!49))))

(assert (= (and start!132912 res!1064372) b!1556358))

(assert (= (and b!1556358 res!1064369) b!1556363))

(assert (= (and b!1556363 res!1064370) b!1556359))

(assert (= (and b!1556359 res!1064373) b!1556361))

(assert (= (and b!1556359 (not res!1064371)) b!1556362))

(assert (= start!132912 b!1556360))

(declare-fun m!1434719 () Bool)

(assert (=> b!1556359 m!1434719))

(declare-fun m!1434721 () Bool)

(assert (=> b!1556359 m!1434721))

(declare-fun m!1434723 () Bool)

(assert (=> b!1556359 m!1434723))

(declare-fun m!1434725 () Bool)

(assert (=> b!1556359 m!1434725))

(declare-fun m!1434727 () Bool)

(assert (=> b!1556361 m!1434727))

(declare-fun m!1434729 () Bool)

(assert (=> b!1556361 m!1434729))

(declare-fun m!1434731 () Bool)

(assert (=> start!132912 m!1434731))

(declare-fun m!1434733 () Bool)

(assert (=> start!132912 m!1434733))

(assert (=> b!1556362 m!1434729))

(assert (=> b!1556362 m!1434729))

(declare-fun m!1434735 () Bool)

(assert (=> b!1556362 m!1434735))

(declare-fun m!1434737 () Bool)

(assert (=> b!1556362 m!1434737))

(declare-fun m!1434739 () Bool)

(assert (=> b!1556363 m!1434739))

(check-sat (not start!132912) (not b!1556362) tp_is_empty!38233 (not b!1556363) (not b!1556360) (not b!1556359) (not b!1556361))
(check-sat)
