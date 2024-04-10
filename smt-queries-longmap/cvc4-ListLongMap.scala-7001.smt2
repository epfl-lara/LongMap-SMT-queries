; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!88904 () Bool)

(assert start!88904)

(declare-fun b!1020264 () Bool)

(declare-fun res!683843 () Bool)

(declare-fun e!574247 () Bool)

(assert (=> b!1020264 (=> (not res!683843) (not e!574247))))

(declare-datatypes ((B!1716 0))(
  ( (B!1717 (val!11942 Int)) )
))
(declare-datatypes ((tuple2!15430 0))(
  ( (tuple2!15431 (_1!7726 (_ BitVec 64)) (_2!7726 B!1716)) )
))
(declare-datatypes ((List!21630 0))(
  ( (Nil!21627) (Cons!21626 (h!22824 tuple2!15430) (t!30640 List!21630)) )
))
(declare-fun l!1367 () List!21630)

(declare-fun isStrictlySorted!695 (List!21630) Bool)

(assert (=> b!1020264 (= res!683843 (isStrictlySorted!695 (t!30640 l!1367)))))

(declare-fun b!1020265 () Bool)

(declare-fun res!683845 () Bool)

(assert (=> b!1020265 (=> (not res!683845) (not e!574247))))

(declare-fun lt!449823 () tuple2!15430)

(assert (=> b!1020265 (= res!683845 (and (is-Cons!21626 l!1367) (not (= (h!22824 l!1367) lt!449823))))))

(declare-fun b!1020266 () Bool)

(declare-fun e!574248 () Bool)

(declare-fun tp_is_empty!23783 () Bool)

(declare-fun tp!71224 () Bool)

(assert (=> b!1020266 (= e!574248 (and tp_is_empty!23783 tp!71224))))

(declare-fun b!1020267 () Bool)

(assert (=> b!1020267 (= e!574247 (not true))))

(declare-fun key!393 () (_ BitVec 64))

(declare-fun containsKey!552 (List!21630 (_ BitVec 64)) Bool)

(assert (=> b!1020267 (containsKey!552 (t!30640 l!1367) key!393)))

(declare-fun value!188 () B!1716)

(declare-datatypes ((Unit!33297 0))(
  ( (Unit!33298) )
))
(declare-fun lt!449822 () Unit!33297)

(declare-fun lemmaContainsTupleThenContainsKey!12 (List!21630 (_ BitVec 64) B!1716) Unit!33297)

(assert (=> b!1020267 (= lt!449822 (lemmaContainsTupleThenContainsKey!12 (t!30640 l!1367) key!393 value!188))))

(declare-fun b!1020268 () Bool)

(declare-fun res!683844 () Bool)

(assert (=> b!1020268 (=> (not res!683844) (not e!574247))))

(declare-fun contains!5921 (List!21630 tuple2!15430) Bool)

(assert (=> b!1020268 (= res!683844 (contains!5921 (t!30640 l!1367) lt!449823))))

(declare-fun res!683842 () Bool)

(declare-fun e!574246 () Bool)

(assert (=> start!88904 (=> (not res!683842) (not e!574246))))

(assert (=> start!88904 (= res!683842 (isStrictlySorted!695 l!1367))))

(assert (=> start!88904 e!574246))

(assert (=> start!88904 e!574248))

(assert (=> start!88904 true))

(assert (=> start!88904 tp_is_empty!23783))

(declare-fun b!1020269 () Bool)

(assert (=> b!1020269 (= e!574246 e!574247)))

(declare-fun res!683846 () Bool)

(assert (=> b!1020269 (=> (not res!683846) (not e!574247))))

(assert (=> b!1020269 (= res!683846 (contains!5921 l!1367 lt!449823))))

(assert (=> b!1020269 (= lt!449823 (tuple2!15431 key!393 value!188))))

(assert (= (and start!88904 res!683842) b!1020269))

(assert (= (and b!1020269 res!683846) b!1020265))

(assert (= (and b!1020265 res!683845) b!1020264))

(assert (= (and b!1020264 res!683843) b!1020268))

(assert (= (and b!1020268 res!683844) b!1020267))

(assert (= (and start!88904 (is-Cons!21626 l!1367)) b!1020266))

(declare-fun m!940279 () Bool)

(assert (=> b!1020264 m!940279))

(declare-fun m!940281 () Bool)

(assert (=> b!1020268 m!940281))

(declare-fun m!940283 () Bool)

(assert (=> start!88904 m!940283))

(declare-fun m!940285 () Bool)

(assert (=> b!1020267 m!940285))

(declare-fun m!940287 () Bool)

(assert (=> b!1020267 m!940287))

(declare-fun m!940289 () Bool)

(assert (=> b!1020269 m!940289))

(push 1)

