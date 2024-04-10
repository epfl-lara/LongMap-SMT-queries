; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1352 () Bool)

(assert start!1352)

(declare-fun b_free!417 () Bool)

(declare-fun b_next!417 () Bool)

(assert (=> start!1352 (= b_free!417 (not b_next!417))))

(declare-fun tp!1685 () Bool)

(declare-fun b_and!623 () Bool)

(assert (=> start!1352 (= tp!1685 b_and!623)))

(declare-fun b!10795 () Bool)

(declare-fun e!6305 () Bool)

(declare-fun tp!1683 () Bool)

(assert (=> b!10795 (= e!6305 tp!1683)))

(declare-fun b!10796 () Bool)

(declare-fun e!6303 () Bool)

(declare-fun tp_is_empty!531 () Bool)

(declare-fun tp!1684 () Bool)

(assert (=> b!10796 (= e!6303 (and tp_is_empty!531 tp!1684))))

(declare-fun b!10798 () Bool)

(declare-fun e!6304 () Bool)

(declare-datatypes ((B!358 0))(
  ( (B!359 (val!274 Int)) )
))
(declare-datatypes ((tuple2!348 0))(
  ( (tuple2!349 (_1!174 (_ BitVec 64)) (_2!174 B!358)) )
))
(declare-datatypes ((List!326 0))(
  ( (Nil!323) (Cons!322 (h!888 tuple2!348) (t!2521 List!326)) )
))
(declare-fun kvs!4 () List!326)

(assert (=> b!10798 (= e!6304 (not (not (= kvs!4 Nil!323))))))

(declare-datatypes ((ListLongMap!329 0))(
  ( (ListLongMap!330 (toList!180 List!326)) )
))
(declare-fun lt!2665 () ListLongMap!329)

(declare-fun lm!227 () ListLongMap!329)

(declare-fun lt!2667 () tuple2!348)

(declare-fun +!18 (ListLongMap!329 tuple2!348) ListLongMap!329)

(assert (=> b!10798 (= lt!2665 (+!18 lm!227 lt!2667))))

(declare-fun p!216 () Int)

(declare-fun forall!45 (List!326 Int) Bool)

(assert (=> b!10798 (forall!45 (toList!180 (+!18 lm!227 (tuple2!349 (_1!174 lt!2667) (_2!174 lt!2667)))) p!216)))

(declare-datatypes ((Unit!221 0))(
  ( (Unit!222) )
))
(declare-fun lt!2666 () Unit!221)

(declare-fun addValidProp!6 (ListLongMap!329 Int (_ BitVec 64) B!358) Unit!221)

(assert (=> b!10798 (= lt!2666 (addValidProp!6 lm!227 p!216 (_1!174 lt!2667) (_2!174 lt!2667)))))

(declare-fun head!762 (List!326) tuple2!348)

(assert (=> b!10798 (= lt!2667 (head!762 kvs!4))))

(declare-fun b!10799 () Bool)

(declare-fun res!9105 () Bool)

(assert (=> b!10799 (=> (not res!9105) (not e!6304))))

(declare-fun isEmpty!55 (List!326) Bool)

(assert (=> b!10799 (= res!9105 (not (isEmpty!55 kvs!4)))))

(declare-fun res!9106 () Bool)

(assert (=> start!1352 (=> (not res!9106) (not e!6304))))

(assert (=> start!1352 (= res!9106 (forall!45 (toList!180 lm!227) p!216))))

(assert (=> start!1352 e!6304))

(declare-fun inv!519 (ListLongMap!329) Bool)

(assert (=> start!1352 (and (inv!519 lm!227) e!6305)))

(assert (=> start!1352 tp!1685))

(assert (=> start!1352 e!6303))

(declare-fun b!10797 () Bool)

(declare-fun res!9104 () Bool)

(assert (=> b!10797 (=> (not res!9104) (not e!6304))))

(assert (=> b!10797 (= res!9104 (forall!45 kvs!4 p!216))))

(assert (= (and start!1352 res!9106) b!10797))

(assert (= (and b!10797 res!9104) b!10799))

(assert (= (and b!10799 res!9105) b!10798))

(assert (= start!1352 b!10795))

(get-info :version)

(assert (= (and start!1352 ((_ is Cons!322) kvs!4)) b!10796))

(declare-fun m!7013 () Bool)

(assert (=> b!10798 m!7013))

(declare-fun m!7015 () Bool)

(assert (=> b!10798 m!7015))

(declare-fun m!7017 () Bool)

(assert (=> b!10798 m!7017))

(declare-fun m!7019 () Bool)

(assert (=> b!10798 m!7019))

(declare-fun m!7021 () Bool)

(assert (=> b!10798 m!7021))

(declare-fun m!7023 () Bool)

(assert (=> b!10799 m!7023))

(declare-fun m!7025 () Bool)

(assert (=> start!1352 m!7025))

(declare-fun m!7027 () Bool)

(assert (=> start!1352 m!7027))

(declare-fun m!7029 () Bool)

(assert (=> b!10797 m!7029))

(check-sat tp_is_empty!531 (not start!1352) (not b!10799) (not b!10797) (not b_next!417) b_and!623 (not b!10798) (not b!10795) (not b!10796))
(check-sat b_and!623 (not b_next!417))
(get-model)

(declare-fun d!1219 () Bool)

(declare-fun e!6331 () Bool)

(assert (=> d!1219 e!6331))

(declare-fun res!9134 () Bool)

(assert (=> d!1219 (=> (not res!9134) (not e!6331))))

(declare-fun lt!2687 () ListLongMap!329)

(declare-fun contains!147 (ListLongMap!329 (_ BitVec 64)) Bool)

(assert (=> d!1219 (= res!9134 (contains!147 lt!2687 (_1!174 (tuple2!349 (_1!174 lt!2667) (_2!174 lt!2667)))))))

(declare-fun lt!2690 () List!326)

(assert (=> d!1219 (= lt!2687 (ListLongMap!330 lt!2690))))

(declare-fun lt!2688 () Unit!221)

(declare-fun lt!2689 () Unit!221)

(assert (=> d!1219 (= lt!2688 lt!2689)))

(declare-datatypes ((Option!26 0))(
  ( (Some!25 (v!1340 B!358)) (None!24) )
))
(declare-fun getValueByKey!20 (List!326 (_ BitVec 64)) Option!26)

(assert (=> d!1219 (= (getValueByKey!20 lt!2690 (_1!174 (tuple2!349 (_1!174 lt!2667) (_2!174 lt!2667)))) (Some!25 (_2!174 (tuple2!349 (_1!174 lt!2667) (_2!174 lt!2667)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!4 (List!326 (_ BitVec 64) B!358) Unit!221)

(assert (=> d!1219 (= lt!2689 (lemmaContainsTupThenGetReturnValue!4 lt!2690 (_1!174 (tuple2!349 (_1!174 lt!2667) (_2!174 lt!2667))) (_2!174 (tuple2!349 (_1!174 lt!2667) (_2!174 lt!2667)))))))

(declare-fun insertStrictlySorted!4 (List!326 (_ BitVec 64) B!358) List!326)

(assert (=> d!1219 (= lt!2690 (insertStrictlySorted!4 (toList!180 lm!227) (_1!174 (tuple2!349 (_1!174 lt!2667) (_2!174 lt!2667))) (_2!174 (tuple2!349 (_1!174 lt!2667) (_2!174 lt!2667)))))))

(assert (=> d!1219 (= (+!18 lm!227 (tuple2!349 (_1!174 lt!2667) (_2!174 lt!2667))) lt!2687)))

(declare-fun b!10834 () Bool)

(declare-fun res!9135 () Bool)

(assert (=> b!10834 (=> (not res!9135) (not e!6331))))

(assert (=> b!10834 (= res!9135 (= (getValueByKey!20 (toList!180 lt!2687) (_1!174 (tuple2!349 (_1!174 lt!2667) (_2!174 lt!2667)))) (Some!25 (_2!174 (tuple2!349 (_1!174 lt!2667) (_2!174 lt!2667))))))))

(declare-fun b!10835 () Bool)

(declare-fun contains!148 (List!326 tuple2!348) Bool)

(assert (=> b!10835 (= e!6331 (contains!148 (toList!180 lt!2687) (tuple2!349 (_1!174 lt!2667) (_2!174 lt!2667))))))

(assert (= (and d!1219 res!9134) b!10834))

(assert (= (and b!10834 res!9135) b!10835))

(declare-fun m!7057 () Bool)

(assert (=> d!1219 m!7057))

(declare-fun m!7059 () Bool)

(assert (=> d!1219 m!7059))

(declare-fun m!7061 () Bool)

(assert (=> d!1219 m!7061))

(declare-fun m!7063 () Bool)

(assert (=> d!1219 m!7063))

(declare-fun m!7065 () Bool)

(assert (=> b!10834 m!7065))

(declare-fun m!7067 () Bool)

(assert (=> b!10835 m!7067))

(assert (=> b!10798 d!1219))

(declare-fun d!1227 () Bool)

(declare-fun e!6332 () Bool)

(assert (=> d!1227 e!6332))

(declare-fun res!9136 () Bool)

(assert (=> d!1227 (=> (not res!9136) (not e!6332))))

(declare-fun lt!2699 () ListLongMap!329)

(assert (=> d!1227 (= res!9136 (contains!147 lt!2699 (_1!174 lt!2667)))))

(declare-fun lt!2702 () List!326)

(assert (=> d!1227 (= lt!2699 (ListLongMap!330 lt!2702))))

(declare-fun lt!2700 () Unit!221)

(declare-fun lt!2701 () Unit!221)

(assert (=> d!1227 (= lt!2700 lt!2701)))

(assert (=> d!1227 (= (getValueByKey!20 lt!2702 (_1!174 lt!2667)) (Some!25 (_2!174 lt!2667)))))

(assert (=> d!1227 (= lt!2701 (lemmaContainsTupThenGetReturnValue!4 lt!2702 (_1!174 lt!2667) (_2!174 lt!2667)))))

(assert (=> d!1227 (= lt!2702 (insertStrictlySorted!4 (toList!180 lm!227) (_1!174 lt!2667) (_2!174 lt!2667)))))

(assert (=> d!1227 (= (+!18 lm!227 lt!2667) lt!2699)))

(declare-fun b!10836 () Bool)

(declare-fun res!9137 () Bool)

(assert (=> b!10836 (=> (not res!9137) (not e!6332))))

(assert (=> b!10836 (= res!9137 (= (getValueByKey!20 (toList!180 lt!2699) (_1!174 lt!2667)) (Some!25 (_2!174 lt!2667))))))

(declare-fun b!10837 () Bool)

(assert (=> b!10837 (= e!6332 (contains!148 (toList!180 lt!2699) lt!2667))))

(assert (= (and d!1227 res!9136) b!10836))

(assert (= (and b!10836 res!9137) b!10837))

(declare-fun m!7069 () Bool)

(assert (=> d!1227 m!7069))

(declare-fun m!7071 () Bool)

(assert (=> d!1227 m!7071))

(declare-fun m!7073 () Bool)

(assert (=> d!1227 m!7073))

(declare-fun m!7075 () Bool)

(assert (=> d!1227 m!7075))

(declare-fun m!7077 () Bool)

(assert (=> b!10836 m!7077))

(declare-fun m!7079 () Bool)

(assert (=> b!10837 m!7079))

(assert (=> b!10798 d!1227))

(declare-fun d!1229 () Bool)

(assert (=> d!1229 (forall!45 (toList!180 (+!18 lm!227 (tuple2!349 (_1!174 lt!2667) (_2!174 lt!2667)))) p!216)))

(declare-fun lt!2718 () Unit!221)

(declare-fun choose!151 (ListLongMap!329 Int (_ BitVec 64) B!358) Unit!221)

(assert (=> d!1229 (= lt!2718 (choose!151 lm!227 p!216 (_1!174 lt!2667) (_2!174 lt!2667)))))

(declare-fun e!6339 () Bool)

(assert (=> d!1229 e!6339))

(declare-fun res!9147 () Bool)

(assert (=> d!1229 (=> (not res!9147) (not e!6339))))

(assert (=> d!1229 (= res!9147 (forall!45 (toList!180 lm!227) p!216))))

(assert (=> d!1229 (= (addValidProp!6 lm!227 p!216 (_1!174 lt!2667) (_2!174 lt!2667)) lt!2718)))

(declare-fun b!10848 () Bool)

(declare-fun dynLambda!60 (Int tuple2!348) Bool)

(assert (=> b!10848 (= e!6339 (dynLambda!60 p!216 (tuple2!349 (_1!174 lt!2667) (_2!174 lt!2667))))))

(assert (= (and d!1229 res!9147) b!10848))

(declare-fun b_lambda!461 () Bool)

(assert (=> (not b_lambda!461) (not b!10848)))

(declare-fun t!2530 () Bool)

(declare-fun tb!201 () Bool)

(assert (=> (and start!1352 (= p!216 p!216) t!2530) tb!201))

(declare-fun result!345 () Bool)

(assert (=> tb!201 (= result!345 true)))

(assert (=> b!10848 t!2530))

(declare-fun b_and!633 () Bool)

(assert (= b_and!623 (and (=> t!2530 result!345) b_and!633)))

(assert (=> d!1229 m!7019))

(assert (=> d!1229 m!7015))

(declare-fun m!7097 () Bool)

(assert (=> d!1229 m!7097))

(assert (=> d!1229 m!7025))

(declare-fun m!7099 () Bool)

(assert (=> b!10848 m!7099))

(assert (=> b!10798 d!1229))

(declare-fun d!1235 () Bool)

(declare-fun res!9161 () Bool)

(declare-fun e!6350 () Bool)

(assert (=> d!1235 (=> res!9161 e!6350)))

(assert (=> d!1235 (= res!9161 ((_ is Nil!323) (toList!180 (+!18 lm!227 (tuple2!349 (_1!174 lt!2667) (_2!174 lt!2667))))))))

(assert (=> d!1235 (= (forall!45 (toList!180 (+!18 lm!227 (tuple2!349 (_1!174 lt!2667) (_2!174 lt!2667)))) p!216) e!6350)))

(declare-fun b!10863 () Bool)

(declare-fun e!6351 () Bool)

(assert (=> b!10863 (= e!6350 e!6351)))

(declare-fun res!9162 () Bool)

(assert (=> b!10863 (=> (not res!9162) (not e!6351))))

(assert (=> b!10863 (= res!9162 (dynLambda!60 p!216 (h!888 (toList!180 (+!18 lm!227 (tuple2!349 (_1!174 lt!2667) (_2!174 lt!2667)))))))))

(declare-fun b!10864 () Bool)

(assert (=> b!10864 (= e!6351 (forall!45 (t!2521 (toList!180 (+!18 lm!227 (tuple2!349 (_1!174 lt!2667) (_2!174 lt!2667))))) p!216))))

(assert (= (and d!1235 (not res!9161)) b!10863))

(assert (= (and b!10863 res!9162) b!10864))

(declare-fun b_lambda!465 () Bool)

(assert (=> (not b_lambda!465) (not b!10863)))

(declare-fun t!2534 () Bool)

(declare-fun tb!205 () Bool)

(assert (=> (and start!1352 (= p!216 p!216) t!2534) tb!205))

(declare-fun result!349 () Bool)

(assert (=> tb!205 (= result!349 true)))

(assert (=> b!10863 t!2534))

(declare-fun b_and!637 () Bool)

(assert (= b_and!633 (and (=> t!2534 result!349) b_and!637)))

(declare-fun m!7117 () Bool)

(assert (=> b!10863 m!7117))

(declare-fun m!7119 () Bool)

(assert (=> b!10864 m!7119))

(assert (=> b!10798 d!1235))

(declare-fun d!1245 () Bool)

(assert (=> d!1245 (= (head!762 kvs!4) (h!888 kvs!4))))

(assert (=> b!10798 d!1245))

(declare-fun d!1251 () Bool)

(declare-fun res!9169 () Bool)

(declare-fun e!6356 () Bool)

(assert (=> d!1251 (=> res!9169 e!6356)))

(assert (=> d!1251 (= res!9169 ((_ is Nil!323) (toList!180 lm!227)))))

(assert (=> d!1251 (= (forall!45 (toList!180 lm!227) p!216) e!6356)))

(declare-fun b!10871 () Bool)

(declare-fun e!6357 () Bool)

(assert (=> b!10871 (= e!6356 e!6357)))

(declare-fun res!9170 () Bool)

(assert (=> b!10871 (=> (not res!9170) (not e!6357))))

(assert (=> b!10871 (= res!9170 (dynLambda!60 p!216 (h!888 (toList!180 lm!227))))))

(declare-fun b!10872 () Bool)

(assert (=> b!10872 (= e!6357 (forall!45 (t!2521 (toList!180 lm!227)) p!216))))

(assert (= (and d!1251 (not res!9169)) b!10871))

(assert (= (and b!10871 res!9170) b!10872))

(declare-fun b_lambda!469 () Bool)

(assert (=> (not b_lambda!469) (not b!10871)))

(declare-fun t!2538 () Bool)

(declare-fun tb!209 () Bool)

(assert (=> (and start!1352 (= p!216 p!216) t!2538) tb!209))

(declare-fun result!353 () Bool)

(assert (=> tb!209 (= result!353 true)))

(assert (=> b!10871 t!2538))

(declare-fun b_and!641 () Bool)

(assert (= b_and!637 (and (=> t!2538 result!353) b_and!641)))

(declare-fun m!7149 () Bool)

(assert (=> b!10871 m!7149))

(declare-fun m!7151 () Bool)

(assert (=> b!10872 m!7151))

(assert (=> start!1352 d!1251))

(declare-fun d!1257 () Bool)

(declare-fun isStrictlySorted!32 (List!326) Bool)

(assert (=> d!1257 (= (inv!519 lm!227) (isStrictlySorted!32 (toList!180 lm!227)))))

(declare-fun bs!405 () Bool)

(assert (= bs!405 d!1257))

(declare-fun m!7161 () Bool)

(assert (=> bs!405 m!7161))

(assert (=> start!1352 d!1257))

(declare-fun d!1265 () Bool)

(assert (=> d!1265 (= (isEmpty!55 kvs!4) ((_ is Nil!323) kvs!4))))

(assert (=> b!10799 d!1265))

(declare-fun d!1269 () Bool)

(declare-fun res!9177 () Bool)

(declare-fun e!6364 () Bool)

(assert (=> d!1269 (=> res!9177 e!6364)))

(assert (=> d!1269 (= res!9177 ((_ is Nil!323) kvs!4))))

(assert (=> d!1269 (= (forall!45 kvs!4 p!216) e!6364)))

(declare-fun b!10879 () Bool)

(declare-fun e!6365 () Bool)

(assert (=> b!10879 (= e!6364 e!6365)))

(declare-fun res!9178 () Bool)

(assert (=> b!10879 (=> (not res!9178) (not e!6365))))

(assert (=> b!10879 (= res!9178 (dynLambda!60 p!216 (h!888 kvs!4)))))

(declare-fun b!10880 () Bool)

(assert (=> b!10880 (= e!6365 (forall!45 (t!2521 kvs!4) p!216))))

(assert (= (and d!1269 (not res!9177)) b!10879))

(assert (= (and b!10879 res!9178) b!10880))

(declare-fun b_lambda!477 () Bool)

(assert (=> (not b_lambda!477) (not b!10879)))

(declare-fun t!2546 () Bool)

(declare-fun tb!217 () Bool)

(assert (=> (and start!1352 (= p!216 p!216) t!2546) tb!217))

(declare-fun result!361 () Bool)

(assert (=> tb!217 (= result!361 true)))

(assert (=> b!10879 t!2546))

(declare-fun b_and!649 () Bool)

(assert (= b_and!641 (and (=> t!2546 result!361) b_and!649)))

(declare-fun m!7171 () Bool)

(assert (=> b!10879 m!7171))

(declare-fun m!7173 () Bool)

(assert (=> b!10880 m!7173))

(assert (=> b!10797 d!1269))

(declare-fun b!10894 () Bool)

(declare-fun e!6374 () Bool)

(declare-fun tp!1702 () Bool)

(assert (=> b!10894 (= e!6374 (and tp_is_empty!531 tp!1702))))

(assert (=> b!10795 (= tp!1683 e!6374)))

(assert (= (and b!10795 ((_ is Cons!322) (toList!180 lm!227))) b!10894))

(declare-fun b!10897 () Bool)

(declare-fun e!6376 () Bool)

(declare-fun tp!1705 () Bool)

(assert (=> b!10897 (= e!6376 (and tp_is_empty!531 tp!1705))))

(assert (=> b!10796 (= tp!1684 e!6376)))

(assert (= (and b!10796 ((_ is Cons!322) (t!2521 kvs!4))) b!10897))

(declare-fun b_lambda!480 () Bool)

(assert (= b_lambda!465 (or (and start!1352 b_free!417) b_lambda!480)))

(declare-fun b_lambda!488 () Bool)

(assert (= b_lambda!461 (or (and start!1352 b_free!417) b_lambda!488)))

(declare-fun b_lambda!493 () Bool)

(assert (= b_lambda!477 (or (and start!1352 b_free!417) b_lambda!493)))

(declare-fun b_lambda!499 () Bool)

(assert (= b_lambda!469 (or (and start!1352 b_free!417) b_lambda!499)))

(check-sat (not b!10872) (not b!10894) (not b_lambda!488) (not b_next!417) (not d!1227) (not b!10837) (not b!10864) (not d!1229) (not b_lambda!480) tp_is_empty!531 (not b!10880) (not d!1219) (not b!10897) (not b_lambda!499) (not d!1257) (not b_lambda!493) (not b!10834) (not b!10836) b_and!649 (not b!10835))
(check-sat b_and!649 (not b_next!417))
