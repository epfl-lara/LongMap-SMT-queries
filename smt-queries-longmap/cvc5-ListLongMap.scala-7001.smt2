; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!88900 () Bool)

(assert start!88900)

(declare-fun b!1020228 () Bool)

(declare-fun e!574229 () Bool)

(assert (=> b!1020228 (= e!574229 (not true))))

(declare-datatypes ((B!1712 0))(
  ( (B!1713 (val!11940 Int)) )
))
(declare-datatypes ((tuple2!15426 0))(
  ( (tuple2!15427 (_1!7724 (_ BitVec 64)) (_2!7724 B!1712)) )
))
(declare-datatypes ((List!21628 0))(
  ( (Nil!21625) (Cons!21624 (h!22822 tuple2!15426) (t!30638 List!21628)) )
))
(declare-fun l!1367 () List!21628)

(declare-fun key!393 () (_ BitVec 64))

(declare-fun containsKey!550 (List!21628 (_ BitVec 64)) Bool)

(assert (=> b!1020228 (containsKey!550 (t!30638 l!1367) key!393)))

(declare-fun value!188 () B!1712)

(declare-datatypes ((Unit!33293 0))(
  ( (Unit!33294) )
))
(declare-fun lt!449810 () Unit!33293)

(declare-fun lemmaContainsTupleThenContainsKey!10 (List!21628 (_ BitVec 64) B!1712) Unit!33293)

(assert (=> b!1020228 (= lt!449810 (lemmaContainsTupleThenContainsKey!10 (t!30638 l!1367) key!393 value!188))))

(declare-fun res!683815 () Bool)

(declare-fun e!574230 () Bool)

(assert (=> start!88900 (=> (not res!683815) (not e!574230))))

(declare-fun isStrictlySorted!693 (List!21628) Bool)

(assert (=> start!88900 (= res!683815 (isStrictlySorted!693 l!1367))))

(assert (=> start!88900 e!574230))

(declare-fun e!574228 () Bool)

(assert (=> start!88900 e!574228))

(assert (=> start!88900 true))

(declare-fun tp_is_empty!23779 () Bool)

(assert (=> start!88900 tp_is_empty!23779))

(declare-fun b!1020229 () Bool)

(declare-fun tp!71218 () Bool)

(assert (=> b!1020229 (= e!574228 (and tp_is_empty!23779 tp!71218))))

(declare-fun b!1020230 () Bool)

(assert (=> b!1020230 (= e!574230 e!574229)))

(declare-fun res!683816 () Bool)

(assert (=> b!1020230 (=> (not res!683816) (not e!574229))))

(declare-fun lt!449811 () tuple2!15426)

(declare-fun contains!5919 (List!21628 tuple2!15426) Bool)

(assert (=> b!1020230 (= res!683816 (contains!5919 l!1367 lt!449811))))

(assert (=> b!1020230 (= lt!449811 (tuple2!15427 key!393 value!188))))

(declare-fun b!1020231 () Bool)

(declare-fun res!683812 () Bool)

(assert (=> b!1020231 (=> (not res!683812) (not e!574229))))

(assert (=> b!1020231 (= res!683812 (contains!5919 (t!30638 l!1367) lt!449811))))

(declare-fun b!1020232 () Bool)

(declare-fun res!683814 () Bool)

(assert (=> b!1020232 (=> (not res!683814) (not e!574229))))

(assert (=> b!1020232 (= res!683814 (and (is-Cons!21624 l!1367) (not (= (h!22822 l!1367) lt!449811))))))

(declare-fun b!1020233 () Bool)

(declare-fun res!683813 () Bool)

(assert (=> b!1020233 (=> (not res!683813) (not e!574229))))

(assert (=> b!1020233 (= res!683813 (isStrictlySorted!693 (t!30638 l!1367)))))

(assert (= (and start!88900 res!683815) b!1020230))

(assert (= (and b!1020230 res!683816) b!1020232))

(assert (= (and b!1020232 res!683814) b!1020233))

(assert (= (and b!1020233 res!683813) b!1020231))

(assert (= (and b!1020231 res!683812) b!1020228))

(assert (= (and start!88900 (is-Cons!21624 l!1367)) b!1020229))

(declare-fun m!940255 () Bool)

(assert (=> b!1020233 m!940255))

(declare-fun m!940257 () Bool)

(assert (=> start!88900 m!940257))

(declare-fun m!940259 () Bool)

(assert (=> b!1020228 m!940259))

(declare-fun m!940261 () Bool)

(assert (=> b!1020228 m!940261))

(declare-fun m!940263 () Bool)

(assert (=> b!1020231 m!940263))

(declare-fun m!940265 () Bool)

(assert (=> b!1020230 m!940265))

(push 1)

