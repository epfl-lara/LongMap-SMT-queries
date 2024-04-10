; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89008 () Bool)

(assert start!89008)

(declare-fun b!1020792 () Bool)

(declare-fun res!684220 () Bool)

(declare-fun e!574651 () Bool)

(assert (=> b!1020792 (=> (not res!684220) (not e!574651))))

(declare-datatypes ((B!1748 0))(
  ( (B!1749 (val!11958 Int)) )
))
(declare-datatypes ((tuple2!15462 0))(
  ( (tuple2!15463 (_1!7742 (_ BitVec 64)) (_2!7742 B!1748)) )
))
(declare-datatypes ((List!21646 0))(
  ( (Nil!21643) (Cons!21642 (h!22840 tuple2!15462) (t!30656 List!21646)) )
))
(declare-fun l!1367 () List!21646)

(declare-fun lt!449946 () tuple2!15462)

(assert (=> b!1020792 (= res!684220 (or (not (is-Cons!21642 l!1367)) (= (h!22840 l!1367) lt!449946)))))

(declare-fun b!1020791 () Bool)

(declare-fun e!574652 () Bool)

(assert (=> b!1020791 (= e!574652 e!574651)))

(declare-fun res!684219 () Bool)

(assert (=> b!1020791 (=> (not res!684219) (not e!574651))))

(declare-fun contains!5937 (List!21646 tuple2!15462) Bool)

(assert (=> b!1020791 (= res!684219 (contains!5937 l!1367 lt!449946))))

(declare-fun key!393 () (_ BitVec 64))

(declare-fun value!188 () B!1748)

(assert (=> b!1020791 (= lt!449946 (tuple2!15463 key!393 value!188))))

(declare-fun b!1020794 () Bool)

(declare-fun e!574653 () Bool)

(declare-fun tp_is_empty!23815 () Bool)

(declare-fun tp!71308 () Bool)

(assert (=> b!1020794 (= e!574653 (and tp_is_empty!23815 tp!71308))))

(declare-fun res!684221 () Bool)

(assert (=> start!89008 (=> (not res!684221) (not e!574652))))

(declare-fun isStrictlySorted!711 (List!21646) Bool)

(assert (=> start!89008 (= res!684221 (isStrictlySorted!711 l!1367))))

(assert (=> start!89008 e!574652))

(assert (=> start!89008 e!574653))

(assert (=> start!89008 true))

(assert (=> start!89008 tp_is_empty!23815))

(declare-fun b!1020793 () Bool)

(declare-fun containsKey!556 (List!21646 (_ BitVec 64)) Bool)

(assert (=> b!1020793 (= e!574651 (not (containsKey!556 l!1367 key!393)))))

(assert (= (and start!89008 res!684221) b!1020791))

(assert (= (and b!1020791 res!684219) b!1020792))

(assert (= (and b!1020792 res!684220) b!1020793))

(assert (= (and start!89008 (is-Cons!21642 l!1367)) b!1020794))

(declare-fun m!940585 () Bool)

(assert (=> b!1020791 m!940585))

(declare-fun m!940587 () Bool)

(assert (=> start!89008 m!940587))

(declare-fun m!940589 () Bool)

(assert (=> b!1020793 m!940589))

(push 1)

(assert (not b!1020793))

(assert (not b!1020791))

(assert (not start!89008))

(assert tp_is_empty!23815)

(assert (not b!1020794))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!122457 () Bool)

(declare-fun res!684248 () Bool)

(declare-fun e!574680 () Bool)

(assert (=> d!122457 (=> res!684248 e!574680)))

(assert (=> d!122457 (= res!684248 (or (is-Nil!21643 l!1367) (is-Nil!21643 (t!30656 l!1367))))))

(assert (=> d!122457 (= (isStrictlySorted!711 l!1367) e!574680)))

(declare-fun b!1020827 () Bool)

(declare-fun e!574681 () Bool)

(assert (=> b!1020827 (= e!574680 e!574681)))

(declare-fun res!684249 () Bool)

(assert (=> b!1020827 (=> (not res!684249) (not e!574681))))

(assert (=> b!1020827 (= res!684249 (bvslt (_1!7742 (h!22840 l!1367)) (_1!7742 (h!22840 (t!30656 l!1367)))))))

(declare-fun b!1020828 () Bool)

(assert (=> b!1020828 (= e!574681 (isStrictlySorted!711 (t!30656 l!1367)))))

(assert (= (and d!122457 (not res!684248)) b!1020827))

(assert (= (and b!1020827 res!684249) b!1020828))

(declare-fun m!940603 () Bool)

(assert (=> b!1020828 m!940603))

(assert (=> start!89008 d!122457))

(declare-fun d!122463 () Bool)

(declare-fun lt!449958 () Bool)

(declare-fun content!506 (List!21646) (Set tuple2!15462))

(assert (=> d!122463 (= lt!449958 (set.member lt!449946 (content!506 l!1367)))))

(declare-fun e!574693 () Bool)

(assert (=> d!122463 (= lt!449958 e!574693)))

(declare-fun res!684260 () Bool)

(assert (=> d!122463 (=> (not res!684260) (not e!574693))))

(assert (=> d!122463 (= res!684260 (is-Cons!21642 l!1367))))

(assert (=> d!122463 (= (contains!5937 l!1367 lt!449946) lt!449958)))

(declare-fun b!1020839 () Bool)

(declare-fun e!574692 () Bool)

(assert (=> b!1020839 (= e!574693 e!574692)))

(declare-fun res!684261 () Bool)

(assert (=> b!1020839 (=> res!684261 e!574692)))

(assert (=> b!1020839 (= res!684261 (= (h!22840 l!1367) lt!449946))))

(declare-fun b!1020840 () Bool)

(assert (=> b!1020840 (= e!574692 (contains!5937 (t!30656 l!1367) lt!449946))))

(assert (= (and d!122463 res!684260) b!1020839))

(assert (= (and b!1020839 (not res!684261)) b!1020840))

(declare-fun m!940611 () Bool)

(assert (=> d!122463 m!940611))

(declare-fun m!940613 () Bool)

(assert (=> d!122463 m!940613))

(declare-fun m!940615 () Bool)

(assert (=> b!1020840 m!940615))

(assert (=> b!1020791 d!122463))

(declare-fun d!122467 () Bool)

(declare-fun res!684276 () Bool)

(declare-fun e!574708 () Bool)

(assert (=> d!122467 (=> res!684276 e!574708)))

(assert (=> d!122467 (= res!684276 (and (is-Cons!21642 l!1367) (= (_1!7742 (h!22840 l!1367)) key!393)))))

(assert (=> d!122467 (= (containsKey!556 l!1367 key!393) e!574708)))

(declare-fun b!1020855 () Bool)

(declare-fun e!574709 () Bool)

(assert (=> b!1020855 (= e!574708 e!574709)))

(declare-fun res!684277 () Bool)

(assert (=> b!1020855 (=> (not res!684277) (not e!574709))))

(assert (=> b!1020855 (= res!684277 (and (or (not (is-Cons!21642 l!1367)) (bvsle (_1!7742 (h!22840 l!1367)) key!393)) (is-Cons!21642 l!1367) (bvslt (_1!7742 (h!22840 l!1367)) key!393)))))

(declare-fun b!1020856 () Bool)

(assert (=> b!1020856 (= e!574709 (containsKey!556 (t!30656 l!1367) key!393))))

(assert (= (and d!122467 (not res!684276)) b!1020855))

(assert (= (and b!1020855 res!684277) b!1020856))

(declare-fun m!940619 () Bool)

(assert (=> b!1020856 m!940619))

(assert (=> b!1020793 d!122467))

(declare-fun b!1020868 () Bool)

(declare-fun e!574717 () Bool)

(declare-fun tp!71320 () Bool)

(assert (=> b!1020868 (= e!574717 (and tp_is_empty!23815 tp!71320))))

(assert (=> b!1020794 (= tp!71308 e!574717)))

(assert (= (and b!1020794 (is-Cons!21642 (t!30656 l!1367))) b!1020868))

(push 1)

(assert (not b!1020868))

(assert tp_is_empty!23815)

(assert (not b!1020856))

(assert (not d!122463))

(assert (not b!1020840))

(assert (not b!1020828))

(check-sat)

(pop 1)

