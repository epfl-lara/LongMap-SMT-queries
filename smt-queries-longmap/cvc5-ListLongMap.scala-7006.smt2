; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!88978 () Bool)

(assert start!88978)

(declare-fun b!1020645 () Bool)

(declare-fun e!574535 () Bool)

(declare-fun tp_is_empty!23809 () Bool)

(declare-fun tp!71290 () Bool)

(assert (=> b!1020645 (= e!574535 (and tp_is_empty!23809 tp!71290))))

(declare-fun res!684098 () Bool)

(declare-fun e!574536 () Bool)

(assert (=> start!88978 (=> (not res!684098) (not e!574536))))

(declare-datatypes ((B!1742 0))(
  ( (B!1743 (val!11955 Int)) )
))
(declare-datatypes ((tuple2!15456 0))(
  ( (tuple2!15457 (_1!7739 (_ BitVec 64)) (_2!7739 B!1742)) )
))
(declare-datatypes ((List!21643 0))(
  ( (Nil!21640) (Cons!21639 (h!22837 tuple2!15456) (t!30653 List!21643)) )
))
(declare-fun l!1367 () List!21643)

(declare-fun isStrictlySorted!708 (List!21643) Bool)

(assert (=> start!88978 (= res!684098 (isStrictlySorted!708 l!1367))))

(assert (=> start!88978 e!574536))

(assert (=> start!88978 e!574535))

(assert (=> start!88978 true))

(assert (=> start!88978 tp_is_empty!23809))

(declare-fun b!1020646 () Bool)

(declare-fun res!684097 () Bool)

(declare-fun e!574534 () Bool)

(assert (=> b!1020646 (=> (not res!684097) (not e!574534))))

(declare-fun lt!449909 () tuple2!15456)

(assert (=> b!1020646 (= res!684097 (and (is-Cons!21639 l!1367) (not (= (h!22837 l!1367) lt!449909))))))

(declare-fun b!1020647 () Bool)

(declare-fun key!393 () (_ BitVec 64))

(declare-fun containsKey!553 (List!21643 (_ BitVec 64)) Bool)

(assert (=> b!1020647 (= e!574534 (not (containsKey!553 l!1367 key!393)))))

(assert (=> b!1020647 (containsKey!553 (t!30653 l!1367) key!393)))

(declare-fun value!188 () B!1742)

(declare-datatypes ((Unit!33299 0))(
  ( (Unit!33300) )
))
(declare-fun lt!449910 () Unit!33299)

(declare-fun lemmaContainsTupleThenContainsKey!13 (List!21643 (_ BitVec 64) B!1742) Unit!33299)

(assert (=> b!1020647 (= lt!449910 (lemmaContainsTupleThenContainsKey!13 (t!30653 l!1367) key!393 value!188))))

(declare-fun b!1020648 () Bool)

(declare-fun res!684099 () Bool)

(assert (=> b!1020648 (=> (not res!684099) (not e!574534))))

(assert (=> b!1020648 (= res!684099 (isStrictlySorted!708 (t!30653 l!1367)))))

(declare-fun b!1020649 () Bool)

(declare-fun res!684100 () Bool)

(assert (=> b!1020649 (=> (not res!684100) (not e!574534))))

(declare-fun contains!5934 (List!21643 tuple2!15456) Bool)

(assert (=> b!1020649 (= res!684100 (contains!5934 (t!30653 l!1367) lt!449909))))

(declare-fun b!1020650 () Bool)

(assert (=> b!1020650 (= e!574536 e!574534)))

(declare-fun res!684101 () Bool)

(assert (=> b!1020650 (=> (not res!684101) (not e!574534))))

(assert (=> b!1020650 (= res!684101 (contains!5934 l!1367 lt!449909))))

(assert (=> b!1020650 (= lt!449909 (tuple2!15457 key!393 value!188))))

(assert (= (and start!88978 res!684098) b!1020650))

(assert (= (and b!1020650 res!684101) b!1020646))

(assert (= (and b!1020646 res!684097) b!1020648))

(assert (= (and b!1020648 res!684099) b!1020649))

(assert (= (and b!1020649 res!684100) b!1020647))

(assert (= (and start!88978 (is-Cons!21639 l!1367)) b!1020645))

(declare-fun m!940489 () Bool)

(assert (=> b!1020650 m!940489))

(declare-fun m!940491 () Bool)

(assert (=> start!88978 m!940491))

(declare-fun m!940493 () Bool)

(assert (=> b!1020647 m!940493))

(declare-fun m!940495 () Bool)

(assert (=> b!1020647 m!940495))

(declare-fun m!940497 () Bool)

(assert (=> b!1020647 m!940497))

(declare-fun m!940499 () Bool)

(assert (=> b!1020649 m!940499))

(declare-fun m!940501 () Bool)

(assert (=> b!1020648 m!940501))

(push 1)

(assert (not b!1020648))

(assert (not start!88978))

(assert (not b!1020645))

(assert tp_is_empty!23809)

(assert (not b!1020649))

(assert (not b!1020650))

(assert (not b!1020647))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!122415 () Bool)

(declare-fun res!684148 () Bool)

(declare-fun e!574571 () Bool)

(assert (=> d!122415 (=> res!684148 e!574571)))

(assert (=> d!122415 (= res!684148 (and (is-Cons!21639 l!1367) (= (_1!7739 (h!22837 l!1367)) key!393)))))

(assert (=> d!122415 (= (containsKey!553 l!1367 key!393) e!574571)))

(declare-fun b!1020703 () Bool)

(declare-fun e!574572 () Bool)

(assert (=> b!1020703 (= e!574571 e!574572)))

(declare-fun res!684149 () Bool)

(assert (=> b!1020703 (=> (not res!684149) (not e!574572))))

(assert (=> b!1020703 (= res!684149 (and (or (not (is-Cons!21639 l!1367)) (bvsle (_1!7739 (h!22837 l!1367)) key!393)) (is-Cons!21639 l!1367) (bvslt (_1!7739 (h!22837 l!1367)) key!393)))))

(declare-fun b!1020704 () Bool)

(assert (=> b!1020704 (= e!574572 (containsKey!553 (t!30653 l!1367) key!393))))

(assert (= (and d!122415 (not res!684148)) b!1020703))

(assert (= (and b!1020703 res!684149) b!1020704))

(assert (=> b!1020704 m!940495))

(assert (=> b!1020647 d!122415))

(declare-fun d!122423 () Bool)

(declare-fun res!684150 () Bool)

(declare-fun e!574573 () Bool)

(assert (=> d!122423 (=> res!684150 e!574573)))

(assert (=> d!122423 (= res!684150 (and (is-Cons!21639 (t!30653 l!1367)) (= (_1!7739 (h!22837 (t!30653 l!1367))) key!393)))))

(assert (=> d!122423 (= (containsKey!553 (t!30653 l!1367) key!393) e!574573)))

(declare-fun b!1020705 () Bool)

(declare-fun e!574574 () Bool)

(assert (=> b!1020705 (= e!574573 e!574574)))

(declare-fun res!684151 () Bool)

(assert (=> b!1020705 (=> (not res!684151) (not e!574574))))

(assert (=> b!1020705 (= res!684151 (and (or (not (is-Cons!21639 (t!30653 l!1367))) (bvsle (_1!7739 (h!22837 (t!30653 l!1367))) key!393)) (is-Cons!21639 (t!30653 l!1367)) (bvslt (_1!7739 (h!22837 (t!30653 l!1367))) key!393)))))

(declare-fun b!1020706 () Bool)

(assert (=> b!1020706 (= e!574574 (containsKey!553 (t!30653 (t!30653 l!1367)) key!393))))

(assert (= (and d!122423 (not res!684150)) b!1020705))

(assert (= (and b!1020705 res!684151) b!1020706))

(declare-fun m!940533 () Bool)

(assert (=> b!1020706 m!940533))

(assert (=> b!1020647 d!122423))

(declare-fun d!122425 () Bool)

(assert (=> d!122425 (containsKey!553 (t!30653 l!1367) key!393)))

(declare-fun lt!449928 () Unit!33299)

(declare-fun choose!1679 (List!21643 (_ BitVec 64) B!1742) Unit!33299)

(assert (=> d!122425 (= lt!449928 (choose!1679 (t!30653 l!1367) key!393 value!188))))

(declare-fun e!574584 () Bool)

(assert (=> d!122425 e!574584))

(declare-fun res!684161 () Bool)

(assert (=> d!122425 (=> (not res!684161) (not e!574584))))

(assert (=> d!122425 (= res!684161 (isStrictlySorted!708 (t!30653 l!1367)))))

(assert (=> d!122425 (= (lemmaContainsTupleThenContainsKey!13 (t!30653 l!1367) key!393 value!188) lt!449928)))

(declare-fun b!1020716 () Bool)

(assert (=> b!1020716 (= e!574584 (contains!5934 (t!30653 l!1367) (tuple2!15457 key!393 value!188)))))

(assert (= (and d!122425 res!684161) b!1020716))

(assert (=> d!122425 m!940495))

(declare-fun m!940541 () Bool)

(assert (=> d!122425 m!940541))

(assert (=> d!122425 m!940501))

(declare-fun m!940543 () Bool)

(assert (=> b!1020716 m!940543))

(assert (=> b!1020647 d!122425))

(declare-fun d!122433 () Bool)

(declare-fun lt!449937 () Bool)

(declare-fun content!503 (List!21643) (Set tuple2!15456))

(assert (=> d!122433 (= lt!449937 (set.member lt!449909 (content!503 (t!30653 l!1367))))))

(declare-fun e!574599 () Bool)

(assert (=> d!122433 (= lt!449937 e!574599)))

(declare-fun res!684175 () Bool)

(assert (=> d!122433 (=> (not res!684175) (not e!574599))))

(assert (=> d!122433 (= res!684175 (is-Cons!21639 (t!30653 l!1367)))))

(assert (=> d!122433 (= (contains!5934 (t!30653 l!1367) lt!449909) lt!449937)))

(declare-fun b!1020730 () Bool)

(declare-fun e!574598 () Bool)

(assert (=> b!1020730 (= e!574599 e!574598)))

(declare-fun res!684176 () Bool)

(assert (=> b!1020730 (=> res!684176 e!574598)))

(assert (=> b!1020730 (= res!684176 (= (h!22837 (t!30653 l!1367)) lt!449909))))

(declare-fun b!1020731 () Bool)

(assert (=> b!1020731 (= e!574598 (contains!5934 (t!30653 (t!30653 l!1367)) lt!449909))))

(assert (= (and d!122433 res!684175) b!1020730))

(assert (= (and b!1020730 (not res!684176)) b!1020731))

(declare-fun m!940555 () Bool)

(assert (=> d!122433 m!940555))

(declare-fun m!940557 () Bool)

(assert (=> d!122433 m!940557))

(declare-fun m!940559 () Bool)

(assert (=> b!1020731 m!940559))

(assert (=> b!1020649 d!122433))

(declare-fun d!122439 () Bool)

(declare-fun res!684197 () Bool)

(declare-fun e!574620 () Bool)

(assert (=> d!122439 (=> res!684197 e!574620)))

(assert (=> d!122439 (= res!684197 (or (is-Nil!21640 (t!30653 l!1367)) (is-Nil!21640 (t!30653 (t!30653 l!1367)))))))

(assert (=> d!122439 (= (isStrictlySorted!708 (t!30653 l!1367)) e!574620)))

(declare-fun b!1020752 () Bool)

(declare-fun e!574621 () Bool)

(assert (=> b!1020752 (= e!574620 e!574621)))

(declare-fun res!684198 () Bool)

(assert (=> b!1020752 (=> (not res!684198) (not e!574621))))

(assert (=> b!1020752 (= res!684198 (bvslt (_1!7739 (h!22837 (t!30653 l!1367))) (_1!7739 (h!22837 (t!30653 (t!30653 l!1367))))))))

(declare-fun b!1020753 () Bool)

(assert (=> b!1020753 (= e!574621 (isStrictlySorted!708 (t!30653 (t!30653 l!1367))))))

(assert (= (and d!122439 (not res!684197)) b!1020752))

(assert (= (and b!1020752 res!684198) b!1020753))

(declare-fun m!940567 () Bool)

(assert (=> b!1020753 m!940567))

(assert (=> b!1020648 d!122439))

(declare-fun d!122447 () Bool)

(declare-fun res!684199 () Bool)

(declare-fun e!574622 () Bool)

(assert (=> d!122447 (=> res!684199 e!574622)))

(assert (=> d!122447 (= res!684199 (or (is-Nil!21640 l!1367) (is-Nil!21640 (t!30653 l!1367))))))

(assert (=> d!122447 (= (isStrictlySorted!708 l!1367) e!574622)))

(declare-fun b!1020754 () Bool)

(declare-fun e!574623 () Bool)

(assert (=> b!1020754 (= e!574622 e!574623)))

(declare-fun res!684200 () Bool)

(assert (=> b!1020754 (=> (not res!684200) (not e!574623))))

(assert (=> b!1020754 (= res!684200 (bvslt (_1!7739 (h!22837 l!1367)) (_1!7739 (h!22837 (t!30653 l!1367)))))))

(declare-fun b!1020755 () Bool)

(assert (=> b!1020755 (= e!574623 (isStrictlySorted!708 (t!30653 l!1367)))))

(assert (= (and d!122447 (not res!684199)) b!1020754))

(assert (= (and b!1020754 res!684200) b!1020755))

(assert (=> b!1020755 m!940501))

(assert (=> start!88978 d!122447))

(declare-fun d!122451 () Bool)

(declare-fun lt!449939 () Bool)

(assert (=> d!122451 (= lt!449939 (set.member lt!449909 (content!503 l!1367)))))

(declare-fun e!574627 () Bool)

(assert (=> d!122451 (= lt!449939 e!574627)))

(declare-fun res!684203 () Bool)

(assert (=> d!122451 (=> (not res!684203) (not e!574627))))

(assert (=> d!122451 (= res!684203 (is-Cons!21639 l!1367))))

(assert (=> d!122451 (= (contains!5934 l!1367 lt!449909) lt!449939)))

(declare-fun b!1020758 () Bool)

(declare-fun e!574626 () Bool)

(assert (=> b!1020758 (= e!574627 e!574626)))

(declare-fun res!684204 () Bool)

(assert (=> b!1020758 (=> res!684204 e!574626)))

(assert (=> b!1020758 (= res!684204 (= (h!22837 l!1367) lt!449909))))

(declare-fun b!1020759 () Bool)

(assert (=> b!1020759 (= e!574626 (contains!5934 (t!30653 l!1367) lt!449909))))

(assert (= (and d!122451 res!684203) b!1020758))

(assert (= (and b!1020758 (not res!684204)) b!1020759))

(declare-fun m!940571 () Bool)

(assert (=> d!122451 m!940571))

(declare-fun m!940573 () Bool)

(assert (=> d!122451 m!940573))

(assert (=> b!1020759 m!940499))

(assert (=> b!1020650 d!122451))

(declare-fun b!1020773 () Bool)

(declare-fun e!574637 () Bool)

(declare-fun tp!71302 () Bool)

(assert (=> b!1020773 (= e!574637 (and tp_is_empty!23809 tp!71302))))

(assert (=> b!1020645 (= tp!71290 e!574637)))

(assert (= (and b!1020645 (is-Cons!21639 (t!30653 l!1367))) b!1020773))

(push 1)

(assert (not d!122433))

(assert (not b!1020759))

(assert (not b!1020704))

(assert (not b!1020731))

(assert (not b!1020773))

(assert (not b!1020716))

(assert tp_is_empty!23809)

(assert (not b!1020755))

(assert (not d!122451))

(assert (not d!122425))

(assert (not b!1020706))

(assert (not b!1020753))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

