; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7456 () Bool)

(assert start!7456)

(declare-fun res!27836 () Bool)

(declare-fun e!30726 () Bool)

(assert (=> start!7456 (=> (not res!27836) (not e!30726))))

(declare-datatypes ((B!914 0))(
  ( (B!915 (val!1077 Int)) )
))
(declare-datatypes ((tuple2!1736 0))(
  ( (tuple2!1737 (_1!879 (_ BitVec 64)) (_2!879 B!914)) )
))
(declare-datatypes ((List!1274 0))(
  ( (Nil!1271) (Cons!1270 (h!1850 tuple2!1736) (t!4302 List!1274)) )
))
(declare-datatypes ((ListLongMap!1229 0))(
  ( (ListLongMap!1230 (toList!630 List!1274)) )
))
(declare-fun lm!267 () ListLongMap!1229)

(declare-fun key!657 () (_ BitVec 64))

(declare-fun contains!594 (ListLongMap!1229 (_ BitVec 64)) Bool)

(assert (=> start!7456 (= res!27836 (not (contains!594 lm!267 key!657)))))

(assert (=> start!7456 e!30726))

(declare-fun e!30727 () Bool)

(declare-fun inv!2220 (ListLongMap!1229) Bool)

(assert (=> start!7456 (and (inv!2220 lm!267) e!30727)))

(assert (=> start!7456 true))

(declare-fun b!47911 () Bool)

(declare-fun isStrictlySorted!247 (List!1274) Bool)

(assert (=> b!47911 (= e!30726 (not (isStrictlySorted!247 (toList!630 lm!267))))))

(declare-fun b!47912 () Bool)

(declare-fun tp!6311 () Bool)

(assert (=> b!47912 (= e!30727 tp!6311)))

(assert (= (and start!7456 res!27836) b!47911))

(assert (= start!7456 b!47912))

(declare-fun m!41937 () Bool)

(assert (=> start!7456 m!41937))

(declare-fun m!41939 () Bool)

(assert (=> start!7456 m!41939))

(declare-fun m!41941 () Bool)

(assert (=> b!47911 m!41941))

(push 1)

(assert (not start!7456))

(assert (not b!47911))

(assert (not b!47912))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!9493 () Bool)

(declare-fun e!30751 () Bool)

(assert (=> d!9493 e!30751))

(declare-fun res!27851 () Bool)

(assert (=> d!9493 (=> res!27851 e!30751)))

(declare-fun lt!20485 () Bool)

(assert (=> d!9493 (= res!27851 (not lt!20485))))

(declare-fun lt!20484 () Bool)

(assert (=> d!9493 (= lt!20485 lt!20484)))

(declare-datatypes ((Unit!1337 0))(
  ( (Unit!1338) )
))
(declare-fun lt!20486 () Unit!1337)

(declare-fun e!30750 () Unit!1337)

(assert (=> d!9493 (= lt!20486 e!30750)))

(declare-fun c!6444 () Bool)

(assert (=> d!9493 (= c!6444 lt!20484)))

(declare-fun containsKey!96 (List!1274 (_ BitVec 64)) Bool)

(assert (=> d!9493 (= lt!20484 (containsKey!96 (toList!630 lm!267) key!657))))

(assert (=> d!9493 (= (contains!594 lm!267 key!657) lt!20485)))

(declare-fun b!47937 () Bool)

(declare-fun lt!20483 () Unit!1337)

(assert (=> b!47937 (= e!30750 lt!20483)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!66 (List!1274 (_ BitVec 64)) Unit!1337)

(assert (=> b!47937 (= lt!20483 (lemmaContainsKeyImpliesGetValueByKeyDefined!66 (toList!630 lm!267) key!657))))

(declare-datatypes ((Option!116 0))(
  ( (Some!115 (v!2132 B!914)) (None!114) )
))
(declare-fun isDefined!67 (Option!116) Bool)

(declare-fun getValueByKey!110 (List!1274 (_ BitVec 64)) Option!116)

(assert (=> b!47937 (isDefined!67 (getValueByKey!110 (toList!630 lm!267) key!657))))

(declare-fun b!47938 () Bool)

(declare-fun Unit!1341 () Unit!1337)

(assert (=> b!47938 (= e!30750 Unit!1341)))

(declare-fun b!47939 () Bool)

(assert (=> b!47939 (= e!30751 (isDefined!67 (getValueByKey!110 (toList!630 lm!267) key!657)))))

(assert (= (and d!9493 c!6444) b!47937))

(assert (= (and d!9493 (not c!6444)) b!47938))

(assert (= (and d!9493 (not res!27851)) b!47939))

(declare-fun m!41957 () Bool)

(assert (=> d!9493 m!41957))

(declare-fun m!41959 () Bool)

(assert (=> b!47937 m!41959))

(declare-fun m!41961 () Bool)

(assert (=> b!47937 m!41961))

(assert (=> b!47937 m!41961))

(declare-fun m!41963 () Bool)

(assert (=> b!47937 m!41963))

(assert (=> b!47939 m!41961))

(assert (=> b!47939 m!41961))

(assert (=> b!47939 m!41963))

(assert (=> start!7456 d!9493))

(declare-fun d!9501 () Bool)

(assert (=> d!9501 (= (inv!2220 lm!267) (isStrictlySorted!247 (toList!630 lm!267)))))

(declare-fun bs!2233 () Bool)

(assert (= bs!2233 d!9501))

(assert (=> bs!2233 m!41941))

(assert (=> start!7456 d!9501))

(declare-fun d!9503 () Bool)

(declare-fun res!27859 () Bool)

(declare-fun e!30764 () Bool)

(assert (=> d!9503 (=> res!27859 e!30764)))

(assert (=> d!9503 (= res!27859 (or (is-Nil!1271 (toList!630 lm!267)) (is-Nil!1271 (t!4302 (toList!630 lm!267)))))))

(assert (=> d!9503 (= (isStrictlySorted!247 (toList!630 lm!267)) e!30764)))

(declare-fun b!47957 () Bool)

(declare-fun e!30765 () Bool)

(assert (=> b!47957 (= e!30764 e!30765)))

(declare-fun res!27860 () Bool)

(assert (=> b!47957 (=> (not res!27860) (not e!30765))))

(assert (=> b!47957 (= res!27860 (bvslt (_1!879 (h!1850 (toList!630 lm!267))) (_1!879 (h!1850 (t!4302 (toList!630 lm!267))))))))

(declare-fun b!47958 () Bool)

(assert (=> b!47958 (= e!30765 (isStrictlySorted!247 (t!4302 (toList!630 lm!267))))))

(assert (= (and d!9503 (not res!27859)) b!47957))

(assert (= (and b!47957 res!27860) b!47958))

(declare-fun m!41973 () Bool)

(assert (=> b!47958 m!41973))

(assert (=> b!47911 d!9503))

(declare-fun b!47965 () Bool)

(declare-fun e!30770 () Bool)

(declare-fun tp_is_empty!2065 () Bool)

(declare-fun tp!6320 () Bool)

(assert (=> b!47965 (= e!30770 (and tp_is_empty!2065 tp!6320))))

(assert (=> b!47912 (= tp!6311 e!30770)))

(assert (= (and b!47912 (is-Cons!1270 (toList!630 lm!267))) b!47965))

(push 1)

(assert (not b!47937))

(assert (not b!47965))

(assert (not b!47939))

(assert (not b!47958))

(assert (not d!9501))

(assert tp_is_empty!2065)

(assert (not d!9493))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

