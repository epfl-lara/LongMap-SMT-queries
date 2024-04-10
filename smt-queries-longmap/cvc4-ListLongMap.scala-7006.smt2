; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!88982 () Bool)

(assert start!88982)

(declare-fun b!1020681 () Bool)

(declare-fun e!574554 () Bool)

(declare-fun tp_is_empty!23813 () Bool)

(declare-fun tp!71296 () Bool)

(assert (=> b!1020681 (= e!574554 (and tp_is_empty!23813 tp!71296))))

(declare-fun b!1020682 () Bool)

(declare-fun e!574552 () Bool)

(declare-fun e!574553 () Bool)

(assert (=> b!1020682 (= e!574552 e!574553)))

(declare-fun res!684129 () Bool)

(assert (=> b!1020682 (=> (not res!684129) (not e!574553))))

(declare-datatypes ((B!1746 0))(
  ( (B!1747 (val!11957 Int)) )
))
(declare-datatypes ((tuple2!15460 0))(
  ( (tuple2!15461 (_1!7741 (_ BitVec 64)) (_2!7741 B!1746)) )
))
(declare-datatypes ((List!21645 0))(
  ( (Nil!21642) (Cons!21641 (h!22839 tuple2!15460) (t!30655 List!21645)) )
))
(declare-fun l!1367 () List!21645)

(declare-fun lt!449922 () tuple2!15460)

(declare-fun contains!5936 (List!21645 tuple2!15460) Bool)

(assert (=> b!1020682 (= res!684129 (contains!5936 l!1367 lt!449922))))

(declare-fun key!393 () (_ BitVec 64))

(declare-fun value!188 () B!1746)

(assert (=> b!1020682 (= lt!449922 (tuple2!15461 key!393 value!188))))

(declare-fun b!1020683 () Bool)

(declare-fun res!684127 () Bool)

(assert (=> b!1020683 (=> (not res!684127) (not e!574553))))

(assert (=> b!1020683 (= res!684127 (and (is-Cons!21641 l!1367) (not (= (h!22839 l!1367) lt!449922))))))

(declare-fun b!1020685 () Bool)

(declare-fun res!684130 () Bool)

(assert (=> b!1020685 (=> (not res!684130) (not e!574553))))

(declare-fun isStrictlySorted!710 (List!21645) Bool)

(assert (=> b!1020685 (= res!684130 (isStrictlySorted!710 (t!30655 l!1367)))))

(declare-fun b!1020686 () Bool)

(declare-fun res!684128 () Bool)

(assert (=> b!1020686 (=> (not res!684128) (not e!574553))))

(assert (=> b!1020686 (= res!684128 (contains!5936 (t!30655 l!1367) lt!449922))))

(declare-fun res!684131 () Bool)

(assert (=> start!88982 (=> (not res!684131) (not e!574552))))

(assert (=> start!88982 (= res!684131 (isStrictlySorted!710 l!1367))))

(assert (=> start!88982 e!574552))

(assert (=> start!88982 e!574554))

(assert (=> start!88982 true))

(assert (=> start!88982 tp_is_empty!23813))

(declare-fun b!1020684 () Bool)

(declare-fun containsKey!555 (List!21645 (_ BitVec 64)) Bool)

(assert (=> b!1020684 (= e!574553 (not (containsKey!555 l!1367 key!393)))))

(assert (=> b!1020684 (containsKey!555 (t!30655 l!1367) key!393)))

(declare-datatypes ((Unit!33303 0))(
  ( (Unit!33304) )
))
(declare-fun lt!449921 () Unit!33303)

(declare-fun lemmaContainsTupleThenContainsKey!15 (List!21645 (_ BitVec 64) B!1746) Unit!33303)

(assert (=> b!1020684 (= lt!449921 (lemmaContainsTupleThenContainsKey!15 (t!30655 l!1367) key!393 value!188))))

(assert (= (and start!88982 res!684131) b!1020682))

(assert (= (and b!1020682 res!684129) b!1020683))

(assert (= (and b!1020683 res!684127) b!1020685))

(assert (= (and b!1020685 res!684130) b!1020686))

(assert (= (and b!1020686 res!684128) b!1020684))

(assert (= (and start!88982 (is-Cons!21641 l!1367)) b!1020681))

(declare-fun m!940517 () Bool)

(assert (=> b!1020684 m!940517))

(declare-fun m!940519 () Bool)

(assert (=> b!1020684 m!940519))

(declare-fun m!940521 () Bool)

(assert (=> b!1020684 m!940521))

(declare-fun m!940523 () Bool)

(assert (=> b!1020682 m!940523))

(declare-fun m!940525 () Bool)

(assert (=> b!1020685 m!940525))

(declare-fun m!940527 () Bool)

(assert (=> start!88982 m!940527))

(declare-fun m!940529 () Bool)

(assert (=> b!1020686 m!940529))

(push 1)

(assert (not b!1020685))

(assert (not b!1020682))

(assert (not b!1020681))

(assert tp_is_empty!23813)

(assert (not b!1020684))

(assert (not start!88982))

(assert (not b!1020686))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!122417 () Bool)

(declare-fun res!684152 () Bool)

(declare-fun e!574575 () Bool)

(assert (=> d!122417 (=> res!684152 e!574575)))

(assert (=> d!122417 (= res!684152 (and (is-Cons!21641 l!1367) (= (_1!7741 (h!22839 l!1367)) key!393)))))

(assert (=> d!122417 (= (containsKey!555 l!1367 key!393) e!574575)))

(declare-fun b!1020707 () Bool)

(declare-fun e!574576 () Bool)

(assert (=> b!1020707 (= e!574575 e!574576)))

(declare-fun res!684153 () Bool)

(assert (=> b!1020707 (=> (not res!684153) (not e!574576))))

(assert (=> b!1020707 (= res!684153 (and (or (not (is-Cons!21641 l!1367)) (bvsle (_1!7741 (h!22839 l!1367)) key!393)) (is-Cons!21641 l!1367) (bvslt (_1!7741 (h!22839 l!1367)) key!393)))))

(declare-fun b!1020708 () Bool)

(assert (=> b!1020708 (= e!574576 (containsKey!555 (t!30655 l!1367) key!393))))

(assert (= (and d!122417 (not res!684152)) b!1020707))

(assert (= (and b!1020707 res!684153) b!1020708))

(assert (=> b!1020708 m!940519))

(assert (=> b!1020684 d!122417))

(declare-fun d!122427 () Bool)

(declare-fun res!684154 () Bool)

(declare-fun e!574577 () Bool)

(assert (=> d!122427 (=> res!684154 e!574577)))

(assert (=> d!122427 (= res!684154 (and (is-Cons!21641 (t!30655 l!1367)) (= (_1!7741 (h!22839 (t!30655 l!1367))) key!393)))))

(assert (=> d!122427 (= (containsKey!555 (t!30655 l!1367) key!393) e!574577)))

(declare-fun b!1020709 () Bool)

(declare-fun e!574578 () Bool)

(assert (=> b!1020709 (= e!574577 e!574578)))

(declare-fun res!684155 () Bool)

(assert (=> b!1020709 (=> (not res!684155) (not e!574578))))

(assert (=> b!1020709 (= res!684155 (and (or (not (is-Cons!21641 (t!30655 l!1367))) (bvsle (_1!7741 (h!22839 (t!30655 l!1367))) key!393)) (is-Cons!21641 (t!30655 l!1367)) (bvslt (_1!7741 (h!22839 (t!30655 l!1367))) key!393)))))

(declare-fun b!1020710 () Bool)

(assert (=> b!1020710 (= e!574578 (containsKey!555 (t!30655 (t!30655 l!1367)) key!393))))

(assert (= (and d!122427 (not res!684154)) b!1020709))

(assert (= (and b!1020709 res!684155) b!1020710))

(declare-fun m!940535 () Bool)

(assert (=> b!1020710 m!940535))

(assert (=> b!1020684 d!122427))

(declare-fun d!122429 () Bool)

(assert (=> d!122429 (containsKey!555 (t!30655 l!1367) key!393)))

(declare-fun lt!449933 () Unit!33303)

(declare-fun choose!1680 (List!21645 (_ BitVec 64) B!1746) Unit!33303)

(assert (=> d!122429 (= lt!449933 (choose!1680 (t!30655 l!1367) key!393 value!188))))

(declare-fun e!574591 () Bool)

(assert (=> d!122429 e!574591))

(declare-fun res!684168 () Bool)

(assert (=> d!122429 (=> (not res!684168) (not e!574591))))

(assert (=> d!122429 (= res!684168 (isStrictlySorted!710 (t!30655 l!1367)))))

(assert (=> d!122429 (= (lemmaContainsTupleThenContainsKey!15 (t!30655 l!1367) key!393 value!188) lt!449933)))

(declare-fun b!1020723 () Bool)

(assert (=> b!1020723 (= e!574591 (contains!5936 (t!30655 l!1367) (tuple2!15461 key!393 value!188)))))

(assert (= (and d!122429 res!684168) b!1020723))

(assert (=> d!122429 m!940519))

(declare-fun m!940545 () Bool)

(assert (=> d!122429 m!940545))

(assert (=> d!122429 m!940525))

(declare-fun m!940547 () Bool)

(assert (=> b!1020723 m!940547))

(assert (=> b!1020684 d!122429))

(declare-fun d!122435 () Bool)

(declare-fun res!684183 () Bool)

(declare-fun e!574606 () Bool)

(assert (=> d!122435 (=> res!684183 e!574606)))

(assert (=> d!122435 (= res!684183 (or (is-Nil!21642 (t!30655 l!1367)) (is-Nil!21642 (t!30655 (t!30655 l!1367)))))))

(assert (=> d!122435 (= (isStrictlySorted!710 (t!30655 l!1367)) e!574606)))

(declare-fun b!1020738 () Bool)

(declare-fun e!574607 () Bool)

(assert (=> b!1020738 (= e!574606 e!574607)))

(declare-fun res!684184 () Bool)

(assert (=> b!1020738 (=> (not res!684184) (not e!574607))))

(assert (=> b!1020738 (= res!684184 (bvslt (_1!7741 (h!22839 (t!30655 l!1367))) (_1!7741 (h!22839 (t!30655 (t!30655 l!1367))))))))

(declare-fun b!1020739 () Bool)

(assert (=> b!1020739 (= e!574607 (isStrictlySorted!710 (t!30655 (t!30655 l!1367))))))

(assert (= (and d!122435 (not res!684183)) b!1020738))

(assert (= (and b!1020738 res!684184) b!1020739))

(declare-fun m!940561 () Bool)

(assert (=> b!1020739 m!940561))

(assert (=> b!1020685 d!122435))

(declare-fun d!122441 () Bool)

(declare-fun res!684187 () Bool)

(declare-fun e!574610 () Bool)

(assert (=> d!122441 (=> res!684187 e!574610)))

(assert (=> d!122441 (= res!684187 (or (is-Nil!21642 l!1367) (is-Nil!21642 (t!30655 l!1367))))))

(assert (=> d!122441 (= (isStrictlySorted!710 l!1367) e!574610)))

(declare-fun b!1020742 () Bool)

(declare-fun e!574611 () Bool)

(assert (=> b!1020742 (= e!574610 e!574611)))

(declare-fun res!684188 () Bool)

(assert (=> b!1020742 (=> (not res!684188) (not e!574611))))

(assert (=> b!1020742 (= res!684188 (bvslt (_1!7741 (h!22839 l!1367)) (_1!7741 (h!22839 (t!30655 l!1367)))))))

(declare-fun b!1020743 () Bool)

(assert (=> b!1020743 (= e!574611 (isStrictlySorted!710 (t!30655 l!1367)))))

(assert (= (and d!122441 (not res!684187)) b!1020742))

(assert (= (and b!1020742 res!684188) b!1020743))

(assert (=> b!1020743 m!940525))

(assert (=> start!88982 d!122441))

(declare-fun d!122443 () Bool)

(declare-fun lt!449942 () Bool)

(declare-fun content!504 (List!21645) (Set tuple2!15460))

(assert (=> d!122443 (= lt!449942 (member lt!449922 (content!504 (t!30655 l!1367))))))

(declare-fun e!574639 () Bool)

(assert (=> d!122443 (= lt!449942 e!574639)))

(declare-fun res!684210 () Bool)

(assert (=> d!122443 (=> (not res!684210) (not e!574639))))

(assert (=> d!122443 (= res!684210 (is-Cons!21641 (t!30655 l!1367)))))

(assert (=> d!122443 (= (contains!5936 (t!30655 l!1367) lt!449922) lt!449942)))

(declare-fun b!1020774 () Bool)

(declare-fun e!574638 () Bool)

(assert (=> b!1020774 (= e!574639 e!574638)))

(declare-fun res!684209 () Bool)

(assert (=> b!1020774 (=> res!684209 e!574638)))

(assert (=> b!1020774 (= res!684209 (= (h!22839 (t!30655 l!1367)) lt!449922))))

(declare-fun b!1020775 () Bool)

(assert (=> b!1020775 (= e!574638 (contains!5936 (t!30655 (t!30655 l!1367)) lt!449922))))

(assert (= (and d!122443 res!684210) b!1020774))

(assert (= (and b!1020774 (not res!684209)) b!1020775))

(declare-fun m!940575 () Bool)

(assert (=> d!122443 m!940575))

(declare-fun m!940577 () Bool)

(assert (=> d!122443 m!940577))

(declare-fun m!940579 () Bool)

(assert (=> b!1020775 m!940579))

(assert (=> b!1020686 d!122443))

(declare-fun d!122453 () Bool)

(declare-fun lt!449943 () Bool)

(assert (=> d!122453 (= lt!449943 (member lt!449922 (content!504 l!1367)))))

(declare-fun e!574641 () Bool)

(assert (=> d!122453 (= lt!449943 e!574641)))

(declare-fun res!684212 () Bool)

(assert (=> d!122453 (=> (not res!684212) (not e!574641))))

(assert (=> d!122453 (= res!684212 (is-Cons!21641 l!1367))))

(assert (=> d!122453 (= (contains!5936 l!1367 lt!449922) lt!449943)))

(declare-fun b!1020776 () Bool)

(declare-fun e!574640 () Bool)

(assert (=> b!1020776 (= e!574641 e!574640)))

(declare-fun res!684211 () Bool)

(assert (=> b!1020776 (=> res!684211 e!574640)))

(assert (=> b!1020776 (= res!684211 (= (h!22839 l!1367) lt!449922))))

(declare-fun b!1020777 () Bool)

(assert (=> b!1020777 (= e!574640 (contains!5936 (t!30655 l!1367) lt!449922))))

(assert (= (and d!122453 res!684212) b!1020776))

(assert (= (and b!1020776 (not res!684211)) b!1020777))

(declare-fun m!940581 () Bool)

(assert (=> d!122453 m!940581))

(declare-fun m!940583 () Bool)

(assert (=> d!122453 m!940583))

(assert (=> b!1020777 m!940529))

(assert (=> b!1020682 d!122453))

(declare-fun b!1020782 () Bool)

(declare-fun e!574644 () Bool)

(declare-fun tp!71305 () Bool)

(assert (=> b!1020782 (= e!574644 (and tp_is_empty!23813 tp!71305))))

(assert (=> b!1020681 (= tp!71296 e!574644)))

(assert (= (and b!1020681 (is-Cons!21641 (t!30655 l!1367))) b!1020782))

(push 1)

(assert (not b!1020710))

(assert tp_is_empty!23813)

(assert (not b!1020739))

(assert (not b!1020782))

(assert (not b!1020708))

(assert (not b!1020777))

(assert (not d!122453))

(assert (not b!1020743))

(assert (not b!1020775))

(assert (not d!122429))

(assert (not b!1020723))

(assert (not d!122443))

(check-sat)

(pop 1)

(push 1)

(check-sat)

