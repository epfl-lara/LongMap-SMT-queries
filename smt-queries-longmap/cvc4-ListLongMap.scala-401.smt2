; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7484 () Bool)

(assert start!7484)

(declare-fun res!27886 () Bool)

(declare-fun e!30801 () Bool)

(assert (=> start!7484 (=> (not res!27886) (not e!30801))))

(declare-datatypes ((B!924 0))(
  ( (B!925 (val!1082 Int)) )
))
(declare-datatypes ((tuple2!1746 0))(
  ( (tuple2!1747 (_1!884 (_ BitVec 64)) (_2!884 B!924)) )
))
(declare-datatypes ((List!1279 0))(
  ( (Nil!1276) (Cons!1275 (h!1855 tuple2!1746) (t!4307 List!1279)) )
))
(declare-datatypes ((ListLongMap!1239 0))(
  ( (ListLongMap!1240 (toList!635 List!1279)) )
))
(declare-fun lm!267 () ListLongMap!1239)

(declare-fun key!657 () (_ BitVec 64))

(declare-fun contains!599 (ListLongMap!1239 (_ BitVec 64)) Bool)

(assert (=> start!7484 (= res!27886 (not (contains!599 lm!267 key!657)))))

(assert (=> start!7484 e!30801))

(declare-fun e!30802 () Bool)

(declare-fun inv!2230 (ListLongMap!1239) Bool)

(assert (=> start!7484 (and (inv!2230 lm!267) e!30802)))

(assert (=> start!7484 true))

(declare-fun b!48009 () Bool)

(declare-fun res!27887 () Bool)

(assert (=> b!48009 (=> (not res!27887) (not e!30801))))

(declare-fun isStrictlySorted!252 (List!1279) Bool)

(assert (=> b!48009 (= res!27887 (isStrictlySorted!252 (toList!635 lm!267)))))

(declare-fun b!48010 () Bool)

(declare-fun containsKey!101 (List!1279 (_ BitVec 64)) Bool)

(assert (=> b!48010 (= e!30801 (containsKey!101 (toList!635 lm!267) key!657))))

(declare-fun b!48011 () Bool)

(declare-fun tp!6335 () Bool)

(assert (=> b!48011 (= e!30802 tp!6335)))

(assert (= (and start!7484 res!27886) b!48009))

(assert (= (and b!48009 res!27887) b!48010))

(assert (= start!7484 b!48011))

(declare-fun m!42001 () Bool)

(assert (=> start!7484 m!42001))

(declare-fun m!42003 () Bool)

(assert (=> start!7484 m!42003))

(declare-fun m!42005 () Bool)

(assert (=> b!48009 m!42005))

(declare-fun m!42007 () Bool)

(assert (=> b!48010 m!42007))

(push 1)

(assert (not start!7484))

(assert (not b!48009))

(assert (not b!48010))

(assert (not b!48011))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!9519 () Bool)

(declare-fun e!30840 () Bool)

(assert (=> d!9519 e!30840))

(declare-fun res!27916 () Bool)

(assert (=> d!9519 (=> res!27916 e!30840)))

(declare-fun lt!20544 () Bool)

(assert (=> d!9519 (= res!27916 (not lt!20544))))

(declare-fun lt!20543 () Bool)

(assert (=> d!9519 (= lt!20544 lt!20543)))

(declare-datatypes ((Unit!1351 0))(
  ( (Unit!1352) )
))
(declare-fun lt!20546 () Unit!1351)

(declare-fun e!30839 () Unit!1351)

(assert (=> d!9519 (= lt!20546 e!30839)))

(declare-fun c!6459 () Bool)

(assert (=> d!9519 (= c!6459 lt!20543)))

(assert (=> d!9519 (= lt!20543 (containsKey!101 (toList!635 lm!267) key!657))))

(assert (=> d!9519 (= (contains!599 lm!267 key!657) lt!20544)))

(declare-fun b!48056 () Bool)

(declare-fun lt!20545 () Unit!1351)

(assert (=> b!48056 (= e!30839 lt!20545)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!71 (List!1279 (_ BitVec 64)) Unit!1351)

(assert (=> b!48056 (= lt!20545 (lemmaContainsKeyImpliesGetValueByKeyDefined!71 (toList!635 lm!267) key!657))))

(declare-datatypes ((Option!121 0))(
  ( (Some!120 (v!2137 B!924)) (None!119) )
))
(declare-fun isDefined!72 (Option!121) Bool)

(declare-fun getValueByKey!115 (List!1279 (_ BitVec 64)) Option!121)

(assert (=> b!48056 (isDefined!72 (getValueByKey!115 (toList!635 lm!267) key!657))))

(declare-fun b!48057 () Bool)

(declare-fun Unit!1354 () Unit!1351)

(assert (=> b!48057 (= e!30839 Unit!1354)))

(declare-fun b!48058 () Bool)

(assert (=> b!48058 (= e!30840 (isDefined!72 (getValueByKey!115 (toList!635 lm!267) key!657)))))

(assert (= (and d!9519 c!6459) b!48056))

(assert (= (and d!9519 (not c!6459)) b!48057))

(assert (= (and d!9519 (not res!27916)) b!48058))

(assert (=> d!9519 m!42007))

(declare-fun m!42025 () Bool)

(assert (=> b!48056 m!42025))

(declare-fun m!42027 () Bool)

(assert (=> b!48056 m!42027))

(assert (=> b!48056 m!42027))

(declare-fun m!42029 () Bool)

(assert (=> b!48056 m!42029))

(assert (=> b!48058 m!42027))

(assert (=> b!48058 m!42027))

(assert (=> b!48058 m!42029))

(assert (=> start!7484 d!9519))

(declare-fun d!9531 () Bool)

(assert (=> d!9531 (= (inv!2230 lm!267) (isStrictlySorted!252 (toList!635 lm!267)))))

(declare-fun bs!2241 () Bool)

(assert (= bs!2241 d!9531))

(assert (=> bs!2241 m!42005))

(assert (=> start!7484 d!9531))

(declare-fun d!9533 () Bool)

(declare-fun res!27925 () Bool)

(declare-fun e!30855 () Bool)

(assert (=> d!9533 (=> res!27925 e!30855)))

(assert (=> d!9533 (= res!27925 (or (is-Nil!1276 (toList!635 lm!267)) (is-Nil!1276 (t!4307 (toList!635 lm!267)))))))

(assert (=> d!9533 (= (isStrictlySorted!252 (toList!635 lm!267)) e!30855)))

(declare-fun b!48077 () Bool)

(declare-fun e!30856 () Bool)

(assert (=> b!48077 (= e!30855 e!30856)))

(declare-fun res!27926 () Bool)

(assert (=> b!48077 (=> (not res!27926) (not e!30856))))

(assert (=> b!48077 (= res!27926 (bvslt (_1!884 (h!1855 (toList!635 lm!267))) (_1!884 (h!1855 (t!4307 (toList!635 lm!267))))))))

