; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1308 () Bool)

(assert start!1308)

(declare-fun b_free!409 () Bool)

(declare-fun b_next!409 () Bool)

(assert (=> start!1308 (= b_free!409 (not b_next!409))))

(declare-fun tp!1636 () Bool)

(declare-fun b_and!591 () Bool)

(assert (=> start!1308 (= tp!1636 b_and!591)))

(declare-fun b!10657 () Bool)

(declare-fun e!6208 () Bool)

(declare-fun tp_is_empty!523 () Bool)

(declare-fun tp!1635 () Bool)

(assert (=> b!10657 (= e!6208 (and tp_is_empty!523 tp!1635))))

(declare-fun b!10658 () Bool)

(declare-fun e!6209 () Bool)

(declare-fun tp!1637 () Bool)

(assert (=> b!10658 (= e!6209 tp!1637)))

(declare-fun b!10659 () Bool)

(declare-fun e!6207 () Bool)

(declare-datatypes ((B!350 0))(
  ( (B!351 (val!270 Int)) )
))
(declare-datatypes ((tuple2!340 0))(
  ( (tuple2!341 (_1!170 (_ BitVec 64)) (_2!170 B!350)) )
))
(declare-datatypes ((List!322 0))(
  ( (Nil!319) (Cons!318 (h!884 tuple2!340) (t!2493 List!322)) )
))
(declare-fun kvs!4 () List!322)

(assert (=> b!10659 (= e!6207 (not (not (= kvs!4 Nil!319))))))

(declare-datatypes ((ListLongMap!321 0))(
  ( (ListLongMap!322 (toList!176 List!322)) )
))
(declare-fun lm!227 () ListLongMap!321)

(declare-fun lt!2592 () tuple2!340)

(declare-fun p!216 () Int)

(declare-fun forall!41 (List!322 Int) Bool)

(declare-fun +!14 (ListLongMap!321 tuple2!340) ListLongMap!321)

(assert (=> b!10659 (forall!41 (toList!176 (+!14 lm!227 (tuple2!341 (_1!170 lt!2592) (_2!170 lt!2592)))) p!216)))

(declare-datatypes ((Unit!213 0))(
  ( (Unit!214) )
))
(declare-fun lt!2591 () Unit!213)

(declare-fun addValidProp!2 (ListLongMap!321 Int (_ BitVec 64) B!350) Unit!213)

(assert (=> b!10659 (= lt!2591 (addValidProp!2 lm!227 p!216 (_1!170 lt!2592) (_2!170 lt!2592)))))

(declare-fun head!758 (List!322) tuple2!340)

(assert (=> b!10659 (= lt!2592 (head!758 kvs!4))))

(declare-fun b!10660 () Bool)

(declare-fun res!9011 () Bool)

(assert (=> b!10660 (=> (not res!9011) (not e!6207))))

(assert (=> b!10660 (= res!9011 (forall!41 kvs!4 p!216))))

(declare-fun res!9013 () Bool)

(assert (=> start!1308 (=> (not res!9013) (not e!6207))))

(assert (=> start!1308 (= res!9013 (forall!41 (toList!176 lm!227) p!216))))

(assert (=> start!1308 e!6207))

(declare-fun inv!510 (ListLongMap!321) Bool)

(assert (=> start!1308 (and (inv!510 lm!227) e!6209)))

(assert (=> start!1308 tp!1636))

(assert (=> start!1308 e!6208))

(declare-fun b!10661 () Bool)

(declare-fun res!9012 () Bool)

(assert (=> b!10661 (=> (not res!9012) (not e!6207))))

(declare-fun isEmpty!51 (List!322) Bool)

(assert (=> b!10661 (= res!9012 (not (isEmpty!51 kvs!4)))))

(assert (= (and start!1308 res!9013) b!10660))

(assert (= (and b!10660 res!9011) b!10661))

(assert (= (and b!10661 res!9012) b!10659))

(assert (= start!1308 b!10658))

(assert (= (and start!1308 (is-Cons!318 kvs!4)) b!10657))

(declare-fun m!6857 () Bool)

(assert (=> b!10659 m!6857))

(declare-fun m!6859 () Bool)

(assert (=> b!10659 m!6859))

(declare-fun m!6861 () Bool)

(assert (=> b!10659 m!6861))

(declare-fun m!6863 () Bool)

(assert (=> b!10659 m!6863))

(declare-fun m!6865 () Bool)

(assert (=> b!10660 m!6865))

(declare-fun m!6867 () Bool)

(assert (=> start!1308 m!6867))

(declare-fun m!6869 () Bool)

(assert (=> start!1308 m!6869))

(declare-fun m!6871 () Bool)

(assert (=> b!10661 m!6871))

(push 1)

(assert (not b!10658))

(assert (not b_next!409))

(assert (not b!10657))

(assert (not b!10659))

(assert (not b!10660))

(assert (not start!1308))

(assert b_and!591)

(assert (not b!10661))

(assert tp_is_empty!523)

(check-sat)

(pop 1)

(push 1)

(assert b_and!591)

(assert (not b_next!409))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!1169 () Bool)

(assert (=> d!1169 (= (isEmpty!51 kvs!4) (is-Nil!319 kvs!4))))

(assert (=> b!10661 d!1169))

(declare-fun d!1181 () Bool)

(declare-fun res!9054 () Bool)

(declare-fun e!6250 () Bool)

(assert (=> d!1181 (=> res!9054 e!6250)))

(assert (=> d!1181 (= res!9054 (is-Nil!319 (toList!176 lm!227)))))

(assert (=> d!1181 (= (forall!41 (toList!176 lm!227) p!216) e!6250)))

(declare-fun b!10714 () Bool)

(declare-fun e!6251 () Bool)

(assert (=> b!10714 (= e!6250 e!6251)))

(declare-fun res!9055 () Bool)

(assert (=> b!10714 (=> (not res!9055) (not e!6251))))

(declare-fun dynLambda!57 (Int tuple2!340) Bool)

(assert (=> b!10714 (= res!9055 (dynLambda!57 p!216 (h!884 (toList!176 lm!227))))))

(declare-fun b!10715 () Bool)

(assert (=> b!10715 (= e!6251 (forall!41 (t!2493 (toList!176 lm!227)) p!216))))

(assert (= (and d!1181 (not res!9054)) b!10714))

(assert (= (and b!10714 res!9055) b!10715))

(declare-fun b_lambda!417 () Bool)

(assert (=> (not b_lambda!417) (not b!10714)))

(declare-fun t!2507 () Bool)

(declare-fun tb!181 () Bool)

(assert (=> (and start!1308 (= p!216 p!216) t!2507) tb!181))

(declare-fun result!319 () Bool)

(assert (=> tb!181 (= result!319 true)))

(assert (=> b!10714 t!2507))

(declare-fun b_and!607 () Bool)

(assert (= b_and!591 (and (=> t!2507 result!319) b_and!607)))

(declare-fun m!6927 () Bool)

(assert (=> b!10714 m!6927))

(declare-fun m!6929 () Bool)

(assert (=> b!10715 m!6929))

(assert (=> start!1308 d!1181))

(declare-fun d!1189 () Bool)

(declare-fun isStrictlySorted!30 (List!322) Bool)

(assert (=> d!1189 (= (inv!510 lm!227) (isStrictlySorted!30 (toList!176 lm!227)))))

(declare-fun bs!400 () Bool)

(assert (= bs!400 d!1189))

(declare-fun m!6931 () Bool)

(assert (=> bs!400 m!6931))

(assert (=> start!1308 d!1189))

(declare-fun d!1191 () Bool)

(declare-fun res!9056 () Bool)

(declare-fun e!6252 () Bool)

(assert (=> d!1191 (=> res!9056 e!6252)))

(assert (=> d!1191 (= res!9056 (is-Nil!319 (toList!176 (+!14 lm!227 (tuple2!341 (_1!170 lt!2592) (_2!170 lt!2592))))))))

(assert (=> d!1191 (= (forall!41 (toList!176 (+!14 lm!227 (tuple2!341 (_1!170 lt!2592) (_2!170 lt!2592)))) p!216) e!6252)))

(declare-fun b!10716 () Bool)

(declare-fun e!6253 () Bool)

(assert (=> b!10716 (= e!6252 e!6253)))

(declare-fun res!9057 () Bool)

(assert (=> b!10716 (=> (not res!9057) (not e!6253))))

(assert (=> b!10716 (= res!9057 (dynLambda!57 p!216 (h!884 (toList!176 (+!14 lm!227 (tuple2!341 (_1!170 lt!2592) (_2!170 lt!2592)))))))))

(declare-fun b!10717 () Bool)

(assert (=> b!10717 (= e!6253 (forall!41 (t!2493 (toList!176 (+!14 lm!227 (tuple2!341 (_1!170 lt!2592) (_2!170 lt!2592))))) p!216))))

(assert (= (and d!1191 (not res!9056)) b!10716))

(assert (= (and b!10716 res!9057) b!10717))

(declare-fun b_lambda!419 () Bool)

(assert (=> (not b_lambda!419) (not b!10716)))

(declare-fun t!2509 () Bool)

(declare-fun tb!183 () Bool)

(assert (=> (and start!1308 (= p!216 p!216) t!2509) tb!183))

(declare-fun result!321 () Bool)

(assert (=> tb!183 (= result!321 true)))

(assert (=> b!10716 t!2509))

(declare-fun b_and!609 () Bool)

(assert (= b_and!607 (and (=> t!2509 result!321) b_and!609)))

(declare-fun m!6933 () Bool)

(assert (=> b!10716 m!6933))

(declare-fun m!6935 () Bool)

(assert (=> b!10717 m!6935))

(assert (=> b!10659 d!1191))

(declare-fun d!1193 () Bool)

(declare-fun e!6264 () Bool)

(assert (=> d!1193 e!6264))

(declare-fun res!9077 () Bool)

(assert (=> d!1193 (=> (not res!9077) (not e!6264))))

(declare-fun lt!2642 () ListLongMap!321)

(declare-fun contains!143 (ListLongMap!321 (_ BitVec 64)) Bool)

(assert (=> d!1193 (= res!9077 (contains!143 lt!2642 (_1!170 (tuple2!341 (_1!170 lt!2592) (_2!170 lt!2592)))))))

(declare-fun lt!2641 () List!322)

(assert (=> d!1193 (= lt!2642 (ListLongMap!322 lt!2641))))

(declare-fun lt!2639 () Unit!213)

(declare-fun lt!2640 () Unit!213)

(assert (=> d!1193 (= lt!2639 lt!2640)))

(declare-datatypes ((Option!24 0))(
  ( (Some!23 (v!1338 B!350)) (None!22) )
))
(declare-fun getValueByKey!18 (List!322 (_ BitVec 64)) Option!24)

(assert (=> d!1193 (= (getValueByKey!18 lt!2641 (_1!170 (tuple2!341 (_1!170 lt!2592) (_2!170 lt!2592)))) (Some!23 (_2!170 (tuple2!341 (_1!170 lt!2592) (_2!170 lt!2592)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!2 (List!322 (_ BitVec 64) B!350) Unit!213)

(assert (=> d!1193 (= lt!2640 (lemmaContainsTupThenGetReturnValue!2 lt!2641 (_1!170 (tuple2!341 (_1!170 lt!2592) (_2!170 lt!2592))) (_2!170 (tuple2!341 (_1!170 lt!2592) (_2!170 lt!2592)))))))

(declare-fun insertStrictlySorted!2 (List!322 (_ BitVec 64) B!350) List!322)

(assert (=> d!1193 (= lt!2641 (insertStrictlySorted!2 (toList!176 lm!227) (_1!170 (tuple2!341 (_1!170 lt!2592) (_2!170 lt!2592))) (_2!170 (tuple2!341 (_1!170 lt!2592) (_2!170 lt!2592)))))))

(assert (=> d!1193 (= (+!14 lm!227 (tuple2!341 (_1!170 lt!2592) (_2!170 lt!2592))) lt!2642)))

(declare-fun b!10737 () Bool)

(declare-fun res!9076 () Bool)

(assert (=> b!10737 (=> (not res!9076) (not e!6264))))

(assert (=> b!10737 (= res!9076 (= (getValueByKey!18 (toList!176 lt!2642) (_1!170 (tuple2!341 (_1!170 lt!2592) (_2!170 lt!2592)))) (Some!23 (_2!170 (tuple2!341 (_1!170 lt!2592) (_2!170 lt!2592))))))))

(declare-fun b!10738 () Bool)

(declare-fun contains!145 (List!322 tuple2!340) Bool)

(assert (=> b!10738 (= e!6264 (contains!145 (toList!176 lt!2642) (tuple2!341 (_1!170 lt!2592) (_2!170 lt!2592))))))

(assert (= (and d!1193 res!9077) b!10737))

(assert (= (and b!10737 res!9076) b!10738))

(declare-fun m!6961 () Bool)

(assert (=> d!1193 m!6961))

(declare-fun m!6963 () Bool)

(assert (=> d!1193 m!6963))

(declare-fun m!6965 () Bool)

(assert (=> d!1193 m!6965))

(declare-fun m!6967 () Bool)

(assert (=> d!1193 m!6967))

(declare-fun m!6969 () Bool)

(assert (=> b!10737 m!6969))

(declare-fun m!6971 () Bool)

(assert (=> b!10738 m!6971))

(assert (=> b!10659 d!1193))

(declare-fun d!1199 () Bool)

(assert (=> d!1199 (forall!41 (toList!176 (+!14 lm!227 (tuple2!341 (_1!170 lt!2592) (_2!170 lt!2592)))) p!216)))

(declare-fun lt!2649 () Unit!213)

(declare-fun choose!148 (ListLongMap!321 Int (_ BitVec 64) B!350) Unit!213)

(assert (=> d!1199 (= lt!2649 (choose!148 lm!227 p!216 (_1!170 lt!2592) (_2!170 lt!2592)))))

(declare-fun e!6279 () Bool)

(assert (=> d!1199 e!6279))

(declare-fun res!9086 () Bool)

(assert (=> d!1199 (=> (not res!9086) (not e!6279))))

(assert (=> d!1199 (= res!9086 (forall!41 (toList!176 lm!227) p!216))))

(assert (=> d!1199 (= (addValidProp!2 lm!227 p!216 (_1!170 lt!2592) (_2!170 lt!2592)) lt!2649)))

(declare-fun b!10759 () Bool)

(assert (=> b!10759 (= e!6279 (dynLambda!57 p!216 (tuple2!341 (_1!170 lt!2592) (_2!170 lt!2592))))))

(assert (= (and d!1199 res!9086) b!10759))

(declare-fun b_lambda!435 () Bool)

(assert (=> (not b_lambda!435) (not b!10759)))

(declare-fun t!2517 () Bool)

(declare-fun tb!191 () Bool)

(assert (=> (and start!1308 (= p!216 p!216) t!2517) tb!191))

(declare-fun result!333 () Bool)

(assert (=> tb!191 (= result!333 true)))

(assert (=> b!10759 t!2517))

(declare-fun b_and!617 () Bool)

(assert (= b_and!609 (and (=> t!2517 result!333) b_and!617)))

(assert (=> d!1199 m!6857))

(assert (=> d!1199 m!6859))

(declare-fun m!6987 () Bool)

(assert (=> d!1199 m!6987))

(assert (=> d!1199 m!6867))

(declare-fun m!6989 () Bool)

(assert (=> b!10759 m!6989))

(assert (=> b!10659 d!1199))

(declare-fun d!1211 () Bool)

(assert (=> d!1211 (= (head!758 kvs!4) (h!884 kvs!4))))

(assert (=> b!10659 d!1211))

(declare-fun d!1213 () Bool)

(declare-fun res!9087 () Bool)

(declare-fun e!6282 () Bool)

(assert (=> d!1213 (=> res!9087 e!6282)))

(assert (=> d!1213 (= res!9087 (is-Nil!319 kvs!4))))

(assert (=> d!1213 (= (forall!41 kvs!4 p!216) e!6282)))

(declare-fun b!10762 () Bool)

(declare-fun e!6283 () Bool)

(assert (=> b!10762 (= e!6282 e!6283)))

(declare-fun res!9088 () Bool)

(assert (=> b!10762 (=> (not res!9088) (not e!6283))))

(assert (=> b!10762 (= res!9088 (dynLambda!57 p!216 (h!884 kvs!4)))))

(declare-fun b!10763 () Bool)

(assert (=> b!10763 (= e!6283 (forall!41 (t!2493 kvs!4) p!216))))

(assert (= (and d!1213 (not res!9087)) b!10762))

(assert (= (and b!10762 res!9088) b!10763))

(declare-fun b_lambda!445 () Bool)

(assert (=> (not b_lambda!445) (not b!10762)))

(declare-fun t!2519 () Bool)

(declare-fun tb!193 () Bool)

(assert (=> (and start!1308 (= p!216 p!216) t!2519) tb!193))

(declare-fun result!335 () Bool)

(assert (=> tb!193 (= result!335 true)))

(assert (=> b!10762 t!2519))

(declare-fun b_and!619 () Bool)

(assert (= b_and!617 (and (=> t!2519 result!335) b_and!619)))

(declare-fun m!6991 () Bool)

(assert (=> b!10762 m!6991))

(declare-fun m!6993 () Bool)

(assert (=> b!10763 m!6993))

(assert (=> b!10660 d!1213))

(declare-fun b!10768 () Bool)

