; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132378 () Bool)

(assert start!132378)

(declare-fun res!1063180 () Bool)

(declare-fun e!864769 () Bool)

(assert (=> start!132378 (=> (not res!1063180) (not e!864769))))

(declare-datatypes ((B!2210 0))(
  ( (B!2211 (val!19191 Int)) )
))
(declare-datatypes ((tuple2!24830 0))(
  ( (tuple2!24831 (_1!12426 (_ BitVec 64)) (_2!12426 B!2210)) )
))
(declare-datatypes ((List!36270 0))(
  ( (Nil!36267) (Cons!36266 (h!37713 tuple2!24830) (t!50983 List!36270)) )
))
(declare-datatypes ((ListLongMap!22439 0))(
  ( (ListLongMap!22440 (toList!11235 List!36270)) )
))
(declare-fun lm!249 () ListLongMap!22439)

(declare-fun a0!49 () (_ BitVec 64))

(declare-fun contains!10098 (ListLongMap!22439 (_ BitVec 64)) Bool)

(assert (=> start!132378 (= res!1063180 (contains!10098 lm!249 a0!49))))

(assert (=> start!132378 e!864769))

(declare-fun e!864768 () Bool)

(declare-fun inv!57303 (ListLongMap!22439) Bool)

(assert (=> start!132378 (and (inv!57303 lm!249) e!864768)))

(assert (=> start!132378 true))

(declare-fun tp_is_empty!38221 () Bool)

(assert (=> start!132378 tp_is_empty!38221))

(declare-fun b!1553232 () Bool)

(assert (=> b!1553232 (= e!864769 (not true))))

(declare-fun e!864770 () Bool)

(assert (=> b!1553232 e!864770))

(declare-fun res!1063181 () Bool)

(assert (=> b!1553232 (=> (not res!1063181) (not e!864770))))

(declare-fun lt!669415 () List!36270)

(declare-fun containsKey!756 (List!36270 (_ BitVec 64)) Bool)

(assert (=> b!1553232 (= res!1063181 (containsKey!756 lt!669415 a0!49))))

(declare-fun a!523 () (_ BitVec 64))

(declare-fun b!96 () B!2210)

(declare-fun insertStrictlySorted!505 (List!36270 (_ BitVec 64) B!2210) List!36270)

(assert (=> b!1553232 (= lt!669415 (insertStrictlySorted!505 (toList!11235 lm!249) a!523 b!96))))

(declare-datatypes ((Unit!51560 0))(
  ( (Unit!51561) )
))
(declare-fun lt!669414 () Unit!51560)

(declare-fun lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!1 (List!36270 (_ BitVec 64) B!2210 (_ BitVec 64)) Unit!51560)

(assert (=> b!1553232 (= lt!669414 (lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!1 (toList!11235 lm!249) a!523 b!96 a0!49))))

(declare-fun b!1553233 () Bool)

(declare-fun tp!112111 () Bool)

(assert (=> b!1553233 (= e!864768 tp!112111)))

(declare-fun b!1553234 () Bool)

(declare-datatypes ((Option!814 0))(
  ( (Some!813 (v!21992 B!2210)) (None!812) )
))
(declare-fun getValueByKey!739 (List!36270 (_ BitVec 64)) Option!814)

(assert (=> b!1553234 (= e!864770 (= (getValueByKey!739 lt!669415 a0!49) (getValueByKey!739 (toList!11235 lm!249) a0!49)))))

(declare-fun b!1553235 () Bool)

(declare-fun res!1063182 () Bool)

(assert (=> b!1553235 (=> (not res!1063182) (not e!864769))))

(assert (=> b!1553235 (= res!1063182 (containsKey!756 (toList!11235 lm!249) a0!49))))

(declare-fun b!1553236 () Bool)

(declare-fun res!1063183 () Bool)

(assert (=> b!1553236 (=> (not res!1063183) (not e!864769))))

(assert (=> b!1553236 (= res!1063183 (not (= a0!49 a!523)))))

(assert (= (and start!132378 res!1063180) b!1553236))

(assert (= (and b!1553236 res!1063183) b!1553235))

(assert (= (and b!1553235 res!1063182) b!1553232))

(assert (= (and b!1553232 res!1063181) b!1553234))

(assert (= start!132378 b!1553233))

(declare-fun m!1431293 () Bool)

(assert (=> start!132378 m!1431293))

(declare-fun m!1431295 () Bool)

(assert (=> start!132378 m!1431295))

(declare-fun m!1431297 () Bool)

(assert (=> b!1553232 m!1431297))

(declare-fun m!1431299 () Bool)

(assert (=> b!1553232 m!1431299))

(declare-fun m!1431301 () Bool)

(assert (=> b!1553232 m!1431301))

(declare-fun m!1431303 () Bool)

(assert (=> b!1553234 m!1431303))

(declare-fun m!1431305 () Bool)

(assert (=> b!1553234 m!1431305))

(declare-fun m!1431307 () Bool)

(assert (=> b!1553235 m!1431307))

(check-sat (not start!132378) tp_is_empty!38221 (not b!1553235) (not b!1553234) (not b!1553232) (not b!1553233))
(check-sat)
