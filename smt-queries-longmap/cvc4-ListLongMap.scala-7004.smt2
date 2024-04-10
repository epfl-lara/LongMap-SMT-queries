; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!88940 () Bool)

(assert start!88940)

(declare-fun b!1020424 () Bool)

(declare-fun e!574373 () Bool)

(declare-fun e!574372 () Bool)

(assert (=> b!1020424 (= e!574373 e!574372)))

(declare-fun res!683944 () Bool)

(assert (=> b!1020424 (=> res!683944 e!574372)))

(declare-datatypes ((B!1734 0))(
  ( (B!1735 (val!11951 Int)) )
))
(declare-datatypes ((tuple2!15448 0))(
  ( (tuple2!15449 (_1!7735 (_ BitVec 64)) (_2!7735 B!1734)) )
))
(declare-datatypes ((List!21639 0))(
  ( (Nil!21636) (Cons!21635 (h!22833 tuple2!15448) (t!30649 List!21639)) )
))
(declare-fun l!1367 () List!21639)

(declare-fun isStrictlySorted!704 (List!21639) Bool)

(assert (=> b!1020424 (= res!683944 (not (isStrictlySorted!704 (t!30649 l!1367))))))

(declare-fun b!1020425 () Bool)

(declare-fun e!574374 () Bool)

(declare-fun tp_is_empty!23801 () Bool)

(declare-fun tp!71260 () Bool)

(assert (=> b!1020425 (= e!574374 (and tp_is_empty!23801 tp!71260))))

(declare-fun b!1020426 () Bool)

(declare-fun res!683942 () Bool)

(assert (=> b!1020426 (=> (not res!683942) (not e!574373))))

(declare-fun lt!449859 () tuple2!15448)

(assert (=> b!1020426 (= res!683942 (and (is-Cons!21635 l!1367) (not (= (h!22833 l!1367) lt!449859))))))

(declare-fun res!683943 () Bool)

(declare-fun e!574371 () Bool)

(assert (=> start!88940 (=> (not res!683943) (not e!574371))))

(assert (=> start!88940 (= res!683943 (isStrictlySorted!704 l!1367))))

(assert (=> start!88940 e!574371))

(assert (=> start!88940 e!574374))

(assert (=> start!88940 true))

(assert (=> start!88940 tp_is_empty!23801))

(declare-fun b!1020427 () Bool)

(assert (=> b!1020427 (= e!574371 e!574373)))

(declare-fun res!683945 () Bool)

(assert (=> b!1020427 (=> (not res!683945) (not e!574373))))

(declare-fun contains!5930 (List!21639 tuple2!15448) Bool)

(assert (=> b!1020427 (= res!683945 (contains!5930 l!1367 lt!449859))))

(declare-fun key!393 () (_ BitVec 64))

(declare-fun value!188 () B!1734)

(assert (=> b!1020427 (= lt!449859 (tuple2!15449 key!393 value!188))))

(declare-fun b!1020428 () Bool)

(assert (=> b!1020428 (= e!574372 (not (contains!5930 (t!30649 l!1367) lt!449859)))))

(assert (= (and start!88940 res!683943) b!1020427))

(assert (= (and b!1020427 res!683945) b!1020426))

(assert (= (and b!1020426 res!683942) b!1020424))

(assert (= (and b!1020424 (not res!683944)) b!1020428))

(assert (= (and start!88940 (is-Cons!21635 l!1367)) b!1020425))

(declare-fun m!940367 () Bool)

(assert (=> b!1020424 m!940367))

(declare-fun m!940369 () Bool)

(assert (=> start!88940 m!940369))

(declare-fun m!940371 () Bool)

(assert (=> b!1020427 m!940371))

(declare-fun m!940373 () Bool)

(assert (=> b!1020428 m!940373))

(push 1)

(assert (not start!88940))

(assert (not b!1020428))

(assert (not b!1020425))

(assert (not b!1020424))

(assert (not b!1020427))

(assert tp_is_empty!23801)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!122353 () Bool)

(declare-fun lt!449864 () Bool)

(declare-fun content!496 (List!21639) (Set tuple2!15448))

(assert (=> d!122353 (= lt!449864 (member lt!449859 (content!496 l!1367)))))

(declare-fun e!574398 () Bool)

(assert (=> d!122353 (= lt!449864 e!574398)))

(declare-fun res!683968 () Bool)

(assert (=> d!122353 (=> (not res!683968) (not e!574398))))

(assert (=> d!122353 (= res!683968 (is-Cons!21635 l!1367))))

(assert (=> d!122353 (= (contains!5930 l!1367 lt!449859) lt!449864)))

(declare-fun b!1020451 () Bool)

(declare-fun e!574397 () Bool)

(assert (=> b!1020451 (= e!574398 e!574397)))

(declare-fun res!683969 () Bool)

(assert (=> b!1020451 (=> res!683969 e!574397)))

(assert (=> b!1020451 (= res!683969 (= (h!22833 l!1367) lt!449859))))

(declare-fun b!1020452 () Bool)

(assert (=> b!1020452 (= e!574397 (contains!5930 (t!30649 l!1367) lt!449859))))

(assert (= (and d!122353 res!683968) b!1020451))

(assert (= (and b!1020451 (not res!683969)) b!1020452))

(declare-fun m!940377 () Bool)

(assert (=> d!122353 m!940377))

(declare-fun m!940379 () Bool)

(assert (=> d!122353 m!940379))

(assert (=> b!1020452 m!940373))

(assert (=> b!1020427 d!122353))

(declare-fun d!122361 () Bool)

(declare-fun res!683988 () Bool)

(declare-fun e!574422 () Bool)

(assert (=> d!122361 (=> res!683988 e!574422)))

(assert (=> d!122361 (= res!683988 (or (is-Nil!21636 (t!30649 l!1367)) (is-Nil!21636 (t!30649 (t!30649 l!1367)))))))

(assert (=> d!122361 (= (isStrictlySorted!704 (t!30649 l!1367)) e!574422)))

(declare-fun b!1020480 () Bool)

(declare-fun e!574423 () Bool)

(assert (=> b!1020480 (= e!574422 e!574423)))

(declare-fun res!683989 () Bool)

(assert (=> b!1020480 (=> (not res!683989) (not e!574423))))

(assert (=> b!1020480 (= res!683989 (bvslt (_1!7735 (h!22833 (t!30649 l!1367))) (_1!7735 (h!22833 (t!30649 (t!30649 l!1367))))))))

(declare-fun b!1020481 () Bool)

(assert (=> b!1020481 (= e!574423 (isStrictlySorted!704 (t!30649 (t!30649 l!1367))))))

(assert (= (and d!122361 (not res!683988)) b!1020480))

(assert (= (and b!1020480 res!683989) b!1020481))

(declare-fun m!940403 () Bool)

(assert (=> b!1020481 m!940403))

(assert (=> b!1020424 d!122361))

(declare-fun d!122369 () Bool)

(declare-fun lt!449871 () Bool)

(assert (=> d!122369 (= lt!449871 (member lt!449859 (content!496 (t!30649 l!1367))))))

(declare-fun e!574425 () Bool)

(assert (=> d!122369 (= lt!449871 e!574425)))

(declare-fun res!683990 () Bool)

(assert (=> d!122369 (=> (not res!683990) (not e!574425))))

(assert (=> d!122369 (= res!683990 (is-Cons!21635 (t!30649 l!1367)))))

(assert (=> d!122369 (= (contains!5930 (t!30649 l!1367) lt!449859) lt!449871)))

(declare-fun b!1020482 () Bool)

(declare-fun e!574424 () Bool)

(assert (=> b!1020482 (= e!574425 e!574424)))

(declare-fun res!683991 () Bool)

(assert (=> b!1020482 (=> res!683991 e!574424)))

