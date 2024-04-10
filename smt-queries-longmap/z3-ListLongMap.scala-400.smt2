; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7458 () Bool)

(assert start!7458)

(declare-fun res!27839 () Bool)

(declare-fun e!30732 () Bool)

(assert (=> start!7458 (=> (not res!27839) (not e!30732))))

(declare-datatypes ((B!916 0))(
  ( (B!917 (val!1078 Int)) )
))
(declare-datatypes ((tuple2!1738 0))(
  ( (tuple2!1739 (_1!880 (_ BitVec 64)) (_2!880 B!916)) )
))
(declare-datatypes ((List!1275 0))(
  ( (Nil!1272) (Cons!1271 (h!1851 tuple2!1738) (t!4303 List!1275)) )
))
(declare-datatypes ((ListLongMap!1231 0))(
  ( (ListLongMap!1232 (toList!631 List!1275)) )
))
(declare-fun lm!267 () ListLongMap!1231)

(declare-fun key!657 () (_ BitVec 64))

(declare-fun contains!595 (ListLongMap!1231 (_ BitVec 64)) Bool)

(assert (=> start!7458 (= res!27839 (not (contains!595 lm!267 key!657)))))

(assert (=> start!7458 e!30732))

(declare-fun e!30733 () Bool)

(declare-fun inv!2221 (ListLongMap!1231) Bool)

(assert (=> start!7458 (and (inv!2221 lm!267) e!30733)))

(assert (=> start!7458 true))

(declare-fun b!47917 () Bool)

(declare-fun isStrictlySorted!248 (List!1275) Bool)

(assert (=> b!47917 (= e!30732 (not (isStrictlySorted!248 (toList!631 lm!267))))))

(declare-fun b!47918 () Bool)

(declare-fun tp!6314 () Bool)

(assert (=> b!47918 (= e!30733 tp!6314)))

(assert (= (and start!7458 res!27839) b!47917))

(assert (= start!7458 b!47918))

(declare-fun m!41943 () Bool)

(assert (=> start!7458 m!41943))

(declare-fun m!41945 () Bool)

(assert (=> start!7458 m!41945))

(declare-fun m!41947 () Bool)

(assert (=> b!47917 m!41947))

(check-sat (not start!7458) (not b!47917) (not b!47918))
(check-sat)
(get-model)

(declare-fun d!9497 () Bool)

(declare-fun e!30761 () Bool)

(assert (=> d!9497 e!30761))

(declare-fun res!27858 () Bool)

(assert (=> d!9497 (=> res!27858 e!30761)))

(declare-fun lt!20498 () Bool)

(assert (=> d!9497 (= res!27858 (not lt!20498))))

(declare-fun lt!20496 () Bool)

(assert (=> d!9497 (= lt!20498 lt!20496)))

(declare-datatypes ((Unit!1339 0))(
  ( (Unit!1340) )
))
(declare-fun lt!20495 () Unit!1339)

(declare-fun e!30760 () Unit!1339)

(assert (=> d!9497 (= lt!20495 e!30760)))

(declare-fun c!6447 () Bool)

(assert (=> d!9497 (= c!6447 lt!20496)))

(declare-fun containsKey!97 (List!1275 (_ BitVec 64)) Bool)

(assert (=> d!9497 (= lt!20496 (containsKey!97 (toList!631 lm!267) key!657))))

(assert (=> d!9497 (= (contains!595 lm!267 key!657) lt!20498)))

(declare-fun b!47950 () Bool)

(declare-fun lt!20497 () Unit!1339)

(assert (=> b!47950 (= e!30760 lt!20497)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!67 (List!1275 (_ BitVec 64)) Unit!1339)

(assert (=> b!47950 (= lt!20497 (lemmaContainsKeyImpliesGetValueByKeyDefined!67 (toList!631 lm!267) key!657))))

(declare-datatypes ((Option!117 0))(
  ( (Some!116 (v!2133 B!916)) (None!115) )
))
(declare-fun isDefined!68 (Option!117) Bool)

(declare-fun getValueByKey!111 (List!1275 (_ BitVec 64)) Option!117)

(assert (=> b!47950 (isDefined!68 (getValueByKey!111 (toList!631 lm!267) key!657))))

(declare-fun b!47951 () Bool)

(declare-fun Unit!1342 () Unit!1339)

(assert (=> b!47951 (= e!30760 Unit!1342)))

(declare-fun b!47952 () Bool)

(assert (=> b!47952 (= e!30761 (isDefined!68 (getValueByKey!111 (toList!631 lm!267) key!657)))))

(assert (= (and d!9497 c!6447) b!47950))

(assert (= (and d!9497 (not c!6447)) b!47951))

(assert (= (and d!9497 (not res!27858)) b!47952))

(declare-fun m!41965 () Bool)

(assert (=> d!9497 m!41965))

(declare-fun m!41967 () Bool)

(assert (=> b!47950 m!41967))

(declare-fun m!41969 () Bool)

(assert (=> b!47950 m!41969))

(assert (=> b!47950 m!41969))

(declare-fun m!41971 () Bool)

(assert (=> b!47950 m!41971))

(assert (=> b!47952 m!41969))

(assert (=> b!47952 m!41969))

(assert (=> b!47952 m!41971))

(assert (=> start!7458 d!9497))

(declare-fun d!9505 () Bool)

(assert (=> d!9505 (= (inv!2221 lm!267) (isStrictlySorted!248 (toList!631 lm!267)))))

(declare-fun bs!2234 () Bool)

(assert (= bs!2234 d!9505))

(assert (=> bs!2234 m!41947))

(assert (=> start!7458 d!9505))

(declare-fun d!9507 () Bool)

(declare-fun res!27868 () Bool)

(declare-fun e!30777 () Bool)

(assert (=> d!9507 (=> res!27868 e!30777)))

(get-info :version)

(assert (=> d!9507 (= res!27868 (or ((_ is Nil!1272) (toList!631 lm!267)) ((_ is Nil!1272) (t!4303 (toList!631 lm!267)))))))

(assert (=> d!9507 (= (isStrictlySorted!248 (toList!631 lm!267)) e!30777)))

(declare-fun b!47973 () Bool)

(declare-fun e!30778 () Bool)

(assert (=> b!47973 (= e!30777 e!30778)))

(declare-fun res!27869 () Bool)

(assert (=> b!47973 (=> (not res!27869) (not e!30778))))

(assert (=> b!47973 (= res!27869 (bvslt (_1!880 (h!1851 (toList!631 lm!267))) (_1!880 (h!1851 (t!4303 (toList!631 lm!267))))))))

(declare-fun b!47974 () Bool)

(assert (=> b!47974 (= e!30778 (isStrictlySorted!248 (t!4303 (toList!631 lm!267))))))

(assert (= (and d!9507 (not res!27868)) b!47973))

(assert (= (and b!47973 res!27869) b!47974))

(declare-fun m!41983 () Bool)

(assert (=> b!47974 m!41983))

(assert (=> b!47917 d!9507))

(declare-fun b!47984 () Bool)

(declare-fun e!30784 () Bool)

(declare-fun tp_is_empty!2069 () Bool)

(declare-fun tp!6326 () Bool)

(assert (=> b!47984 (= e!30784 (and tp_is_empty!2069 tp!6326))))

(assert (=> b!47918 (= tp!6314 e!30784)))

(assert (= (and b!47918 ((_ is Cons!1271) (toList!631 lm!267))) b!47984))

(check-sat tp_is_empty!2069 (not b!47950) (not d!9505) (not b!47952) (not d!9497) (not b!47974) (not b!47984))
(check-sat)
