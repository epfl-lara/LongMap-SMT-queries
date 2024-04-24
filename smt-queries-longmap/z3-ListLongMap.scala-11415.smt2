; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133410 () Bool)

(assert start!133410)

(declare-fun b!1559558 () Bool)

(declare-fun e!868861 () Bool)

(declare-fun e!868862 () Bool)

(assert (=> b!1559558 (= e!868861 e!868862)))

(declare-fun res!1065957 () Bool)

(assert (=> b!1559558 (=> res!1065957 e!868862)))

(declare-datatypes ((B!2366 0))(
  ( (B!2367 (val!19269 Int)) )
))
(declare-datatypes ((tuple2!24968 0))(
  ( (tuple2!24969 (_1!12495 (_ BitVec 64)) (_2!12495 B!2366)) )
))
(declare-datatypes ((List!36332 0))(
  ( (Nil!36329) (Cons!36328 (h!37792 tuple2!24968) (t!51051 List!36332)) )
))
(declare-datatypes ((ListLongMap!22477 0))(
  ( (ListLongMap!22478 (toList!11254 List!36332)) )
))
(declare-fun lm!250 () ListLongMap!22477)

(declare-fun isStrictlySorted!940 (List!36332) Bool)

(assert (=> b!1559558 (= res!1065957 (not (isStrictlySorted!940 (toList!11254 lm!250))))))

(declare-fun b!1559559 () Bool)

(declare-fun a0!50 () (_ BitVec 64))

(declare-fun a!524 () (_ BitVec 64))

(assert (=> b!1559559 (= e!868862 (= a0!50 a!524))))

(declare-fun b!1559560 () Bool)

(declare-fun res!1065960 () Bool)

(assert (=> b!1559560 (=> (not res!1065960) (not e!868861))))

(assert (=> b!1559560 (= res!1065960 (not (= a!524 a0!50)))))

(declare-fun b!1559561 () Bool)

(declare-fun res!1065959 () Bool)

(assert (=> b!1559561 (=> res!1065959 e!868862)))

(declare-fun containsKey!815 (List!36332 (_ BitVec 64)) Bool)

(assert (=> b!1559561 (= res!1065959 (not (containsKey!815 (toList!11254 lm!250) a0!50)))))

(declare-fun b!1559557 () Bool)

(declare-fun e!868860 () Bool)

(declare-fun tp!112476 () Bool)

(assert (=> b!1559557 (= e!868860 tp!112476)))

(declare-fun res!1065958 () Bool)

(assert (=> start!133410 (=> (not res!1065958) (not e!868861))))

(declare-fun contains!10235 (ListLongMap!22477 (_ BitVec 64)) Bool)

(assert (=> start!133410 (= res!1065958 (contains!10235 lm!250 a0!50))))

(assert (=> start!133410 e!868861))

(declare-fun inv!57457 (ListLongMap!22477) Bool)

(assert (=> start!133410 (and (inv!57457 lm!250) e!868860)))

(assert (=> start!133410 true))

(assert (= (and start!133410 res!1065958) b!1559560))

(assert (= (and b!1559560 res!1065960) b!1559558))

(assert (= (and b!1559558 (not res!1065957)) b!1559561))

(assert (= (and b!1559561 (not res!1065959)) b!1559559))

(assert (= start!133410 b!1559557))

(declare-fun m!1436621 () Bool)

(assert (=> b!1559558 m!1436621))

(declare-fun m!1436623 () Bool)

(assert (=> b!1559561 m!1436623))

(declare-fun m!1436625 () Bool)

(assert (=> start!133410 m!1436625))

(declare-fun m!1436627 () Bool)

(assert (=> start!133410 m!1436627))

(check-sat (not start!133410) (not b!1559558) (not b!1559561) (not b!1559557))
(check-sat)
(get-model)

(declare-fun d!163097 () Bool)

(declare-fun e!868904 () Bool)

(assert (=> d!163097 e!868904))

(declare-fun res!1066005 () Bool)

(assert (=> d!163097 (=> res!1066005 e!868904)))

(declare-fun lt!671401 () Bool)

(assert (=> d!163097 (= res!1066005 (not lt!671401))))

(declare-fun lt!671402 () Bool)

(assert (=> d!163097 (= lt!671401 lt!671402)))

(declare-datatypes ((Unit!51755 0))(
  ( (Unit!51756) )
))
(declare-fun lt!671404 () Unit!51755)

(declare-fun e!868903 () Unit!51755)

(assert (=> d!163097 (= lt!671404 e!868903)))

(declare-fun c!144733 () Bool)

(assert (=> d!163097 (= c!144733 lt!671402)))

(assert (=> d!163097 (= lt!671402 (containsKey!815 (toList!11254 lm!250) a0!50))))

(assert (=> d!163097 (= (contains!10235 lm!250 a0!50) lt!671401)))

(declare-fun b!1559616 () Bool)

(declare-fun lt!671403 () Unit!51755)

(assert (=> b!1559616 (= e!868903 lt!671403)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!522 (List!36332 (_ BitVec 64)) Unit!51755)

(assert (=> b!1559616 (= lt!671403 (lemmaContainsKeyImpliesGetValueByKeyDefined!522 (toList!11254 lm!250) a0!50))))

(declare-datatypes ((Option!852 0))(
  ( (Some!851 (v!22039 B!2366)) (None!850) )
))
(declare-fun isDefined!568 (Option!852) Bool)

(declare-fun getValueByKey!777 (List!36332 (_ BitVec 64)) Option!852)

(assert (=> b!1559616 (isDefined!568 (getValueByKey!777 (toList!11254 lm!250) a0!50))))

(declare-fun b!1559617 () Bool)

(declare-fun Unit!51757 () Unit!51755)

(assert (=> b!1559617 (= e!868903 Unit!51757)))

(declare-fun b!1559618 () Bool)

(assert (=> b!1559618 (= e!868904 (isDefined!568 (getValueByKey!777 (toList!11254 lm!250) a0!50)))))

(assert (= (and d!163097 c!144733) b!1559616))

(assert (= (and d!163097 (not c!144733)) b!1559617))

(assert (= (and d!163097 (not res!1066005)) b!1559618))

(assert (=> d!163097 m!1436623))

(declare-fun m!1436651 () Bool)

(assert (=> b!1559616 m!1436651))

(declare-fun m!1436653 () Bool)

(assert (=> b!1559616 m!1436653))

(assert (=> b!1559616 m!1436653))

(declare-fun m!1436655 () Bool)

(assert (=> b!1559616 m!1436655))

(assert (=> b!1559618 m!1436653))

(assert (=> b!1559618 m!1436653))

(assert (=> b!1559618 m!1436655))

(assert (=> start!133410 d!163097))

(declare-fun d!163109 () Bool)

(assert (=> d!163109 (= (inv!57457 lm!250) (isStrictlySorted!940 (toList!11254 lm!250)))))

(declare-fun bs!44777 () Bool)

(assert (= bs!44777 d!163109))

(assert (=> bs!44777 m!1436621))

(assert (=> start!133410 d!163109))

(declare-fun d!163111 () Bool)

(declare-fun res!1066013 () Bool)

(declare-fun e!868915 () Bool)

(assert (=> d!163111 (=> res!1066013 e!868915)))

(get-info :version)

(assert (=> d!163111 (= res!1066013 (or ((_ is Nil!36329) (toList!11254 lm!250)) ((_ is Nil!36329) (t!51051 (toList!11254 lm!250)))))))

(assert (=> d!163111 (= (isStrictlySorted!940 (toList!11254 lm!250)) e!868915)))

(declare-fun b!1559632 () Bool)

(declare-fun e!868916 () Bool)

(assert (=> b!1559632 (= e!868915 e!868916)))

(declare-fun res!1066014 () Bool)

(assert (=> b!1559632 (=> (not res!1066014) (not e!868916))))

(assert (=> b!1559632 (= res!1066014 (bvslt (_1!12495 (h!37792 (toList!11254 lm!250))) (_1!12495 (h!37792 (t!51051 (toList!11254 lm!250))))))))

(declare-fun b!1559633 () Bool)

(assert (=> b!1559633 (= e!868916 (isStrictlySorted!940 (t!51051 (toList!11254 lm!250))))))

(assert (= (and d!163111 (not res!1066013)) b!1559632))

(assert (= (and b!1559632 res!1066014) b!1559633))

(declare-fun m!1436663 () Bool)

(assert (=> b!1559633 m!1436663))

(assert (=> b!1559558 d!163111))

(declare-fun d!163115 () Bool)

(declare-fun res!1066026 () Bool)

(declare-fun e!868931 () Bool)

(assert (=> d!163115 (=> res!1066026 e!868931)))

(assert (=> d!163115 (= res!1066026 (and ((_ is Cons!36328) (toList!11254 lm!250)) (= (_1!12495 (h!37792 (toList!11254 lm!250))) a0!50)))))

(assert (=> d!163115 (= (containsKey!815 (toList!11254 lm!250) a0!50) e!868931)))

(declare-fun b!1559651 () Bool)

(declare-fun e!868932 () Bool)

(assert (=> b!1559651 (= e!868931 e!868932)))

(declare-fun res!1066027 () Bool)

(assert (=> b!1559651 (=> (not res!1066027) (not e!868932))))

(assert (=> b!1559651 (= res!1066027 (and (or (not ((_ is Cons!36328) (toList!11254 lm!250))) (bvsle (_1!12495 (h!37792 (toList!11254 lm!250))) a0!50)) ((_ is Cons!36328) (toList!11254 lm!250)) (bvslt (_1!12495 (h!37792 (toList!11254 lm!250))) a0!50)))))

(declare-fun b!1559652 () Bool)

(assert (=> b!1559652 (= e!868932 (containsKey!815 (t!51051 (toList!11254 lm!250)) a0!50))))

(assert (= (and d!163115 (not res!1066026)) b!1559651))

(assert (= (and b!1559651 res!1066027) b!1559652))

(declare-fun m!1436671 () Bool)

(assert (=> b!1559652 m!1436671))

(assert (=> b!1559561 d!163115))

(declare-fun b!1559668 () Bool)

(declare-fun e!868942 () Bool)

(declare-fun tp_is_empty!38373 () Bool)

(declare-fun tp!112488 () Bool)

(assert (=> b!1559668 (= e!868942 (and tp_is_empty!38373 tp!112488))))

(assert (=> b!1559557 (= tp!112476 e!868942)))

(assert (= (and b!1559557 ((_ is Cons!36328) (toList!11254 lm!250))) b!1559668))

(check-sat (not b!1559618) (not b!1559616) (not b!1559633) (not d!163109) (not d!163097) (not b!1559668) tp_is_empty!38373 (not b!1559652))
(check-sat)
