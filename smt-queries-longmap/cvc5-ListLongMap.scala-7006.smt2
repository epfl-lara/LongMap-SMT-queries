; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!88980 () Bool)

(assert start!88980)

(declare-fun b!1020536 () Bool)

(declare-fun res!684061 () Bool)

(declare-fun e!574466 () Bool)

(assert (=> b!1020536 (=> (not res!684061) (not e!574466))))

(declare-datatypes ((B!1746 0))(
  ( (B!1747 (val!11957 Int)) )
))
(declare-datatypes ((tuple2!15540 0))(
  ( (tuple2!15541 (_1!7781 (_ BitVec 64)) (_2!7781 B!1746)) )
))
(declare-datatypes ((List!21680 0))(
  ( (Nil!21677) (Cons!21676 (h!22874 tuple2!15540) (t!30681 List!21680)) )
))
(declare-fun l!1367 () List!21680)

(declare-fun lt!449722 () tuple2!15540)

(declare-fun contains!5912 (List!21680 tuple2!15540) Bool)

(assert (=> b!1020536 (= res!684061 (contains!5912 (t!30681 l!1367) lt!449722))))

(declare-fun res!684063 () Bool)

(declare-fun e!574464 () Bool)

(assert (=> start!88980 (=> (not res!684063) (not e!574464))))

(declare-fun isStrictlySorted!706 (List!21680) Bool)

(assert (=> start!88980 (= res!684063 (isStrictlySorted!706 l!1367))))

(assert (=> start!88980 e!574464))

(declare-fun e!574465 () Bool)

(assert (=> start!88980 e!574465))

(assert (=> start!88980 true))

(declare-fun tp_is_empty!23813 () Bool)

(assert (=> start!88980 tp_is_empty!23813))

(declare-fun b!1020537 () Bool)

(declare-fun res!684064 () Bool)

(assert (=> b!1020537 (=> (not res!684064) (not e!574466))))

(assert (=> b!1020537 (= res!684064 (and (is-Cons!21676 l!1367) (not (= (h!22874 l!1367) lt!449722))))))

(declare-fun b!1020538 () Bool)

(assert (=> b!1020538 (= e!574464 e!574466)))

(declare-fun res!684060 () Bool)

(assert (=> b!1020538 (=> (not res!684060) (not e!574466))))

(assert (=> b!1020538 (= res!684060 (contains!5912 l!1367 lt!449722))))

(declare-fun key!393 () (_ BitVec 64))

(declare-fun value!188 () B!1746)

(assert (=> b!1020538 (= lt!449722 (tuple2!15541 key!393 value!188))))

(declare-fun b!1020539 () Bool)

(declare-fun containsKey!555 (List!21680 (_ BitVec 64)) Bool)

(assert (=> b!1020539 (= e!574466 (not (containsKey!555 l!1367 key!393)))))

(assert (=> b!1020539 (containsKey!555 (t!30681 l!1367) key!393)))

(declare-datatypes ((Unit!33199 0))(
  ( (Unit!33200) )
))
(declare-fun lt!449721 () Unit!33199)

(declare-fun lemmaContainsTupleThenContainsKey!15 (List!21680 (_ BitVec 64) B!1746) Unit!33199)

(assert (=> b!1020539 (= lt!449721 (lemmaContainsTupleThenContainsKey!15 (t!30681 l!1367) key!393 value!188))))

(declare-fun b!1020540 () Bool)

(declare-fun res!684062 () Bool)

(assert (=> b!1020540 (=> (not res!684062) (not e!574466))))

(assert (=> b!1020540 (= res!684062 (isStrictlySorted!706 (t!30681 l!1367)))))

(declare-fun b!1020541 () Bool)

(declare-fun tp!71296 () Bool)

(assert (=> b!1020541 (= e!574465 (and tp_is_empty!23813 tp!71296))))

(assert (= (and start!88980 res!684063) b!1020538))

(assert (= (and b!1020538 res!684060) b!1020537))

(assert (= (and b!1020537 res!684064) b!1020540))

(assert (= (and b!1020540 res!684062) b!1020536))

(assert (= (and b!1020536 res!684061) b!1020539))

(assert (= (and start!88980 (is-Cons!21676 l!1367)) b!1020541))

(declare-fun m!939897 () Bool)

(assert (=> b!1020536 m!939897))

(declare-fun m!939899 () Bool)

(assert (=> start!88980 m!939899))

(declare-fun m!939901 () Bool)

(assert (=> b!1020538 m!939901))

(declare-fun m!939903 () Bool)

(assert (=> b!1020540 m!939903))

(declare-fun m!939905 () Bool)

(assert (=> b!1020539 m!939905))

(declare-fun m!939907 () Bool)

(assert (=> b!1020539 m!939907))

(declare-fun m!939909 () Bool)

(assert (=> b!1020539 m!939909))

(push 1)

(assert (not b!1020540))

(assert tp_is_empty!23813)

(assert (not b!1020539))

(assert (not b!1020541))

(assert (not b!1020538))

(assert (not start!88980))

(assert (not b!1020536))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!122265 () Bool)

(declare-fun res!684081 () Bool)

(declare-fun e!574483 () Bool)

(assert (=> d!122265 (=> res!684081 e!574483)))

(assert (=> d!122265 (= res!684081 (and (is-Cons!21676 l!1367) (= (_1!7781 (h!22874 l!1367)) key!393)))))

(assert (=> d!122265 (= (containsKey!555 l!1367 key!393) e!574483)))

(declare-fun b!1020558 () Bool)

(declare-fun e!574484 () Bool)

(assert (=> b!1020558 (= e!574483 e!574484)))

(declare-fun res!684082 () Bool)

(assert (=> b!1020558 (=> (not res!684082) (not e!574484))))

(assert (=> b!1020558 (= res!684082 (and (or (not (is-Cons!21676 l!1367)) (bvsle (_1!7781 (h!22874 l!1367)) key!393)) (is-Cons!21676 l!1367) (bvslt (_1!7781 (h!22874 l!1367)) key!393)))))

(declare-fun b!1020559 () Bool)

(assert (=> b!1020559 (= e!574484 (containsKey!555 (t!30681 l!1367) key!393))))

(assert (= (and d!122265 (not res!684081)) b!1020558))

(assert (= (and b!1020558 res!684082) b!1020559))

(assert (=> b!1020559 m!939907))

(assert (=> b!1020539 d!122265))

(declare-fun d!122273 () Bool)

(declare-fun res!684087 () Bool)

(declare-fun e!574489 () Bool)

(assert (=> d!122273 (=> res!684087 e!574489)))

(assert (=> d!122273 (= res!684087 (and (is-Cons!21676 (t!30681 l!1367)) (= (_1!7781 (h!22874 (t!30681 l!1367))) key!393)))))

(assert (=> d!122273 (= (containsKey!555 (t!30681 l!1367) key!393) e!574489)))

(declare-fun b!1020564 () Bool)

(declare-fun e!574490 () Bool)

(assert (=> b!1020564 (= e!574489 e!574490)))

(declare-fun res!684088 () Bool)

(assert (=> b!1020564 (=> (not res!684088) (not e!574490))))

(assert (=> b!1020564 (= res!684088 (and (or (not (is-Cons!21676 (t!30681 l!1367))) (bvsle (_1!7781 (h!22874 (t!30681 l!1367))) key!393)) (is-Cons!21676 (t!30681 l!1367)) (bvslt (_1!7781 (h!22874 (t!30681 l!1367))) key!393)))))

(declare-fun b!1020565 () Bool)

(assert (=> b!1020565 (= e!574490 (containsKey!555 (t!30681 (t!30681 l!1367)) key!393))))

(assert (= (and d!122273 (not res!684087)) b!1020564))

(assert (= (and b!1020564 res!684088) b!1020565))

(declare-fun m!939915 () Bool)

(assert (=> b!1020565 m!939915))

(assert (=> b!1020539 d!122273))

(declare-fun d!122277 () Bool)

(assert (=> d!122277 (containsKey!555 (t!30681 l!1367) key!393)))

(declare-fun lt!449730 () Unit!33199)

(declare-fun choose!1686 (List!21680 (_ BitVec 64) B!1746) Unit!33199)

(assert (=> d!122277 (= lt!449730 (choose!1686 (t!30681 l!1367) key!393 value!188))))

(declare-fun e!574506 () Bool)

(assert (=> d!122277 e!574506))

(declare-fun res!684104 () Bool)

(assert (=> d!122277 (=> (not res!684104) (not e!574506))))

(assert (=> d!122277 (= res!684104 (isStrictlySorted!706 (t!30681 l!1367)))))

(assert (=> d!122277 (= (lemmaContainsTupleThenContainsKey!15 (t!30681 l!1367) key!393 value!188) lt!449730)))

(declare-fun b!1020581 () Bool)

(assert (=> b!1020581 (= e!574506 (contains!5912 (t!30681 l!1367) (tuple2!15541 key!393 value!188)))))

(assert (= (and d!122277 res!684104) b!1020581))

(assert (=> d!122277 m!939907))

(declare-fun m!939923 () Bool)

(assert (=> d!122277 m!939923))

(assert (=> d!122277 m!939903))

(declare-fun m!939927 () Bool)

(assert (=> b!1020581 m!939927))

(assert (=> b!1020539 d!122277))

(declare-fun d!122285 () Bool)

(declare-fun lt!449738 () Bool)

(declare-fun content!504 (List!21680) (Set tuple2!15540))

(assert (=> d!122285 (= lt!449738 (set.member lt!449722 (content!504 l!1367)))))

(declare-fun e!574530 () Bool)

(assert (=> d!122285 (= lt!449738 e!574530)))

(declare-fun res!684125 () Bool)

(assert (=> d!122285 (=> (not res!684125) (not e!574530))))

(assert (=> d!122285 (= res!684125 (is-Cons!21676 l!1367))))

(assert (=> d!122285 (= (contains!5912 l!1367 lt!449722) lt!449738)))

(declare-fun b!1020607 () Bool)

(declare-fun e!574531 () Bool)

(assert (=> b!1020607 (= e!574530 e!574531)))

(declare-fun res!684126 () Bool)

(assert (=> b!1020607 (=> res!684126 e!574531)))

(assert (=> b!1020607 (= res!684126 (= (h!22874 l!1367) lt!449722))))

(declare-fun b!1020608 () Bool)

(assert (=> b!1020608 (= e!574531 (contains!5912 (t!30681 l!1367) lt!449722))))

(assert (= (and d!122285 res!684125) b!1020607))

(assert (= (and b!1020607 (not res!684126)) b!1020608))

(declare-fun m!939941 () Bool)

(assert (=> d!122285 m!939941))

(declare-fun m!939943 () Bool)

(assert (=> d!122285 m!939943))

(assert (=> b!1020608 m!939897))

(assert (=> b!1020538 d!122285))

(declare-fun d!122293 () Bool)

(declare-fun lt!449739 () Bool)

(assert (=> d!122293 (= lt!449739 (set.member lt!449722 (content!504 (t!30681 l!1367))))))

(declare-fun e!574534 () Bool)

(assert (=> d!122293 (= lt!449739 e!574534)))

(declare-fun res!684129 () Bool)

(assert (=> d!122293 (=> (not res!684129) (not e!574534))))

(assert (=> d!122293 (= res!684129 (is-Cons!21676 (t!30681 l!1367)))))

(assert (=> d!122293 (= (contains!5912 (t!30681 l!1367) lt!449722) lt!449739)))

(declare-fun b!1020611 () Bool)

(declare-fun e!574535 () Bool)

(assert (=> b!1020611 (= e!574534 e!574535)))

(declare-fun res!684130 () Bool)

(assert (=> b!1020611 (=> res!684130 e!574535)))

(assert (=> b!1020611 (= res!684130 (= (h!22874 (t!30681 l!1367)) lt!449722))))

(declare-fun b!1020612 () Bool)

(assert (=> b!1020612 (= e!574535 (contains!5912 (t!30681 (t!30681 l!1367)) lt!449722))))

(assert (= (and d!122293 res!684129) b!1020611))

(assert (= (and b!1020611 (not res!684130)) b!1020612))

(declare-fun m!939947 () Bool)

(assert (=> d!122293 m!939947))

(declare-fun m!939949 () Bool)

(assert (=> d!122293 m!939949))

(declare-fun m!939951 () Bool)

(assert (=> b!1020612 m!939951))

(assert (=> b!1020536 d!122293))

(declare-fun d!122297 () Bool)

(declare-fun res!684137 () Bool)

(declare-fun e!574542 () Bool)

(assert (=> d!122297 (=> res!684137 e!574542)))

(assert (=> d!122297 (= res!684137 (or (is-Nil!21677 l!1367) (is-Nil!21677 (t!30681 l!1367))))))

(assert (=> d!122297 (= (isStrictlySorted!706 l!1367) e!574542)))

(declare-fun b!1020619 () Bool)

(declare-fun e!574543 () Bool)

(assert (=> b!1020619 (= e!574542 e!574543)))

(declare-fun res!684138 () Bool)

(assert (=> b!1020619 (=> (not res!684138) (not e!574543))))

(assert (=> b!1020619 (= res!684138 (bvslt (_1!7781 (h!22874 l!1367)) (_1!7781 (h!22874 (t!30681 l!1367)))))))

(declare-fun b!1020620 () Bool)

(assert (=> b!1020620 (= e!574543 (isStrictlySorted!706 (t!30681 l!1367)))))

(assert (= (and d!122297 (not res!684137)) b!1020619))

(assert (= (and b!1020619 res!684138) b!1020620))

(assert (=> b!1020620 m!939903))

(assert (=> start!88980 d!122297))

(declare-fun d!122299 () Bool)

(declare-fun res!684139 () Bool)

(declare-fun e!574544 () Bool)

(assert (=> d!122299 (=> res!684139 e!574544)))

(assert (=> d!122299 (= res!684139 (or (is-Nil!21677 (t!30681 l!1367)) (is-Nil!21677 (t!30681 (t!30681 l!1367)))))))

(assert (=> d!122299 (= (isStrictlySorted!706 (t!30681 l!1367)) e!574544)))

(declare-fun b!1020621 () Bool)

(declare-fun e!574545 () Bool)

(assert (=> b!1020621 (= e!574544 e!574545)))

(declare-fun res!684140 () Bool)

(assert (=> b!1020621 (=> (not res!684140) (not e!574545))))

(assert (=> b!1020621 (= res!684140 (bvslt (_1!7781 (h!22874 (t!30681 l!1367))) (_1!7781 (h!22874 (t!30681 (t!30681 l!1367))))))))

(declare-fun b!1020622 () Bool)

(assert (=> b!1020622 (= e!574545 (isStrictlySorted!706 (t!30681 (t!30681 l!1367))))))

(assert (= (and d!122299 (not res!684139)) b!1020621))

(assert (= (and b!1020621 res!684140) b!1020622))

(declare-fun m!939953 () Bool)

(assert (=> b!1020622 m!939953))

(assert (=> b!1020540 d!122299))

(declare-fun b!1020630 () Bool)

(declare-fun e!574551 () Bool)

(declare-fun tp!71302 () Bool)

(assert (=> b!1020630 (= e!574551 (and tp_is_empty!23813 tp!71302))))

(assert (=> b!1020541 (= tp!71296 e!574551)))

(assert (= (and b!1020541 (is-Cons!21676 (t!30681 l!1367))) b!1020630))

(push 1)

(assert (not b!1020581))

(assert (not b!1020630))

(assert (not d!122293))

(assert (not b!1020608))

(assert (not b!1020622))

(assert (not b!1020612))

(assert (not b!1020565))

(assert (not d!122285))

(assert tp_is_empty!23813)

(assert (not b!1020559))

(assert (not b!1020620))

(assert (not d!122277))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

