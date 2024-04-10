; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!88958 () Bool)

(assert start!88958)

(declare-fun b!1020540 () Bool)

(declare-fun res!684035 () Bool)

(declare-fun e!574457 () Bool)

(assert (=> b!1020540 (=> (not res!684035) (not e!574457))))

(declare-datatypes ((B!1740 0))(
  ( (B!1741 (val!11954 Int)) )
))
(declare-datatypes ((tuple2!15454 0))(
  ( (tuple2!15455 (_1!7738 (_ BitVec 64)) (_2!7738 B!1740)) )
))
(declare-datatypes ((List!21642 0))(
  ( (Nil!21639) (Cons!21638 (h!22836 tuple2!15454) (t!30652 List!21642)) )
))
(declare-fun l!1367 () List!21642)

(declare-fun lt!449880 () tuple2!15454)

(declare-fun contains!5933 (List!21642 tuple2!15454) Bool)

(assert (=> b!1020540 (= res!684035 (contains!5933 (t!30652 l!1367) lt!449880))))

(declare-fun b!1020541 () Bool)

(declare-fun e!574458 () Bool)

(assert (=> b!1020541 (= e!574458 e!574457)))

(declare-fun res!684034 () Bool)

(assert (=> b!1020541 (=> (not res!684034) (not e!574457))))

(assert (=> b!1020541 (= res!684034 (contains!5933 l!1367 lt!449880))))

(declare-fun key!393 () (_ BitVec 64))

(declare-fun value!188 () B!1740)

(assert (=> b!1020541 (= lt!449880 (tuple2!15455 key!393 value!188))))

(declare-fun b!1020542 () Bool)

(declare-fun e!574456 () Bool)

(declare-fun tp_is_empty!23807 () Bool)

(declare-fun tp!71278 () Bool)

(assert (=> b!1020542 (= e!574456 (and tp_is_empty!23807 tp!71278))))

(declare-fun res!684038 () Bool)

(assert (=> start!88958 (=> (not res!684038) (not e!574458))))

(declare-fun isStrictlySorted!707 (List!21642) Bool)

(assert (=> start!88958 (= res!684038 (isStrictlySorted!707 l!1367))))

(assert (=> start!88958 e!574458))

(assert (=> start!88958 e!574456))

(assert (=> start!88958 true))

(assert (=> start!88958 tp_is_empty!23807))

(declare-fun b!1020543 () Bool)

(declare-fun res!684036 () Bool)

(assert (=> b!1020543 (=> (not res!684036) (not e!574457))))

(assert (=> b!1020543 (= res!684036 (and (is-Cons!21638 l!1367) (not (= (h!22836 l!1367) lt!449880))))))

(declare-fun b!1020544 () Bool)

(declare-fun ListPrimitiveSize!144 (List!21642) Int)

(assert (=> b!1020544 (= e!574457 (>= (ListPrimitiveSize!144 (t!30652 l!1367)) (ListPrimitiveSize!144 l!1367)))))

(declare-fun b!1020545 () Bool)

(declare-fun res!684037 () Bool)

(assert (=> b!1020545 (=> (not res!684037) (not e!574457))))

(assert (=> b!1020545 (= res!684037 (isStrictlySorted!707 (t!30652 l!1367)))))

(assert (= (and start!88958 res!684038) b!1020541))

(assert (= (and b!1020541 res!684034) b!1020543))

(assert (= (and b!1020543 res!684036) b!1020545))

(assert (= (and b!1020545 res!684037) b!1020540))

(assert (= (and b!1020540 res!684035) b!1020544))

(assert (= (and start!88958 (is-Cons!21638 l!1367)) b!1020542))

(declare-fun m!940435 () Bool)

(assert (=> b!1020541 m!940435))

(declare-fun m!940437 () Bool)

(assert (=> b!1020540 m!940437))

(declare-fun m!940439 () Bool)

(assert (=> b!1020544 m!940439))

(declare-fun m!940441 () Bool)

(assert (=> b!1020544 m!940441))

(declare-fun m!940443 () Bool)

(assert (=> b!1020545 m!940443))

(declare-fun m!940445 () Bool)

(assert (=> start!88958 m!940445))

(push 1)

(assert (not b!1020544))

(assert (not b!1020545))

(assert tp_is_empty!23807)

(assert (not start!88958))

(assert (not b!1020541))

(assert (not b!1020540))

(assert (not b!1020542))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!122379 () Bool)

(declare-fun res!684057 () Bool)

(declare-fun e!574477 () Bool)

(assert (=> d!122379 (=> res!684057 e!574477)))

(assert (=> d!122379 (= res!684057 (or (is-Nil!21639 l!1367) (is-Nil!21639 (t!30652 l!1367))))))

(assert (=> d!122379 (= (isStrictlySorted!707 l!1367) e!574477)))

(declare-fun b!1020564 () Bool)

(declare-fun e!574478 () Bool)

(assert (=> b!1020564 (= e!574477 e!574478)))

(declare-fun res!684058 () Bool)

(assert (=> b!1020564 (=> (not res!684058) (not e!574478))))

(assert (=> b!1020564 (= res!684058 (bvslt (_1!7738 (h!22836 l!1367)) (_1!7738 (h!22836 (t!30652 l!1367)))))))

(declare-fun b!1020565 () Bool)

(assert (=> b!1020565 (= e!574478 (isStrictlySorted!707 (t!30652 l!1367)))))

(assert (= (and d!122379 (not res!684057)) b!1020564))

(assert (= (and b!1020564 res!684058) b!1020565))

(assert (=> b!1020565 m!940443))

(assert (=> start!88958 d!122379))

(declare-fun d!122387 () Bool)

(declare-fun lt!449890 () Int)

(assert (=> d!122387 (>= lt!449890 0)))

(declare-fun e!574497 () Int)

(assert (=> d!122387 (= lt!449890 e!574497)))

(declare-fun c!103504 () Bool)

(assert (=> d!122387 (= c!103504 (is-Nil!21639 (t!30652 l!1367)))))

(assert (=> d!122387 (= (ListPrimitiveSize!144 (t!30652 l!1367)) lt!449890)))

(declare-fun b!1020586 () Bool)

(assert (=> b!1020586 (= e!574497 0)))

(declare-fun b!1020587 () Bool)

(assert (=> b!1020587 (= e!574497 (+ 1 (ListPrimitiveSize!144 (t!30652 (t!30652 l!1367)))))))

(assert (= (and d!122387 c!103504) b!1020586))

(assert (= (and d!122387 (not c!103504)) b!1020587))

(declare-fun m!940465 () Bool)

(assert (=> b!1020587 m!940465))

(assert (=> b!1020544 d!122387))

(declare-fun d!122397 () Bool)

(declare-fun lt!449891 () Int)

(assert (=> d!122397 (>= lt!449891 0)))

(declare-fun e!574498 () Int)

(assert (=> d!122397 (= lt!449891 e!574498)))

(declare-fun c!103505 () Bool)

(assert (=> d!122397 (= c!103505 (is-Nil!21639 l!1367))))

(assert (=> d!122397 (= (ListPrimitiveSize!144 l!1367) lt!449891)))

(declare-fun b!1020588 () Bool)

(assert (=> b!1020588 (= e!574498 0)))

(declare-fun b!1020589 () Bool)

(assert (=> b!1020589 (= e!574498 (+ 1 (ListPrimitiveSize!144 (t!30652 l!1367))))))

(assert (= (and d!122397 c!103505) b!1020588))

(assert (= (and d!122397 (not c!103505)) b!1020589))

(assert (=> b!1020589 m!940439))

(assert (=> b!1020544 d!122397))

(declare-fun d!122399 () Bool)

(declare-fun lt!449903 () Bool)

(declare-fun content!501 (List!21642) (Set tuple2!15454))

(assert (=> d!122399 (= lt!449903 (member lt!449880 (content!501 (t!30652 l!1367))))))

(declare-fun e!574520 () Bool)

(assert (=> d!122399 (= lt!449903 e!574520)))

(declare-fun res!684081 () Bool)

(assert (=> d!122399 (=> (not res!684081) (not e!574520))))

(assert (=> d!122399 (= res!684081 (is-Cons!21638 (t!30652 l!1367)))))

(assert (=> d!122399 (= (contains!5933 (t!30652 l!1367) lt!449880) lt!449903)))

(declare-fun b!1020622 () Bool)

(declare-fun e!574519 () Bool)

(assert (=> b!1020622 (= e!574520 e!574519)))

(declare-fun res!684082 () Bool)

(assert (=> b!1020622 (=> res!684082 e!574519)))

(assert (=> b!1020622 (= res!684082 (= (h!22836 (t!30652 l!1367)) lt!449880))))

(declare-fun b!1020623 () Bool)

(assert (=> b!1020623 (= e!574519 (contains!5933 (t!30652 (t!30652 l!1367)) lt!449880))))

(assert (= (and d!122399 res!684081) b!1020622))

(assert (= (and b!1020622 (not res!684082)) b!1020623))

(declare-fun m!940477 () Bool)

(assert (=> d!122399 m!940477))

(declare-fun m!940479 () Bool)

(assert (=> d!122399 m!940479))

(declare-fun m!940481 () Bool)

(assert (=> b!1020623 m!940481))

(assert (=> b!1020540 d!122399))

(declare-fun d!122407 () Bool)

(declare-fun res!684083 () Bool)

(declare-fun e!574521 () Bool)

(assert (=> d!122407 (=> res!684083 e!574521)))

(assert (=> d!122407 (= res!684083 (or (is-Nil!21639 (t!30652 l!1367)) (is-Nil!21639 (t!30652 (t!30652 l!1367)))))))

(assert (=> d!122407 (= (isStrictlySorted!707 (t!30652 l!1367)) e!574521)))

(declare-fun b!1020624 () Bool)

(declare-fun e!574522 () Bool)

(assert (=> b!1020624 (= e!574521 e!574522)))

(declare-fun res!684084 () Bool)

(assert (=> b!1020624 (=> (not res!684084) (not e!574522))))

(assert (=> b!1020624 (= res!684084 (bvslt (_1!7738 (h!22836 (t!30652 l!1367))) (_1!7738 (h!22836 (t!30652 (t!30652 l!1367))))))))

(declare-fun b!1020625 () Bool)

(assert (=> b!1020625 (= e!574522 (isStrictlySorted!707 (t!30652 (t!30652 l!1367))))))

(assert (= (and d!122407 (not res!684083)) b!1020624))

(assert (= (and b!1020624 res!684084) b!1020625))

(declare-fun m!940483 () Bool)

(assert (=> b!1020625 m!940483))

(assert (=> b!1020545 d!122407))

(declare-fun d!122409 () Bool)

(declare-fun lt!449904 () Bool)

(assert (=> d!122409 (= lt!449904 (member lt!449880 (content!501 l!1367)))))

(declare-fun e!574524 () Bool)

(assert (=> d!122409 (= lt!449904 e!574524)))

