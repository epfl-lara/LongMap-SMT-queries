; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!88954 () Bool)

(assert start!88954)

(declare-fun b!1020504 () Bool)

(declare-fun res!684005 () Bool)

(declare-fun e!574438 () Bool)

(assert (=> b!1020504 (=> (not res!684005) (not e!574438))))

(declare-datatypes ((B!1736 0))(
  ( (B!1737 (val!11952 Int)) )
))
(declare-datatypes ((tuple2!15450 0))(
  ( (tuple2!15451 (_1!7736 (_ BitVec 64)) (_2!7736 B!1736)) )
))
(declare-datatypes ((List!21640 0))(
  ( (Nil!21637) (Cons!21636 (h!22834 tuple2!15450) (t!30650 List!21640)) )
))
(declare-fun l!1367 () List!21640)

(declare-fun lt!449874 () tuple2!15450)

(declare-fun contains!5931 (List!21640 tuple2!15450) Bool)

(assert (=> b!1020504 (= res!684005 (contains!5931 (t!30650 l!1367) lt!449874))))

(declare-fun b!1020505 () Bool)

(declare-fun res!684008 () Bool)

(assert (=> b!1020505 (=> (not res!684008) (not e!574438))))

(declare-fun isStrictlySorted!705 (List!21640) Bool)

(assert (=> b!1020505 (= res!684008 (isStrictlySorted!705 (t!30650 l!1367)))))

(declare-fun b!1020506 () Bool)

(declare-fun e!574440 () Bool)

(assert (=> b!1020506 (= e!574440 e!574438)))

(declare-fun res!684007 () Bool)

(assert (=> b!1020506 (=> (not res!684007) (not e!574438))))

(assert (=> b!1020506 (= res!684007 (contains!5931 l!1367 lt!449874))))

(declare-fun key!393 () (_ BitVec 64))

(declare-fun value!188 () B!1736)

(assert (=> b!1020506 (= lt!449874 (tuple2!15451 key!393 value!188))))

(declare-fun b!1020507 () Bool)

(declare-fun e!574439 () Bool)

(declare-fun tp_is_empty!23803 () Bool)

(declare-fun tp!71272 () Bool)

(assert (=> b!1020507 (= e!574439 (and tp_is_empty!23803 tp!71272))))

(declare-fun res!684006 () Bool)

(assert (=> start!88954 (=> (not res!684006) (not e!574440))))

(assert (=> start!88954 (= res!684006 (isStrictlySorted!705 l!1367))))

(assert (=> start!88954 e!574440))

(assert (=> start!88954 e!574439))

(assert (=> start!88954 true))

(assert (=> start!88954 tp_is_empty!23803))

(declare-fun b!1020508 () Bool)

(declare-fun ListPrimitiveSize!142 (List!21640) Int)

(assert (=> b!1020508 (= e!574438 (>= (ListPrimitiveSize!142 (t!30650 l!1367)) (ListPrimitiveSize!142 l!1367)))))

(declare-fun b!1020509 () Bool)

(declare-fun res!684004 () Bool)

(assert (=> b!1020509 (=> (not res!684004) (not e!574438))))

(assert (=> b!1020509 (= res!684004 (and (is-Cons!21636 l!1367) (not (= (h!22834 l!1367) lt!449874))))))

(assert (= (and start!88954 res!684006) b!1020506))

(assert (= (and b!1020506 res!684007) b!1020509))

(assert (= (and b!1020509 res!684004) b!1020505))

(assert (= (and b!1020505 res!684008) b!1020504))

(assert (= (and b!1020504 res!684005) b!1020508))

(assert (= (and start!88954 (is-Cons!21636 l!1367)) b!1020507))

(declare-fun m!940411 () Bool)

(assert (=> start!88954 m!940411))

(declare-fun m!940413 () Bool)

(assert (=> b!1020505 m!940413))

(declare-fun m!940415 () Bool)

(assert (=> b!1020506 m!940415))

(declare-fun m!940417 () Bool)

(assert (=> b!1020508 m!940417))

(declare-fun m!940419 () Bool)

(assert (=> b!1020508 m!940419))

(declare-fun m!940421 () Bool)

(assert (=> b!1020504 m!940421))

(push 1)

(assert (not b!1020505))

(assert tp_is_empty!23803)

(assert (not b!1020504))

(assert (not b!1020508))

(assert (not b!1020506))

(assert (not start!88954))

(assert (not b!1020507))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!122375 () Bool)

(declare-fun lt!449883 () Bool)

(declare-fun content!499 (List!21640) (Set tuple2!15450))

(assert (=> d!122375 (= lt!449883 (set.member lt!449874 (content!499 l!1367)))))

(declare-fun e!574468 () Bool)

(assert (=> d!122375 (= lt!449883 e!574468)))

(declare-fun res!684050 () Bool)

(assert (=> d!122375 (=> (not res!684050) (not e!574468))))

(assert (=> d!122375 (= res!684050 (is-Cons!21636 l!1367))))

(assert (=> d!122375 (= (contains!5931 l!1367 lt!449874) lt!449883)))

(declare-fun b!1020555 () Bool)

(declare-fun e!574470 () Bool)

(assert (=> b!1020555 (= e!574468 e!574470)))

(declare-fun res!684047 () Bool)

(assert (=> b!1020555 (=> res!684047 e!574470)))

(assert (=> b!1020555 (= res!684047 (= (h!22834 l!1367) lt!449874))))

(declare-fun b!1020557 () Bool)

(assert (=> b!1020557 (= e!574470 (contains!5931 (t!30650 l!1367) lt!449874))))

(assert (= (and d!122375 res!684050) b!1020555))

(assert (= (and b!1020555 (not res!684047)) b!1020557))

(declare-fun m!940447 () Bool)

(assert (=> d!122375 m!940447))

(declare-fun m!940449 () Bool)

(assert (=> d!122375 m!940449))

(assert (=> b!1020557 m!940421))

(assert (=> b!1020506 d!122375))

(declare-fun d!122383 () Bool)

(declare-fun res!684067 () Bool)

(declare-fun e!574487 () Bool)

(assert (=> d!122383 (=> res!684067 e!574487)))

(assert (=> d!122383 (= res!684067 (or (is-Nil!21637 (t!30650 l!1367)) (is-Nil!21637 (t!30650 (t!30650 l!1367)))))))

(assert (=> d!122383 (= (isStrictlySorted!705 (t!30650 l!1367)) e!574487)))

(declare-fun b!1020574 () Bool)

(declare-fun e!574488 () Bool)

(assert (=> b!1020574 (= e!574487 e!574488)))

(declare-fun res!684068 () Bool)

(assert (=> b!1020574 (=> (not res!684068) (not e!574488))))

(assert (=> b!1020574 (= res!684068 (bvslt (_1!7736 (h!22834 (t!30650 l!1367))) (_1!7736 (h!22834 (t!30650 (t!30650 l!1367))))))))

(declare-fun b!1020575 () Bool)

(assert (=> b!1020575 (= e!574488 (isStrictlySorted!705 (t!30650 (t!30650 l!1367))))))

(assert (= (and d!122383 (not res!684067)) b!1020574))

(assert (= (and b!1020574 res!684068) b!1020575))

(declare-fun m!940453 () Bool)

(assert (=> b!1020575 m!940453))

(assert (=> b!1020505 d!122383))

(declare-fun d!122389 () Bool)

(declare-fun lt!449888 () Bool)

(assert (=> d!122389 (= lt!449888 (set.member lt!449874 (content!499 (t!30650 l!1367))))))

(declare-fun e!574491 () Bool)

(assert (=> d!122389 (= lt!449888 e!574491)))

(declare-fun res!684070 () Bool)

(assert (=> d!122389 (=> (not res!684070) (not e!574491))))

(assert (=> d!122389 (= res!684070 (is-Cons!21636 (t!30650 l!1367)))))

(assert (=> d!122389 (= (contains!5931 (t!30650 l!1367) lt!449874) lt!449888)))

(declare-fun b!1020580 () Bool)

(declare-fun e!574492 () Bool)

(assert (=> b!1020580 (= e!574491 e!574492)))

(declare-fun res!684069 () Bool)

(assert (=> b!1020580 (=> res!684069 e!574492)))

(assert (=> b!1020580 (= res!684069 (= (h!22834 (t!30650 l!1367)) lt!449874))))

(declare-fun b!1020581 () Bool)

(assert (=> b!1020581 (= e!574492 (contains!5931 (t!30650 (t!30650 l!1367)) lt!449874))))

(assert (= (and d!122389 res!684070) b!1020580))

(assert (= (and b!1020580 (not res!684069)) b!1020581))

(declare-fun m!940455 () Bool)

(assert (=> d!122389 m!940455))

(declare-fun m!940457 () Bool)

(assert (=> d!122389 m!940457))

(declare-fun m!940459 () Bool)

(assert (=> b!1020581 m!940459))

(assert (=> b!1020504 d!122389))

(declare-fun d!122391 () Bool)

(declare-fun res!684071 () Bool)

(declare-fun e!574493 () Bool)

(assert (=> d!122391 (=> res!684071 e!574493)))

(assert (=> d!122391 (= res!684071 (or (is-Nil!21637 l!1367) (is-Nil!21637 (t!30650 l!1367))))))

(assert (=> d!122391 (= (isStrictlySorted!705 l!1367) e!574493)))

(declare-fun b!1020582 () Bool)

(declare-fun e!574494 () Bool)

(assert (=> b!1020582 (= e!574493 e!574494)))

(declare-fun res!684072 () Bool)

(assert (=> b!1020582 (=> (not res!684072) (not e!574494))))

(assert (=> b!1020582 (= res!684072 (bvslt (_1!7736 (h!22834 l!1367)) (_1!7736 (h!22834 (t!30650 l!1367)))))))

(declare-fun b!1020583 () Bool)

(assert (=> b!1020583 (= e!574494 (isStrictlySorted!705 (t!30650 l!1367)))))

(assert (= (and d!122391 (not res!684071)) b!1020582))

(assert (= (and b!1020582 res!684072) b!1020583))

(assert (=> b!1020583 m!940413))

(assert (=> start!88954 d!122391))

(declare-fun d!122393 () Bool)

(declare-fun lt!449896 () Int)

(assert (=> d!122393 (>= lt!449896 0)))

(declare-fun e!574503 () Int)

(assert (=> d!122393 (= lt!449896 e!574503)))

(declare-fun c!103510 () Bool)

(assert (=> d!122393 (= c!103510 (is-Nil!21637 (t!30650 l!1367)))))

(assert (=> d!122393 (= (ListPrimitiveSize!142 (t!30650 l!1367)) lt!449896)))

(declare-fun b!1020598 () Bool)

(assert (=> b!1020598 (= e!574503 0)))

(declare-fun b!1020599 () Bool)

(assert (=> b!1020599 (= e!574503 (+ 1 (ListPrimitiveSize!142 (t!30650 (t!30650 l!1367)))))))

(assert (= (and d!122393 c!103510) b!1020598))

(assert (= (and d!122393 (not c!103510)) b!1020599))

(declare-fun m!940467 () Bool)

(assert (=> b!1020599 m!940467))

(assert (=> b!1020508 d!122393))

(declare-fun d!122401 () Bool)

(declare-fun lt!449897 () Int)

(assert (=> d!122401 (>= lt!449897 0)))

(declare-fun e!574504 () Int)

(assert (=> d!122401 (= lt!449897 e!574504)))

(declare-fun c!103511 () Bool)

(assert (=> d!122401 (= c!103511 (is-Nil!21637 l!1367))))

(assert (=> d!122401 (= (ListPrimitiveSize!142 l!1367) lt!449897)))

(declare-fun b!1020600 () Bool)

(assert (=> b!1020600 (= e!574504 0)))

(declare-fun b!1020601 () Bool)

(assert (=> b!1020601 (= e!574504 (+ 1 (ListPrimitiveSize!142 (t!30650 l!1367))))))

(assert (= (and d!122401 c!103511) b!1020600))

(assert (= (and d!122401 (not c!103511)) b!1020601))

(assert (=> b!1020601 m!940417))

(assert (=> b!1020508 d!122401))

(declare-fun b!1020616 () Bool)

(declare-fun e!574515 () Bool)

(declare-fun tp!71281 () Bool)

(assert (=> b!1020616 (= e!574515 (and tp_is_empty!23803 tp!71281))))

(assert (=> b!1020507 (= tp!71272 e!574515)))

(assert (= (and b!1020507 (is-Cons!21636 (t!30650 l!1367))) b!1020616))

(push 1)

