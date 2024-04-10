; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132428 () Bool)

(assert start!132428)

(declare-fun b!1553545 () Bool)

(declare-fun res!1063309 () Bool)

(declare-fun e!864967 () Bool)

(assert (=> b!1553545 (=> (not res!1063309) (not e!864967))))

(declare-datatypes ((B!2210 0))(
  ( (B!2211 (val!19191 Int)) )
))
(declare-datatypes ((tuple2!24758 0))(
  ( (tuple2!24759 (_1!12390 (_ BitVec 64)) (_2!12390 B!2210)) )
))
(declare-datatypes ((List!36225 0))(
  ( (Nil!36222) (Cons!36221 (h!37667 tuple2!24758) (t!50946 List!36225)) )
))
(declare-datatypes ((ListLongMap!22367 0))(
  ( (ListLongMap!22368 (toList!11199 List!36225)) )
))
(declare-fun lm!249 () ListLongMap!22367)

(declare-fun a0!49 () (_ BitVec 64))

(declare-fun containsKey!758 (List!36225 (_ BitVec 64)) Bool)

(assert (=> b!1553545 (= res!1063309 (containsKey!758 (toList!11199 lm!249) a0!49))))

(declare-fun b!1553546 () Bool)

(assert (=> b!1553546 (= e!864967 (not true))))

(declare-fun e!864968 () Bool)

(assert (=> b!1553546 e!864968))

(declare-fun res!1063310 () Bool)

(assert (=> b!1553546 (=> (not res!1063310) (not e!864968))))

(declare-fun lt!669701 () List!36225)

(assert (=> b!1553546 (= res!1063310 (containsKey!758 lt!669701 a0!49))))

(declare-fun a!523 () (_ BitVec 64))

(declare-fun b!96 () B!2210)

(declare-fun insertStrictlySorted!504 (List!36225 (_ BitVec 64) B!2210) List!36225)

(assert (=> b!1553546 (= lt!669701 (insertStrictlySorted!504 (toList!11199 lm!249) a!523 b!96))))

(declare-datatypes ((Unit!51743 0))(
  ( (Unit!51744) )
))
(declare-fun lt!669700 () Unit!51743)

(declare-fun lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!1 (List!36225 (_ BitVec 64) B!2210 (_ BitVec 64)) Unit!51743)

(assert (=> b!1553546 (= lt!669700 (lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!1 (toList!11199 lm!249) a!523 b!96 a0!49))))

(declare-fun res!1063311 () Bool)

(assert (=> start!132428 (=> (not res!1063311) (not e!864967))))

(declare-fun contains!10141 (ListLongMap!22367 (_ BitVec 64)) Bool)

(assert (=> start!132428 (= res!1063311 (contains!10141 lm!249 a0!49))))

(assert (=> start!132428 e!864967))

(declare-fun e!864966 () Bool)

(declare-fun inv!57303 (ListLongMap!22367) Bool)

(assert (=> start!132428 (and (inv!57303 lm!249) e!864966)))

(assert (=> start!132428 true))

(declare-fun tp_is_empty!38221 () Bool)

(assert (=> start!132428 tp_is_empty!38221))

(declare-fun b!1553547 () Bool)

(declare-datatypes ((Option!812 0))(
  ( (Some!811 (v!21996 B!2210)) (None!810) )
))
(declare-fun getValueByKey!736 (List!36225 (_ BitVec 64)) Option!812)

(assert (=> b!1553547 (= e!864968 (= (getValueByKey!736 lt!669701 a0!49) (getValueByKey!736 (toList!11199 lm!249) a0!49)))))

(declare-fun b!1553548 () Bool)

(declare-fun tp!112110 () Bool)

(assert (=> b!1553548 (= e!864966 tp!112110)))

(declare-fun b!1553549 () Bool)

(declare-fun res!1063312 () Bool)

(assert (=> b!1553549 (=> (not res!1063312) (not e!864967))))

(assert (=> b!1553549 (= res!1063312 (not (= a0!49 a!523)))))

(assert (= (and start!132428 res!1063311) b!1553549))

(assert (= (and b!1553549 res!1063312) b!1553545))

(assert (= (and b!1553545 res!1063309) b!1553546))

(assert (= (and b!1553546 res!1063310) b!1553547))

(assert (= start!132428 b!1553548))

(declare-fun m!1432185 () Bool)

(assert (=> b!1553545 m!1432185))

(declare-fun m!1432187 () Bool)

(assert (=> b!1553546 m!1432187))

(declare-fun m!1432189 () Bool)

(assert (=> b!1553546 m!1432189))

(declare-fun m!1432191 () Bool)

(assert (=> b!1553546 m!1432191))

(declare-fun m!1432193 () Bool)

(assert (=> start!132428 m!1432193))

(declare-fun m!1432195 () Bool)

(assert (=> start!132428 m!1432195))

(declare-fun m!1432197 () Bool)

(assert (=> b!1553547 m!1432197))

(declare-fun m!1432199 () Bool)

(assert (=> b!1553547 m!1432199))

(push 1)

(assert (not b!1553546))

(assert (not b!1553548))

(assert tp_is_empty!38221)

(assert (not b!1553547))

(assert (not b!1553545))

(assert (not start!132428))

(check-sat)

(pop 1)

