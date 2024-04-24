; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2260 () Bool)

(assert start!2260)

(declare-fun res!11474 () Bool)

(declare-fun e!9057 () Bool)

(assert (=> start!2260 (=> (not res!11474) (not e!9057))))

(declare-datatypes ((B!582 0))(
  ( (B!583 (val!389 Int)) )
))
(declare-datatypes ((tuple2!574 0))(
  ( (tuple2!575 (_1!287 (_ BitVec 64)) (_2!287 B!582)) )
))
(declare-datatypes ((List!442 0))(
  ( (Nil!439) (Cons!438 (h!1004 tuple2!574) (t!2844 List!442)) )
))
(declare-datatypes ((ListLongMap!405 0))(
  ( (ListLongMap!406 (toList!218 List!442)) )
))
(declare-fun thiss!177 () ListLongMap!405)

(declare-fun size!495 (List!442) Int)

(assert (=> start!2260 (= res!11474 (< (size!495 (toList!218 thiss!177)) 2147483647))))

(assert (=> start!2260 e!9057))

(declare-fun e!9058 () Bool)

(declare-fun inv!746 (ListLongMap!405) Bool)

(assert (=> start!2260 (and (inv!746 thiss!177) e!9058)))

(declare-fun b!15016 () Bool)

(declare-datatypes ((List!443 0))(
  ( (Nil!440) (Cons!439 (h!1005 (_ BitVec 64)) (t!2845 List!443)) )
))
(declare-fun length!4 (List!443) Int)

(declare-fun getKeysList!3 (List!442) List!443)

(assert (=> b!15016 (= e!9057 (>= (length!4 (getKeysList!3 (toList!218 thiss!177))) 2147483647))))

(declare-fun b!15017 () Bool)

(declare-fun tp!2432 () Bool)

(assert (=> b!15017 (= e!9058 tp!2432)))

(assert (= (and start!2260 res!11474) b!15016))

(assert (= start!2260 b!15017))

(declare-fun m!9985 () Bool)

(assert (=> start!2260 m!9985))

(declare-fun m!9987 () Bool)

(assert (=> start!2260 m!9987))

(declare-fun m!9989 () Bool)

(assert (=> b!15016 m!9989))

(assert (=> b!15016 m!9989))

(declare-fun m!9991 () Bool)

(assert (=> b!15016 m!9991))

(push 1)

(assert (not start!2260))

(assert (not b!15016))

(assert (not b!15017))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!2453 () Bool)

(declare-fun lt!3648 () Int)

(assert (=> d!2453 (>= lt!3648 0)))

(declare-fun e!9061 () Int)

(assert (=> d!2453 (= lt!3648 e!9061)))

(declare-fun c!1419 () Bool)

(assert (=> d!2453 (= c!1419 (is-Nil!439 (toList!218 thiss!177)))))

(assert (=> d!2453 (= (size!495 (toList!218 thiss!177)) lt!3648)))

(declare-fun b!15022 () Bool)

(assert (=> b!15022 (= e!9061 0)))

(declare-fun b!15023 () Bool)

(assert (=> b!15023 (= e!9061 (+ 1 (size!495 (t!2844 (toList!218 thiss!177)))))))

(assert (= (and d!2453 c!1419) b!15022))

(assert (= (and d!2453 (not c!1419)) b!15023))

(declare-fun m!9995 () Bool)

(assert (=> b!15023 m!9995))

(assert (=> start!2260 d!2453))

(declare-fun d!2461 () Bool)

(declare-fun isStrictlySorted!123 (List!442) Bool)

(assert (=> d!2461 (= (inv!746 thiss!177) (isStrictlySorted!123 (toList!218 thiss!177)))))

(declare-fun bs!619 () Bool)

(assert (= bs!619 d!2461))

(declare-fun m!9997 () Bool)

(assert (=> bs!619 m!9997))

(assert (=> start!2260 d!2461))

(declare-fun d!2463 () Bool)

(declare-fun size!496 (List!443) Int)

(assert (=> d!2463 (= (length!4 (getKeysList!3 (toList!218 thiss!177))) (size!496 (getKeysList!3 (toList!218 thiss!177))))))

(declare-fun bs!620 () Bool)

(assert (= bs!620 d!2463))

(assert (=> bs!620 m!9989))

(declare-fun m!9999 () Bool)

(assert (=> bs!620 m!9999))

(assert (=> b!15016 d!2463))

(declare-fun d!2465 () Bool)

(declare-fun e!9074 () Bool)

(assert (=> d!2465 e!9074))

(declare-fun res!11479 () Bool)

(assert (=> d!2465 (=> (not res!11479) (not e!9074))))

(declare-fun lt!3656 () List!443)

(declare-fun isStrictlySortedLong!0 (List!443) Bool)

(assert (=> d!2465 (= res!11479 (isStrictlySortedLong!0 lt!3656))))

(declare-fun e!9073 () List!443)

(assert (=> d!2465 (= lt!3656 e!9073)))

(declare-fun c!1427 () Bool)

(assert (=> d!2465 (= c!1427 (is-Cons!438 (toList!218 thiss!177)))))

(assert (=> d!2465 (isStrictlySorted!123 (toList!218 thiss!177))))

(assert (=> d!2465 (= (getKeysList!3 (toList!218 thiss!177)) lt!3656)))

(declare-fun b!15042 () Bool)

(assert (=> b!15042 (= e!9073 (Cons!439 (_1!287 (h!1004 (toList!218 thiss!177))) (getKeysList!3 (t!2844 (toList!218 thiss!177)))))))

(declare-fun b!15043 () Bool)

(assert (=> b!15043 (= e!9073 Nil!440)))

(declare-fun b!15044 () Bool)

(declare-fun length!5 (List!442) Int)

(assert (=> b!15044 (= e!9074 (= (length!4 lt!3656) (length!5 (toList!218 thiss!177))))))

(assert (= (and d!2465 c!1427) b!15042))

(assert (= (and d!2465 (not c!1427)) b!15043))

(assert (= (and d!2465 res!11479) b!15044))

(declare-fun m!10007 () Bool)

(assert (=> d!2465 m!10007))

(assert (=> d!2465 m!9997))

(declare-fun m!10009 () Bool)

(assert (=> b!15042 m!10009))

(declare-fun m!10011 () Bool)

(assert (=> b!15044 m!10011))

(declare-fun m!10013 () Bool)

(assert (=> b!15044 m!10013))

(assert (=> b!15016 d!2465))

(declare-fun b!15049 () Bool)

(declare-fun e!9077 () Bool)

(declare-fun tp_is_empty!757 () Bool)

(declare-fun tp!2435 () Bool)

(assert (=> b!15049 (= e!9077 (and tp_is_empty!757 tp!2435))))

(assert (=> b!15017 (= tp!2432 e!9077)))

(assert (= (and b!15017 (is-Cons!438 (toList!218 thiss!177))) b!15049))

(push 1)

(assert tp_is_empty!757)

(assert (not d!2463))

(assert (not b!15044))

(assert (not d!2465))

(assert (not b!15023))

(assert (not d!2461))

(assert (not b!15049))

(assert (not b!15042))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!2477 () Bool)

(assert (=> d!2477 (= (length!4 lt!3656) (size!496 lt!3656))))

(declare-fun bs!624 () Bool)

(assert (= bs!624 d!2477))

(declare-fun m!10035 () Bool)

(assert (=> bs!624 m!10035))

(assert (=> b!15044 d!2477))

(declare-fun d!2479 () Bool)

(assert (=> d!2479 (= (length!5 (toList!218 thiss!177)) (size!495 (toList!218 thiss!177)))))

(declare-fun bs!625 () Bool)

(assert (= bs!625 d!2479))

(assert (=> bs!625 m!9985))

(assert (=> b!15044 d!2479))

(declare-fun d!2481 () Bool)

(declare-fun lt!3666 () Int)

(assert (=> d!2481 (>= lt!3666 0)))

(declare-fun e!9097 () Int)

(assert (=> d!2481 (= lt!3666 e!9097)))

(declare-fun c!1437 () Bool)

(assert (=> d!2481 (= c!1437 (is-Nil!440 (getKeysList!3 (toList!218 thiss!177))))))

(assert (=> d!2481 (= (size!496 (getKeysList!3 (toList!218 thiss!177))) lt!3666)))

(declare-fun b!15082 () Bool)

(assert (=> b!15082 (= e!9097 0)))

(declare-fun b!15083 () Bool)

(assert (=> b!15083 (= e!9097 (+ 1 (size!496 (t!2845 (getKeysList!3 (toList!218 thiss!177))))))))

(assert (= (and d!2481 c!1437) b!15082))

(assert (= (and d!2481 (not c!1437)) b!15083))

(declare-fun m!10037 () Bool)

(assert (=> b!15083 m!10037))

(assert (=> d!2463 d!2481))

(declare-fun d!2483 () Bool)

(declare-fun lt!3667 () Int)

(assert (=> d!2483 (>= lt!3667 0)))

(declare-fun e!9098 () Int)

(assert (=> d!2483 (= lt!3667 e!9098)))

(declare-fun c!1438 () Bool)

(assert (=> d!2483 (= c!1438 (is-Nil!439 (t!2844 (toList!218 thiss!177))))))

(assert (=> d!2483 (= (size!495 (t!2844 (toList!218 thiss!177))) lt!3667)))

(declare-fun b!15084 () Bool)

(assert (=> b!15084 (= e!9098 0)))

(declare-fun b!15085 () Bool)

(assert (=> b!15085 (= e!9098 (+ 1 (size!495 (t!2844 (t!2844 (toList!218 thiss!177))))))))

(assert (= (and d!2483 c!1438) b!15084))

(assert (= (and d!2483 (not c!1438)) b!15085))

(declare-fun m!10039 () Bool)

(assert (=> b!15085 m!10039))

(assert (=> b!15023 d!2483))

(declare-fun d!2485 () Bool)

(declare-fun res!11489 () Bool)

(declare-fun e!9105 () Bool)

(assert (=> d!2485 (=> res!11489 e!9105)))

(assert (=> d!2485 (= res!11489 (or (is-Nil!439 (toList!218 thiss!177)) (is-Nil!439 (t!2844 (toList!218 thiss!177)))))))

(assert (=> d!2485 (= (isStrictlySorted!123 (toList!218 thiss!177)) e!9105)))

(declare-fun b!15093 () Bool)

(declare-fun e!9106 () Bool)

(assert (=> b!15093 (= e!9105 e!9106)))

(declare-fun res!11490 () Bool)

(assert (=> b!15093 (=> (not res!11490) (not e!9106))))

(assert (=> b!15093 (= res!11490 (bvslt (_1!287 (h!1004 (toList!218 thiss!177))) (_1!287 (h!1004 (t!2844 (toList!218 thiss!177))))))))

(declare-fun b!15094 () Bool)

(assert (=> b!15094 (= e!9106 (isStrictlySorted!123 (t!2844 (toList!218 thiss!177))))))

(assert (= (and d!2485 (not res!11489)) b!15093))

(assert (= (and b!15093 res!11490) b!15094))

(declare-fun m!10053 () Bool)

(assert (=> b!15094 m!10053))

(assert (=> d!2461 d!2485))

(declare-fun d!2495 () Bool)

(declare-fun e!9108 () Bool)

(assert (=> d!2495 e!9108))

(declare-fun res!11491 () Bool)

(assert (=> d!2495 (=> (not res!11491) (not e!9108))))

(declare-fun lt!3669 () List!443)

(assert (=> d!2495 (= res!11491 (isStrictlySortedLong!0 lt!3669))))

(declare-fun e!9107 () List!443)

(assert (=> d!2495 (= lt!3669 e!9107)))

(declare-fun c!1440 () Bool)

(assert (=> d!2495 (= c!1440 (is-Cons!438 (t!2844 (toList!218 thiss!177))))))

(assert (=> d!2495 (isStrictlySorted!123 (t!2844 (toList!218 thiss!177)))))

(assert (=> d!2495 (= (getKeysList!3 (t!2844 (toList!218 thiss!177))) lt!3669)))

(declare-fun b!15095 () Bool)

(assert (=> b!15095 (= e!9107 (Cons!439 (_1!287 (h!1004 (t!2844 (toList!218 thiss!177)))) (getKeysList!3 (t!2844 (t!2844 (toList!218 thiss!177))))))))

(declare-fun b!15096 () Bool)

(assert (=> b!15096 (= e!9107 Nil!440)))

(declare-fun b!15097 () Bool)

(assert (=> b!15097 (= e!9108 (= (length!4 lt!3669) (length!5 (t!2844 (toList!218 thiss!177)))))))

(assert (= (and d!2495 c!1440) b!15095))

(assert (= (and d!2495 (not c!1440)) b!15096))

(assert (= (and d!2495 res!11491) b!15097))

(declare-fun m!10055 () Bool)

(assert (=> d!2495 m!10055))

(assert (=> d!2495 m!10053))

(declare-fun m!10057 () Bool)

(assert (=> b!15095 m!10057))

(declare-fun m!10059 () Bool)

(assert (=> b!15097 m!10059))

(declare-fun m!10061 () Bool)

(assert (=> b!15097 m!10061))

(assert (=> b!15042 d!2495))

(declare-fun d!2497 () Bool)

(declare-fun res!11496 () Bool)

(declare-fun e!9116 () Bool)

(assert (=> d!2497 (=> res!11496 e!9116)))

(assert (=> d!2497 (= res!11496 (or (is-Nil!440 lt!3656) (is-Nil!440 (t!2845 lt!3656))))))

(assert (=> d!2497 (= (isStrictlySortedLong!0 lt!3656) e!9116)))

(declare-fun b!15108 () Bool)

(declare-fun e!9117 () Bool)

(assert (=> b!15108 (= e!9116 e!9117)))

(declare-fun res!11497 () Bool)

(assert (=> b!15108 (=> (not res!11497) (not e!9117))))

(assert (=> b!15108 (= res!11497 (bvslt (h!1005 lt!3656) (h!1005 (t!2845 lt!3656))))))

(declare-fun b!15109 () Bool)

(assert (=> b!15109 (= e!9117 (isStrictlySortedLong!0 (t!2845 lt!3656)))))

(assert (= (and d!2497 (not res!11496)) b!15108))

(assert (= (and b!15108 res!11497) b!15109))

(declare-fun m!10065 () Bool)

(assert (=> b!15109 m!10065))

(assert (=> d!2465 d!2497))

(assert (=> d!2465 d!2485))

(declare-fun b!15110 () Bool)

(declare-fun e!9118 () Bool)

(declare-fun tp!2442 () Bool)

(assert (=> b!15110 (= e!9118 (and tp_is_empty!757 tp!2442))))

(assert (=> b!15049 (= tp!2435 e!9118)))

(assert (= (and b!15049 (is-Cons!438 (t!2844 (toList!218 thiss!177)))) b!15110))

(push 1)

(assert (not b!15110))

(assert tp_is_empty!757)

(assert (not d!2479))

(assert (not b!15109))

(assert (not d!2495))

(assert (not b!15083))

(assert (not b!15094))

(assert (not b!15085))

(assert (not b!15097))

(assert (not b!15095))

(assert (not d!2477))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

