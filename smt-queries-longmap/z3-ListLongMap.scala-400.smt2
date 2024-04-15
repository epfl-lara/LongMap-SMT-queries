; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7458 () Bool)

(assert start!7458)

(declare-fun res!27816 () Bool)

(declare-fun e!30683 () Bool)

(assert (=> start!7458 (=> (not res!27816) (not e!30683))))

(declare-datatypes ((B!914 0))(
  ( (B!915 (val!1077 Int)) )
))
(declare-datatypes ((tuple2!1740 0))(
  ( (tuple2!1741 (_1!881 (_ BitVec 64)) (_2!881 B!914)) )
))
(declare-datatypes ((List!1270 0))(
  ( (Nil!1267) (Cons!1266 (h!1846 tuple2!1740) (t!4297 List!1270)) )
))
(declare-datatypes ((ListLongMap!1221 0))(
  ( (ListLongMap!1222 (toList!626 List!1270)) )
))
(declare-fun lm!267 () ListLongMap!1221)

(declare-fun key!657 () (_ BitVec 64))

(declare-fun contains!591 (ListLongMap!1221 (_ BitVec 64)) Bool)

(assert (=> start!7458 (= res!27816 (not (contains!591 lm!267 key!657)))))

(assert (=> start!7458 e!30683))

(declare-fun e!30684 () Bool)

(declare-fun inv!2220 (ListLongMap!1221) Bool)

(assert (=> start!7458 (and (inv!2220 lm!267) e!30684)))

(assert (=> start!7458 true))

(declare-fun b!47845 () Bool)

(declare-fun isStrictlySorted!242 (List!1270) Bool)

(assert (=> b!47845 (= e!30683 (not (isStrictlySorted!242 (toList!626 lm!267))))))

(declare-fun b!47846 () Bool)

(declare-fun tp!6311 () Bool)

(assert (=> b!47846 (= e!30684 tp!6311)))

(assert (= (and start!7458 res!27816) b!47845))

(assert (= start!7458 b!47846))

(declare-fun m!41855 () Bool)

(assert (=> start!7458 m!41855))

(declare-fun m!41857 () Bool)

(assert (=> start!7458 m!41857))

(declare-fun m!41859 () Bool)

(assert (=> b!47845 m!41859))

(check-sat (not start!7458) (not b!47845) (not b!47846))
(check-sat)
(get-model)

(declare-fun d!9467 () Bool)

(declare-fun e!30712 () Bool)

(assert (=> d!9467 e!30712))

(declare-fun res!27833 () Bool)

(assert (=> d!9467 (=> res!27833 e!30712)))

(declare-fun lt!20476 () Bool)

(assert (=> d!9467 (= res!27833 (not lt!20476))))

(declare-fun lt!20478 () Bool)

(assert (=> d!9467 (= lt!20476 lt!20478)))

(declare-datatypes ((Unit!1342 0))(
  ( (Unit!1343) )
))
(declare-fun lt!20477 () Unit!1342)

(declare-fun e!30711 () Unit!1342)

(assert (=> d!9467 (= lt!20477 e!30711)))

(declare-fun c!6423 () Bool)

(assert (=> d!9467 (= c!6423 lt!20478)))

(declare-fun containsKey!94 (List!1270 (_ BitVec 64)) Bool)

(assert (=> d!9467 (= lt!20478 (containsKey!94 (toList!626 lm!267) key!657))))

(assert (=> d!9467 (= (contains!591 lm!267 key!657) lt!20476)))

(declare-fun b!47877 () Bool)

(declare-fun lt!20475 () Unit!1342)

(assert (=> b!47877 (= e!30711 lt!20475)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!65 (List!1270 (_ BitVec 64)) Unit!1342)

(assert (=> b!47877 (= lt!20475 (lemmaContainsKeyImpliesGetValueByKeyDefined!65 (toList!626 lm!267) key!657))))

(declare-datatypes ((Option!114 0))(
  ( (Some!113 (v!2130 B!914)) (None!112) )
))
(declare-fun isDefined!66 (Option!114) Bool)

(declare-fun getValueByKey!108 (List!1270 (_ BitVec 64)) Option!114)

(assert (=> b!47877 (isDefined!66 (getValueByKey!108 (toList!626 lm!267) key!657))))

(declare-fun b!47878 () Bool)

(declare-fun Unit!1346 () Unit!1342)

(assert (=> b!47878 (= e!30711 Unit!1346)))

(declare-fun b!47879 () Bool)

(assert (=> b!47879 (= e!30712 (isDefined!66 (getValueByKey!108 (toList!626 lm!267) key!657)))))

(assert (= (and d!9467 c!6423) b!47877))

(assert (= (and d!9467 (not c!6423)) b!47878))

(assert (= (and d!9467 (not res!27833)) b!47879))

(declare-fun m!41875 () Bool)

(assert (=> d!9467 m!41875))

(declare-fun m!41877 () Bool)

(assert (=> b!47877 m!41877))

(declare-fun m!41879 () Bool)

(assert (=> b!47877 m!41879))

(assert (=> b!47877 m!41879))

(declare-fun m!41881 () Bool)

(assert (=> b!47877 m!41881))

(assert (=> b!47879 m!41879))

(assert (=> b!47879 m!41879))

(assert (=> b!47879 m!41881))

(assert (=> start!7458 d!9467))

(declare-fun d!9475 () Bool)

(assert (=> d!9475 (= (inv!2220 lm!267) (isStrictlySorted!242 (toList!626 lm!267)))))

(declare-fun bs!2232 () Bool)

(assert (= bs!2232 d!9475))

(assert (=> bs!2232 m!41859))

(assert (=> start!7458 d!9475))

(declare-fun d!9477 () Bool)

(declare-fun res!27842 () Bool)

(declare-fun e!30725 () Bool)

(assert (=> d!9477 (=> res!27842 e!30725)))

(get-info :version)

(assert (=> d!9477 (= res!27842 (or ((_ is Nil!1267) (toList!626 lm!267)) ((_ is Nil!1267) (t!4297 (toList!626 lm!267)))))))

(assert (=> d!9477 (= (isStrictlySorted!242 (toList!626 lm!267)) e!30725)))

(declare-fun b!47896 () Bool)

(declare-fun e!30726 () Bool)

(assert (=> b!47896 (= e!30725 e!30726)))

(declare-fun res!27843 () Bool)

(assert (=> b!47896 (=> (not res!27843) (not e!30726))))

(assert (=> b!47896 (= res!27843 (bvslt (_1!881 (h!1846 (toList!626 lm!267))) (_1!881 (h!1846 (t!4297 (toList!626 lm!267))))))))

(declare-fun b!47897 () Bool)

(assert (=> b!47897 (= e!30726 (isStrictlySorted!242 (t!4297 (toList!626 lm!267))))))

(assert (= (and d!9477 (not res!27842)) b!47896))

(assert (= (and b!47896 res!27843) b!47897))

(declare-fun m!41899 () Bool)

(assert (=> b!47897 m!41899))

(assert (=> b!47845 d!9477))

(declare-fun b!47911 () Bool)

(declare-fun e!30736 () Bool)

(declare-fun tp_is_empty!2067 () Bool)

(declare-fun tp!6323 () Bool)

(assert (=> b!47911 (= e!30736 (and tp_is_empty!2067 tp!6323))))

(assert (=> b!47846 (= tp!6311 e!30736)))

(assert (= (and b!47846 ((_ is Cons!1266) (toList!626 lm!267))) b!47911))

(check-sat (not d!9467) (not b!47879) (not b!47877) (not d!9475) (not b!47911) tp_is_empty!2067 (not b!47897))
(check-sat)
