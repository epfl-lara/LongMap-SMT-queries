; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132432 () Bool)

(assert start!132432)

(declare-fun b!1553575 () Bool)

(declare-fun e!864984 () Bool)

(assert (=> b!1553575 (= e!864984 (not true))))

(declare-fun e!864986 () Bool)

(assert (=> b!1553575 e!864986))

(declare-fun res!1063333 () Bool)

(assert (=> b!1553575 (=> (not res!1063333) (not e!864986))))

(declare-datatypes ((B!2214 0))(
  ( (B!2215 (val!19193 Int)) )
))
(declare-datatypes ((tuple2!24762 0))(
  ( (tuple2!24763 (_1!12392 (_ BitVec 64)) (_2!12392 B!2214)) )
))
(declare-datatypes ((List!36227 0))(
  ( (Nil!36224) (Cons!36223 (h!37669 tuple2!24762) (t!50948 List!36227)) )
))
(declare-fun lt!669713 () List!36227)

(declare-fun a0!49 () (_ BitVec 64))

(declare-fun containsKey!760 (List!36227 (_ BitVec 64)) Bool)

(assert (=> b!1553575 (= res!1063333 (containsKey!760 lt!669713 a0!49))))

(declare-fun a!523 () (_ BitVec 64))

(declare-fun b!96 () B!2214)

(declare-datatypes ((ListLongMap!22371 0))(
  ( (ListLongMap!22372 (toList!11201 List!36227)) )
))
(declare-fun lm!249 () ListLongMap!22371)

(declare-fun insertStrictlySorted!506 (List!36227 (_ BitVec 64) B!2214) List!36227)

(assert (=> b!1553575 (= lt!669713 (insertStrictlySorted!506 (toList!11201 lm!249) a!523 b!96))))

(declare-datatypes ((Unit!51747 0))(
  ( (Unit!51748) )
))
(declare-fun lt!669712 () Unit!51747)

(declare-fun lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!3 (List!36227 (_ BitVec 64) B!2214 (_ BitVec 64)) Unit!51747)

(assert (=> b!1553575 (= lt!669712 (lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!3 (toList!11201 lm!249) a!523 b!96 a0!49))))

(declare-fun b!1553576 () Bool)

(declare-datatypes ((Option!814 0))(
  ( (Some!813 (v!21998 B!2214)) (None!812) )
))
(declare-fun getValueByKey!738 (List!36227 (_ BitVec 64)) Option!814)

(assert (=> b!1553576 (= e!864986 (= (getValueByKey!738 lt!669713 a0!49) (getValueByKey!738 (toList!11201 lm!249) a0!49)))))

(declare-fun b!1553577 () Bool)

(declare-fun res!1063335 () Bool)

(assert (=> b!1553577 (=> (not res!1063335) (not e!864984))))

(assert (=> b!1553577 (= res!1063335 (containsKey!760 (toList!11201 lm!249) a0!49))))

(declare-fun b!1553578 () Bool)

(declare-fun res!1063334 () Bool)

(assert (=> b!1553578 (=> (not res!1063334) (not e!864984))))

(assert (=> b!1553578 (= res!1063334 (not (= a0!49 a!523)))))

(declare-fun res!1063336 () Bool)

(assert (=> start!132432 (=> (not res!1063336) (not e!864984))))

(declare-fun contains!10143 (ListLongMap!22371 (_ BitVec 64)) Bool)

(assert (=> start!132432 (= res!1063336 (contains!10143 lm!249 a0!49))))

(assert (=> start!132432 e!864984))

(declare-fun e!864985 () Bool)

(declare-fun inv!57305 (ListLongMap!22371) Bool)

(assert (=> start!132432 (and (inv!57305 lm!249) e!864985)))

(assert (=> start!132432 true))

(declare-fun tp_is_empty!38225 () Bool)

(assert (=> start!132432 tp_is_empty!38225))

(declare-fun b!1553579 () Bool)

(declare-fun tp!112116 () Bool)

(assert (=> b!1553579 (= e!864985 tp!112116)))

(assert (= (and start!132432 res!1063336) b!1553578))

(assert (= (and b!1553578 res!1063334) b!1553577))

(assert (= (and b!1553577 res!1063335) b!1553575))

(assert (= (and b!1553575 res!1063333) b!1553576))

(assert (= start!132432 b!1553579))

(declare-fun m!1432217 () Bool)

(assert (=> b!1553575 m!1432217))

(declare-fun m!1432219 () Bool)

(assert (=> b!1553575 m!1432219))

(declare-fun m!1432221 () Bool)

(assert (=> b!1553575 m!1432221))

(declare-fun m!1432223 () Bool)

(assert (=> b!1553576 m!1432223))

(declare-fun m!1432225 () Bool)

(assert (=> b!1553576 m!1432225))

(declare-fun m!1432227 () Bool)

(assert (=> b!1553577 m!1432227))

(declare-fun m!1432229 () Bool)

(assert (=> start!132432 m!1432229))

(declare-fun m!1432231 () Bool)

(assert (=> start!132432 m!1432231))

(push 1)

(assert (not b!1553579))

(assert (not b!1553575))

(assert (not b!1553577))

(assert (not start!132432))

(assert (not b!1553576))

(assert tp_is_empty!38225)

(check-sat)

(pop 1)

