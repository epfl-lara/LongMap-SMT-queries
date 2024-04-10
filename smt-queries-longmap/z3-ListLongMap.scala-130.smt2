; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2258 () Bool)

(assert start!2258)

(declare-fun res!11473 () Bool)

(declare-fun e!9055 () Bool)

(assert (=> start!2258 (=> (not res!11473) (not e!9055))))

(declare-datatypes ((B!580 0))(
  ( (B!581 (val!388 Int)) )
))
(declare-datatypes ((tuple2!576 0))(
  ( (tuple2!577 (_1!288 (_ BitVec 64)) (_2!288 B!580)) )
))
(declare-datatypes ((List!444 0))(
  ( (Nil!441) (Cons!440 (h!1006 tuple2!576) (t!2846 List!444)) )
))
(declare-datatypes ((ListLongMap!407 0))(
  ( (ListLongMap!408 (toList!219 List!444)) )
))
(declare-fun thiss!177 () ListLongMap!407)

(declare-fun size!503 (List!444) Int)

(assert (=> start!2258 (= res!11473 (< (size!503 (toList!219 thiss!177)) 2147483647))))

(assert (=> start!2258 e!9055))

(declare-fun e!9056 () Bool)

(declare-fun inv!745 (ListLongMap!407) Bool)

(assert (=> start!2258 (and (inv!745 thiss!177) e!9056)))

(declare-fun b!15016 () Bool)

(declare-datatypes ((List!445 0))(
  ( (Nil!442) (Cons!441 (h!1007 (_ BitVec 64)) (t!2847 List!445)) )
))
(declare-fun length!3 (List!445) Int)

(declare-fun getKeysList!2 (List!444) List!445)

(assert (=> b!15016 (= e!9055 (>= (length!3 (getKeysList!2 (toList!219 thiss!177))) 2147483647))))

(declare-fun b!15017 () Bool)

(declare-fun tp!2429 () Bool)

(assert (=> b!15017 (= e!9056 tp!2429)))

(assert (= (and start!2258 res!11473) b!15016))

(assert (= start!2258 b!15017))

(declare-fun m!9985 () Bool)

(assert (=> start!2258 m!9985))

(declare-fun m!9987 () Bool)

(assert (=> start!2258 m!9987))

(declare-fun m!9989 () Bool)

(assert (=> b!15016 m!9989))

(assert (=> b!15016 m!9989))

(declare-fun m!9991 () Bool)

(assert (=> b!15016 m!9991))

(check-sat (not b!15016) (not start!2258) (not b!15017))
(check-sat)
(get-model)

(declare-fun d!2457 () Bool)

(declare-fun size!505 (List!445) Int)

(assert (=> d!2457 (= (length!3 (getKeysList!2 (toList!219 thiss!177))) (size!505 (getKeysList!2 (toList!219 thiss!177))))))

(declare-fun bs!618 () Bool)

(assert (= bs!618 d!2457))

(assert (=> bs!618 m!9989))

(declare-fun m!10001 () Bool)

(assert (=> bs!618 m!10001))

(assert (=> b!15016 d!2457))

(declare-fun d!2463 () Bool)

(declare-fun e!9074 () Bool)

(assert (=> d!2463 e!9074))

(declare-fun res!11479 () Bool)

(assert (=> d!2463 (=> (not res!11479) (not e!9074))))

(declare-fun lt!3654 () List!445)

(declare-fun isStrictlySortedLong!0 (List!445) Bool)

(assert (=> d!2463 (= res!11479 (isStrictlySortedLong!0 lt!3654))))

(declare-fun e!9073 () List!445)

(assert (=> d!2463 (= lt!3654 e!9073)))

(declare-fun c!1427 () Bool)

(get-info :version)

(assert (=> d!2463 (= c!1427 ((_ is Cons!440) (toList!219 thiss!177)))))

(declare-fun isStrictlySorted!130 (List!444) Bool)

(assert (=> d!2463 (isStrictlySorted!130 (toList!219 thiss!177))))

(assert (=> d!2463 (= (getKeysList!2 (toList!219 thiss!177)) lt!3654)))

(declare-fun b!15042 () Bool)

(assert (=> b!15042 (= e!9073 (Cons!441 (_1!288 (h!1006 (toList!219 thiss!177))) (getKeysList!2 (t!2846 (toList!219 thiss!177)))))))

(declare-fun b!15043 () Bool)

(assert (=> b!15043 (= e!9073 Nil!442)))

(declare-fun b!15044 () Bool)

(declare-fun length!5 (List!444) Int)

(assert (=> b!15044 (= e!9074 (= (length!3 lt!3654) (length!5 (toList!219 thiss!177))))))

(assert (= (and d!2463 c!1427) b!15042))

(assert (= (and d!2463 (not c!1427)) b!15043))

(assert (= (and d!2463 res!11479) b!15044))

(declare-fun m!10015 () Bool)

(assert (=> d!2463 m!10015))

(declare-fun m!10017 () Bool)

(assert (=> d!2463 m!10017))

(declare-fun m!10019 () Bool)

(assert (=> b!15042 m!10019))

(declare-fun m!10021 () Bool)

(assert (=> b!15044 m!10021))

(declare-fun m!10023 () Bool)

(assert (=> b!15044 m!10023))

(assert (=> b!15016 d!2463))

(declare-fun d!2477 () Bool)

(declare-fun lt!3661 () Int)

(assert (=> d!2477 (>= lt!3661 0)))

(declare-fun e!9083 () Int)

(assert (=> d!2477 (= lt!3661 e!9083)))

(declare-fun c!1434 () Bool)

(assert (=> d!2477 (= c!1434 ((_ is Nil!441) (toList!219 thiss!177)))))

(assert (=> d!2477 (= (size!503 (toList!219 thiss!177)) lt!3661)))

(declare-fun b!15059 () Bool)

(assert (=> b!15059 (= e!9083 0)))

(declare-fun b!15060 () Bool)

(assert (=> b!15060 (= e!9083 (+ 1 (size!503 (t!2846 (toList!219 thiss!177)))))))

(assert (= (and d!2477 c!1434) b!15059))

(assert (= (and d!2477 (not c!1434)) b!15060))

(declare-fun m!10025 () Bool)

(assert (=> b!15060 m!10025))

(assert (=> start!2258 d!2477))

(declare-fun d!2479 () Bool)

(assert (=> d!2479 (= (inv!745 thiss!177) (isStrictlySorted!130 (toList!219 thiss!177)))))

(declare-fun bs!623 () Bool)

(assert (= bs!623 d!2479))

(assert (=> bs!623 m!10017))

(assert (=> start!2258 d!2479))

(declare-fun b!15077 () Bool)

(declare-fun e!9094 () Bool)

(declare-fun tp_is_empty!759 () Bool)

(declare-fun tp!2437 () Bool)

(assert (=> b!15077 (= e!9094 (and tp_is_empty!759 tp!2437))))

(assert (=> b!15017 (= tp!2429 e!9094)))

(assert (= (and b!15017 ((_ is Cons!440) (toList!219 thiss!177))) b!15077))

(check-sat (not d!2479) (not b!15042) (not d!2463) (not b!15060) tp_is_empty!759 (not d!2457) (not b!15077) (not b!15044))
(check-sat)
(get-model)

(declare-fun d!2481 () Bool)

(declare-fun lt!3666 () Int)

(assert (=> d!2481 (>= lt!3666 0)))

(declare-fun e!9101 () Int)

(assert (=> d!2481 (= lt!3666 e!9101)))

(declare-fun c!1439 () Bool)

(assert (=> d!2481 (= c!1439 ((_ is Nil!442) (getKeysList!2 (toList!219 thiss!177))))))

(assert (=> d!2481 (= (size!505 (getKeysList!2 (toList!219 thiss!177))) lt!3666)))

(declare-fun b!15088 () Bool)

(assert (=> b!15088 (= e!9101 0)))

(declare-fun b!15089 () Bool)

(assert (=> b!15089 (= e!9101 (+ 1 (size!505 (t!2847 (getKeysList!2 (toList!219 thiss!177))))))))

(assert (= (and d!2481 c!1439) b!15088))

(assert (= (and d!2481 (not c!1439)) b!15089))

(declare-fun m!10043 () Bool)

(assert (=> b!15089 m!10043))

(assert (=> d!2457 d!2481))

(declare-fun d!2483 () Bool)

(declare-fun res!11490 () Bool)

(declare-fun e!9106 () Bool)

(assert (=> d!2483 (=> res!11490 e!9106)))

(assert (=> d!2483 (= res!11490 (or ((_ is Nil!441) (toList!219 thiss!177)) ((_ is Nil!441) (t!2846 (toList!219 thiss!177)))))))

(assert (=> d!2483 (= (isStrictlySorted!130 (toList!219 thiss!177)) e!9106)))

(declare-fun b!15094 () Bool)

(declare-fun e!9107 () Bool)

(assert (=> b!15094 (= e!9106 e!9107)))

(declare-fun res!11491 () Bool)

(assert (=> b!15094 (=> (not res!11491) (not e!9107))))

(assert (=> b!15094 (= res!11491 (bvslt (_1!288 (h!1006 (toList!219 thiss!177))) (_1!288 (h!1006 (t!2846 (toList!219 thiss!177))))))))

(declare-fun b!15095 () Bool)

(assert (=> b!15095 (= e!9107 (isStrictlySorted!130 (t!2846 (toList!219 thiss!177))))))

(assert (= (and d!2483 (not res!11490)) b!15094))

(assert (= (and b!15094 res!11491) b!15095))

(declare-fun m!10045 () Bool)

(assert (=> b!15095 m!10045))

(assert (=> d!2479 d!2483))

(declare-fun d!2485 () Bool)

(declare-fun lt!3667 () Int)

(assert (=> d!2485 (>= lt!3667 0)))

(declare-fun e!9108 () Int)

(assert (=> d!2485 (= lt!3667 e!9108)))

(declare-fun c!1440 () Bool)

(assert (=> d!2485 (= c!1440 ((_ is Nil!441) (t!2846 (toList!219 thiss!177))))))

(assert (=> d!2485 (= (size!503 (t!2846 (toList!219 thiss!177))) lt!3667)))

(declare-fun b!15096 () Bool)

(assert (=> b!15096 (= e!9108 0)))

(declare-fun b!15097 () Bool)

(assert (=> b!15097 (= e!9108 (+ 1 (size!503 (t!2846 (t!2846 (toList!219 thiss!177))))))))

(assert (= (and d!2485 c!1440) b!15096))

(assert (= (and d!2485 (not c!1440)) b!15097))

(declare-fun m!10047 () Bool)

(assert (=> b!15097 m!10047))

(assert (=> b!15060 d!2485))

(declare-fun d!2487 () Bool)

(declare-fun e!9110 () Bool)

(assert (=> d!2487 e!9110))

(declare-fun res!11492 () Bool)

(assert (=> d!2487 (=> (not res!11492) (not e!9110))))

(declare-fun lt!3668 () List!445)

(assert (=> d!2487 (= res!11492 (isStrictlySortedLong!0 lt!3668))))

(declare-fun e!9109 () List!445)

(assert (=> d!2487 (= lt!3668 e!9109)))

(declare-fun c!1441 () Bool)

(assert (=> d!2487 (= c!1441 ((_ is Cons!440) (t!2846 (toList!219 thiss!177))))))

(assert (=> d!2487 (isStrictlySorted!130 (t!2846 (toList!219 thiss!177)))))

(assert (=> d!2487 (= (getKeysList!2 (t!2846 (toList!219 thiss!177))) lt!3668)))

(declare-fun b!15098 () Bool)

(assert (=> b!15098 (= e!9109 (Cons!441 (_1!288 (h!1006 (t!2846 (toList!219 thiss!177)))) (getKeysList!2 (t!2846 (t!2846 (toList!219 thiss!177))))))))

(declare-fun b!15099 () Bool)

(assert (=> b!15099 (= e!9109 Nil!442)))

(declare-fun b!15100 () Bool)

(assert (=> b!15100 (= e!9110 (= (length!3 lt!3668) (length!5 (t!2846 (toList!219 thiss!177)))))))

(assert (= (and d!2487 c!1441) b!15098))

(assert (= (and d!2487 (not c!1441)) b!15099))

(assert (= (and d!2487 res!11492) b!15100))

(declare-fun m!10049 () Bool)

(assert (=> d!2487 m!10049))

(assert (=> d!2487 m!10045))

(declare-fun m!10051 () Bool)

(assert (=> b!15098 m!10051))

(declare-fun m!10053 () Bool)

(assert (=> b!15100 m!10053))

(declare-fun m!10055 () Bool)

(assert (=> b!15100 m!10055))

(assert (=> b!15042 d!2487))

(declare-fun d!2491 () Bool)

(declare-fun res!11502 () Bool)

(declare-fun e!9121 () Bool)

(assert (=> d!2491 (=> res!11502 e!9121)))

(assert (=> d!2491 (= res!11502 (or ((_ is Nil!442) lt!3654) ((_ is Nil!442) (t!2847 lt!3654))))))

(assert (=> d!2491 (= (isStrictlySortedLong!0 lt!3654) e!9121)))

(declare-fun b!15112 () Bool)

(declare-fun e!9122 () Bool)

(assert (=> b!15112 (= e!9121 e!9122)))

(declare-fun res!11503 () Bool)

(assert (=> b!15112 (=> (not res!11503) (not e!9122))))

(assert (=> b!15112 (= res!11503 (bvslt (h!1007 lt!3654) (h!1007 (t!2847 lt!3654))))))

(declare-fun b!15113 () Bool)

(assert (=> b!15113 (= e!9122 (isStrictlySortedLong!0 (t!2847 lt!3654)))))

(assert (= (and d!2491 (not res!11502)) b!15112))

(assert (= (and b!15112 res!11503) b!15113))

(declare-fun m!10067 () Bool)

(assert (=> b!15113 m!10067))

(assert (=> d!2463 d!2491))

(assert (=> d!2463 d!2483))

(declare-fun d!2495 () Bool)

(assert (=> d!2495 (= (length!3 lt!3654) (size!505 lt!3654))))

(declare-fun bs!624 () Bool)

(assert (= bs!624 d!2495))

(declare-fun m!10069 () Bool)

(assert (=> bs!624 m!10069))

(assert (=> b!15044 d!2495))

(declare-fun d!2497 () Bool)

(assert (=> d!2497 (= (length!5 (toList!219 thiss!177)) (size!503 (toList!219 thiss!177)))))

(declare-fun bs!625 () Bool)

(assert (= bs!625 d!2497))

(assert (=> bs!625 m!9985))

(assert (=> b!15044 d!2497))

(declare-fun b!15118 () Bool)

(declare-fun e!9126 () Bool)

(declare-fun tp!2442 () Bool)

(assert (=> b!15118 (= e!9126 (and tp_is_empty!759 tp!2442))))

(assert (=> b!15077 (= tp!2437 e!9126)))

(assert (= (and b!15077 ((_ is Cons!440) (t!2846 (toList!219 thiss!177)))) b!15118))

(check-sat (not b!15113) (not b!15095) tp_is_empty!759 (not b!15097) (not d!2495) (not b!15118) (not b!15100) (not d!2487) (not b!15089) (not d!2497) (not b!15098))
(check-sat)
