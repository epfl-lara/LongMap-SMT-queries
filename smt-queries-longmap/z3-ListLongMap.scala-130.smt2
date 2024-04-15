; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2256 () Bool)

(assert start!2256)

(declare-fun res!11470 () Bool)

(declare-fun e!9049 () Bool)

(assert (=> start!2256 (=> (not res!11470) (not e!9049))))

(declare-datatypes ((B!578 0))(
  ( (B!579 (val!387 Int)) )
))
(declare-datatypes ((tuple2!570 0))(
  ( (tuple2!571 (_1!285 (_ BitVec 64)) (_2!285 B!578)) )
))
(declare-datatypes ((List!438 0))(
  ( (Nil!435) (Cons!434 (h!1000 tuple2!570) (t!2840 List!438)) )
))
(declare-datatypes ((ListLongMap!401 0))(
  ( (ListLongMap!402 (toList!216 List!438)) )
))
(declare-fun thiss!177 () ListLongMap!401)

(declare-fun size!493 (List!438) Int)

(assert (=> start!2256 (= res!11470 (< (size!493 (toList!216 thiss!177)) 2147483647))))

(assert (=> start!2256 e!9049))

(declare-fun e!9050 () Bool)

(declare-fun inv!744 (ListLongMap!401) Bool)

(assert (=> start!2256 (and (inv!744 thiss!177) e!9050)))

(declare-fun b!15010 () Bool)

(declare-datatypes ((List!439 0))(
  ( (Nil!436) (Cons!435 (h!1001 (_ BitVec 64)) (t!2841 List!439)) )
))
(declare-fun length!2 (List!439) Int)

(declare-fun getKeysList!1 (List!438) List!439)

(assert (=> b!15010 (= e!9049 (>= (length!2 (getKeysList!1 (toList!216 thiss!177))) 2147483647))))

(declare-fun b!15011 () Bool)

(declare-fun tp!2426 () Bool)

(assert (=> b!15011 (= e!9050 tp!2426)))

(assert (= (and start!2256 res!11470) b!15010))

(assert (= start!2256 b!15011))

(declare-fun m!9969 () Bool)

(assert (=> start!2256 m!9969))

(declare-fun m!9971 () Bool)

(assert (=> start!2256 m!9971))

(declare-fun m!9973 () Bool)

(assert (=> b!15010 m!9973))

(assert (=> b!15010 m!9973))

(declare-fun m!9975 () Bool)

(assert (=> b!15010 m!9975))

(check-sat (not start!2256) (not b!15010) (not b!15011))
(check-sat)
(get-model)

(declare-fun d!2457 () Bool)

(declare-fun lt!3650 () Int)

(assert (=> d!2457 (>= lt!3650 0)))

(declare-fun e!9067 () Int)

(assert (=> d!2457 (= lt!3650 e!9067)))

(declare-fun c!1423 () Bool)

(get-info :version)

(assert (=> d!2457 (= c!1423 ((_ is Nil!435) (toList!216 thiss!177)))))

(assert (=> d!2457 (= (size!493 (toList!216 thiss!177)) lt!3650)))

(declare-fun b!15032 () Bool)

(assert (=> b!15032 (= e!9067 0)))

(declare-fun b!15033 () Bool)

(assert (=> b!15033 (= e!9067 (+ 1 (size!493 (t!2840 (toList!216 thiss!177)))))))

(assert (= (and d!2457 c!1423) b!15032))

(assert (= (and d!2457 (not c!1423)) b!15033))

(declare-fun m!9995 () Bool)

(assert (=> b!15033 m!9995))

(assert (=> start!2256 d!2457))

(declare-fun d!2465 () Bool)

(declare-fun isStrictlySorted!126 (List!438) Bool)

(assert (=> d!2465 (= (inv!744 thiss!177) (isStrictlySorted!126 (toList!216 thiss!177)))))

(declare-fun bs!619 () Bool)

(assert (= bs!619 d!2465))

(declare-fun m!9999 () Bool)

(assert (=> bs!619 m!9999))

(assert (=> start!2256 d!2465))

(declare-fun d!2469 () Bool)

(declare-fun size!497 (List!439) Int)

(assert (=> d!2469 (= (length!2 (getKeysList!1 (toList!216 thiss!177))) (size!497 (getKeysList!1 (toList!216 thiss!177))))))

(declare-fun bs!621 () Bool)

(assert (= bs!621 d!2469))

(assert (=> bs!621 m!9973))

(declare-fun m!10003 () Bool)

(assert (=> bs!621 m!10003))

(assert (=> b!15010 d!2469))

(declare-fun d!2473 () Bool)

(declare-fun e!9086 () Bool)

(assert (=> d!2473 e!9086))

(declare-fun res!11484 () Bool)

(assert (=> d!2473 (=> (not res!11484) (not e!9086))))

(declare-fun lt!3661 () List!439)

(declare-fun isStrictlySortedLong!0 (List!439) Bool)

(assert (=> d!2473 (= res!11484 (isStrictlySortedLong!0 lt!3661))))

(declare-fun e!9085 () List!439)

(assert (=> d!2473 (= lt!3661 e!9085)))

(declare-fun c!1434 () Bool)

(assert (=> d!2473 (= c!1434 ((_ is Cons!434) (toList!216 thiss!177)))))

(assert (=> d!2473 (isStrictlySorted!126 (toList!216 thiss!177))))

(assert (=> d!2473 (= (getKeysList!1 (toList!216 thiss!177)) lt!3661)))

(declare-fun b!15061 () Bool)

(assert (=> b!15061 (= e!9085 (Cons!435 (_1!285 (h!1000 (toList!216 thiss!177))) (getKeysList!1 (t!2840 (toList!216 thiss!177)))))))

(declare-fun b!15062 () Bool)

(assert (=> b!15062 (= e!9085 Nil!436)))

(declare-fun b!15063 () Bool)

(declare-fun length!5 (List!438) Int)

(assert (=> b!15063 (= e!9086 (= (length!2 lt!3661) (length!5 (toList!216 thiss!177))))))

(assert (= (and d!2473 c!1434) b!15061))

(assert (= (and d!2473 (not c!1434)) b!15062))

(assert (= (and d!2473 res!11484) b!15063))

(declare-fun m!10017 () Bool)

(assert (=> d!2473 m!10017))

(assert (=> d!2473 m!9999))

(declare-fun m!10019 () Bool)

(assert (=> b!15061 m!10019))

(declare-fun m!10021 () Bool)

(assert (=> b!15063 m!10021))

(declare-fun m!10023 () Bool)

(assert (=> b!15063 m!10023))

(assert (=> b!15010 d!2473))

(declare-fun b!15077 () Bool)

(declare-fun e!9094 () Bool)

(declare-fun tp_is_empty!757 () Bool)

(declare-fun tp!2435 () Bool)

(assert (=> b!15077 (= e!9094 (and tp_is_empty!757 tp!2435))))

(assert (=> b!15011 (= tp!2426 e!9094)))

(assert (= (and b!15011 ((_ is Cons!434) (toList!216 thiss!177))) b!15077))

(check-sat (not b!15063) (not d!2473) (not d!2469) (not d!2465) (not b!15033) tp_is_empty!757 (not b!15077) (not b!15061))
(check-sat)
(get-model)

(declare-fun d!2481 () Bool)

(declare-fun res!11490 () Bool)

(declare-fun e!9103 () Bool)

(assert (=> d!2481 (=> res!11490 e!9103)))

(assert (=> d!2481 (= res!11490 (or ((_ is Nil!435) (toList!216 thiss!177)) ((_ is Nil!435) (t!2840 (toList!216 thiss!177)))))))

(assert (=> d!2481 (= (isStrictlySorted!126 (toList!216 thiss!177)) e!9103)))

(declare-fun b!15088 () Bool)

(declare-fun e!9104 () Bool)

(assert (=> b!15088 (= e!9103 e!9104)))

(declare-fun res!11491 () Bool)

(assert (=> b!15088 (=> (not res!11491) (not e!9104))))

(assert (=> b!15088 (= res!11491 (bvslt (_1!285 (h!1000 (toList!216 thiss!177))) (_1!285 (h!1000 (t!2840 (toList!216 thiss!177))))))))

(declare-fun b!15089 () Bool)

(assert (=> b!15089 (= e!9104 (isStrictlySorted!126 (t!2840 (toList!216 thiss!177))))))

(assert (= (and d!2481 (not res!11490)) b!15088))

(assert (= (and b!15088 res!11491) b!15089))

(declare-fun m!10035 () Bool)

(assert (=> b!15089 m!10035))

(assert (=> d!2465 d!2481))

(declare-fun d!2483 () Bool)

(assert (=> d!2483 (= (length!2 lt!3661) (size!497 lt!3661))))

(declare-fun bs!624 () Bool)

(assert (= bs!624 d!2483))

(declare-fun m!10037 () Bool)

(assert (=> bs!624 m!10037))

(assert (=> b!15063 d!2483))

(declare-fun d!2485 () Bool)

(assert (=> d!2485 (= (length!5 (toList!216 thiss!177)) (size!493 (toList!216 thiss!177)))))

(declare-fun bs!625 () Bool)

(assert (= bs!625 d!2485))

(assert (=> bs!625 m!9969))

(assert (=> b!15063 d!2485))

(declare-fun d!2487 () Bool)

(declare-fun res!11496 () Bool)

(declare-fun e!9109 () Bool)

(assert (=> d!2487 (=> res!11496 e!9109)))

(assert (=> d!2487 (= res!11496 (or ((_ is Nil!436) lt!3661) ((_ is Nil!436) (t!2841 lt!3661))))))

(assert (=> d!2487 (= (isStrictlySortedLong!0 lt!3661) e!9109)))

(declare-fun b!15094 () Bool)

(declare-fun e!9110 () Bool)

(assert (=> b!15094 (= e!9109 e!9110)))

(declare-fun res!11497 () Bool)

(assert (=> b!15094 (=> (not res!11497) (not e!9110))))

(assert (=> b!15094 (= res!11497 (bvslt (h!1001 lt!3661) (h!1001 (t!2841 lt!3661))))))

(declare-fun b!15095 () Bool)

(assert (=> b!15095 (= e!9110 (isStrictlySortedLong!0 (t!2841 lt!3661)))))

(assert (= (and d!2487 (not res!11496)) b!15094))

(assert (= (and b!15094 res!11497) b!15095))

(declare-fun m!10039 () Bool)

(assert (=> b!15095 m!10039))

(assert (=> d!2473 d!2487))

(assert (=> d!2473 d!2481))

(declare-fun d!2489 () Bool)

(declare-fun lt!3669 () Int)

(assert (=> d!2489 (>= lt!3669 0)))

(declare-fun e!9118 () Int)

(assert (=> d!2489 (= lt!3669 e!9118)))

(declare-fun c!1442 () Bool)

(assert (=> d!2489 (= c!1442 ((_ is Nil!436) (getKeysList!1 (toList!216 thiss!177))))))

(assert (=> d!2489 (= (size!497 (getKeysList!1 (toList!216 thiss!177))) lt!3669)))

(declare-fun b!15108 () Bool)

(assert (=> b!15108 (= e!9118 0)))

(declare-fun b!15109 () Bool)

(assert (=> b!15109 (= e!9118 (+ 1 (size!497 (t!2841 (getKeysList!1 (toList!216 thiss!177))))))))

(assert (= (and d!2489 c!1442) b!15108))

(assert (= (and d!2489 (not c!1442)) b!15109))

(declare-fun m!10065 () Bool)

(assert (=> b!15109 m!10065))

(assert (=> d!2469 d!2489))

(declare-fun d!2505 () Bool)

(declare-fun lt!3672 () Int)

(assert (=> d!2505 (>= lt!3672 0)))

(declare-fun e!9121 () Int)

(assert (=> d!2505 (= lt!3672 e!9121)))

(declare-fun c!1445 () Bool)

(assert (=> d!2505 (= c!1445 ((_ is Nil!435) (t!2840 (toList!216 thiss!177))))))

(assert (=> d!2505 (= (size!493 (t!2840 (toList!216 thiss!177))) lt!3672)))

(declare-fun b!15114 () Bool)

(assert (=> b!15114 (= e!9121 0)))

(declare-fun b!15115 () Bool)

(assert (=> b!15115 (= e!9121 (+ 1 (size!493 (t!2840 (t!2840 (toList!216 thiss!177))))))))

(assert (= (and d!2505 c!1445) b!15114))

(assert (= (and d!2505 (not c!1445)) b!15115))

(declare-fun m!10067 () Bool)

(assert (=> b!15115 m!10067))

(assert (=> b!15033 d!2505))

(declare-fun d!2507 () Bool)

(declare-fun e!9123 () Bool)

(assert (=> d!2507 e!9123))

(declare-fun res!11500 () Bool)

(assert (=> d!2507 (=> (not res!11500) (not e!9123))))

(declare-fun lt!3673 () List!439)

(assert (=> d!2507 (= res!11500 (isStrictlySortedLong!0 lt!3673))))

(declare-fun e!9122 () List!439)

(assert (=> d!2507 (= lt!3673 e!9122)))

(declare-fun c!1446 () Bool)

(assert (=> d!2507 (= c!1446 ((_ is Cons!434) (t!2840 (toList!216 thiss!177))))))

(assert (=> d!2507 (isStrictlySorted!126 (t!2840 (toList!216 thiss!177)))))

(assert (=> d!2507 (= (getKeysList!1 (t!2840 (toList!216 thiss!177))) lt!3673)))

(declare-fun b!15116 () Bool)

(assert (=> b!15116 (= e!9122 (Cons!435 (_1!285 (h!1000 (t!2840 (toList!216 thiss!177)))) (getKeysList!1 (t!2840 (t!2840 (toList!216 thiss!177))))))))

(declare-fun b!15117 () Bool)

(assert (=> b!15117 (= e!9122 Nil!436)))

(declare-fun b!15118 () Bool)

(assert (=> b!15118 (= e!9123 (= (length!2 lt!3673) (length!5 (t!2840 (toList!216 thiss!177)))))))

(assert (= (and d!2507 c!1446) b!15116))

(assert (= (and d!2507 (not c!1446)) b!15117))

(assert (= (and d!2507 res!11500) b!15118))

(declare-fun m!10069 () Bool)

(assert (=> d!2507 m!10069))

(assert (=> d!2507 m!10035))

(declare-fun m!10071 () Bool)

(assert (=> b!15116 m!10071))

(declare-fun m!10073 () Bool)

(assert (=> b!15118 m!10073))

(declare-fun m!10075 () Bool)

(assert (=> b!15118 m!10075))

(assert (=> b!15061 d!2507))

(declare-fun b!15121 () Bool)

(declare-fun e!9125 () Bool)

(declare-fun tp!2442 () Bool)

(assert (=> b!15121 (= e!9125 (and tp_is_empty!757 tp!2442))))

(assert (=> b!15077 (= tp!2435 e!9125)))

(assert (= (and b!15077 ((_ is Cons!434) (t!2840 (toList!216 thiss!177)))) b!15121))

(check-sat (not d!2485) (not d!2507) (not d!2483) (not b!15121) (not b!15118) (not b!15116) (not b!15089) tp_is_empty!757 (not b!15115) (not b!15109) (not b!15095))
(check-sat)
