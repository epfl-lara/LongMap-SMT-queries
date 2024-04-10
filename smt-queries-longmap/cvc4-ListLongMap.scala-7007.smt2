; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89012 () Bool)

(assert start!89012)

(declare-fun b!1020818 () Bool)

(declare-fun e!574669 () Bool)

(declare-fun tp_is_empty!23819 () Bool)

(declare-fun tp!71314 () Bool)

(assert (=> b!1020818 (= e!574669 (and tp_is_empty!23819 tp!71314))))

(declare-fun b!1020815 () Bool)

(declare-fun e!574671 () Bool)

(declare-fun e!574670 () Bool)

(assert (=> b!1020815 (= e!574671 e!574670)))

(declare-fun res!684238 () Bool)

(assert (=> b!1020815 (=> (not res!684238) (not e!574670))))

(declare-datatypes ((B!1752 0))(
  ( (B!1753 (val!11960 Int)) )
))
(declare-datatypes ((tuple2!15466 0))(
  ( (tuple2!15467 (_1!7744 (_ BitVec 64)) (_2!7744 B!1752)) )
))
(declare-datatypes ((List!21648 0))(
  ( (Nil!21645) (Cons!21644 (h!22842 tuple2!15466) (t!30658 List!21648)) )
))
(declare-fun l!1367 () List!21648)

(declare-fun lt!449952 () tuple2!15466)

(declare-fun contains!5939 (List!21648 tuple2!15466) Bool)

(assert (=> b!1020815 (= res!684238 (contains!5939 l!1367 lt!449952))))

(declare-fun key!393 () (_ BitVec 64))

(declare-fun value!188 () B!1752)

(assert (=> b!1020815 (= lt!449952 (tuple2!15467 key!393 value!188))))

(declare-fun res!684237 () Bool)

(assert (=> start!89012 (=> (not res!684237) (not e!574671))))

(declare-fun isStrictlySorted!713 (List!21648) Bool)

(assert (=> start!89012 (= res!684237 (isStrictlySorted!713 l!1367))))

(assert (=> start!89012 e!574671))

(assert (=> start!89012 e!574669))

(assert (=> start!89012 true))

(assert (=> start!89012 tp_is_empty!23819))

(declare-fun b!1020816 () Bool)

(declare-fun res!684239 () Bool)

(assert (=> b!1020816 (=> (not res!684239) (not e!574670))))

(assert (=> b!1020816 (= res!684239 (or (not (is-Cons!21644 l!1367)) (= (h!22842 l!1367) lt!449952)))))

(declare-fun b!1020817 () Bool)

(declare-fun containsKey!558 (List!21648 (_ BitVec 64)) Bool)

(assert (=> b!1020817 (= e!574670 (not (containsKey!558 l!1367 key!393)))))

(assert (= (and start!89012 res!684237) b!1020815))

(assert (= (and b!1020815 res!684238) b!1020816))

(assert (= (and b!1020816 res!684239) b!1020817))

(assert (= (and start!89012 (is-Cons!21644 l!1367)) b!1020818))

(declare-fun m!940597 () Bool)

(assert (=> b!1020815 m!940597))

(declare-fun m!940599 () Bool)

(assert (=> start!89012 m!940599))

(declare-fun m!940601 () Bool)

(assert (=> b!1020817 m!940601))

(push 1)

(assert (not b!1020818))

(assert (not start!89012))

(assert (not b!1020817))

(assert tp_is_empty!23819)

(assert (not b!1020815))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!122461 () Bool)

(declare-fun lt!449961 () Bool)

(declare-fun content!507 (List!21648) (Set tuple2!15466))

(assert (=> d!122461 (= lt!449961 (member lt!449952 (content!507 l!1367)))))

(declare-fun e!574719 () Bool)

(assert (=> d!122461 (= lt!449961 e!574719)))

(declare-fun res!684281 () Bool)

(assert (=> d!122461 (=> (not res!684281) (not e!574719))))

(assert (=> d!122461 (= res!684281 (is-Cons!21644 l!1367))))

(assert (=> d!122461 (= (contains!5939 l!1367 lt!449952) lt!449961)))

(declare-fun b!1020869 () Bool)

(declare-fun e!574718 () Bool)

(assert (=> b!1020869 (= e!574719 e!574718)))

(declare-fun res!684280 () Bool)

(assert (=> b!1020869 (=> res!684280 e!574718)))

(assert (=> b!1020869 (= res!684280 (= (h!22842 l!1367) lt!449952))))

(declare-fun b!1020870 () Bool)

(assert (=> b!1020870 (= e!574718 (contains!5939 (t!30658 l!1367) lt!449952))))

(assert (= (and d!122461 res!684281) b!1020869))

(assert (= (and b!1020869 (not res!684280)) b!1020870))

(declare-fun m!940623 () Bool)

(assert (=> d!122461 m!940623))

(declare-fun m!940625 () Bool)

(assert (=> d!122461 m!940625))

(declare-fun m!940627 () Bool)

(assert (=> b!1020870 m!940627))

(assert (=> b!1020815 d!122461))

(declare-fun d!122471 () Bool)

(declare-fun res!684286 () Bool)

(declare-fun e!574724 () Bool)

(assert (=> d!122471 (=> res!684286 e!574724)))

(assert (=> d!122471 (= res!684286 (or (is-Nil!21645 l!1367) (is-Nil!21645 (t!30658 l!1367))))))

