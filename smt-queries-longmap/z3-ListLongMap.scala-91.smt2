; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1308 () Bool)

(assert start!1308)

(declare-fun b_free!409 () Bool)

(declare-fun b_next!409 () Bool)

(assert (=> start!1308 (= b_free!409 (not b_next!409))))

(declare-fun tp!1637 () Bool)

(declare-fun b_and!591 () Bool)

(assert (=> start!1308 (= tp!1637 b_and!591)))

(declare-fun res!9011 () Bool)

(declare-fun e!6208 () Bool)

(assert (=> start!1308 (=> (not res!9011) (not e!6208))))

(declare-datatypes ((B!350 0))(
  ( (B!351 (val!270 Int)) )
))
(declare-datatypes ((tuple2!336 0))(
  ( (tuple2!337 (_1!168 (_ BitVec 64)) (_2!168 B!350)) )
))
(declare-datatypes ((List!318 0))(
  ( (Nil!315) (Cons!314 (h!880 tuple2!336) (t!2489 List!318)) )
))
(declare-datatypes ((ListLongMap!317 0))(
  ( (ListLongMap!318 (toList!174 List!318)) )
))
(declare-fun lm!227 () ListLongMap!317)

(declare-fun p!216 () Int)

(declare-fun forall!41 (List!318 Int) Bool)

(assert (=> start!1308 (= res!9011 (forall!41 (toList!174 lm!227) p!216))))

(assert (=> start!1308 e!6208))

(declare-fun e!6209 () Bool)

(declare-fun inv!510 (ListLongMap!317) Bool)

(assert (=> start!1308 (and (inv!510 lm!227) e!6209)))

(assert (=> start!1308 tp!1637))

(declare-fun e!6207 () Bool)

(assert (=> start!1308 e!6207))

(declare-fun b!10657 () Bool)

(declare-fun kvs!4 () List!318)

(assert (=> b!10657 (= e!6208 (not (not (= kvs!4 Nil!315))))))

(declare-fun lt!2591 () tuple2!336)

(declare-fun +!14 (ListLongMap!317 tuple2!336) ListLongMap!317)

(assert (=> b!10657 (forall!41 (toList!174 (+!14 lm!227 (tuple2!337 (_1!168 lt!2591) (_2!168 lt!2591)))) p!216)))

(declare-datatypes ((Unit!223 0))(
  ( (Unit!224) )
))
(declare-fun lt!2592 () Unit!223)

(declare-fun addValidProp!2 (ListLongMap!317 Int (_ BitVec 64) B!350) Unit!223)

(assert (=> b!10657 (= lt!2592 (addValidProp!2 lm!227 p!216 (_1!168 lt!2591) (_2!168 lt!2591)))))

(declare-fun head!758 (List!318) tuple2!336)

(assert (=> b!10657 (= lt!2591 (head!758 kvs!4))))

(declare-fun b!10658 () Bool)

(declare-fun tp_is_empty!523 () Bool)

(declare-fun tp!1635 () Bool)

(assert (=> b!10658 (= e!6207 (and tp_is_empty!523 tp!1635))))

(declare-fun b!10659 () Bool)

(declare-fun res!9013 () Bool)

(assert (=> b!10659 (=> (not res!9013) (not e!6208))))

(declare-fun isEmpty!51 (List!318) Bool)

(assert (=> b!10659 (= res!9013 (not (isEmpty!51 kvs!4)))))

(declare-fun b!10660 () Bool)

(declare-fun tp!1636 () Bool)

(assert (=> b!10660 (= e!6209 tp!1636)))

(declare-fun b!10661 () Bool)

(declare-fun res!9012 () Bool)

(assert (=> b!10661 (=> (not res!9012) (not e!6208))))

(assert (=> b!10661 (= res!9012 (forall!41 kvs!4 p!216))))

(assert (= (and start!1308 res!9011) b!10661))

(assert (= (and b!10661 res!9012) b!10659))

(assert (= (and b!10659 res!9013) b!10657))

(assert (= start!1308 b!10660))

(get-info :version)

(assert (= (and start!1308 ((_ is Cons!314) kvs!4)) b!10658))

(declare-fun m!6857 () Bool)

(assert (=> start!1308 m!6857))

(declare-fun m!6859 () Bool)

(assert (=> start!1308 m!6859))

(declare-fun m!6861 () Bool)

(assert (=> b!10657 m!6861))

(declare-fun m!6863 () Bool)

(assert (=> b!10657 m!6863))

(declare-fun m!6865 () Bool)

(assert (=> b!10657 m!6865))

(declare-fun m!6867 () Bool)

(assert (=> b!10657 m!6867))

(declare-fun m!6869 () Bool)

(assert (=> b!10659 m!6869))

(declare-fun m!6871 () Bool)

(assert (=> b!10661 m!6871))

(check-sat (not b!10660) (not b!10657) (not b!10661) b_and!591 (not b_next!409) (not start!1308) tp_is_empty!523 (not b!10659) (not b!10658))
(check-sat b_and!591 (not b_next!409))
(get-model)

(declare-fun d!1169 () Bool)

(declare-fun res!9042 () Bool)

(declare-fun e!6238 () Bool)

(assert (=> d!1169 (=> res!9042 e!6238)))

(assert (=> d!1169 (= res!9042 ((_ is Nil!315) (toList!174 (+!14 lm!227 (tuple2!337 (_1!168 lt!2591) (_2!168 lt!2591))))))))

(assert (=> d!1169 (= (forall!41 (toList!174 (+!14 lm!227 (tuple2!337 (_1!168 lt!2591) (_2!168 lt!2591)))) p!216) e!6238)))

(declare-fun b!10702 () Bool)

(declare-fun e!6239 () Bool)

(assert (=> b!10702 (= e!6238 e!6239)))

(declare-fun res!9043 () Bool)

(assert (=> b!10702 (=> (not res!9043) (not e!6239))))

(declare-fun dynLambda!55 (Int tuple2!336) Bool)

(assert (=> b!10702 (= res!9043 (dynLambda!55 p!216 (h!880 (toList!174 (+!14 lm!227 (tuple2!337 (_1!168 lt!2591) (_2!168 lt!2591)))))))))

(declare-fun b!10703 () Bool)

(assert (=> b!10703 (= e!6239 (forall!41 (t!2489 (toList!174 (+!14 lm!227 (tuple2!337 (_1!168 lt!2591) (_2!168 lt!2591))))) p!216))))

(assert (= (and d!1169 (not res!9042)) b!10702))

(assert (= (and b!10702 res!9043) b!10703))

(declare-fun b_lambda!409 () Bool)

(assert (=> (not b_lambda!409) (not b!10702)))

(declare-fun t!2495 () Bool)

(declare-fun tb!173 () Bool)

(assert (=> (and start!1308 (= p!216 p!216) t!2495) tb!173))

(declare-fun result!311 () Bool)

(assert (=> tb!173 (= result!311 true)))

(assert (=> b!10702 t!2495))

(declare-fun b_and!599 () Bool)

(assert (= b_and!591 (and (=> t!2495 result!311) b_and!599)))

(declare-fun m!6909 () Bool)

(assert (=> b!10702 m!6909))

(declare-fun m!6911 () Bool)

(assert (=> b!10703 m!6911))

(assert (=> b!10657 d!1169))

(declare-fun d!1175 () Bool)

(declare-fun e!6255 () Bool)

(assert (=> d!1175 e!6255))

(declare-fun res!9065 () Bool)

(assert (=> d!1175 (=> (not res!9065) (not e!6255))))

(declare-fun lt!2625 () ListLongMap!317)

(declare-fun contains!139 (ListLongMap!317 (_ BitVec 64)) Bool)

(assert (=> d!1175 (= res!9065 (contains!139 lt!2625 (_1!168 (tuple2!337 (_1!168 lt!2591) (_2!168 lt!2591)))))))

(declare-fun lt!2627 () List!318)

(assert (=> d!1175 (= lt!2625 (ListLongMap!318 lt!2627))))

(declare-fun lt!2628 () Unit!223)

(declare-fun lt!2626 () Unit!223)

(assert (=> d!1175 (= lt!2628 lt!2626)))

(declare-datatypes ((Option!23 0))(
  ( (Some!22 (v!1337 B!350)) (None!21) )
))
(declare-fun getValueByKey!17 (List!318 (_ BitVec 64)) Option!23)

(assert (=> d!1175 (= (getValueByKey!17 lt!2627 (_1!168 (tuple2!337 (_1!168 lt!2591) (_2!168 lt!2591)))) (Some!22 (_2!168 (tuple2!337 (_1!168 lt!2591) (_2!168 lt!2591)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!1 (List!318 (_ BitVec 64) B!350) Unit!223)

(assert (=> d!1175 (= lt!2626 (lemmaContainsTupThenGetReturnValue!1 lt!2627 (_1!168 (tuple2!337 (_1!168 lt!2591) (_2!168 lt!2591))) (_2!168 (tuple2!337 (_1!168 lt!2591) (_2!168 lt!2591)))))))

(declare-fun insertStrictlySorted!1 (List!318 (_ BitVec 64) B!350) List!318)

(assert (=> d!1175 (= lt!2627 (insertStrictlySorted!1 (toList!174 lm!227) (_1!168 (tuple2!337 (_1!168 lt!2591) (_2!168 lt!2591))) (_2!168 (tuple2!337 (_1!168 lt!2591) (_2!168 lt!2591)))))))

(assert (=> d!1175 (= (+!14 lm!227 (tuple2!337 (_1!168 lt!2591) (_2!168 lt!2591))) lt!2625)))

(declare-fun b!10724 () Bool)

(declare-fun res!9064 () Bool)

(assert (=> b!10724 (=> (not res!9064) (not e!6255))))

(assert (=> b!10724 (= res!9064 (= (getValueByKey!17 (toList!174 lt!2625) (_1!168 (tuple2!337 (_1!168 lt!2591) (_2!168 lt!2591)))) (Some!22 (_2!168 (tuple2!337 (_1!168 lt!2591) (_2!168 lt!2591))))))))

(declare-fun b!10725 () Bool)

(declare-fun contains!141 (List!318 tuple2!336) Bool)

(assert (=> b!10725 (= e!6255 (contains!141 (toList!174 lt!2625) (tuple2!337 (_1!168 lt!2591) (_2!168 lt!2591))))))

(assert (= (and d!1175 res!9065) b!10724))

(assert (= (and b!10724 res!9064) b!10725))

(declare-fun m!6939 () Bool)

(assert (=> d!1175 m!6939))

(declare-fun m!6941 () Bool)

(assert (=> d!1175 m!6941))

(declare-fun m!6943 () Bool)

(assert (=> d!1175 m!6943))

(declare-fun m!6945 () Bool)

(assert (=> d!1175 m!6945))

(declare-fun m!6947 () Bool)

(assert (=> b!10724 m!6947))

(declare-fun m!6949 () Bool)

(assert (=> b!10725 m!6949))

(assert (=> b!10657 d!1175))

(declare-fun d!1187 () Bool)

(assert (=> d!1187 (forall!41 (toList!174 (+!14 lm!227 (tuple2!337 (_1!168 lt!2591) (_2!168 lt!2591)))) p!216)))

(declare-fun lt!2634 () Unit!223)

(declare-fun choose!147 (ListLongMap!317 Int (_ BitVec 64) B!350) Unit!223)

(assert (=> d!1187 (= lt!2634 (choose!147 lm!227 p!216 (_1!168 lt!2591) (_2!168 lt!2591)))))

(declare-fun e!6261 () Bool)

(assert (=> d!1187 e!6261))

(declare-fun res!9071 () Bool)

(assert (=> d!1187 (=> (not res!9071) (not e!6261))))

(assert (=> d!1187 (= res!9071 (forall!41 (toList!174 lm!227) p!216))))

(assert (=> d!1187 (= (addValidProp!2 lm!227 p!216 (_1!168 lt!2591) (_2!168 lt!2591)) lt!2634)))

(declare-fun b!10733 () Bool)

(assert (=> b!10733 (= e!6261 (dynLambda!55 p!216 (tuple2!337 (_1!168 lt!2591) (_2!168 lt!2591))))))

(assert (= (and d!1187 res!9071) b!10733))

(declare-fun b_lambda!419 () Bool)

(assert (=> (not b_lambda!419) (not b!10733)))

(declare-fun t!2505 () Bool)

(declare-fun tb!183 () Bool)

(assert (=> (and start!1308 (= p!216 p!216) t!2505) tb!183))

(declare-fun result!321 () Bool)

(assert (=> tb!183 (= result!321 true)))

(assert (=> b!10733 t!2505))

(declare-fun b_and!609 () Bool)

(assert (= b_and!599 (and (=> t!2505 result!321) b_and!609)))

(assert (=> d!1187 m!6861))

(assert (=> d!1187 m!6863))

(declare-fun m!6955 () Bool)

(assert (=> d!1187 m!6955))

(assert (=> d!1187 m!6857))

(declare-fun m!6957 () Bool)

(assert (=> b!10733 m!6957))

(assert (=> b!10657 d!1187))

(declare-fun d!1193 () Bool)

(assert (=> d!1193 (= (head!758 kvs!4) (h!880 kvs!4))))

(assert (=> b!10657 d!1193))

(declare-fun d!1197 () Bool)

(declare-fun res!9080 () Bool)

(declare-fun e!6268 () Bool)

(assert (=> d!1197 (=> res!9080 e!6268)))

(assert (=> d!1197 (= res!9080 ((_ is Nil!315) kvs!4))))

(assert (=> d!1197 (= (forall!41 kvs!4 p!216) e!6268)))

(declare-fun b!10742 () Bool)

(declare-fun e!6269 () Bool)

(assert (=> b!10742 (= e!6268 e!6269)))

(declare-fun res!9081 () Bool)

(assert (=> b!10742 (=> (not res!9081) (not e!6269))))

(assert (=> b!10742 (= res!9081 (dynLambda!55 p!216 (h!880 kvs!4)))))

(declare-fun b!10743 () Bool)

(assert (=> b!10743 (= e!6269 (forall!41 (t!2489 kvs!4) p!216))))

(assert (= (and d!1197 (not res!9080)) b!10742))

(assert (= (and b!10742 res!9081) b!10743))

(declare-fun b_lambda!425 () Bool)

(assert (=> (not b_lambda!425) (not b!10742)))

(declare-fun t!2511 () Bool)

(declare-fun tb!189 () Bool)

(assert (=> (and start!1308 (= p!216 p!216) t!2511) tb!189))

(declare-fun result!327 () Bool)

(assert (=> tb!189 (= result!327 true)))

(assert (=> b!10742 t!2511))

(declare-fun b_and!615 () Bool)

(assert (= b_and!609 (and (=> t!2511 result!327) b_and!615)))

(declare-fun m!6967 () Bool)

(assert (=> b!10742 m!6967))

(declare-fun m!6969 () Bool)

(assert (=> b!10743 m!6969))

(assert (=> b!10661 d!1197))

(declare-fun d!1201 () Bool)

(assert (=> d!1201 (= (isEmpty!51 kvs!4) ((_ is Nil!315) kvs!4))))

(assert (=> b!10659 d!1201))

(declare-fun d!1203 () Bool)

(declare-fun res!9084 () Bool)

(declare-fun e!6271 () Bool)

(assert (=> d!1203 (=> res!9084 e!6271)))

(assert (=> d!1203 (= res!9084 ((_ is Nil!315) (toList!174 lm!227)))))

(assert (=> d!1203 (= (forall!41 (toList!174 lm!227) p!216) e!6271)))

(declare-fun b!10746 () Bool)

(declare-fun e!6272 () Bool)

(assert (=> b!10746 (= e!6271 e!6272)))

(declare-fun res!9085 () Bool)

(assert (=> b!10746 (=> (not res!9085) (not e!6272))))

(assert (=> b!10746 (= res!9085 (dynLambda!55 p!216 (h!880 (toList!174 lm!227))))))

(declare-fun b!10747 () Bool)

(assert (=> b!10747 (= e!6272 (forall!41 (t!2489 (toList!174 lm!227)) p!216))))

(assert (= (and d!1203 (not res!9084)) b!10746))

(assert (= (and b!10746 res!9085) b!10747))

(declare-fun b_lambda!427 () Bool)

(assert (=> (not b_lambda!427) (not b!10746)))

(declare-fun t!2513 () Bool)

(declare-fun tb!191 () Bool)

(assert (=> (and start!1308 (= p!216 p!216) t!2513) tb!191))

(declare-fun result!329 () Bool)

(assert (=> tb!191 (= result!329 true)))

(assert (=> b!10746 t!2513))

(declare-fun b_and!617 () Bool)

(assert (= b_and!615 (and (=> t!2513 result!329) b_and!617)))

(declare-fun m!6983 () Bool)

(assert (=> b!10746 m!6983))

(declare-fun m!6987 () Bool)

(assert (=> b!10747 m!6987))

(assert (=> start!1308 d!1203))

(declare-fun d!1207 () Bool)

(declare-fun isStrictlySorted!31 (List!318) Bool)

(assert (=> d!1207 (= (inv!510 lm!227) (isStrictlySorted!31 (toList!174 lm!227)))))

(declare-fun bs!401 () Bool)

(assert (= bs!401 d!1207))

(declare-fun m!6989 () Bool)

(assert (=> bs!401 m!6989))

(assert (=> start!1308 d!1207))

(declare-fun b!10758 () Bool)

(declare-fun e!6279 () Bool)

(declare-fun tp!1662 () Bool)

(assert (=> b!10758 (= e!6279 (and tp_is_empty!523 tp!1662))))

(assert (=> b!10660 (= tp!1636 e!6279)))

(assert (= (and b!10660 ((_ is Cons!314) (toList!174 lm!227))) b!10758))

(declare-fun b!10759 () Bool)

(declare-fun e!6280 () Bool)

(declare-fun tp!1663 () Bool)

(assert (=> b!10759 (= e!6280 (and tp_is_empty!523 tp!1663))))

(assert (=> b!10658 (= tp!1635 e!6280)))

(assert (= (and b!10658 ((_ is Cons!314) (t!2489 kvs!4))) b!10759))

(declare-fun b_lambda!437 () Bool)

(assert (= b_lambda!409 (or (and start!1308 b_free!409) b_lambda!437)))

(declare-fun b_lambda!439 () Bool)

(assert (= b_lambda!425 (or (and start!1308 b_free!409) b_lambda!439)))

(declare-fun b_lambda!441 () Bool)

(assert (= b_lambda!419 (or (and start!1308 b_free!409) b_lambda!441)))

(declare-fun b_lambda!443 () Bool)

(assert (= b_lambda!427 (or (and start!1308 b_free!409) b_lambda!443)))

(check-sat (not b_lambda!443) (not b!10758) (not b!10703) (not b_lambda!439) tp_is_empty!523 (not b_lambda!437) (not b!10759) (not d!1187) (not b_next!409) (not b!10747) (not b!10743) (not d!1175) b_and!617 (not b!10725) (not b_lambda!441) (not b!10724) (not d!1207))
(check-sat b_and!617 (not b_next!409))
