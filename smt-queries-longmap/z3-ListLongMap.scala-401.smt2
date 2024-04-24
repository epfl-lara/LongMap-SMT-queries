; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7486 () Bool)

(assert start!7486)

(declare-fun res!27850 () Bool)

(declare-fun e!30753 () Bool)

(assert (=> start!7486 (=> (not res!27850) (not e!30753))))

(declare-datatypes ((B!920 0))(
  ( (B!921 (val!1080 Int)) )
))
(declare-datatypes ((tuple2!1724 0))(
  ( (tuple2!1725 (_1!873 (_ BitVec 64)) (_2!873 B!920)) )
))
(declare-datatypes ((List!1263 0))(
  ( (Nil!1260) (Cons!1259 (h!1839 tuple2!1724) (t!4291 List!1263)) )
))
(declare-datatypes ((ListLongMap!1211 0))(
  ( (ListLongMap!1212 (toList!621 List!1263)) )
))
(declare-fun lm!267 () ListLongMap!1211)

(declare-fun key!657 () (_ BitVec 64))

(declare-fun contains!588 (ListLongMap!1211 (_ BitVec 64)) Bool)

(assert (=> start!7486 (= res!27850 (not (contains!588 lm!267 key!657)))))

(assert (=> start!7486 e!30753))

(declare-fun e!30752 () Bool)

(declare-fun inv!2228 (ListLongMap!1211) Bool)

(assert (=> start!7486 (and (inv!2228 lm!267) e!30752)))

(assert (=> start!7486 true))

(declare-fun b!47934 () Bool)

(declare-fun res!27849 () Bool)

(assert (=> b!47934 (=> (not res!27849) (not e!30753))))

(declare-fun isStrictlySorted!238 (List!1263) Bool)

(assert (=> b!47934 (= res!27849 (isStrictlySorted!238 (toList!621 lm!267)))))

(declare-fun b!47935 () Bool)

(declare-fun containsKey!99 (List!1263 (_ BitVec 64)) Bool)

(assert (=> b!47935 (= e!30753 (containsKey!99 (toList!621 lm!267) key!657))))

(declare-fun b!47936 () Bool)

(declare-fun tp!6329 () Bool)

(assert (=> b!47936 (= e!30752 tp!6329)))

(assert (= (and start!7486 res!27850) b!47934))

(assert (= (and b!47934 res!27849) b!47935))

(assert (= start!7486 b!47936))

(declare-fun m!41861 () Bool)

(assert (=> start!7486 m!41861))

(declare-fun m!41863 () Bool)

(assert (=> start!7486 m!41863))

(declare-fun m!41865 () Bool)

(assert (=> b!47934 m!41865))

(declare-fun m!41867 () Bool)

(assert (=> b!47935 m!41867))

(check-sat (not start!7486) (not b!47934) (not b!47935) (not b!47936))
(check-sat)
(get-model)

(declare-fun d!9501 () Bool)

(declare-fun e!30775 () Bool)

(assert (=> d!9501 e!30775))

(declare-fun res!27865 () Bool)

(assert (=> d!9501 (=> res!27865 e!30775)))

(declare-fun lt!20488 () Bool)

(assert (=> d!9501 (= res!27865 (not lt!20488))))

(declare-fun lt!20491 () Bool)

(assert (=> d!9501 (= lt!20488 lt!20491)))

(declare-datatypes ((Unit!1357 0))(
  ( (Unit!1358) )
))
(declare-fun lt!20490 () Unit!1357)

(declare-fun e!30774 () Unit!1357)

(assert (=> d!9501 (= lt!20490 e!30774)))

(declare-fun c!6441 () Bool)

(assert (=> d!9501 (= c!6441 lt!20491)))

(assert (=> d!9501 (= lt!20491 (containsKey!99 (toList!621 lm!267) key!657))))

(assert (=> d!9501 (= (contains!588 lm!267 key!657) lt!20488)))

(declare-fun b!47969 () Bool)

(declare-fun lt!20489 () Unit!1357)

(assert (=> b!47969 (= e!30774 lt!20489)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!69 (List!1263 (_ BitVec 64)) Unit!1357)

(assert (=> b!47969 (= lt!20489 (lemmaContainsKeyImpliesGetValueByKeyDefined!69 (toList!621 lm!267) key!657))))

(declare-datatypes ((Option!120 0))(
  ( (Some!119 (v!2136 B!920)) (None!118) )
))
(declare-fun isDefined!70 (Option!120) Bool)

(declare-fun getValueByKey!114 (List!1263 (_ BitVec 64)) Option!120)

(assert (=> b!47969 (isDefined!70 (getValueByKey!114 (toList!621 lm!267) key!657))))

(declare-fun b!47970 () Bool)

(declare-fun Unit!1359 () Unit!1357)

(assert (=> b!47970 (= e!30774 Unit!1359)))

(declare-fun b!47971 () Bool)

(assert (=> b!47971 (= e!30775 (isDefined!70 (getValueByKey!114 (toList!621 lm!267) key!657)))))

(assert (= (and d!9501 c!6441) b!47969))

(assert (= (and d!9501 (not c!6441)) b!47970))

(assert (= (and d!9501 (not res!27865)) b!47971))

(assert (=> d!9501 m!41867))

(declare-fun m!41885 () Bool)

(assert (=> b!47969 m!41885))

(declare-fun m!41887 () Bool)

(assert (=> b!47969 m!41887))

(assert (=> b!47969 m!41887))

(declare-fun m!41889 () Bool)

(assert (=> b!47969 m!41889))

(assert (=> b!47971 m!41887))

(assert (=> b!47971 m!41887))

(assert (=> b!47971 m!41889))

(assert (=> start!7486 d!9501))

(declare-fun d!9507 () Bool)

(assert (=> d!9507 (= (inv!2228 lm!267) (isStrictlySorted!238 (toList!621 lm!267)))))

(declare-fun bs!2239 () Bool)

(assert (= bs!2239 d!9507))

(assert (=> bs!2239 m!41865))

(assert (=> start!7486 d!9507))

(declare-fun d!9509 () Bool)

(declare-fun res!27876 () Bool)

(declare-fun e!30788 () Bool)

(assert (=> d!9509 (=> res!27876 e!30788)))

(get-info :version)

(assert (=> d!9509 (= res!27876 (or ((_ is Nil!1260) (toList!621 lm!267)) ((_ is Nil!1260) (t!4291 (toList!621 lm!267)))))))

(assert (=> d!9509 (= (isStrictlySorted!238 (toList!621 lm!267)) e!30788)))

(declare-fun b!47986 () Bool)

(declare-fun e!30789 () Bool)

(assert (=> b!47986 (= e!30788 e!30789)))

(declare-fun res!27877 () Bool)

(assert (=> b!47986 (=> (not res!27877) (not e!30789))))

(assert (=> b!47986 (= res!27877 (bvslt (_1!873 (h!1839 (toList!621 lm!267))) (_1!873 (h!1839 (t!4291 (toList!621 lm!267))))))))

(declare-fun b!47987 () Bool)

(assert (=> b!47987 (= e!30789 (isStrictlySorted!238 (t!4291 (toList!621 lm!267))))))

(assert (= (and d!9509 (not res!27876)) b!47986))

(assert (= (and b!47986 res!27877) b!47987))

(declare-fun m!41903 () Bool)

(assert (=> b!47987 m!41903))

(assert (=> b!47934 d!9509))

(declare-fun d!9515 () Bool)

(declare-fun res!27886 () Bool)

(declare-fun e!30798 () Bool)

(assert (=> d!9515 (=> res!27886 e!30798)))

(assert (=> d!9515 (= res!27886 (and ((_ is Cons!1259) (toList!621 lm!267)) (= (_1!873 (h!1839 (toList!621 lm!267))) key!657)))))

(assert (=> d!9515 (= (containsKey!99 (toList!621 lm!267) key!657) e!30798)))

(declare-fun b!47992 () Bool)

(declare-fun e!30799 () Bool)

(assert (=> b!47992 (= e!30798 e!30799)))

(declare-fun res!27887 () Bool)

(assert (=> b!47992 (=> (not res!27887) (not e!30799))))

(assert (=> b!47992 (= res!27887 (and (or (not ((_ is Cons!1259) (toList!621 lm!267))) (bvsle (_1!873 (h!1839 (toList!621 lm!267))) key!657)) ((_ is Cons!1259) (toList!621 lm!267)) (bvslt (_1!873 (h!1839 (toList!621 lm!267))) key!657)))))

(declare-fun b!47993 () Bool)

(assert (=> b!47993 (= e!30799 (containsKey!99 (t!4291 (toList!621 lm!267)) key!657))))

(assert (= (and d!9515 (not res!27886)) b!47992))

(assert (= (and b!47992 res!27887) b!47993))

(declare-fun m!41905 () Bool)

(assert (=> b!47993 m!41905))

(assert (=> b!47935 d!9515))

(declare-fun b!48006 () Bool)

(declare-fun e!30806 () Bool)

(declare-fun tp_is_empty!2071 () Bool)

(declare-fun tp!6338 () Bool)

(assert (=> b!48006 (= e!30806 (and tp_is_empty!2071 tp!6338))))

(assert (=> b!47936 (= tp!6329 e!30806)))

(assert (= (and b!47936 ((_ is Cons!1259) (toList!621 lm!267))) b!48006))

(check-sat (not b!47987) tp_is_empty!2071 (not b!47969) (not b!47971) (not b!48006) (not d!9501) (not d!9507) (not b!47993))
(check-sat)
