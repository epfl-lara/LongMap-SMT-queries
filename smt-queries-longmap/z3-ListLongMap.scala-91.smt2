; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1308 () Bool)

(assert start!1308)

(declare-fun b_free!409 () Bool)

(declare-fun b_next!409 () Bool)

(assert (=> start!1308 (= b_free!409 (not b_next!409))))

(declare-fun tp!1636 () Bool)

(declare-fun b_and!591 () Bool)

(assert (=> start!1308 (= tp!1636 b_and!591)))

(declare-fun b!10657 () Bool)

(declare-fun res!9011 () Bool)

(declare-fun e!6207 () Bool)

(assert (=> b!10657 (=> (not res!9011) (not e!6207))))

(declare-datatypes ((B!350 0))(
  ( (B!351 (val!270 Int)) )
))
(declare-datatypes ((tuple2!336 0))(
  ( (tuple2!337 (_1!168 (_ BitVec 64)) (_2!168 B!350)) )
))
(declare-datatypes ((List!318 0))(
  ( (Nil!315) (Cons!314 (h!880 tuple2!336) (t!2489 List!318)) )
))
(declare-fun kvs!4 () List!318)

(declare-fun p!216 () Int)

(declare-fun forall!41 (List!318 Int) Bool)

(assert (=> b!10657 (= res!9011 (forall!41 kvs!4 p!216))))

(declare-fun b!10658 () Bool)

(assert (=> b!10658 (= e!6207 (not (not (= kvs!4 Nil!315))))))

(declare-datatypes ((ListLongMap!317 0))(
  ( (ListLongMap!318 (toList!174 List!318)) )
))
(declare-fun lm!227 () ListLongMap!317)

(declare-fun lt!2592 () tuple2!336)

(declare-fun +!14 (ListLongMap!317 tuple2!336) ListLongMap!317)

(assert (=> b!10658 (forall!41 (toList!174 (+!14 lm!227 (tuple2!337 (_1!168 lt!2592) (_2!168 lt!2592)))) p!216)))

(declare-datatypes ((Unit!223 0))(
  ( (Unit!224) )
))
(declare-fun lt!2591 () Unit!223)

(declare-fun addValidProp!2 (ListLongMap!317 Int (_ BitVec 64) B!350) Unit!223)

(assert (=> b!10658 (= lt!2591 (addValidProp!2 lm!227 p!216 (_1!168 lt!2592) (_2!168 lt!2592)))))

(declare-fun head!758 (List!318) tuple2!336)

(assert (=> b!10658 (= lt!2592 (head!758 kvs!4))))

(declare-fun b!10660 () Bool)

(declare-fun res!9013 () Bool)

(assert (=> b!10660 (=> (not res!9013) (not e!6207))))

(declare-fun isEmpty!51 (List!318) Bool)

(assert (=> b!10660 (= res!9013 (not (isEmpty!51 kvs!4)))))

(declare-fun b!10661 () Bool)

(declare-fun e!6209 () Bool)

(declare-fun tp_is_empty!523 () Bool)

(declare-fun tp!1635 () Bool)

(assert (=> b!10661 (= e!6209 (and tp_is_empty!523 tp!1635))))

(declare-fun b!10659 () Bool)

(declare-fun e!6208 () Bool)

(declare-fun tp!1637 () Bool)

(assert (=> b!10659 (= e!6208 tp!1637)))

(declare-fun res!9012 () Bool)

(assert (=> start!1308 (=> (not res!9012) (not e!6207))))

(assert (=> start!1308 (= res!9012 (forall!41 (toList!174 lm!227) p!216))))

(assert (=> start!1308 e!6207))

(declare-fun inv!510 (ListLongMap!317) Bool)

(assert (=> start!1308 (and (inv!510 lm!227) e!6208)))

(assert (=> start!1308 tp!1636))

(assert (=> start!1308 e!6209))

(assert (= (and start!1308 res!9012) b!10657))

(assert (= (and b!10657 res!9011) b!10660))

(assert (= (and b!10660 res!9013) b!10658))

(assert (= start!1308 b!10659))

(get-info :version)

(assert (= (and start!1308 ((_ is Cons!314) kvs!4)) b!10661))

(declare-fun m!6853 () Bool)

(assert (=> b!10657 m!6853))

(declare-fun m!6855 () Bool)

(assert (=> b!10658 m!6855))

(declare-fun m!6857 () Bool)

(assert (=> b!10658 m!6857))

(declare-fun m!6859 () Bool)

(assert (=> b!10658 m!6859))

(declare-fun m!6861 () Bool)

(assert (=> b!10658 m!6861))

(declare-fun m!6863 () Bool)

(assert (=> b!10660 m!6863))

(declare-fun m!6865 () Bool)

(assert (=> start!1308 m!6865))

(declare-fun m!6867 () Bool)

(assert (=> start!1308 m!6867))

(check-sat (not b!10657) (not start!1308) (not b!10658) (not b!10660) (not b!10659) (not b_next!409) tp_is_empty!523 b_and!591 (not b!10661))
(check-sat b_and!591 (not b_next!409))
(get-model)

(declare-fun d!1167 () Bool)

(declare-fun res!9036 () Bool)

(declare-fun e!6232 () Bool)

(assert (=> d!1167 (=> res!9036 e!6232)))

(assert (=> d!1167 (= res!9036 ((_ is Nil!315) (toList!174 (+!14 lm!227 (tuple2!337 (_1!168 lt!2592) (_2!168 lt!2592))))))))

(assert (=> d!1167 (= (forall!41 (toList!174 (+!14 lm!227 (tuple2!337 (_1!168 lt!2592) (_2!168 lt!2592)))) p!216) e!6232)))

(declare-fun b!10696 () Bool)

(declare-fun e!6233 () Bool)

(assert (=> b!10696 (= e!6232 e!6233)))

(declare-fun res!9037 () Bool)

(assert (=> b!10696 (=> (not res!9037) (not e!6233))))

(declare-fun dynLambda!55 (Int tuple2!336) Bool)

(assert (=> b!10696 (= res!9037 (dynLambda!55 p!216 (h!880 (toList!174 (+!14 lm!227 (tuple2!337 (_1!168 lt!2592) (_2!168 lt!2592)))))))))

(declare-fun b!10697 () Bool)

(assert (=> b!10697 (= e!6233 (forall!41 (t!2489 (toList!174 (+!14 lm!227 (tuple2!337 (_1!168 lt!2592) (_2!168 lt!2592))))) p!216))))

(assert (= (and d!1167 (not res!9036)) b!10696))

(assert (= (and b!10696 res!9037) b!10697))

(declare-fun b_lambda!407 () Bool)

(assert (=> (not b_lambda!407) (not b!10696)))

(declare-fun t!2493 () Bool)

(declare-fun tb!171 () Bool)

(assert (=> (and start!1308 (= p!216 p!216) t!2493) tb!171))

(declare-fun result!309 () Bool)

(assert (=> tb!171 (= result!309 true)))

(assert (=> b!10696 t!2493))

(declare-fun b_and!597 () Bool)

(assert (= b_and!591 (and (=> t!2493 result!309) b_and!597)))

(declare-fun m!6901 () Bool)

(assert (=> b!10696 m!6901))

(declare-fun m!6903 () Bool)

(assert (=> b!10697 m!6903))

(assert (=> b!10658 d!1167))

(declare-fun d!1175 () Bool)

(declare-fun e!6252 () Bool)

(assert (=> d!1175 e!6252))

(declare-fun res!9059 () Bool)

(assert (=> d!1175 (=> (not res!9059) (not e!6252))))

(declare-fun lt!2621 () ListLongMap!317)

(declare-fun contains!139 (ListLongMap!317 (_ BitVec 64)) Bool)

(assert (=> d!1175 (= res!9059 (contains!139 lt!2621 (_1!168 (tuple2!337 (_1!168 lt!2592) (_2!168 lt!2592)))))))

(declare-fun lt!2622 () List!318)

(assert (=> d!1175 (= lt!2621 (ListLongMap!318 lt!2622))))

(declare-fun lt!2623 () Unit!223)

(declare-fun lt!2624 () Unit!223)

(assert (=> d!1175 (= lt!2623 lt!2624)))

(declare-datatypes ((Option!23 0))(
  ( (Some!22 (v!1337 B!350)) (None!21) )
))
(declare-fun getValueByKey!17 (List!318 (_ BitVec 64)) Option!23)

(assert (=> d!1175 (= (getValueByKey!17 lt!2622 (_1!168 (tuple2!337 (_1!168 lt!2592) (_2!168 lt!2592)))) (Some!22 (_2!168 (tuple2!337 (_1!168 lt!2592) (_2!168 lt!2592)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!1 (List!318 (_ BitVec 64) B!350) Unit!223)

(assert (=> d!1175 (= lt!2624 (lemmaContainsTupThenGetReturnValue!1 lt!2622 (_1!168 (tuple2!337 (_1!168 lt!2592) (_2!168 lt!2592))) (_2!168 (tuple2!337 (_1!168 lt!2592) (_2!168 lt!2592)))))))

(declare-fun insertStrictlySorted!1 (List!318 (_ BitVec 64) B!350) List!318)

(assert (=> d!1175 (= lt!2622 (insertStrictlySorted!1 (toList!174 lm!227) (_1!168 (tuple2!337 (_1!168 lt!2592) (_2!168 lt!2592))) (_2!168 (tuple2!337 (_1!168 lt!2592) (_2!168 lt!2592)))))))

(assert (=> d!1175 (= (+!14 lm!227 (tuple2!337 (_1!168 lt!2592) (_2!168 lt!2592))) lt!2621)))

(declare-fun b!10718 () Bool)

(declare-fun res!9058 () Bool)

(assert (=> b!10718 (=> (not res!9058) (not e!6252))))

(assert (=> b!10718 (= res!9058 (= (getValueByKey!17 (toList!174 lt!2621) (_1!168 (tuple2!337 (_1!168 lt!2592) (_2!168 lt!2592)))) (Some!22 (_2!168 (tuple2!337 (_1!168 lt!2592) (_2!168 lt!2592))))))))

(declare-fun b!10719 () Bool)

(declare-fun contains!140 (List!318 tuple2!336) Bool)

(assert (=> b!10719 (= e!6252 (contains!140 (toList!174 lt!2621) (tuple2!337 (_1!168 lt!2592) (_2!168 lt!2592))))))

(assert (= (and d!1175 res!9059) b!10718))

(assert (= (and b!10718 res!9058) b!10719))

(declare-fun m!6923 () Bool)

(assert (=> d!1175 m!6923))

(declare-fun m!6925 () Bool)

(assert (=> d!1175 m!6925))

(declare-fun m!6927 () Bool)

(assert (=> d!1175 m!6927))

(declare-fun m!6929 () Bool)

(assert (=> d!1175 m!6929))

(declare-fun m!6931 () Bool)

(assert (=> b!10718 m!6931))

(declare-fun m!6933 () Bool)

(assert (=> b!10719 m!6933))

(assert (=> b!10658 d!1175))

(declare-fun d!1187 () Bool)

(assert (=> d!1187 (forall!41 (toList!174 (+!14 lm!227 (tuple2!337 (_1!168 lt!2592) (_2!168 lt!2592)))) p!216)))

(declare-fun lt!2643 () Unit!223)

(declare-fun choose!148 (ListLongMap!317 Int (_ BitVec 64) B!350) Unit!223)

(assert (=> d!1187 (= lt!2643 (choose!148 lm!227 p!216 (_1!168 lt!2592) (_2!168 lt!2592)))))

(declare-fun e!6261 () Bool)

(assert (=> d!1187 e!6261))

(declare-fun res!9074 () Bool)

(assert (=> d!1187 (=> (not res!9074) (not e!6261))))

(assert (=> d!1187 (= res!9074 (forall!41 (toList!174 lm!227) p!216))))

(assert (=> d!1187 (= (addValidProp!2 lm!227 p!216 (_1!168 lt!2592) (_2!168 lt!2592)) lt!2643)))

(declare-fun b!10735 () Bool)

(assert (=> b!10735 (= e!6261 (dynLambda!55 p!216 (tuple2!337 (_1!168 lt!2592) (_2!168 lt!2592))))))

(assert (= (and d!1187 res!9074) b!10735))

(declare-fun b_lambda!417 () Bool)

(assert (=> (not b_lambda!417) (not b!10735)))

(declare-fun t!2503 () Bool)

(declare-fun tb!181 () Bool)

(assert (=> (and start!1308 (= p!216 p!216) t!2503) tb!181))

(declare-fun result!319 () Bool)

(assert (=> tb!181 (= result!319 true)))

(assert (=> b!10735 t!2503))

(declare-fun b_and!607 () Bool)

(assert (= b_and!597 (and (=> t!2503 result!319) b_and!607)))

(assert (=> d!1187 m!6855))

(assert (=> d!1187 m!6857))

(declare-fun m!6959 () Bool)

(assert (=> d!1187 m!6959))

(assert (=> d!1187 m!6865))

(declare-fun m!6961 () Bool)

(assert (=> b!10735 m!6961))

(assert (=> b!10658 d!1187))

(declare-fun d!1193 () Bool)

(assert (=> d!1193 (= (head!758 kvs!4) (h!880 kvs!4))))

(assert (=> b!10658 d!1193))

(declare-fun d!1195 () Bool)

(declare-fun res!9078 () Bool)

(declare-fun e!6265 () Bool)

(assert (=> d!1195 (=> res!9078 e!6265)))

(assert (=> d!1195 (= res!9078 ((_ is Nil!315) kvs!4))))

(assert (=> d!1195 (= (forall!41 kvs!4 p!216) e!6265)))

(declare-fun b!10740 () Bool)

(declare-fun e!6266 () Bool)

(assert (=> b!10740 (= e!6265 e!6266)))

(declare-fun res!9079 () Bool)

(assert (=> b!10740 (=> (not res!9079) (not e!6266))))

(assert (=> b!10740 (= res!9079 (dynLambda!55 p!216 (h!880 kvs!4)))))

(declare-fun b!10741 () Bool)

(assert (=> b!10741 (= e!6266 (forall!41 (t!2489 kvs!4) p!216))))

(assert (= (and d!1195 (not res!9078)) b!10740))

(assert (= (and b!10740 res!9079) b!10741))

(declare-fun b_lambda!421 () Bool)

(assert (=> (not b_lambda!421) (not b!10740)))

(declare-fun t!2507 () Bool)

(declare-fun tb!185 () Bool)

(assert (=> (and start!1308 (= p!216 p!216) t!2507) tb!185))

(declare-fun result!323 () Bool)

(assert (=> tb!185 (= result!323 true)))

(assert (=> b!10740 t!2507))

(declare-fun b_and!611 () Bool)

(assert (= b_and!607 (and (=> t!2507 result!323) b_and!611)))

(declare-fun m!6967 () Bool)

(assert (=> b!10740 m!6967))

(declare-fun m!6969 () Bool)

(assert (=> b!10741 m!6969))

(assert (=> b!10657 d!1195))

(declare-fun d!1199 () Bool)

(assert (=> d!1199 (= (isEmpty!51 kvs!4) ((_ is Nil!315) kvs!4))))

(assert (=> b!10660 d!1199))

(declare-fun d!1203 () Bool)

(declare-fun res!9082 () Bool)

(declare-fun e!6269 () Bool)

(assert (=> d!1203 (=> res!9082 e!6269)))

(assert (=> d!1203 (= res!9082 ((_ is Nil!315) (toList!174 lm!227)))))

(assert (=> d!1203 (= (forall!41 (toList!174 lm!227) p!216) e!6269)))

(declare-fun b!10745 () Bool)

(declare-fun e!6270 () Bool)

(assert (=> b!10745 (= e!6269 e!6270)))

(declare-fun res!9083 () Bool)

(assert (=> b!10745 (=> (not res!9083) (not e!6270))))

(assert (=> b!10745 (= res!9083 (dynLambda!55 p!216 (h!880 (toList!174 lm!227))))))

(declare-fun b!10746 () Bool)

(assert (=> b!10746 (= e!6270 (forall!41 (t!2489 (toList!174 lm!227)) p!216))))

(assert (= (and d!1203 (not res!9082)) b!10745))

(assert (= (and b!10745 res!9083) b!10746))

(declare-fun b_lambda!423 () Bool)

(assert (=> (not b_lambda!423) (not b!10745)))

(declare-fun t!2509 () Bool)

(declare-fun tb!187 () Bool)

(assert (=> (and start!1308 (= p!216 p!216) t!2509) tb!187))

(declare-fun result!325 () Bool)

(assert (=> tb!187 (= result!325 true)))

(assert (=> b!10745 t!2509))

(declare-fun b_and!613 () Bool)

(assert (= b_and!611 (and (=> t!2509 result!325) b_and!613)))

(declare-fun m!6971 () Bool)

(assert (=> b!10745 m!6971))

(declare-fun m!6973 () Bool)

(assert (=> b!10746 m!6973))

(assert (=> start!1308 d!1203))

(declare-fun d!1207 () Bool)

(declare-fun isStrictlySorted!28 (List!318) Bool)

(assert (=> d!1207 (= (inv!510 lm!227) (isStrictlySorted!28 (toList!174 lm!227)))))

(declare-fun bs!400 () Bool)

(assert (= bs!400 d!1207))

(declare-fun m!6983 () Bool)

(assert (=> bs!400 m!6983))

(assert (=> start!1308 d!1207))

(declare-fun b!10760 () Bool)

(declare-fun e!6280 () Bool)

(declare-fun tp!1660 () Bool)

(assert (=> b!10760 (= e!6280 (and tp_is_empty!523 tp!1660))))

(assert (=> b!10661 (= tp!1635 e!6280)))

(assert (= (and b!10661 ((_ is Cons!314) (t!2489 kvs!4))) b!10760))

(declare-fun b!10762 () Bool)

(declare-fun e!6282 () Bool)

(declare-fun tp!1662 () Bool)

(assert (=> b!10762 (= e!6282 (and tp_is_empty!523 tp!1662))))

(assert (=> b!10659 (= tp!1637 e!6282)))

(assert (= (and b!10659 ((_ is Cons!314) (toList!174 lm!227))) b!10762))

(declare-fun b_lambda!431 () Bool)

(assert (= b_lambda!421 (or (and start!1308 b_free!409) b_lambda!431)))

(declare-fun b_lambda!433 () Bool)

(assert (= b_lambda!407 (or (and start!1308 b_free!409) b_lambda!433)))

(declare-fun b_lambda!435 () Bool)

(assert (= b_lambda!417 (or (and start!1308 b_free!409) b_lambda!435)))

(declare-fun b_lambda!437 () Bool)

(assert (= b_lambda!423 (or (and start!1308 b_free!409) b_lambda!437)))

(check-sat (not b!10762) (not b!10718) (not d!1207) (not d!1187) (not b!10697) (not d!1175) b_and!613 (not b_lambda!431) (not b!10719) tp_is_empty!523 (not b!10746) (not b_lambda!435) (not b_lambda!433) (not b_lambda!437) (not b!10760) (not b!10741) (not b_next!409))
(check-sat b_and!613 (not b_next!409))
