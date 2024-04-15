; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132948 () Bool)

(assert start!132948)

(declare-fun b!1556808 () Bool)

(declare-fun e!867155 () Bool)

(declare-fun a0!50 () (_ BitVec 64))

(declare-fun a!524 () (_ BitVec 64))

(assert (=> b!1556808 (= e!867155 (= a0!50 a!524))))

(declare-fun b!1556809 () Bool)

(declare-fun e!867153 () Bool)

(assert (=> b!1556809 (= e!867153 e!867155)))

(declare-fun res!1064968 () Bool)

(assert (=> b!1556809 (=> res!1064968 e!867155)))

(declare-datatypes ((B!2366 0))(
  ( (B!2367 (val!19269 Int)) )
))
(declare-datatypes ((tuple2!24986 0))(
  ( (tuple2!24987 (_1!12504 (_ BitVec 64)) (_2!12504 B!2366)) )
))
(declare-datatypes ((List!36348 0))(
  ( (Nil!36345) (Cons!36344 (h!37791 tuple2!24986) (t!51067 List!36348)) )
))
(declare-datatypes ((ListLongMap!22487 0))(
  ( (ListLongMap!22488 (toList!11259 List!36348)) )
))
(declare-fun lm!250 () ListLongMap!22487)

(declare-fun isStrictlySorted!951 (List!36348) Bool)

(assert (=> b!1556809 (= res!1064968 (not (isStrictlySorted!951 (toList!11259 lm!250))))))

(declare-fun b!1556810 () Bool)

(declare-fun res!1064971 () Bool)

(assert (=> b!1556810 (=> (not res!1064971) (not e!867153))))

(assert (=> b!1556810 (= res!1064971 (not (= a!524 a0!50)))))

(declare-fun b!1556811 () Bool)

(declare-fun res!1064970 () Bool)

(assert (=> b!1556811 (=> res!1064970 e!867155)))

(declare-fun containsKey!813 (List!36348 (_ BitVec 64)) Bool)

(assert (=> b!1556811 (= res!1064970 (not (containsKey!813 (toList!11259 lm!250) a0!50)))))

(declare-fun res!1064969 () Bool)

(assert (=> start!132948 (=> (not res!1064969) (not e!867153))))

(declare-fun contains!10149 (ListLongMap!22487 (_ BitVec 64)) Bool)

(assert (=> start!132948 (= res!1064969 (contains!10149 lm!250 a0!50))))

(assert (=> start!132948 e!867153))

(declare-fun e!867154 () Bool)

(declare-fun inv!57457 (ListLongMap!22487) Bool)

(assert (=> start!132948 (and (inv!57457 lm!250) e!867154)))

(assert (=> start!132948 true))

(declare-fun b!1556812 () Bool)

(declare-fun tp!112477 () Bool)

(assert (=> b!1556812 (= e!867154 tp!112477)))

(assert (= (and start!132948 res!1064969) b!1556810))

(assert (= (and b!1556810 res!1064971) b!1556809))

(assert (= (and b!1556809 (not res!1064968)) b!1556811))

(assert (= (and b!1556811 (not res!1064970)) b!1556808))

(assert (= start!132948 b!1556812))

(declare-fun m!1433471 () Bool)

(assert (=> b!1556809 m!1433471))

(declare-fun m!1433473 () Bool)

(assert (=> b!1556811 m!1433473))

(declare-fun m!1433475 () Bool)

(assert (=> start!132948 m!1433475))

(declare-fun m!1433477 () Bool)

(assert (=> start!132948 m!1433477))

(check-sat (not b!1556809) (not start!132948) (not b!1556811) (not b!1556812))
(check-sat)
(get-model)

(declare-fun d!162145 () Bool)

(declare-fun res!1065008 () Bool)

(declare-fun e!867186 () Bool)

(assert (=> d!162145 (=> res!1065008 e!867186)))

(get-info :version)

(assert (=> d!162145 (= res!1065008 (or ((_ is Nil!36345) (toList!11259 lm!250)) ((_ is Nil!36345) (t!51067 (toList!11259 lm!250)))))))

(assert (=> d!162145 (= (isStrictlySorted!951 (toList!11259 lm!250)) e!867186)))

(declare-fun b!1556855 () Bool)

(declare-fun e!867187 () Bool)

(assert (=> b!1556855 (= e!867186 e!867187)))

(declare-fun res!1065009 () Bool)

(assert (=> b!1556855 (=> (not res!1065009) (not e!867187))))

(assert (=> b!1556855 (= res!1065009 (bvslt (_1!12504 (h!37791 (toList!11259 lm!250))) (_1!12504 (h!37791 (t!51067 (toList!11259 lm!250))))))))

(declare-fun b!1556856 () Bool)

(assert (=> b!1556856 (= e!867187 (isStrictlySorted!951 (t!51067 (toList!11259 lm!250))))))

(assert (= (and d!162145 (not res!1065008)) b!1556855))

(assert (= (and b!1556855 res!1065009) b!1556856))

(declare-fun m!1433495 () Bool)

(assert (=> b!1556856 m!1433495))

(assert (=> b!1556809 d!162145))

(declare-fun d!162149 () Bool)

(declare-fun e!867205 () Bool)

(assert (=> d!162149 e!867205))

(declare-fun res!1065020 () Bool)

(assert (=> d!162149 (=> res!1065020 e!867205)))

(declare-fun lt!670226 () Bool)

(assert (=> d!162149 (= res!1065020 (not lt!670226))))

(declare-fun lt!670223 () Bool)

(assert (=> d!162149 (= lt!670226 lt!670223)))

(declare-datatypes ((Unit!51660 0))(
  ( (Unit!51661) )
))
(declare-fun lt!670224 () Unit!51660)

(declare-fun e!867204 () Unit!51660)

(assert (=> d!162149 (= lt!670224 e!867204)))

(declare-fun c!143848 () Bool)

(assert (=> d!162149 (= c!143848 lt!670223)))

(assert (=> d!162149 (= lt!670223 (containsKey!813 (toList!11259 lm!250) a0!50))))

(assert (=> d!162149 (= (contains!10149 lm!250 a0!50) lt!670226)))

(declare-fun b!1556879 () Bool)

(declare-fun lt!670225 () Unit!51660)

(assert (=> b!1556879 (= e!867204 lt!670225)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!521 (List!36348 (_ BitVec 64)) Unit!51660)

(assert (=> b!1556879 (= lt!670225 (lemmaContainsKeyImpliesGetValueByKeyDefined!521 (toList!11259 lm!250) a0!50))))

(declare-datatypes ((Option!859 0))(
  ( (Some!858 (v!22043 B!2366)) (None!857) )
))
(declare-fun isDefined!572 (Option!859) Bool)

(declare-fun getValueByKey!784 (List!36348 (_ BitVec 64)) Option!859)

(assert (=> b!1556879 (isDefined!572 (getValueByKey!784 (toList!11259 lm!250) a0!50))))

(declare-fun b!1556880 () Bool)

(declare-fun Unit!51666 () Unit!51660)

(assert (=> b!1556880 (= e!867204 Unit!51666)))

(declare-fun b!1556881 () Bool)

(assert (=> b!1556881 (= e!867205 (isDefined!572 (getValueByKey!784 (toList!11259 lm!250) a0!50)))))

(assert (= (and d!162149 c!143848) b!1556879))

(assert (= (and d!162149 (not c!143848)) b!1556880))

(assert (= (and d!162149 (not res!1065020)) b!1556881))

(assert (=> d!162149 m!1433473))

(declare-fun m!1433501 () Bool)

(assert (=> b!1556879 m!1433501))

(declare-fun m!1433503 () Bool)

(assert (=> b!1556879 m!1433503))

(assert (=> b!1556879 m!1433503))

(declare-fun m!1433505 () Bool)

(assert (=> b!1556879 m!1433505))

(assert (=> b!1556881 m!1433503))

(assert (=> b!1556881 m!1433503))

(assert (=> b!1556881 m!1433505))

(assert (=> start!132948 d!162149))

(declare-fun d!162155 () Bool)

(assert (=> d!162155 (= (inv!57457 lm!250) (isStrictlySorted!951 (toList!11259 lm!250)))))

(declare-fun bs!44713 () Bool)

(assert (= bs!44713 d!162155))

(assert (=> bs!44713 m!1433471))

(assert (=> start!132948 d!162155))

(declare-fun d!162161 () Bool)

(declare-fun res!1065037 () Bool)

(declare-fun e!867224 () Bool)

(assert (=> d!162161 (=> res!1065037 e!867224)))

(assert (=> d!162161 (= res!1065037 (and ((_ is Cons!36344) (toList!11259 lm!250)) (= (_1!12504 (h!37791 (toList!11259 lm!250))) a0!50)))))

(assert (=> d!162161 (= (containsKey!813 (toList!11259 lm!250) a0!50) e!867224)))

(declare-fun b!1556902 () Bool)

(declare-fun e!867225 () Bool)

(assert (=> b!1556902 (= e!867224 e!867225)))

(declare-fun res!1065038 () Bool)

(assert (=> b!1556902 (=> (not res!1065038) (not e!867225))))

(assert (=> b!1556902 (= res!1065038 (and (or (not ((_ is Cons!36344) (toList!11259 lm!250))) (bvsle (_1!12504 (h!37791 (toList!11259 lm!250))) a0!50)) ((_ is Cons!36344) (toList!11259 lm!250)) (bvslt (_1!12504 (h!37791 (toList!11259 lm!250))) a0!50)))))

(declare-fun b!1556903 () Bool)

(assert (=> b!1556903 (= e!867225 (containsKey!813 (t!51067 (toList!11259 lm!250)) a0!50))))

(assert (= (and d!162161 (not res!1065037)) b!1556902))

(assert (= (and b!1556902 res!1065038) b!1556903))

(declare-fun m!1433521 () Bool)

(assert (=> b!1556903 m!1433521))

(assert (=> b!1556811 d!162161))

(declare-fun b!1556915 () Bool)

(declare-fun e!867233 () Bool)

(declare-fun tp_is_empty!38373 () Bool)

(declare-fun tp!112489 () Bool)

(assert (=> b!1556915 (= e!867233 (and tp_is_empty!38373 tp!112489))))

(assert (=> b!1556812 (= tp!112477 e!867233)))

(assert (= (and b!1556812 ((_ is Cons!36344) (toList!11259 lm!250))) b!1556915))

(check-sat (not d!162149) (not b!1556881) (not d!162155) (not b!1556915) (not b!1556856) (not b!1556903) tp_is_empty!38373 (not b!1556879))
(check-sat)
