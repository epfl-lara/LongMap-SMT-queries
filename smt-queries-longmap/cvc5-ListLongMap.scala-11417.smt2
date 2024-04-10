; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133076 () Bool)

(assert start!133076)

(declare-fun res!1065327 () Bool)

(declare-fun e!867595 () Bool)

(assert (=> start!133076 (=> (not res!1065327) (not e!867595))))

(declare-datatypes ((B!2378 0))(
  ( (B!2379 (val!19275 Int)) )
))
(declare-datatypes ((tuple2!24926 0))(
  ( (tuple2!24927 (_1!12474 (_ BitVec 64)) (_2!12474 B!2378)) )
))
(declare-datatypes ((List!36309 0))(
  ( (Nil!36306) (Cons!36305 (h!37751 tuple2!24926) (t!51036 List!36309)) )
))
(declare-datatypes ((ListLongMap!22427 0))(
  ( (ListLongMap!22428 (toList!11229 List!36309)) )
))
(declare-fun lm!250 () ListLongMap!22427)

(declare-fun a0!50 () (_ BitVec 64))

(declare-fun contains!10200 (ListLongMap!22427 (_ BitVec 64)) Bool)

(assert (=> start!133076 (= res!1065327 (contains!10200 lm!250 a0!50))))

(assert (=> start!133076 e!867595))

(declare-fun e!867596 () Bool)

(declare-fun inv!57473 (ListLongMap!22427) Bool)

(assert (=> start!133076 (and (inv!57473 lm!250) e!867596)))

(assert (=> start!133076 true))

(declare-fun tp_is_empty!38383 () Bool)

(assert (=> start!133076 tp_is_empty!38383))

(declare-fun b!1557513 () Bool)

(declare-fun res!1065328 () Bool)

(assert (=> b!1557513 (=> (not res!1065328) (not e!867595))))

(declare-fun a!524 () (_ BitVec 64))

(assert (=> b!1557513 (= res!1065328 (= a!524 a0!50))))

(declare-fun b!1557514 () Bool)

(declare-fun b!97 () B!2378)

(declare-fun +!5021 (ListLongMap!22427 tuple2!24926) ListLongMap!22427)

(assert (=> b!1557514 (= e!867595 (not (contains!10200 (+!5021 lm!250 (tuple2!24927 a!524 b!97)) a0!50)))))

(declare-fun b!1557515 () Bool)

(declare-fun tp!112512 () Bool)

(assert (=> b!1557515 (= e!867596 tp!112512)))

(assert (= (and start!133076 res!1065327) b!1557513))

(assert (= (and b!1557513 res!1065328) b!1557514))

(assert (= start!133076 b!1557515))

(declare-fun m!1434603 () Bool)

(assert (=> start!133076 m!1434603))

(declare-fun m!1434605 () Bool)

(assert (=> start!133076 m!1434605))

(declare-fun m!1434607 () Bool)

(assert (=> b!1557514 m!1434607))

(assert (=> b!1557514 m!1434607))

(declare-fun m!1434609 () Bool)

(assert (=> b!1557514 m!1434609))

(push 1)

(assert (not start!133076))

(assert (not b!1557514))

(assert (not b!1557515))

(assert tp_is_empty!38383)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!162479 () Bool)

(declare-fun e!867622 () Bool)

(assert (=> d!162479 e!867622))

(declare-fun res!1065347 () Bool)

(assert (=> d!162479 (=> res!1065347 e!867622)))

(declare-fun lt!670657 () Bool)

(assert (=> d!162479 (= res!1065347 (not lt!670657))))

(declare-fun lt!670658 () Bool)

(assert (=> d!162479 (= lt!670657 lt!670658)))

(declare-datatypes ((Unit!51865 0))(
  ( (Unit!51866) )
))
(declare-fun lt!670659 () Unit!51865)

(declare-fun e!867621 () Unit!51865)

(assert (=> d!162479 (= lt!670659 e!867621)))

(declare-fun c!143994 () Bool)

(assert (=> d!162479 (= c!143994 lt!670658)))

(declare-fun containsKey!822 (List!36309 (_ BitVec 64)) Bool)

(assert (=> d!162479 (= lt!670658 (containsKey!822 (toList!11229 lm!250) a0!50))))

(assert (=> d!162479 (= (contains!10200 lm!250 a0!50) lt!670657)))

(declare-fun b!1557552 () Bool)

(declare-fun lt!670656 () Unit!51865)

(assert (=> b!1557552 (= e!867621 lt!670656)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!529 (List!36309 (_ BitVec 64)) Unit!51865)

(assert (=> b!1557552 (= lt!670656 (lemmaContainsKeyImpliesGetValueByKeyDefined!529 (toList!11229 lm!250) a0!50))))

(declare-datatypes ((Option!864 0))(
  ( (Some!863 (v!22054 B!2378)) (None!862) )
))
(declare-fun isDefined!577 (Option!864) Bool)

(declare-fun getValueByKey!788 (List!36309 (_ BitVec 64)) Option!864)

(assert (=> b!1557552 (isDefined!577 (getValueByKey!788 (toList!11229 lm!250) a0!50))))

(declare-fun b!1557553 () Bool)

(declare-fun Unit!51872 () Unit!51865)

(assert (=> b!1557553 (= e!867621 Unit!51872)))

(declare-fun b!1557554 () Bool)

(assert (=> b!1557554 (= e!867622 (isDefined!577 (getValueByKey!788 (toList!11229 lm!250) a0!50)))))

(assert (= (and d!162479 c!143994) b!1557552))

(assert (= (and d!162479 (not c!143994)) b!1557553))

(assert (= (and d!162479 (not res!1065347)) b!1557554))

(declare-fun m!1434627 () Bool)

(assert (=> d!162479 m!1434627))

(declare-fun m!1434631 () Bool)

(assert (=> b!1557552 m!1434631))

(declare-fun m!1434635 () Bool)

(assert (=> b!1557552 m!1434635))

(assert (=> b!1557552 m!1434635))

(declare-fun m!1434641 () Bool)

(assert (=> b!1557552 m!1434641))

(assert (=> b!1557554 m!1434635))

(assert (=> b!1557554 m!1434635))

(assert (=> b!1557554 m!1434641))

(assert (=> start!133076 d!162479))

(declare-fun d!162485 () Bool)

(declare-fun isStrictlySorted!959 (List!36309) Bool)

(assert (=> d!162485 (= (inv!57473 lm!250) (isStrictlySorted!959 (toList!11229 lm!250)))))

(declare-fun bs!44771 () Bool)

(assert (= bs!44771 d!162485))

(declare-fun m!1434651 () Bool)

(assert (=> bs!44771 m!1434651))

(assert (=> start!133076 d!162485))

(declare-fun d!162491 () Bool)

(declare-fun e!867628 () Bool)

(assert (=> d!162491 e!867628))

(declare-fun res!1065350 () Bool)

(assert (=> d!162491 (=> res!1065350 e!867628)))

(declare-fun lt!670669 () Bool)

(assert (=> d!162491 (= res!1065350 (not lt!670669))))

(declare-fun lt!670670 () Bool)

(assert (=> d!162491 (= lt!670669 lt!670670)))

(declare-fun lt!670671 () Unit!51865)

(declare-fun e!867627 () Unit!51865)

(assert (=> d!162491 (= lt!670671 e!867627)))

(declare-fun c!143997 () Bool)

(assert (=> d!162491 (= c!143997 lt!670670)))

(assert (=> d!162491 (= lt!670670 (containsKey!822 (toList!11229 (+!5021 lm!250 (tuple2!24927 a!524 b!97))) a0!50))))

(assert (=> d!162491 (= (contains!10200 (+!5021 lm!250 (tuple2!24927 a!524 b!97)) a0!50) lt!670669)))

(declare-fun b!1557561 () Bool)

(declare-fun lt!670668 () Unit!51865)

(assert (=> b!1557561 (= e!867627 lt!670668)))

(assert (=> b!1557561 (= lt!670668 (lemmaContainsKeyImpliesGetValueByKeyDefined!529 (toList!11229 (+!5021 lm!250 (tuple2!24927 a!524 b!97))) a0!50))))

(assert (=> b!1557561 (isDefined!577 (getValueByKey!788 (toList!11229 (+!5021 lm!250 (tuple2!24927 a!524 b!97))) a0!50))))

(declare-fun b!1557562 () Bool)

(declare-fun Unit!51874 () Unit!51865)

(assert (=> b!1557562 (= e!867627 Unit!51874)))

(declare-fun b!1557563 () Bool)

(assert (=> b!1557563 (= e!867628 (isDefined!577 (getValueByKey!788 (toList!11229 (+!5021 lm!250 (tuple2!24927 a!524 b!97))) a0!50)))))

(assert (= (and d!162491 c!143997) b!1557561))

(assert (= (and d!162491 (not c!143997)) b!1557562))

(assert (= (and d!162491 (not res!1065350)) b!1557563))

(declare-fun m!1434653 () Bool)

(assert (=> d!162491 m!1434653))

(declare-fun m!1434655 () Bool)

(assert (=> b!1557561 m!1434655))

(declare-fun m!1434657 () Bool)

(assert (=> b!1557561 m!1434657))

(assert (=> b!1557561 m!1434657))

(declare-fun m!1434659 () Bool)

(assert (=> b!1557561 m!1434659))

(assert (=> b!1557563 m!1434657))

(assert (=> b!1557563 m!1434657))

(assert (=> b!1557563 m!1434659))

(assert (=> b!1557514 d!162491))

(declare-fun d!162493 () Bool)

(declare-fun e!867641 () Bool)

(assert (=> d!162493 e!867641))

(declare-fun res!1065369 () Bool)

(assert (=> d!162493 (=> (not res!1065369) (not e!867641))))

(declare-fun lt!670714 () ListLongMap!22427)

(assert (=> d!162493 (= res!1065369 (contains!10200 lt!670714 (_1!12474 (tuple2!24927 a!524 b!97))))))

(declare-fun lt!670712 () List!36309)

(assert (=> d!162493 (= lt!670714 (ListLongMap!22428 lt!670712))))

(declare-fun lt!670713 () Unit!51865)

(declare-fun lt!670715 () Unit!51865)

(assert (=> d!162493 (= lt!670713 lt!670715)))

(assert (=> d!162493 (= (getValueByKey!788 lt!670712 (_1!12474 (tuple2!24927 a!524 b!97))) (Some!863 (_2!12474 (tuple2!24927 a!524 b!97))))))

(declare-fun lemmaContainsTupThenGetReturnValue!385 (List!36309 (_ BitVec 64) B!2378) Unit!51865)

(assert (=> d!162493 (= lt!670715 (lemmaContainsTupThenGetReturnValue!385 lt!670712 (_1!12474 (tuple2!24927 a!524 b!97)) (_2!12474 (tuple2!24927 a!524 b!97))))))

(declare-fun insertStrictlySorted!560 (List!36309 (_ BitVec 64) B!2378) List!36309)

(assert (=> d!162493 (= lt!670712 (insertStrictlySorted!560 (toList!11229 lm!250) (_1!12474 (tuple2!24927 a!524 b!97)) (_2!12474 (tuple2!24927 a!524 b!97))))))

(assert (=> d!162493 (= (+!5021 lm!250 (tuple2!24927 a!524 b!97)) lt!670714)))

(declare-fun b!1557586 () Bool)

(declare-fun res!1065370 () Bool)

(assert (=> b!1557586 (=> (not res!1065370) (not e!867641))))

(assert (=> b!1557586 (= res!1065370 (= (getValueByKey!788 (toList!11229 lt!670714) (_1!12474 (tuple2!24927 a!524 b!97))) (Some!863 (_2!12474 (tuple2!24927 a!524 b!97)))))))

(declare-fun b!1557587 () Bool)

(declare-fun contains!10205 (List!36309 tuple2!24926) Bool)

(assert (=> b!1557587 (= e!867641 (contains!10205 (toList!11229 lt!670714) (tuple2!24927 a!524 b!97)))))

(assert (= (and d!162493 res!1065369) b!1557586))

(assert (= (and b!1557586 res!1065370) b!1557587))

(declare-fun m!1434701 () Bool)

(assert (=> d!162493 m!1434701))

(declare-fun m!1434703 () Bool)

(assert (=> d!162493 m!1434703))

(declare-fun m!1434705 () Bool)

(assert (=> d!162493 m!1434705))

(declare-fun m!1434707 () Bool)

(assert (=> d!162493 m!1434707))

(declare-fun m!1434709 () Bool)

(assert (=> b!1557586 m!1434709))

(declare-fun m!1434711 () Bool)

(assert (=> b!1557587 m!1434711))

(assert (=> b!1557514 d!162493))

(declare-fun b!1557601 () Bool)

(declare-fun e!867649 () Bool)

(declare-fun tp!112526 () Bool)

(assert (=> b!1557601 (= e!867649 (and tp_is_empty!38383 tp!112526))))

(assert (=> b!1557515 (= tp!112512 e!867649)))

