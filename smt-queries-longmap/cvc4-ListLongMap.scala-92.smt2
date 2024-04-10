; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1354 () Bool)

(assert start!1354)

(declare-fun b_free!419 () Bool)

(declare-fun b_next!419 () Bool)

(assert (=> start!1354 (= b_free!419 (not b_next!419))))

(declare-fun tp!1693 () Bool)

(declare-fun b_and!625 () Bool)

(assert (=> start!1354 (= tp!1693 b_and!625)))

(declare-fun b!10810 () Bool)

(declare-fun e!6313 () Bool)

(declare-fun tp_is_empty!533 () Bool)

(declare-fun tp!1694 () Bool)

(assert (=> b!10810 (= e!6313 (and tp_is_empty!533 tp!1694))))

(declare-fun b!10811 () Bool)

(declare-fun e!6314 () Bool)

(declare-fun tp!1692 () Bool)

(assert (=> b!10811 (= e!6314 tp!1692)))

(declare-fun b!10812 () Bool)

(declare-fun res!9115 () Bool)

(declare-fun e!6312 () Bool)

(assert (=> b!10812 (=> (not res!9115) (not e!6312))))

(declare-datatypes ((B!360 0))(
  ( (B!361 (val!275 Int)) )
))
(declare-datatypes ((tuple2!350 0))(
  ( (tuple2!351 (_1!175 (_ BitVec 64)) (_2!175 B!360)) )
))
(declare-datatypes ((List!327 0))(
  ( (Nil!324) (Cons!323 (h!889 tuple2!350) (t!2522 List!327)) )
))
(declare-fun kvs!4 () List!327)

(declare-fun p!216 () Int)

(declare-fun forall!46 (List!327 Int) Bool)

(assert (=> b!10812 (= res!9115 (forall!46 kvs!4 p!216))))

(declare-fun res!9113 () Bool)

(assert (=> start!1354 (=> (not res!9113) (not e!6312))))

(declare-datatypes ((ListLongMap!331 0))(
  ( (ListLongMap!332 (toList!181 List!327)) )
))
(declare-fun lm!227 () ListLongMap!331)

(assert (=> start!1354 (= res!9113 (forall!46 (toList!181 lm!227) p!216))))

(assert (=> start!1354 e!6312))

(declare-fun inv!520 (ListLongMap!331) Bool)

(assert (=> start!1354 (and (inv!520 lm!227) e!6314)))

(assert (=> start!1354 tp!1693))

(assert (=> start!1354 e!6313))

(declare-fun b!10813 () Bool)

(declare-fun res!9114 () Bool)

(assert (=> b!10813 (=> (not res!9114) (not e!6312))))

(declare-fun isEmpty!56 (List!327) Bool)

(assert (=> b!10813 (= res!9114 (not (isEmpty!56 kvs!4)))))

(declare-fun b!10814 () Bool)

(assert (=> b!10814 (= e!6312 (not (not (= kvs!4 Nil!324))))))

(declare-fun lt!2676 () ListLongMap!331)

(declare-fun lt!2675 () tuple2!350)

(declare-fun +!19 (ListLongMap!331 tuple2!350) ListLongMap!331)

(assert (=> b!10814 (= lt!2676 (+!19 lm!227 lt!2675))))

(assert (=> b!10814 (forall!46 (toList!181 (+!19 lm!227 (tuple2!351 (_1!175 lt!2675) (_2!175 lt!2675)))) p!216)))

(declare-datatypes ((Unit!223 0))(
  ( (Unit!224) )
))
(declare-fun lt!2674 () Unit!223)

(declare-fun addValidProp!7 (ListLongMap!331 Int (_ BitVec 64) B!360) Unit!223)

(assert (=> b!10814 (= lt!2674 (addValidProp!7 lm!227 p!216 (_1!175 lt!2675) (_2!175 lt!2675)))))

(declare-fun head!763 (List!327) tuple2!350)

(assert (=> b!10814 (= lt!2675 (head!763 kvs!4))))

(assert (= (and start!1354 res!9113) b!10812))

(assert (= (and b!10812 res!9115) b!10813))

(assert (= (and b!10813 res!9114) b!10814))

(assert (= start!1354 b!10811))

(assert (= (and start!1354 (is-Cons!323 kvs!4)) b!10810))

(declare-fun m!7031 () Bool)

(assert (=> b!10812 m!7031))

(declare-fun m!7033 () Bool)

(assert (=> start!1354 m!7033))

(declare-fun m!7035 () Bool)

(assert (=> start!1354 m!7035))

(declare-fun m!7037 () Bool)

(assert (=> b!10813 m!7037))

(declare-fun m!7039 () Bool)

(assert (=> b!10814 m!7039))

(declare-fun m!7041 () Bool)

(assert (=> b!10814 m!7041))

(declare-fun m!7043 () Bool)

(assert (=> b!10814 m!7043))

(declare-fun m!7045 () Bool)

(assert (=> b!10814 m!7045))

(declare-fun m!7047 () Bool)

(assert (=> b!10814 m!7047))

(push 1)

(assert (not b!10810))

(assert (not b_next!419))

(assert (not b!10813))

(assert b_and!625)

(assert (not start!1354))

(assert (not b!10814))

(assert tp_is_empty!533)

(assert (not b!10812))

(assert (not b!10811))

(check-sat)

(pop 1)

(push 1)

(assert b_and!625)

(assert (not b_next!419))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!1221 () Bool)

(declare-fun res!9126 () Bool)

(declare-fun e!6325 () Bool)

(assert (=> d!1221 (=> res!9126 e!6325)))

(assert (=> d!1221 (= res!9126 (is-Nil!324 kvs!4))))

(assert (=> d!1221 (= (forall!46 kvs!4 p!216) e!6325)))

(declare-fun b!10825 () Bool)

(declare-fun e!6326 () Bool)

(assert (=> b!10825 (= e!6325 e!6326)))

(declare-fun res!9127 () Bool)

(assert (=> b!10825 (=> (not res!9127) (not e!6326))))

(declare-fun dynLambda!59 (Int tuple2!350) Bool)

(assert (=> b!10825 (= res!9127 (dynLambda!59 p!216 (h!889 kvs!4)))))

(declare-fun b!10826 () Bool)

(assert (=> b!10826 (= e!6326 (forall!46 (t!2522 kvs!4) p!216))))

(assert (= (and d!1221 (not res!9126)) b!10825))

(assert (= (and b!10825 res!9127) b!10826))

(declare-fun b_lambda!457 () Bool)

(assert (=> (not b_lambda!457) (not b!10825)))

(declare-fun t!2526 () Bool)

(declare-fun tb!197 () Bool)

(assert (=> (and start!1354 (= p!216 p!216) t!2526) tb!197))

(declare-fun result!341 () Bool)

(assert (=> tb!197 (= result!341 true)))

(assert (=> b!10825 t!2526))

(declare-fun b_and!629 () Bool)

(assert (= b_and!625 (and (=> t!2526 result!341) b_and!629)))

(declare-fun m!7051 () Bool)

(assert (=> b!10825 m!7051))

(declare-fun m!7055 () Bool)

(assert (=> b!10826 m!7055))

(assert (=> b!10812 d!1221))

(declare-fun d!1225 () Bool)

(assert (=> d!1225 (forall!46 (toList!181 (+!19 lm!227 (tuple2!351 (_1!175 lt!2675) (_2!175 lt!2675)))) p!216)))

(declare-fun lt!2703 () Unit!223)

(declare-fun choose!150 (ListLongMap!331 Int (_ BitVec 64) B!360) Unit!223)

(assert (=> d!1225 (= lt!2703 (choose!150 lm!227 p!216 (_1!175 lt!2675) (_2!175 lt!2675)))))

(declare-fun e!6335 () Bool)

(assert (=> d!1225 e!6335))

(declare-fun res!9142 () Bool)

(assert (=> d!1225 (=> (not res!9142) (not e!6335))))

(assert (=> d!1225 (= res!9142 (forall!46 (toList!181 lm!227) p!216))))

(assert (=> d!1225 (= (addValidProp!7 lm!227 p!216 (_1!175 lt!2675) (_2!175 lt!2675)) lt!2703)))

(declare-fun b!10840 () Bool)

(assert (=> b!10840 (= e!6335 (dynLambda!59 p!216 (tuple2!351 (_1!175 lt!2675) (_2!175 lt!2675))))))

(assert (= (and d!1225 res!9142) b!10840))

(declare-fun b_lambda!459 () Bool)

(assert (=> (not b_lambda!459) (not b!10840)))

(declare-fun t!2528 () Bool)

(declare-fun tb!199 () Bool)

(assert (=> (and start!1354 (= p!216 p!216) t!2528) tb!199))

(declare-fun result!343 () Bool)

(assert (=> tb!199 (= result!343 true)))

(assert (=> b!10840 t!2528))

(declare-fun b_and!631 () Bool)

(assert (= b_and!629 (and (=> t!2528 result!343) b_and!631)))

(assert (=> d!1225 m!7039))

(assert (=> d!1225 m!7043))

(declare-fun m!7081 () Bool)

(assert (=> d!1225 m!7081))

(assert (=> d!1225 m!7033))

(declare-fun m!7083 () Bool)

(assert (=> b!10840 m!7083))

(assert (=> b!10814 d!1225))

(declare-fun d!1231 () Bool)

(declare-fun e!6347 () Bool)

(assert (=> d!1231 e!6347))

(declare-fun res!9158 () Bool)

(assert (=> d!1231 (=> (not res!9158) (not e!6347))))

(declare-fun lt!2724 () ListLongMap!331)

(declare-fun contains!151 (ListLongMap!331 (_ BitVec 64)) Bool)

(assert (=> d!1231 (= res!9158 (contains!151 lt!2724 (_1!175 (tuple2!351 (_1!175 lt!2675) (_2!175 lt!2675)))))))

(declare-fun lt!2725 () List!327)

(assert (=> d!1231 (= lt!2724 (ListLongMap!332 lt!2725))))

(declare-fun lt!2722 () Unit!223)

(declare-fun lt!2723 () Unit!223)

(assert (=> d!1231 (= lt!2722 lt!2723)))

(declare-datatypes ((Option!28 0))(
  ( (Some!27 (v!1342 B!360)) (None!26) )
))
(declare-fun getValueByKey!22 (List!327 (_ BitVec 64)) Option!28)

(assert (=> d!1231 (= (getValueByKey!22 lt!2725 (_1!175 (tuple2!351 (_1!175 lt!2675) (_2!175 lt!2675)))) (Some!27 (_2!175 (tuple2!351 (_1!175 lt!2675) (_2!175 lt!2675)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!6 (List!327 (_ BitVec 64) B!360) Unit!223)

(assert (=> d!1231 (= lt!2723 (lemmaContainsTupThenGetReturnValue!6 lt!2725 (_1!175 (tuple2!351 (_1!175 lt!2675) (_2!175 lt!2675))) (_2!175 (tuple2!351 (_1!175 lt!2675) (_2!175 lt!2675)))))))

(declare-fun insertStrictlySorted!6 (List!327 (_ BitVec 64) B!360) List!327)

(assert (=> d!1231 (= lt!2725 (insertStrictlySorted!6 (toList!181 lm!227) (_1!175 (tuple2!351 (_1!175 lt!2675) (_2!175 lt!2675))) (_2!175 (tuple2!351 (_1!175 lt!2675) (_2!175 lt!2675)))))))

(assert (=> d!1231 (= (+!19 lm!227 (tuple2!351 (_1!175 lt!2675) (_2!175 lt!2675))) lt!2724)))

(declare-fun b!10859 () Bool)

(declare-fun res!9157 () Bool)

(assert (=> b!10859 (=> (not res!9157) (not e!6347))))

(assert (=> b!10859 (= res!9157 (= (getValueByKey!22 (toList!181 lt!2724) (_1!175 (tuple2!351 (_1!175 lt!2675) (_2!175 lt!2675)))) (Some!27 (_2!175 (tuple2!351 (_1!175 lt!2675) (_2!175 lt!2675))))))))

(declare-fun b!10860 () Bool)

(declare-fun contains!152 (List!327 tuple2!350) Bool)

(assert (=> b!10860 (= e!6347 (contains!152 (toList!181 lt!2724) (tuple2!351 (_1!175 lt!2675) (_2!175 lt!2675))))))

(assert (= (and d!1231 res!9158) b!10859))

(assert (= (and b!10859 res!9157) b!10860))

(declare-fun m!7101 () Bool)

(assert (=> d!1231 m!7101))

(declare-fun m!7103 () Bool)

(assert (=> d!1231 m!7103))

(declare-fun m!7105 () Bool)

(assert (=> d!1231 m!7105))

(declare-fun m!7107 () Bool)

(assert (=> d!1231 m!7107))

(declare-fun m!7109 () Bool)

(assert (=> b!10859 m!7109))

(declare-fun m!7113 () Bool)

(assert (=> b!10860 m!7113))

(assert (=> b!10814 d!1231))

(declare-fun d!1237 () Bool)

(assert (=> d!1237 (= (head!763 kvs!4) (h!889 kvs!4))))

(assert (=> b!10814 d!1237))

(declare-fun d!1241 () Bool)

(declare-fun e!6352 () Bool)

(assert (=> d!1241 e!6352))

(declare-fun res!9164 () Bool)

(assert (=> d!1241 (=> (not res!9164) (not e!6352))))

(declare-fun lt!2728 () ListLongMap!331)

(assert (=> d!1241 (= res!9164 (contains!151 lt!2728 (_1!175 lt!2675)))))

(declare-fun lt!2729 () List!327)

(assert (=> d!1241 (= lt!2728 (ListLongMap!332 lt!2729))))

(declare-fun lt!2726 () Unit!223)

(declare-fun lt!2727 () Unit!223)

(assert (=> d!1241 (= lt!2726 lt!2727)))

(assert (=> d!1241 (= (getValueByKey!22 lt!2729 (_1!175 lt!2675)) (Some!27 (_2!175 lt!2675)))))

(assert (=> d!1241 (= lt!2727 (lemmaContainsTupThenGetReturnValue!6 lt!2729 (_1!175 lt!2675) (_2!175 lt!2675)))))

(assert (=> d!1241 (= lt!2729 (insertStrictlySorted!6 (toList!181 lm!227) (_1!175 lt!2675) (_2!175 lt!2675)))))

(assert (=> d!1241 (= (+!19 lm!227 lt!2675) lt!2728)))

(declare-fun b!10865 () Bool)

(declare-fun res!9163 () Bool)

(assert (=> b!10865 (=> (not res!9163) (not e!6352))))

(assert (=> b!10865 (= res!9163 (= (getValueByKey!22 (toList!181 lt!2728) (_1!175 lt!2675)) (Some!27 (_2!175 lt!2675))))))

(declare-fun b!10866 () Bool)

(assert (=> b!10866 (= e!6352 (contains!152 (toList!181 lt!2728) lt!2675))))

(assert (= (and d!1241 res!9164) b!10865))

(assert (= (and b!10865 res!9163) b!10866))

(declare-fun m!7121 () Bool)

(assert (=> d!1241 m!7121))

(declare-fun m!7123 () Bool)

(assert (=> d!1241 m!7123))

(declare-fun m!7127 () Bool)

(assert (=> d!1241 m!7127))

(declare-fun m!7131 () Bool)

(assert (=> d!1241 m!7131))

(declare-fun m!7135 () Bool)

(assert (=> b!10865 m!7135))

(declare-fun m!7139 () Bool)

(assert (=> b!10866 m!7139))

(assert (=> b!10814 d!1241))

(declare-fun d!1247 () Bool)

(declare-fun res!9167 () Bool)

(declare-fun e!6354 () Bool)

(assert (=> d!1247 (=> res!9167 e!6354)))

