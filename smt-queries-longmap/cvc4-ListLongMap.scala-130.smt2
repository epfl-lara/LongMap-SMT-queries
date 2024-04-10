; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2260 () Bool)

(assert start!2260)

(declare-fun res!11476 () Bool)

(declare-fun e!9061 () Bool)

(assert (=> start!2260 (=> (not res!11476) (not e!9061))))

(declare-datatypes ((B!582 0))(
  ( (B!583 (val!389 Int)) )
))
(declare-datatypes ((tuple2!578 0))(
  ( (tuple2!579 (_1!289 (_ BitVec 64)) (_2!289 B!582)) )
))
(declare-datatypes ((List!446 0))(
  ( (Nil!443) (Cons!442 (h!1008 tuple2!578) (t!2848 List!446)) )
))
(declare-datatypes ((ListLongMap!409 0))(
  ( (ListLongMap!410 (toList!220 List!446)) )
))
(declare-fun thiss!177 () ListLongMap!409)

(declare-fun size!504 (List!446) Int)

(assert (=> start!2260 (= res!11476 (< (size!504 (toList!220 thiss!177)) 2147483647))))

(assert (=> start!2260 e!9061))

(declare-fun e!9062 () Bool)

(declare-fun inv!746 (ListLongMap!409) Bool)

(assert (=> start!2260 (and (inv!746 thiss!177) e!9062)))

(declare-fun b!15022 () Bool)

(declare-datatypes ((List!447 0))(
  ( (Nil!444) (Cons!443 (h!1009 (_ BitVec 64)) (t!2849 List!447)) )
))
(declare-fun length!4 (List!447) Int)

(declare-fun getKeysList!3 (List!446) List!447)

(assert (=> b!15022 (= e!9061 (>= (length!4 (getKeysList!3 (toList!220 thiss!177))) 2147483647))))

(declare-fun b!15023 () Bool)

(declare-fun tp!2432 () Bool)

(assert (=> b!15023 (= e!9062 tp!2432)))

(assert (= (and start!2260 res!11476) b!15022))

(assert (= start!2260 b!15023))

(declare-fun m!9993 () Bool)

(assert (=> start!2260 m!9993))

(declare-fun m!9995 () Bool)

(assert (=> start!2260 m!9995))

(declare-fun m!9997 () Bool)

(assert (=> b!15022 m!9997))

(assert (=> b!15022 m!9997))

(declare-fun m!9999 () Bool)

(assert (=> b!15022 m!9999))

(push 1)

(assert (not start!2260))

(assert (not b!15022))

(assert (not b!15023))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!2461 () Bool)

(declare-fun lt!3651 () Int)

(assert (=> d!2461 (>= lt!3651 0)))

(declare-fun e!9068 () Int)

(assert (=> d!2461 (= lt!3651 e!9068)))

(declare-fun c!1424 () Bool)

(assert (=> d!2461 (= c!1424 (is-Nil!443 (toList!220 thiss!177)))))

(assert (=> d!2461 (= (size!504 (toList!220 thiss!177)) lt!3651)))

(declare-fun b!15034 () Bool)

(assert (=> b!15034 (= e!9068 0)))

(declare-fun b!15035 () Bool)

(assert (=> b!15035 (= e!9068 (+ 1 (size!504 (t!2848 (toList!220 thiss!177)))))))

(assert (= (and d!2461 c!1424) b!15034))

(assert (= (and d!2461 (not c!1424)) b!15035))

(declare-fun m!10005 () Bool)

(assert (=> b!15035 m!10005))

(assert (=> start!2260 d!2461))

(declare-fun d!2467 () Bool)

(declare-fun isStrictlySorted!131 (List!446) Bool)

(assert (=> d!2467 (= (inv!746 thiss!177) (isStrictlySorted!131 (toList!220 thiss!177)))))

(declare-fun bs!620 () Bool)

(assert (= bs!620 d!2467))

(declare-fun m!10009 () Bool)

(assert (=> bs!620 m!10009))

(assert (=> start!2260 d!2467))

(declare-fun d!2471 () Bool)

(declare-fun size!507 (List!447) Int)

(assert (=> d!2471 (= (length!4 (getKeysList!3 (toList!220 thiss!177))) (size!507 (getKeysList!3 (toList!220 thiss!177))))))

(declare-fun bs!622 () Bool)

(assert (= bs!622 d!2471))

(assert (=> bs!622 m!9997))

(declare-fun m!10013 () Bool)

(assert (=> bs!622 m!10013))

(assert (=> b!15022 d!2471))

(declare-fun d!2475 () Bool)

(declare-fun e!9093 () Bool)

(assert (=> d!2475 e!9093))

(declare-fun res!11485 () Bool)

(assert (=> d!2475 (=> (not res!11485) (not e!9093))))

(declare-fun lt!3663 () List!447)

(declare-fun isStrictlySortedLong!0 (List!447) Bool)

(assert (=> d!2475 (= res!11485 (isStrictlySortedLong!0 lt!3663))))

(declare-fun e!9092 () List!447)

(assert (=> d!2475 (= lt!3663 e!9092)))

(declare-fun c!1436 () Bool)

(assert (=> d!2475 (= c!1436 (is-Cons!442 (toList!220 thiss!177)))))

(assert (=> d!2475 (isStrictlySorted!131 (toList!220 thiss!177))))

(assert (=> d!2475 (= (getKeysList!3 (toList!220 thiss!177)) lt!3663)))

(declare-fun b!15074 () Bool)

(assert (=> b!15074 (= e!9092 (Cons!443 (_1!289 (h!1008 (toList!220 thiss!177))) (getKeysList!3 (t!2848 (toList!220 thiss!177)))))))

(declare-fun b!15075 () Bool)

(assert (=> b!15075 (= e!9092 Nil!444)))

(declare-fun b!15076 () Bool)

(declare-fun length!7 (List!446) Int)

(assert (=> b!15076 (= e!9093 (= (length!4 lt!3663) (length!7 (toList!220 thiss!177))))))

(assert (= (and d!2475 c!1436) b!15074))

(assert (= (and d!2475 (not c!1436)) b!15075))

(assert (= (and d!2475 res!11485) b!15076))

(declare-fun m!10035 () Bool)

(assert (=> d!2475 m!10035))

(assert (=> d!2475 m!10009))

(declare-fun m!10037 () Bool)

(assert (=> b!15074 m!10037))

(declare-fun m!10039 () Bool)

(assert (=> b!15076 m!10039))

(declare-fun m!10041 () Bool)

(assert (=> b!15076 m!10041))

(assert (=> b!15022 d!2475))

(declare-fun b!15083 () Bool)

(declare-fun e!9098 () Bool)

(declare-fun tp_is_empty!761 () Bool)

(declare-fun tp!2441 () Bool)

(assert (=> b!15083 (= e!9098 (and tp_is_empty!761 tp!2441))))

(assert (=> b!15023 (= tp!2432 e!9098)))

(assert (= (and b!15023 (is-Cons!442 (toList!220 thiss!177))) b!15083))

(push 1)

(assert (not d!2475))

(assert tp_is_empty!761)

(assert (not b!15074))

(assert (not b!15035))

(assert (not b!15076))

(assert (not b!15083))

(assert (not d!2467))

(assert (not d!2471))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!2509 () Bool)

(declare-fun lt!3674 () Int)

(assert (=> d!2509 (>= lt!3674 0)))

(declare-fun e!9136 () Int)

(assert (=> d!2509 (= lt!3674 e!9136)))

(declare-fun c!1447 () Bool)

