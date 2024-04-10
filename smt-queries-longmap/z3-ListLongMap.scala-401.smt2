; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7482 () Bool)

(assert start!7482)

(declare-fun res!27881 () Bool)

(declare-fun e!30795 () Bool)

(assert (=> start!7482 (=> (not res!27881) (not e!30795))))

(declare-datatypes ((B!922 0))(
  ( (B!923 (val!1081 Int)) )
))
(declare-datatypes ((tuple2!1744 0))(
  ( (tuple2!1745 (_1!883 (_ BitVec 64)) (_2!883 B!922)) )
))
(declare-datatypes ((List!1278 0))(
  ( (Nil!1275) (Cons!1274 (h!1854 tuple2!1744) (t!4306 List!1278)) )
))
(declare-datatypes ((ListLongMap!1237 0))(
  ( (ListLongMap!1238 (toList!634 List!1278)) )
))
(declare-fun lm!267 () ListLongMap!1237)

(declare-fun key!657 () (_ BitVec 64))

(declare-fun contains!598 (ListLongMap!1237 (_ BitVec 64)) Bool)

(assert (=> start!7482 (= res!27881 (not (contains!598 lm!267 key!657)))))

(assert (=> start!7482 e!30795))

(declare-fun e!30796 () Bool)

(declare-fun inv!2229 (ListLongMap!1237) Bool)

(assert (=> start!7482 (and (inv!2229 lm!267) e!30796)))

(assert (=> start!7482 true))

(declare-fun b!48000 () Bool)

(declare-fun res!27880 () Bool)

(assert (=> b!48000 (=> (not res!27880) (not e!30795))))

(declare-fun isStrictlySorted!251 (List!1278) Bool)

(assert (=> b!48000 (= res!27880 (isStrictlySorted!251 (toList!634 lm!267)))))

(declare-fun b!48001 () Bool)

(declare-fun containsKey!100 (List!1278 (_ BitVec 64)) Bool)

(assert (=> b!48001 (= e!30795 (containsKey!100 (toList!634 lm!267) key!657))))

(declare-fun b!48002 () Bool)

(declare-fun tp!6332 () Bool)

(assert (=> b!48002 (= e!30796 tp!6332)))

(assert (= (and start!7482 res!27881) b!48000))

(assert (= (and b!48000 res!27880) b!48001))

(assert (= start!7482 b!48002))

(declare-fun m!41993 () Bool)

(assert (=> start!7482 m!41993))

(declare-fun m!41995 () Bool)

(assert (=> start!7482 m!41995))

(declare-fun m!41997 () Bool)

(assert (=> b!48000 m!41997))

(declare-fun m!41999 () Bool)

(assert (=> b!48001 m!41999))

(check-sat (not start!7482) (not b!48000) (not b!48001) (not b!48002))
(check-sat)
(get-model)

(declare-fun d!9513 () Bool)

(declare-fun e!30814 () Bool)

(assert (=> d!9513 e!30814))

(declare-fun res!27896 () Bool)

(assert (=> d!9513 (=> res!27896 e!30814)))

(declare-fun lt!20520 () Bool)

(assert (=> d!9513 (= res!27896 (not lt!20520))))

(declare-fun lt!20519 () Bool)

(assert (=> d!9513 (= lt!20520 lt!20519)))

(declare-datatypes ((Unit!1346 0))(
  ( (Unit!1347) )
))
(declare-fun lt!20522 () Unit!1346)

(declare-fun e!30813 () Unit!1346)

(assert (=> d!9513 (= lt!20522 e!30813)))

(declare-fun c!6453 () Bool)

(assert (=> d!9513 (= c!6453 lt!20519)))

(assert (=> d!9513 (= lt!20519 (containsKey!100 (toList!634 lm!267) key!657))))

(assert (=> d!9513 (= (contains!598 lm!267 key!657) lt!20520)))

(declare-fun b!48024 () Bool)

(declare-fun lt!20521 () Unit!1346)

(assert (=> b!48024 (= e!30813 lt!20521)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!69 (List!1278 (_ BitVec 64)) Unit!1346)

(assert (=> b!48024 (= lt!20521 (lemmaContainsKeyImpliesGetValueByKeyDefined!69 (toList!634 lm!267) key!657))))

(declare-datatypes ((Option!119 0))(
  ( (Some!118 (v!2135 B!922)) (None!117) )
))
(declare-fun isDefined!70 (Option!119) Bool)

(declare-fun getValueByKey!113 (List!1278 (_ BitVec 64)) Option!119)

(assert (=> b!48024 (isDefined!70 (getValueByKey!113 (toList!634 lm!267) key!657))))

(declare-fun b!48025 () Bool)

(declare-fun Unit!1348 () Unit!1346)

(assert (=> b!48025 (= e!30813 Unit!1348)))

(declare-fun b!48026 () Bool)

(assert (=> b!48026 (= e!30814 (isDefined!70 (getValueByKey!113 (toList!634 lm!267) key!657)))))

(assert (= (and d!9513 c!6453) b!48024))

(assert (= (and d!9513 (not c!6453)) b!48025))

(assert (= (and d!9513 (not res!27896)) b!48026))

(assert (=> d!9513 m!41999))

(declare-fun m!42011 () Bool)

(assert (=> b!48024 m!42011))

(declare-fun m!42013 () Bool)

(assert (=> b!48024 m!42013))

(assert (=> b!48024 m!42013))

(declare-fun m!42015 () Bool)

(assert (=> b!48024 m!42015))

(assert (=> b!48026 m!42013))

(assert (=> b!48026 m!42013))

(assert (=> b!48026 m!42015))

(assert (=> start!7482 d!9513))

(declare-fun d!9521 () Bool)

(assert (=> d!9521 (= (inv!2229 lm!267) (isStrictlySorted!251 (toList!634 lm!267)))))

(declare-fun bs!2239 () Bool)

(assert (= bs!2239 d!9521))

(assert (=> bs!2239 m!41997))

(assert (=> start!7482 d!9521))

(declare-fun d!9523 () Bool)

(declare-fun res!27904 () Bool)

(declare-fun e!30825 () Bool)

(assert (=> d!9523 (=> res!27904 e!30825)))

(get-info :version)

(assert (=> d!9523 (= res!27904 (or ((_ is Nil!1275) (toList!634 lm!267)) ((_ is Nil!1275) (t!4306 (toList!634 lm!267)))))))

(assert (=> d!9523 (= (isStrictlySorted!251 (toList!634 lm!267)) e!30825)))

(declare-fun b!48040 () Bool)

(declare-fun e!30826 () Bool)

(assert (=> b!48040 (= e!30825 e!30826)))

(declare-fun res!27905 () Bool)

(assert (=> b!48040 (=> (not res!27905) (not e!30826))))

(assert (=> b!48040 (= res!27905 (bvslt (_1!883 (h!1854 (toList!634 lm!267))) (_1!883 (h!1854 (t!4306 (toList!634 lm!267))))))))

(declare-fun b!48041 () Bool)

(assert (=> b!48041 (= e!30826 (isStrictlySorted!251 (t!4306 (toList!634 lm!267))))))

(assert (= (and d!9523 (not res!27904)) b!48040))

(assert (= (and b!48040 res!27905) b!48041))

(declare-fun m!42023 () Bool)

(assert (=> b!48041 m!42023))

(assert (=> b!48000 d!9523))

(declare-fun d!9527 () Bool)

(declare-fun res!27919 () Bool)

(declare-fun e!30843 () Bool)

(assert (=> d!9527 (=> res!27919 e!30843)))

(assert (=> d!9527 (= res!27919 (and ((_ is Cons!1274) (toList!634 lm!267)) (= (_1!883 (h!1854 (toList!634 lm!267))) key!657)))))

(assert (=> d!9527 (= (containsKey!100 (toList!634 lm!267) key!657) e!30843)))

(declare-fun b!48061 () Bool)

(declare-fun e!30844 () Bool)

(assert (=> b!48061 (= e!30843 e!30844)))

(declare-fun res!27920 () Bool)

(assert (=> b!48061 (=> (not res!27920) (not e!30844))))

(assert (=> b!48061 (= res!27920 (and (or (not ((_ is Cons!1274) (toList!634 lm!267))) (bvsle (_1!883 (h!1854 (toList!634 lm!267))) key!657)) ((_ is Cons!1274) (toList!634 lm!267)) (bvslt (_1!883 (h!1854 (toList!634 lm!267))) key!657)))))

(declare-fun b!48062 () Bool)

(assert (=> b!48062 (= e!30844 (containsKey!100 (t!4306 (toList!634 lm!267)) key!657))))

(assert (= (and d!9527 (not res!27919)) b!48061))

(assert (= (and b!48061 res!27920) b!48062))

(declare-fun m!42033 () Bool)

(assert (=> b!48062 m!42033))

(assert (=> b!48001 d!9527))

(declare-fun b!48072 () Bool)

(declare-fun e!30850 () Bool)

(declare-fun tp_is_empty!2073 () Bool)

(declare-fun tp!6341 () Bool)

(assert (=> b!48072 (= e!30850 (and tp_is_empty!2073 tp!6341))))

(assert (=> b!48002 (= tp!6332 e!30850)))

(assert (= (and b!48002 ((_ is Cons!1274) (toList!634 lm!267))) b!48072))

(check-sat (not b!48024) (not b!48062) tp_is_empty!2073 (not d!9521) (not b!48072) (not b!48041) (not b!48026) (not d!9513))
(check-sat)
