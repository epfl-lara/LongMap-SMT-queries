; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7480 () Bool)

(assert start!7480)

(declare-fun res!27874 () Bool)

(declare-fun e!30789 () Bool)

(assert (=> start!7480 (=> (not res!27874) (not e!30789))))

(declare-datatypes ((B!920 0))(
  ( (B!921 (val!1080 Int)) )
))
(declare-datatypes ((tuple2!1742 0))(
  ( (tuple2!1743 (_1!882 (_ BitVec 64)) (_2!882 B!920)) )
))
(declare-datatypes ((List!1277 0))(
  ( (Nil!1274) (Cons!1273 (h!1853 tuple2!1742) (t!4305 List!1277)) )
))
(declare-datatypes ((ListLongMap!1235 0))(
  ( (ListLongMap!1236 (toList!633 List!1277)) )
))
(declare-fun lm!267 () ListLongMap!1235)

(declare-fun key!657 () (_ BitVec 64))

(declare-fun contains!597 (ListLongMap!1235 (_ BitVec 64)) Bool)

(assert (=> start!7480 (= res!27874 (not (contains!597 lm!267 key!657)))))

(assert (=> start!7480 e!30789))

(declare-fun e!30790 () Bool)

(declare-fun inv!2228 (ListLongMap!1235) Bool)

(assert (=> start!7480 (and (inv!2228 lm!267) e!30790)))

(assert (=> start!7480 true))

(declare-fun b!47991 () Bool)

(declare-fun res!27875 () Bool)

(assert (=> b!47991 (=> (not res!27875) (not e!30789))))

(declare-fun isStrictlySorted!250 (List!1277) Bool)

(assert (=> b!47991 (= res!27875 (isStrictlySorted!250 (toList!633 lm!267)))))

(declare-fun b!47992 () Bool)

(declare-fun containsKey!99 (List!1277 (_ BitVec 64)) Bool)

(assert (=> b!47992 (= e!30789 (containsKey!99 (toList!633 lm!267) key!657))))

(declare-fun b!47993 () Bool)

(declare-fun tp!6329 () Bool)

(assert (=> b!47993 (= e!30790 tp!6329)))

(assert (= (and start!7480 res!27874) b!47991))

(assert (= (and b!47991 res!27875) b!47992))

(assert (= start!7480 b!47993))

(declare-fun m!41985 () Bool)

(assert (=> start!7480 m!41985))

(declare-fun m!41987 () Bool)

(assert (=> start!7480 m!41987))

(declare-fun m!41989 () Bool)

(assert (=> b!47991 m!41989))

(declare-fun m!41991 () Bool)

(assert (=> b!47992 m!41991))

(push 1)

(assert (not b!47992))

(assert (not start!7480))

(assert (not b!47991))

(assert (not b!47993))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!9515 () Bool)

(declare-fun res!27892 () Bool)

(declare-fun e!30807 () Bool)

(assert (=> d!9515 (=> res!27892 e!30807)))

(assert (=> d!9515 (= res!27892 (and (is-Cons!1273 (toList!633 lm!267)) (= (_1!882 (h!1853 (toList!633 lm!267))) key!657)))))

(assert (=> d!9515 (= (containsKey!99 (toList!633 lm!267) key!657) e!30807)))

(declare-fun b!48016 () Bool)

(declare-fun e!30808 () Bool)

(assert (=> b!48016 (= e!30807 e!30808)))

(declare-fun res!27893 () Bool)

(assert (=> b!48016 (=> (not res!27893) (not e!30808))))

(assert (=> b!48016 (= res!27893 (and (or (not (is-Cons!1273 (toList!633 lm!267))) (bvsle (_1!882 (h!1853 (toList!633 lm!267))) key!657)) (is-Cons!1273 (toList!633 lm!267)) (bvslt (_1!882 (h!1853 (toList!633 lm!267))) key!657)))))

(declare-fun b!48017 () Bool)

(assert (=> b!48017 (= e!30808 (containsKey!99 (t!4305 (toList!633 lm!267)) key!657))))

(assert (= (and d!9515 (not res!27892)) b!48016))

(assert (= (and b!48016 res!27893) b!48017))

(declare-fun m!42009 () Bool)

(assert (=> b!48017 m!42009))

(assert (=> b!47992 d!9515))

(declare-fun d!9517 () Bool)

(declare-fun e!30823 () Bool)

(assert (=> d!9517 e!30823))

(declare-fun res!27903 () Bool)

(assert (=> d!9517 (=> res!27903 e!30823)))

(declare-fun lt!20531 () Bool)

(assert (=> d!9517 (= res!27903 (not lt!20531))))

(declare-fun lt!20534 () Bool)

(assert (=> d!9517 (= lt!20531 lt!20534)))

(declare-datatypes ((Unit!1349 0))(
  ( (Unit!1350) )
))
(declare-fun lt!20533 () Unit!1349)

(declare-fun e!30824 () Unit!1349)

(assert (=> d!9517 (= lt!20533 e!30824)))

(declare-fun c!6456 () Bool)

(assert (=> d!9517 (= c!6456 lt!20534)))

(assert (=> d!9517 (= lt!20534 (containsKey!99 (toList!633 lm!267) key!657))))

(assert (=> d!9517 (= (contains!597 lm!267 key!657) lt!20531)))

(declare-fun b!48037 () Bool)

(declare-fun lt!20532 () Unit!1349)

(assert (=> b!48037 (= e!30824 lt!20532)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!70 (List!1277 (_ BitVec 64)) Unit!1349)

(assert (=> b!48037 (= lt!20532 (lemmaContainsKeyImpliesGetValueByKeyDefined!70 (toList!633 lm!267) key!657))))

(declare-datatypes ((Option!120 0))(
  ( (Some!119 (v!2136 B!920)) (None!118) )
))
(declare-fun isDefined!71 (Option!120) Bool)

(declare-fun getValueByKey!114 (List!1277 (_ BitVec 64)) Option!120)

(assert (=> b!48037 (isDefined!71 (getValueByKey!114 (toList!633 lm!267) key!657))))

(declare-fun b!48038 () Bool)

(declare-fun Unit!1353 () Unit!1349)

(assert (=> b!48038 (= e!30824 Unit!1353)))

(declare-fun b!48039 () Bool)

(assert (=> b!48039 (= e!30823 (isDefined!71 (getValueByKey!114 (toList!633 lm!267) key!657)))))

(assert (= (and d!9517 c!6456) b!48037))

(assert (= (and d!9517 (not c!6456)) b!48038))

(assert (= (and d!9517 (not res!27903)) b!48039))

(assert (=> d!9517 m!41991))

(declare-fun m!42017 () Bool)

(assert (=> b!48037 m!42017))

(declare-fun m!42019 () Bool)

(assert (=> b!48037 m!42019))

(assert (=> b!48037 m!42019))

(declare-fun m!42021 () Bool)

(assert (=> b!48037 m!42021))

(assert (=> b!48039 m!42019))

(assert (=> b!48039 m!42019))

(assert (=> b!48039 m!42021))

(assert (=> start!7480 d!9517))

(declare-fun d!9525 () Bool)

(assert (=> d!9525 (= (inv!2228 lm!267) (isStrictlySorted!250 (toList!633 lm!267)))))

(declare-fun bs!2240 () Bool)

(assert (= bs!2240 d!9525))

(assert (=> bs!2240 m!41989))

(assert (=> start!7480 d!9525))

(declare-fun d!9529 () Bool)

(declare-fun res!27917 () Bool)

(declare-fun e!30841 () Bool)

(assert (=> d!9529 (=> res!27917 e!30841)))

(assert (=> d!9529 (= res!27917 (or (is-Nil!1274 (toList!633 lm!267)) (is-Nil!1274 (t!4305 (toList!633 lm!267)))))))

(assert (=> d!9529 (= (isStrictlySorted!250 (toList!633 lm!267)) e!30841)))

(declare-fun b!48059 () Bool)

(declare-fun e!30842 () Bool)

(assert (=> b!48059 (= e!30841 e!30842)))

(declare-fun res!27918 () Bool)

(assert (=> b!48059 (=> (not res!27918) (not e!30842))))

(assert (=> b!48059 (= res!27918 (bvslt (_1!882 (h!1853 (toList!633 lm!267))) (_1!882 (h!1853 (t!4305 (toList!633 lm!267))))))))

(declare-fun b!48060 () Bool)

(assert (=> b!48060 (= e!30842 (isStrictlySorted!250 (t!4305 (toList!633 lm!267))))))

(assert (= (and d!9529 (not res!27917)) b!48059))

(assert (= (and b!48059 res!27918) b!48060))

(declare-fun m!42031 () Bool)

(assert (=> b!48060 m!42031))

(assert (=> b!47991 d!9529))

(declare-fun b!48071 () Bool)

(declare-fun e!30849 () Bool)

(declare-fun tp_is_empty!2071 () Bool)

(declare-fun tp!6340 () Bool)

(assert (=> b!48071 (= e!30849 (and tp_is_empty!2071 tp!6340))))

(assert (=> b!47993 (= tp!6329 e!30849)))

(assert (= (and b!47993 (is-Cons!1273 (toList!633 lm!267))) b!48071))

(push 1)

