; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1350 () Bool)

(assert start!1350)

(declare-fun b_free!415 () Bool)

(declare-fun b_next!415 () Bool)

(assert (=> start!1350 (= b_free!415 (not b_next!415))))

(declare-fun tp!1674 () Bool)

(declare-fun b_and!621 () Bool)

(assert (=> start!1350 (= tp!1674 b_and!621)))

(declare-fun b!10780 () Bool)

(declare-fun e!6294 () Bool)

(declare-fun tp_is_empty!529 () Bool)

(declare-fun tp!1676 () Bool)

(assert (=> b!10780 (= e!6294 (and tp_is_empty!529 tp!1676))))

(declare-fun b!10782 () Bool)

(declare-fun e!6296 () Bool)

(declare-fun tp!1675 () Bool)

(assert (=> b!10782 (= e!6296 tp!1675)))

(declare-fun b!10783 () Bool)

(declare-fun res!9096 () Bool)

(declare-fun e!6295 () Bool)

(assert (=> b!10783 (=> (not res!9096) (not e!6295))))

(declare-datatypes ((B!356 0))(
  ( (B!357 (val!273 Int)) )
))
(declare-datatypes ((tuple2!346 0))(
  ( (tuple2!347 (_1!173 (_ BitVec 64)) (_2!173 B!356)) )
))
(declare-datatypes ((List!325 0))(
  ( (Nil!322) (Cons!321 (h!887 tuple2!346) (t!2520 List!325)) )
))
(declare-fun kvs!4 () List!325)

(declare-fun isEmpty!54 (List!325) Bool)

(assert (=> b!10783 (= res!9096 (not (isEmpty!54 kvs!4)))))

(declare-fun b!10784 () Bool)

(assert (=> b!10784 (= e!6295 (not (not (= kvs!4 Nil!322))))))

(declare-datatypes ((ListLongMap!327 0))(
  ( (ListLongMap!328 (toList!179 List!325)) )
))
(declare-fun lt!2658 () ListLongMap!327)

(declare-fun lm!227 () ListLongMap!327)

(declare-fun lt!2656 () tuple2!346)

(declare-fun +!17 (ListLongMap!327 tuple2!346) ListLongMap!327)

(assert (=> b!10784 (= lt!2658 (+!17 lm!227 lt!2656))))

(declare-fun p!216 () Int)

(declare-fun forall!44 (List!325 Int) Bool)

(assert (=> b!10784 (forall!44 (toList!179 (+!17 lm!227 (tuple2!347 (_1!173 lt!2656) (_2!173 lt!2656)))) p!216)))

(declare-datatypes ((Unit!219 0))(
  ( (Unit!220) )
))
(declare-fun lt!2657 () Unit!219)

(declare-fun addValidProp!5 (ListLongMap!327 Int (_ BitVec 64) B!356) Unit!219)

(assert (=> b!10784 (= lt!2657 (addValidProp!5 lm!227 p!216 (_1!173 lt!2656) (_2!173 lt!2656)))))

(declare-fun head!761 (List!325) tuple2!346)

(assert (=> b!10784 (= lt!2656 (head!761 kvs!4))))

(declare-fun b!10781 () Bool)

(declare-fun res!9097 () Bool)

(assert (=> b!10781 (=> (not res!9097) (not e!6295))))

(assert (=> b!10781 (= res!9097 (forall!44 kvs!4 p!216))))

(declare-fun res!9095 () Bool)

(assert (=> start!1350 (=> (not res!9095) (not e!6295))))

(assert (=> start!1350 (= res!9095 (forall!44 (toList!179 lm!227) p!216))))

(assert (=> start!1350 e!6295))

(declare-fun inv!518 (ListLongMap!327) Bool)

(assert (=> start!1350 (and (inv!518 lm!227) e!6296)))

(assert (=> start!1350 tp!1674))

(assert (=> start!1350 e!6294))

(assert (= (and start!1350 res!9095) b!10781))

(assert (= (and b!10781 res!9097) b!10783))

(assert (= (and b!10783 res!9096) b!10784))

(assert (= start!1350 b!10782))

(assert (= (and start!1350 (is-Cons!321 kvs!4)) b!10780))

(declare-fun m!6995 () Bool)

(assert (=> b!10783 m!6995))

(declare-fun m!6997 () Bool)

(assert (=> b!10784 m!6997))

(declare-fun m!6999 () Bool)

(assert (=> b!10784 m!6999))

(declare-fun m!7001 () Bool)

(assert (=> b!10784 m!7001))

(declare-fun m!7003 () Bool)

(assert (=> b!10784 m!7003))

(declare-fun m!7005 () Bool)

(assert (=> b!10784 m!7005))

(declare-fun m!7007 () Bool)

(assert (=> b!10781 m!7007))

(declare-fun m!7009 () Bool)

(assert (=> start!1350 m!7009))

(declare-fun m!7011 () Bool)

(assert (=> start!1350 m!7011))

(push 1)

(assert tp_is_empty!529)

(assert b_and!621)

(assert (not b!10782))

(assert (not b!10783))

(assert (not b_next!415))

(assert (not b!10781))

(assert (not b!10784))

(assert (not start!1350))

(assert (not b!10780))

(check-sat)

(pop 1)

(push 1)

(assert b_and!621)

(assert (not b_next!415))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!1217 () Bool)

(declare-fun res!9124 () Bool)

(declare-fun e!6323 () Bool)

(assert (=> d!1217 (=> res!9124 e!6323)))

(assert (=> d!1217 (= res!9124 (is-Nil!322 (toList!179 (+!17 lm!227 (tuple2!347 (_1!173 lt!2656) (_2!173 lt!2656))))))))

(assert (=> d!1217 (= (forall!44 (toList!179 (+!17 lm!227 (tuple2!347 (_1!173 lt!2656) (_2!173 lt!2656)))) p!216) e!6323)))

(declare-fun b!10823 () Bool)

(declare-fun e!6324 () Bool)

(assert (=> b!10823 (= e!6323 e!6324)))

(declare-fun res!9125 () Bool)

(assert (=> b!10823 (=> (not res!9125) (not e!6324))))

(declare-fun dynLambda!58 (Int tuple2!346) Bool)

(assert (=> b!10823 (= res!9125 (dynLambda!58 p!216 (h!887 (toList!179 (+!17 lm!227 (tuple2!347 (_1!173 lt!2656) (_2!173 lt!2656)))))))))

(declare-fun b!10824 () Bool)

(assert (=> b!10824 (= e!6324 (forall!44 (t!2520 (toList!179 (+!17 lm!227 (tuple2!347 (_1!173 lt!2656) (_2!173 lt!2656))))) p!216))))

(assert (= (and d!1217 (not res!9124)) b!10823))

(assert (= (and b!10823 res!9125) b!10824))

(declare-fun b_lambda!455 () Bool)

(assert (=> (not b_lambda!455) (not b!10823)))

(declare-fun t!2524 () Bool)

(declare-fun tb!195 () Bool)

(assert (=> (and start!1350 (= p!216 p!216) t!2524) tb!195))

(declare-fun result!339 () Bool)

(assert (=> tb!195 (= result!339 true)))

(assert (=> b!10823 t!2524))

(declare-fun b_and!627 () Bool)

(assert (= b_and!621 (and (=> t!2524 result!339) b_and!627)))

(declare-fun m!7049 () Bool)

(assert (=> b!10823 m!7049))

(declare-fun m!7054 () Bool)

(assert (=> b!10824 m!7054))

(assert (=> b!10784 d!1217))

(declare-fun d!1223 () Bool)

(declare-fun e!6336 () Bool)

(assert (=> d!1223 e!6336))

(declare-fun res!9144 () Bool)

(assert (=> d!1223 (=> (not res!9144) (not e!6336))))

(declare-fun lt!2704 () ListLongMap!327)

(declare-fun contains!149 (ListLongMap!327 (_ BitVec 64)) Bool)

(assert (=> d!1223 (= res!9144 (contains!149 lt!2704 (_1!173 (tuple2!347 (_1!173 lt!2656) (_2!173 lt!2656)))))))

(declare-fun lt!2705 () List!325)

(assert (=> d!1223 (= lt!2704 (ListLongMap!328 lt!2705))))

(declare-fun lt!2707 () Unit!219)

(declare-fun lt!2706 () Unit!219)

(assert (=> d!1223 (= lt!2707 lt!2706)))

(declare-datatypes ((Option!27 0))(
  ( (Some!26 (v!1341 B!356)) (None!25) )
))
(declare-fun getValueByKey!21 (List!325 (_ BitVec 64)) Option!27)

(assert (=> d!1223 (= (getValueByKey!21 lt!2705 (_1!173 (tuple2!347 (_1!173 lt!2656) (_2!173 lt!2656)))) (Some!26 (_2!173 (tuple2!347 (_1!173 lt!2656) (_2!173 lt!2656)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!5 (List!325 (_ BitVec 64) B!356) Unit!219)

(assert (=> d!1223 (= lt!2706 (lemmaContainsTupThenGetReturnValue!5 lt!2705 (_1!173 (tuple2!347 (_1!173 lt!2656) (_2!173 lt!2656))) (_2!173 (tuple2!347 (_1!173 lt!2656) (_2!173 lt!2656)))))))

(declare-fun insertStrictlySorted!5 (List!325 (_ BitVec 64) B!356) List!325)

(assert (=> d!1223 (= lt!2705 (insertStrictlySorted!5 (toList!179 lm!227) (_1!173 (tuple2!347 (_1!173 lt!2656) (_2!173 lt!2656))) (_2!173 (tuple2!347 (_1!173 lt!2656) (_2!173 lt!2656)))))))

(assert (=> d!1223 (= (+!17 lm!227 (tuple2!347 (_1!173 lt!2656) (_2!173 lt!2656))) lt!2704)))

(declare-fun b!10843 () Bool)

(declare-fun res!9143 () Bool)

(assert (=> b!10843 (=> (not res!9143) (not e!6336))))

(assert (=> b!10843 (= res!9143 (= (getValueByKey!21 (toList!179 lt!2704) (_1!173 (tuple2!347 (_1!173 lt!2656) (_2!173 lt!2656)))) (Some!26 (_2!173 (tuple2!347 (_1!173 lt!2656) (_2!173 lt!2656))))))))

(declare-fun b!10844 () Bool)

(declare-fun contains!150 (List!325 tuple2!346) Bool)

(assert (=> b!10844 (= e!6336 (contains!150 (toList!179 lt!2704) (tuple2!347 (_1!173 lt!2656) (_2!173 lt!2656))))))

(assert (= (and d!1223 res!9144) b!10843))

(assert (= (and b!10843 res!9143) b!10844))

(declare-fun m!7085 () Bool)

(assert (=> d!1223 m!7085))

(declare-fun m!7087 () Bool)

(assert (=> d!1223 m!7087))

(declare-fun m!7089 () Bool)

(assert (=> d!1223 m!7089))

(declare-fun m!7091 () Bool)

(assert (=> d!1223 m!7091))

(declare-fun m!7093 () Bool)

(assert (=> b!10843 m!7093))

(declare-fun m!7095 () Bool)

(assert (=> b!10844 m!7095))

(assert (=> b!10784 d!1223))

(declare-fun d!1233 () Bool)

(assert (=> d!1233 (forall!44 (toList!179 (+!17 lm!227 (tuple2!347 (_1!173 lt!2656) (_2!173 lt!2656)))) p!216)))

(declare-fun lt!2721 () Unit!219)

(declare-fun choose!152 (ListLongMap!327 Int (_ BitVec 64) B!356) Unit!219)

(assert (=> d!1233 (= lt!2721 (choose!152 lm!227 p!216 (_1!173 lt!2656) (_2!173 lt!2656)))))

(declare-fun e!6344 () Bool)

(assert (=> d!1233 e!6344))

(declare-fun res!9154 () Bool)

(assert (=> d!1233 (=> (not res!9154) (not e!6344))))

(assert (=> d!1233 (= res!9154 (forall!44 (toList!179 lm!227) p!216))))

(assert (=> d!1233 (= (addValidProp!5 lm!227 p!216 (_1!173 lt!2656) (_2!173 lt!2656)) lt!2721)))

(declare-fun b!10856 () Bool)

(assert (=> b!10856 (= e!6344 (dynLambda!58 p!216 (tuple2!347 (_1!173 lt!2656) (_2!173 lt!2656))))))

(assert (= (and d!1233 res!9154) b!10856))

(declare-fun b_lambda!463 () Bool)

(assert (=> (not b_lambda!463) (not b!10856)))

(declare-fun t!2532 () Bool)

(declare-fun tb!203 () Bool)

(assert (=> (and start!1350 (= p!216 p!216) t!2532) tb!203))

(declare-fun result!347 () Bool)

(assert (=> tb!203 (= result!347 true)))

(assert (=> b!10856 t!2532))

(declare-fun b_and!635 () Bool)

(assert (= b_and!627 (and (=> t!2532 result!347) b_and!635)))

(assert (=> d!1233 m!6997))

(assert (=> d!1233 m!6999))

(declare-fun m!7111 () Bool)

(assert (=> d!1233 m!7111))

(assert (=> d!1233 m!7009))

(declare-fun m!7115 () Bool)

(assert (=> b!10856 m!7115))

(assert (=> b!10784 d!1233))

(declare-fun d!1239 () Bool)

(assert (=> d!1239 (= (head!761 kvs!4) (h!887 kvs!4))))

(assert (=> b!10784 d!1239))

(declare-fun d!1243 () Bool)

(declare-fun e!6353 () Bool)

(assert (=> d!1243 e!6353))

(declare-fun res!9166 () Bool)

(assert (=> d!1243 (=> (not res!9166) (not e!6353))))

(declare-fun lt!2730 () ListLongMap!327)

(assert (=> d!1243 (= res!9166 (contains!149 lt!2730 (_1!173 lt!2656)))))

(declare-fun lt!2731 () List!325)

(assert (=> d!1243 (= lt!2730 (ListLongMap!328 lt!2731))))

(declare-fun lt!2733 () Unit!219)

(declare-fun lt!2732 () Unit!219)

(assert (=> d!1243 (= lt!2733 lt!2732)))

(assert (=> d!1243 (= (getValueByKey!21 lt!2731 (_1!173 lt!2656)) (Some!26 (_2!173 lt!2656)))))

(assert (=> d!1243 (= lt!2732 (lemmaContainsTupThenGetReturnValue!5 lt!2731 (_1!173 lt!2656) (_2!173 lt!2656)))))

(assert (=> d!1243 (= lt!2731 (insertStrictlySorted!5 (toList!179 lm!227) (_1!173 lt!2656) (_2!173 lt!2656)))))

(assert (=> d!1243 (= (+!17 lm!227 lt!2656) lt!2730)))

(declare-fun b!10867 () Bool)

(declare-fun res!9165 () Bool)

(assert (=> b!10867 (=> (not res!9165) (not e!6353))))

(assert (=> b!10867 (= res!9165 (= (getValueByKey!21 (toList!179 lt!2730) (_1!173 lt!2656)) (Some!26 (_2!173 lt!2656))))))

(declare-fun b!10868 () Bool)

(assert (=> b!10868 (= e!6353 (contains!150 (toList!179 lt!2730) lt!2656))))

(assert (= (and d!1243 res!9166) b!10867))

(assert (= (and b!10867 res!9165) b!10868))

(declare-fun m!7125 () Bool)

(assert (=> d!1243 m!7125))

(declare-fun m!7129 () Bool)

(assert (=> d!1243 m!7129))

(declare-fun m!7133 () Bool)

(assert (=> d!1243 m!7133))

(declare-fun m!7137 () Bool)

(assert (=> d!1243 m!7137))

(declare-fun m!7141 () Bool)

(assert (=> b!10867 m!7141))

(declare-fun m!7143 () Bool)

(assert (=> b!10868 m!7143))

(assert (=> b!10784 d!1243))

(declare-fun d!1249 () Bool)

(assert (=> d!1249 (= (isEmpty!54 kvs!4) (is-Nil!322 kvs!4))))

(assert (=> b!10783 d!1249))

(declare-fun d!1253 () Bool)

(declare-fun res!9171 () Bool)

(declare-fun e!6358 () Bool)

(assert (=> d!1253 (=> res!9171 e!6358)))

(assert (=> d!1253 (= res!9171 (is-Nil!322 (toList!179 lm!227)))))

(assert (=> d!1253 (= (forall!44 (toList!179 lm!227) p!216) e!6358)))

(declare-fun b!10873 () Bool)

(declare-fun e!6359 () Bool)

(assert (=> b!10873 (= e!6358 e!6359)))

(declare-fun res!9172 () Bool)

(assert (=> b!10873 (=> (not res!9172) (not e!6359))))

(assert (=> b!10873 (= res!9172 (dynLambda!58 p!216 (h!887 (toList!179 lm!227))))))

(declare-fun b!10874 () Bool)

(assert (=> b!10874 (= e!6359 (forall!44 (t!2520 (toList!179 lm!227)) p!216))))

(assert (= (and d!1253 (not res!9171)) b!10873))

(assert (= (and b!10873 res!9172) b!10874))

(declare-fun b_lambda!471 () Bool)

(assert (=> (not b_lambda!471) (not b!10873)))

(declare-fun t!2540 () Bool)

(declare-fun tb!211 () Bool)

(assert (=> (and start!1350 (= p!216 p!216) t!2540) tb!211))

(declare-fun result!355 () Bool)

(assert (=> tb!211 (= result!355 true)))

(assert (=> b!10873 t!2540))

(declare-fun b_and!643 () Bool)

(assert (= b_and!635 (and (=> t!2540 result!355) b_and!643)))

(declare-fun m!7153 () Bool)

(assert (=> b!10873 m!7153))

(declare-fun m!7155 () Bool)

(assert (=> b!10874 m!7155))

(assert (=> start!1350 d!1253))

(declare-fun d!1259 () Bool)

(declare-fun isStrictlySorted!33 (List!325) Bool)

(assert (=> d!1259 (= (inv!518 lm!227) (isStrictlySorted!33 (toList!179 lm!227)))))

(declare-fun bs!406 () Bool)

(assert (= bs!406 d!1259))

(declare-fun m!7163 () Bool)

(assert (=> bs!406 m!7163))

(assert (=> start!1350 d!1259))

(declare-fun d!1267 () Bool)

(declare-fun res!9175 () Bool)

(declare-fun e!6362 () Bool)

(assert (=> d!1267 (=> res!9175 e!6362)))

(assert (=> d!1267 (= res!9175 (is-Nil!322 kvs!4))))

(assert (=> d!1267 (= (forall!44 kvs!4 p!216) e!6362)))

(declare-fun b!10877 () Bool)

(declare-fun e!6363 () Bool)

(assert (=> b!10877 (= e!6362 e!6363)))

(declare-fun res!9176 () Bool)

(assert (=> b!10877 (=> (not res!9176) (not e!6363))))

(assert (=> b!10877 (= res!9176 (dynLambda!58 p!216 (h!887 kvs!4)))))

(declare-fun b!10878 () Bool)

(assert (=> b!10878 (= e!6363 (forall!44 (t!2520 kvs!4) p!216))))

(assert (= (and d!1267 (not res!9175)) b!10877))

(assert (= (and b!10877 res!9176) b!10878))

(declare-fun b_lambda!475 () Bool)

(assert (=> (not b_lambda!475) (not b!10877)))

(declare-fun t!2544 () Bool)

(declare-fun tb!215 () Bool)

(assert (=> (and start!1350 (= p!216 p!216) t!2544) tb!215))

(declare-fun result!359 () Bool)

(assert (=> tb!215 (= result!359 true)))

(assert (=> b!10877 t!2544))

(declare-fun b_and!647 () Bool)

(assert (= b_and!643 (and (=> t!2544 result!359) b_and!647)))

(declare-fun m!7165 () Bool)

(assert (=> b!10877 m!7165))

(declare-fun m!7169 () Bool)

(assert (=> b!10878 m!7169))

(assert (=> b!10781 d!1267))

(declare-fun b!10895 () Bool)

(declare-fun e!6373 () Bool)

(declare-fun tp!1703 () Bool)

(assert (=> b!10895 (= e!6373 (and tp_is_empty!529 tp!1703))))

(assert (=> b!10780 (= tp!1676 e!6373)))

(assert (= (and b!10780 (is-Cons!321 (t!2520 kvs!4))) b!10895))

(declare-fun b!10896 () Bool)

(declare-fun e!6375 () Bool)

(declare-fun tp!1704 () Bool)

(assert (=> b!10896 (= e!6375 (and tp_is_empty!529 tp!1704))))

(assert (=> b!10782 (= tp!1675 e!6375)))

(assert (= (and b!10782 (is-Cons!321 (toList!179 lm!227))) b!10896))

(declare-fun b_lambda!483 () Bool)

(assert (= b_lambda!471 (or (and start!1350 b_free!415) b_lambda!483)))

(declare-fun b_lambda!487 () Bool)

(assert (= b_lambda!475 (or (and start!1350 b_free!415) b_lambda!487)))

(declare-fun b_lambda!491 () Bool)

(assert (= b_lambda!463 (or (and start!1350 b_free!415) b_lambda!491)))

(declare-fun b_lambda!497 () Bool)

(assert (= b_lambda!455 (or (and start!1350 b_free!415) b_lambda!497)))

