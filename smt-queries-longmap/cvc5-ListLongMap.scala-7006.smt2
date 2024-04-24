; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89216 () Bool)

(assert start!89216)

(declare-fun b!1022002 () Bool)

(declare-fun e!575399 () Bool)

(declare-fun tp_is_empty!23813 () Bool)

(declare-fun tp!71296 () Bool)

(assert (=> b!1022002 (= e!575399 (and tp_is_empty!23813 tp!71296))))

(declare-fun res!684638 () Bool)

(declare-fun e!575398 () Bool)

(assert (=> start!89216 (=> (not res!684638) (not e!575398))))

(declare-datatypes ((B!1746 0))(
  ( (B!1747 (val!11957 Int)) )
))
(declare-datatypes ((tuple2!15464 0))(
  ( (tuple2!15465 (_1!7743 (_ BitVec 64)) (_2!7743 B!1746)) )
))
(declare-datatypes ((List!21634 0))(
  ( (Nil!21631) (Cons!21630 (h!22837 tuple2!15464) (t!30636 List!21634)) )
))
(declare-fun l!1367 () List!21634)

(declare-fun isStrictlySorted!698 (List!21634) Bool)

(assert (=> start!89216 (= res!684638 (isStrictlySorted!698 l!1367))))

(assert (=> start!89216 e!575398))

(assert (=> start!89216 e!575399))

(assert (=> start!89216 true))

(assert (=> start!89216 tp_is_empty!23813))

(declare-fun b!1022003 () Bool)

(declare-fun e!575400 () Bool)

(declare-fun key!393 () (_ BitVec 64))

(declare-fun containsKey!557 (List!21634 (_ BitVec 64)) Bool)

(assert (=> b!1022003 (= e!575400 (not (containsKey!557 l!1367 key!393)))))

(assert (=> b!1022003 (containsKey!557 (t!30636 l!1367) key!393)))

(declare-fun value!188 () B!1746)

(declare-datatypes ((Unit!33304 0))(
  ( (Unit!33305) )
))
(declare-fun lt!450437 () Unit!33304)

(declare-fun lemmaContainsTupleThenContainsKey!15 (List!21634 (_ BitVec 64) B!1746) Unit!33304)

(assert (=> b!1022003 (= lt!450437 (lemmaContainsTupleThenContainsKey!15 (t!30636 l!1367) key!393 value!188))))

(declare-fun b!1022004 () Bool)

(assert (=> b!1022004 (= e!575398 e!575400)))

(declare-fun res!684641 () Bool)

(assert (=> b!1022004 (=> (not res!684641) (not e!575400))))

(declare-fun lt!450436 () tuple2!15464)

(declare-fun contains!5959 (List!21634 tuple2!15464) Bool)

(assert (=> b!1022004 (= res!684641 (contains!5959 l!1367 lt!450436))))

(assert (=> b!1022004 (= lt!450436 (tuple2!15465 key!393 value!188))))

(declare-fun b!1022005 () Bool)

(declare-fun res!684640 () Bool)

(assert (=> b!1022005 (=> (not res!684640) (not e!575400))))

(assert (=> b!1022005 (= res!684640 (and (is-Cons!21630 l!1367) (not (= (h!22837 l!1367) lt!450436))))))

(declare-fun b!1022006 () Bool)

(declare-fun res!684639 () Bool)

(assert (=> b!1022006 (=> (not res!684639) (not e!575400))))

(assert (=> b!1022006 (= res!684639 (isStrictlySorted!698 (t!30636 l!1367)))))

(declare-fun b!1022007 () Bool)

(declare-fun res!684637 () Bool)

(assert (=> b!1022007 (=> (not res!684637) (not e!575400))))

(assert (=> b!1022007 (= res!684637 (contains!5959 (t!30636 l!1367) lt!450436))))

(assert (= (and start!89216 res!684638) b!1022004))

(assert (= (and b!1022004 res!684641) b!1022005))

(assert (= (and b!1022005 res!684640) b!1022006))

(assert (= (and b!1022006 res!684639) b!1022007))

(assert (= (and b!1022007 res!684637) b!1022003))

(assert (= (and start!89216 (is-Cons!21630 l!1367)) b!1022002))

(declare-fun m!942181 () Bool)

(assert (=> b!1022006 m!942181))

(declare-fun m!942183 () Bool)

(assert (=> b!1022004 m!942183))

(declare-fun m!942185 () Bool)

(assert (=> start!89216 m!942185))

(declare-fun m!942187 () Bool)

(assert (=> b!1022007 m!942187))

(declare-fun m!942189 () Bool)

(assert (=> b!1022003 m!942189))

(declare-fun m!942191 () Bool)

(assert (=> b!1022003 m!942191))

(declare-fun m!942193 () Bool)

(assert (=> b!1022003 m!942193))

(push 1)

(assert (not b!1022002))

(assert tp_is_empty!23813)

(assert (not b!1022004))

(assert (not b!1022007))

(assert (not start!89216))

(assert (not b!1022006))

(assert (not b!1022003))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!122877 () Bool)

(declare-fun res!684650 () Bool)

(declare-fun e!575409 () Bool)

(assert (=> d!122877 (=> res!684650 e!575409)))

(assert (=> d!122877 (= res!684650 (or (is-Nil!21631 (t!30636 l!1367)) (is-Nil!21631 (t!30636 (t!30636 l!1367)))))))

(assert (=> d!122877 (= (isStrictlySorted!698 (t!30636 l!1367)) e!575409)))

(declare-fun b!1022016 () Bool)

(declare-fun e!575410 () Bool)

(assert (=> b!1022016 (= e!575409 e!575410)))

(declare-fun res!684651 () Bool)

(assert (=> b!1022016 (=> (not res!684651) (not e!575410))))

(assert (=> b!1022016 (= res!684651 (bvslt (_1!7743 (h!22837 (t!30636 l!1367))) (_1!7743 (h!22837 (t!30636 (t!30636 l!1367))))))))

(declare-fun b!1022017 () Bool)

(assert (=> b!1022017 (= e!575410 (isStrictlySorted!698 (t!30636 (t!30636 l!1367))))))

(assert (= (and d!122877 (not res!684650)) b!1022016))

(assert (= (and b!1022016 res!684651) b!1022017))

(declare-fun m!942195 () Bool)

(assert (=> b!1022017 m!942195))

(assert (=> b!1022006 d!122877))

(declare-fun d!122881 () Bool)

(declare-fun lt!450443 () Bool)

(declare-fun content!506 (List!21634) (Set tuple2!15464))

(assert (=> d!122881 (= lt!450443 (set.member lt!450436 (content!506 l!1367)))))

(declare-fun e!575432 () Bool)

(assert (=> d!122881 (= lt!450443 e!575432)))

(declare-fun res!684673 () Bool)

(assert (=> d!122881 (=> (not res!684673) (not e!575432))))

(assert (=> d!122881 (= res!684673 (is-Cons!21630 l!1367))))

(assert (=> d!122881 (= (contains!5959 l!1367 lt!450436) lt!450443)))

(declare-fun b!1022038 () Bool)

(declare-fun e!575431 () Bool)

(assert (=> b!1022038 (= e!575432 e!575431)))

(declare-fun res!684672 () Bool)

(assert (=> b!1022038 (=> res!684672 e!575431)))

(assert (=> b!1022038 (= res!684672 (= (h!22837 l!1367) lt!450436))))

(declare-fun b!1022039 () Bool)

(assert (=> b!1022039 (= e!575431 (contains!5959 (t!30636 l!1367) lt!450436))))

(assert (= (and d!122881 res!684673) b!1022038))

(assert (= (and b!1022038 (not res!684672)) b!1022039))

(declare-fun m!942205 () Bool)

(assert (=> d!122881 m!942205))

(declare-fun m!942207 () Bool)

(assert (=> d!122881 m!942207))

(assert (=> b!1022039 m!942187))

(assert (=> b!1022004 d!122881))

(declare-fun d!122891 () Bool)

(declare-fun res!684689 () Bool)

(declare-fun e!575448 () Bool)

(assert (=> d!122891 (=> res!684689 e!575448)))

(assert (=> d!122891 (= res!684689 (and (is-Cons!21630 l!1367) (= (_1!7743 (h!22837 l!1367)) key!393)))))

(assert (=> d!122891 (= (containsKey!557 l!1367 key!393) e!575448)))

(declare-fun b!1022055 () Bool)

(declare-fun e!575449 () Bool)

(assert (=> b!1022055 (= e!575448 e!575449)))

(declare-fun res!684690 () Bool)

(assert (=> b!1022055 (=> (not res!684690) (not e!575449))))

(assert (=> b!1022055 (= res!684690 (and (or (not (is-Cons!21630 l!1367)) (bvsle (_1!7743 (h!22837 l!1367)) key!393)) (is-Cons!21630 l!1367) (bvslt (_1!7743 (h!22837 l!1367)) key!393)))))

(declare-fun b!1022056 () Bool)

(assert (=> b!1022056 (= e!575449 (containsKey!557 (t!30636 l!1367) key!393))))

(assert (= (and d!122891 (not res!684689)) b!1022055))

(assert (= (and b!1022055 res!684690) b!1022056))

(assert (=> b!1022056 m!942191))

(assert (=> b!1022003 d!122891))

(declare-fun d!122899 () Bool)

(declare-fun res!684691 () Bool)

(declare-fun e!575450 () Bool)

(assert (=> d!122899 (=> res!684691 e!575450)))

(assert (=> d!122899 (= res!684691 (and (is-Cons!21630 (t!30636 l!1367)) (= (_1!7743 (h!22837 (t!30636 l!1367))) key!393)))))

(assert (=> d!122899 (= (containsKey!557 (t!30636 l!1367) key!393) e!575450)))

(declare-fun b!1022057 () Bool)

(declare-fun e!575451 () Bool)

(assert (=> b!1022057 (= e!575450 e!575451)))

(declare-fun res!684692 () Bool)

(assert (=> b!1022057 (=> (not res!684692) (not e!575451))))

(assert (=> b!1022057 (= res!684692 (and (or (not (is-Cons!21630 (t!30636 l!1367))) (bvsle (_1!7743 (h!22837 (t!30636 l!1367))) key!393)) (is-Cons!21630 (t!30636 l!1367)) (bvslt (_1!7743 (h!22837 (t!30636 l!1367))) key!393)))))

(declare-fun b!1022058 () Bool)

(assert (=> b!1022058 (= e!575451 (containsKey!557 (t!30636 (t!30636 l!1367)) key!393))))

(assert (= (and d!122899 (not res!684691)) b!1022057))

(assert (= (and b!1022057 res!684692) b!1022058))

(declare-fun m!942219 () Bool)

(assert (=> b!1022058 m!942219))

(assert (=> b!1022003 d!122899))

(declare-fun d!122901 () Bool)

(assert (=> d!122901 (containsKey!557 (t!30636 l!1367) key!393)))

(declare-fun lt!450456 () Unit!33304)

(declare-fun choose!1683 (List!21634 (_ BitVec 64) B!1746) Unit!33304)

(assert (=> d!122901 (= lt!450456 (choose!1683 (t!30636 l!1367) key!393 value!188))))

(declare-fun e!575469 () Bool)

(assert (=> d!122901 e!575469))

(declare-fun res!684710 () Bool)

(assert (=> d!122901 (=> (not res!684710) (not e!575469))))

(assert (=> d!122901 (= res!684710 (isStrictlySorted!698 (t!30636 l!1367)))))

(assert (=> d!122901 (= (lemmaContainsTupleThenContainsKey!15 (t!30636 l!1367) key!393 value!188) lt!450456)))

(declare-fun b!1022076 () Bool)

(assert (=> b!1022076 (= e!575469 (contains!5959 (t!30636 l!1367) (tuple2!15465 key!393 value!188)))))

(assert (= (and d!122901 res!684710) b!1022076))

(assert (=> d!122901 m!942191))

(declare-fun m!942229 () Bool)

(assert (=> d!122901 m!942229))

(assert (=> d!122901 m!942181))

(declare-fun m!942233 () Bool)

(assert (=> b!1022076 m!942233))

(assert (=> b!1022003 d!122901))

(declare-fun d!122909 () Bool)

(declare-fun res!684713 () Bool)

(declare-fun e!575472 () Bool)

(assert (=> d!122909 (=> res!684713 e!575472)))

(assert (=> d!122909 (= res!684713 (or (is-Nil!21631 l!1367) (is-Nil!21631 (t!30636 l!1367))))))

(assert (=> d!122909 (= (isStrictlySorted!698 l!1367) e!575472)))

(declare-fun b!1022079 () Bool)

(declare-fun e!575473 () Bool)

(assert (=> b!1022079 (= e!575472 e!575473)))

(declare-fun res!684714 () Bool)

(assert (=> b!1022079 (=> (not res!684714) (not e!575473))))

(assert (=> b!1022079 (= res!684714 (bvslt (_1!7743 (h!22837 l!1367)) (_1!7743 (h!22837 (t!30636 l!1367)))))))

(declare-fun b!1022080 () Bool)

(assert (=> b!1022080 (= e!575473 (isStrictlySorted!698 (t!30636 l!1367)))))

(assert (= (and d!122909 (not res!684713)) b!1022079))

(assert (= (and b!1022079 res!684714) b!1022080))

(assert (=> b!1022080 m!942181))

(assert (=> start!89216 d!122909))

(declare-fun d!122911 () Bool)

(declare-fun lt!450457 () Bool)

(assert (=> d!122911 (= lt!450457 (set.member lt!450436 (content!506 (t!30636 l!1367))))))

(declare-fun e!575477 () Bool)

(assert (=> d!122911 (= lt!450457 e!575477)))

(declare-fun res!684716 () Bool)

(assert (=> d!122911 (=> (not res!684716) (not e!575477))))

(assert (=> d!122911 (= res!684716 (is-Cons!21630 (t!30636 l!1367)))))

(assert (=> d!122911 (= (contains!5959 (t!30636 l!1367) lt!450436) lt!450457)))

(declare-fun b!1022085 () Bool)

(declare-fun e!575476 () Bool)

(assert (=> b!1022085 (= e!575477 e!575476)))

(declare-fun res!684715 () Bool)

(assert (=> b!1022085 (=> res!684715 e!575476)))

(assert (=> b!1022085 (= res!684715 (= (h!22837 (t!30636 l!1367)) lt!450436))))

(declare-fun b!1022086 () Bool)

(assert (=> b!1022086 (= e!575476 (contains!5959 (t!30636 (t!30636 l!1367)) lt!450436))))

(assert (= (and d!122911 res!684716) b!1022085))

(assert (= (and b!1022085 (not res!684715)) b!1022086))

(declare-fun m!942235 () Bool)

(assert (=> d!122911 m!942235))

(declare-fun m!942237 () Bool)

(assert (=> d!122911 m!942237))

(declare-fun m!942239 () Bool)

(assert (=> b!1022086 m!942239))

(assert (=> b!1022007 d!122911))

(declare-fun b!1022096 () Bool)

(declare-fun e!575485 () Bool)

(declare-fun tp!71302 () Bool)

(assert (=> b!1022096 (= e!575485 (and tp_is_empty!23813 tp!71302))))

(assert (=> b!1022002 (= tp!71296 e!575485)))

(assert (= (and b!1022002 (is-Cons!21630 (t!30636 l!1367))) b!1022096))

(push 1)

(assert (not b!1022017))

(assert (not b!1022076))

(assert tp_is_empty!23813)

(assert (not b!1022039))

(assert (not b!1022086))

(assert (not b!1022080))

(assert (not b!1022058))

(assert (not d!122901))

(assert (not d!122881))

(assert (not d!122911))

(assert (not b!1022096))

(assert (not b!1022056))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

