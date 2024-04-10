; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1310 () Bool)

(assert start!1310)

(declare-fun b_free!411 () Bool)

(declare-fun b_next!411 () Bool)

(assert (=> start!1310 (= b_free!411 (not b_next!411))))

(declare-fun tp!1644 () Bool)

(declare-fun b_and!593 () Bool)

(assert (=> start!1310 (= tp!1644 b_and!593)))

(declare-fun b!10672 () Bool)

(declare-fun e!6217 () Bool)

(declare-fun tp!1646 () Bool)

(assert (=> b!10672 (= e!6217 tp!1646)))

(declare-fun b!10673 () Bool)

(declare-fun e!6218 () Bool)

(declare-datatypes ((B!352 0))(
  ( (B!353 (val!271 Int)) )
))
(declare-datatypes ((tuple2!342 0))(
  ( (tuple2!343 (_1!171 (_ BitVec 64)) (_2!171 B!352)) )
))
(declare-datatypes ((List!323 0))(
  ( (Nil!320) (Cons!319 (h!885 tuple2!342) (t!2494 List!323)) )
))
(declare-fun kvs!4 () List!323)

(assert (=> b!10673 (= e!6218 (not (not (= kvs!4 Nil!320))))))

(declare-datatypes ((ListLongMap!323 0))(
  ( (ListLongMap!324 (toList!177 List!323)) )
))
(declare-fun lm!227 () ListLongMap!323)

(declare-fun lt!2597 () tuple2!342)

(declare-fun p!216 () Int)

(declare-fun forall!42 (List!323 Int) Bool)

(declare-fun +!15 (ListLongMap!323 tuple2!342) ListLongMap!323)

(assert (=> b!10673 (forall!42 (toList!177 (+!15 lm!227 (tuple2!343 (_1!171 lt!2597) (_2!171 lt!2597)))) p!216)))

(declare-datatypes ((Unit!215 0))(
  ( (Unit!216) )
))
(declare-fun lt!2598 () Unit!215)

(declare-fun addValidProp!3 (ListLongMap!323 Int (_ BitVec 64) B!352) Unit!215)

(assert (=> b!10673 (= lt!2598 (addValidProp!3 lm!227 p!216 (_1!171 lt!2597) (_2!171 lt!2597)))))

(declare-fun head!759 (List!323) tuple2!342)

(assert (=> b!10673 (= lt!2597 (head!759 kvs!4))))

(declare-fun b!10675 () Bool)

(declare-fun res!9020 () Bool)

(assert (=> b!10675 (=> (not res!9020) (not e!6218))))

(assert (=> b!10675 (= res!9020 (forall!42 kvs!4 p!216))))

(declare-fun b!10676 () Bool)

(declare-fun e!6216 () Bool)

(declare-fun tp_is_empty!525 () Bool)

(declare-fun tp!1645 () Bool)

(assert (=> b!10676 (= e!6216 (and tp_is_empty!525 tp!1645))))

(declare-fun res!9021 () Bool)

(assert (=> start!1310 (=> (not res!9021) (not e!6218))))

(assert (=> start!1310 (= res!9021 (forall!42 (toList!177 lm!227) p!216))))

(assert (=> start!1310 e!6218))

(declare-fun inv!511 (ListLongMap!323) Bool)

(assert (=> start!1310 (and (inv!511 lm!227) e!6217)))

(assert (=> start!1310 tp!1644))

(assert (=> start!1310 e!6216))

(declare-fun b!10674 () Bool)

(declare-fun res!9022 () Bool)

(assert (=> b!10674 (=> (not res!9022) (not e!6218))))

(declare-fun isEmpty!52 (List!323) Bool)

(assert (=> b!10674 (= res!9022 (not (isEmpty!52 kvs!4)))))

(assert (= (and start!1310 res!9021) b!10675))

(assert (= (and b!10675 res!9020) b!10674))

(assert (= (and b!10674 res!9022) b!10673))

(assert (= start!1310 b!10672))

(get-info :version)

(assert (= (and start!1310 ((_ is Cons!319) kvs!4)) b!10676))

(declare-fun m!6873 () Bool)

(assert (=> b!10673 m!6873))

(declare-fun m!6875 () Bool)

(assert (=> b!10673 m!6875))

(declare-fun m!6877 () Bool)

(assert (=> b!10673 m!6877))

(declare-fun m!6879 () Bool)

(assert (=> b!10673 m!6879))

(declare-fun m!6881 () Bool)

(assert (=> b!10675 m!6881))

(declare-fun m!6883 () Bool)

(assert (=> start!1310 m!6883))

(declare-fun m!6885 () Bool)

(assert (=> start!1310 m!6885))

(declare-fun m!6887 () Bool)

(assert (=> b!10674 m!6887))

(check-sat (not b!10675) (not b!10674) b_and!593 (not b!10672) (not b!10673) tp_is_empty!525 (not start!1310) (not b_next!411) (not b!10676))
(check-sat b_and!593 (not b_next!411))
(get-model)

(declare-fun d!1173 () Bool)

(declare-fun res!9042 () Bool)

(declare-fun e!6238 () Bool)

(assert (=> d!1173 (=> res!9042 e!6238)))

(assert (=> d!1173 (= res!9042 ((_ is Nil!320) kvs!4))))

(assert (=> d!1173 (= (forall!42 kvs!4 p!216) e!6238)))

(declare-fun b!10702 () Bool)

(declare-fun e!6239 () Bool)

(assert (=> b!10702 (= e!6238 e!6239)))

(declare-fun res!9043 () Bool)

(assert (=> b!10702 (=> (not res!9043) (not e!6239))))

(declare-fun dynLambda!55 (Int tuple2!342) Bool)

(assert (=> b!10702 (= res!9043 (dynLambda!55 p!216 (h!885 kvs!4)))))

(declare-fun b!10703 () Bool)

(assert (=> b!10703 (= e!6239 (forall!42 (t!2494 kvs!4) p!216))))

(assert (= (and d!1173 (not res!9042)) b!10702))

(assert (= (and b!10702 res!9043) b!10703))

(declare-fun b_lambda!409 () Bool)

(assert (=> (not b_lambda!409) (not b!10702)))

(declare-fun t!2499 () Bool)

(declare-fun tb!173 () Bool)

(assert (=> (and start!1310 (= p!216 p!216) t!2499) tb!173))

(declare-fun result!311 () Bool)

(assert (=> tb!173 (= result!311 true)))

(assert (=> b!10702 t!2499))

(declare-fun b_and!599 () Bool)

(assert (= b_and!593 (and (=> t!2499 result!311) b_and!599)))

(declare-fun m!6909 () Bool)

(assert (=> b!10702 m!6909))

(declare-fun m!6911 () Bool)

(assert (=> b!10703 m!6911))

(assert (=> b!10675 d!1173))

(declare-fun d!1177 () Bool)

(declare-fun res!9044 () Bool)

(declare-fun e!6240 () Bool)

(assert (=> d!1177 (=> res!9044 e!6240)))

(assert (=> d!1177 (= res!9044 ((_ is Nil!320) (toList!177 (+!15 lm!227 (tuple2!343 (_1!171 lt!2597) (_2!171 lt!2597))))))))

(assert (=> d!1177 (= (forall!42 (toList!177 (+!15 lm!227 (tuple2!343 (_1!171 lt!2597) (_2!171 lt!2597)))) p!216) e!6240)))

(declare-fun b!10704 () Bool)

(declare-fun e!6241 () Bool)

(assert (=> b!10704 (= e!6240 e!6241)))

(declare-fun res!9045 () Bool)

(assert (=> b!10704 (=> (not res!9045) (not e!6241))))

(assert (=> b!10704 (= res!9045 (dynLambda!55 p!216 (h!885 (toList!177 (+!15 lm!227 (tuple2!343 (_1!171 lt!2597) (_2!171 lt!2597)))))))))

(declare-fun b!10705 () Bool)

(assert (=> b!10705 (= e!6241 (forall!42 (t!2494 (toList!177 (+!15 lm!227 (tuple2!343 (_1!171 lt!2597) (_2!171 lt!2597))))) p!216))))

(assert (= (and d!1177 (not res!9044)) b!10704))

(assert (= (and b!10704 res!9045) b!10705))

(declare-fun b_lambda!411 () Bool)

(assert (=> (not b_lambda!411) (not b!10704)))

(declare-fun t!2501 () Bool)

(declare-fun tb!175 () Bool)

(assert (=> (and start!1310 (= p!216 p!216) t!2501) tb!175))

(declare-fun result!313 () Bool)

(assert (=> tb!175 (= result!313 true)))

(assert (=> b!10704 t!2501))

(declare-fun b_and!601 () Bool)

(assert (= b_and!599 (and (=> t!2501 result!313) b_and!601)))

(declare-fun m!6913 () Bool)

(assert (=> b!10704 m!6913))

(declare-fun m!6915 () Bool)

(assert (=> b!10705 m!6915))

(assert (=> b!10673 d!1177))

(declare-fun d!1179 () Bool)

(declare-fun e!6256 () Bool)

(assert (=> d!1179 e!6256))

(declare-fun res!9062 () Bool)

(assert (=> d!1179 (=> (not res!9062) (not e!6256))))

(declare-fun lt!2615 () ListLongMap!323)

(declare-fun contains!141 (ListLongMap!323 (_ BitVec 64)) Bool)

(assert (=> d!1179 (= res!9062 (contains!141 lt!2615 (_1!171 (tuple2!343 (_1!171 lt!2597) (_2!171 lt!2597)))))))

(declare-fun lt!2613 () List!323)

(assert (=> d!1179 (= lt!2615 (ListLongMap!324 lt!2613))))

(declare-fun lt!2614 () Unit!215)

(declare-fun lt!2616 () Unit!215)

(assert (=> d!1179 (= lt!2614 lt!2616)))

(declare-datatypes ((Option!23 0))(
  ( (Some!22 (v!1337 B!352)) (None!21) )
))
(declare-fun getValueByKey!17 (List!323 (_ BitVec 64)) Option!23)

(assert (=> d!1179 (= (getValueByKey!17 lt!2613 (_1!171 (tuple2!343 (_1!171 lt!2597) (_2!171 lt!2597)))) (Some!22 (_2!171 (tuple2!343 (_1!171 lt!2597) (_2!171 lt!2597)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!1 (List!323 (_ BitVec 64) B!352) Unit!215)

(assert (=> d!1179 (= lt!2616 (lemmaContainsTupThenGetReturnValue!1 lt!2613 (_1!171 (tuple2!343 (_1!171 lt!2597) (_2!171 lt!2597))) (_2!171 (tuple2!343 (_1!171 lt!2597) (_2!171 lt!2597)))))))

(declare-fun insertStrictlySorted!1 (List!323 (_ BitVec 64) B!352) List!323)

(assert (=> d!1179 (= lt!2613 (insertStrictlySorted!1 (toList!177 lm!227) (_1!171 (tuple2!343 (_1!171 lt!2597) (_2!171 lt!2597))) (_2!171 (tuple2!343 (_1!171 lt!2597) (_2!171 lt!2597)))))))

(assert (=> d!1179 (= (+!15 lm!227 (tuple2!343 (_1!171 lt!2597) (_2!171 lt!2597))) lt!2615)))

(declare-fun b!10722 () Bool)

(declare-fun res!9063 () Bool)

(assert (=> b!10722 (=> (not res!9063) (not e!6256))))

(assert (=> b!10722 (= res!9063 (= (getValueByKey!17 (toList!177 lt!2615) (_1!171 (tuple2!343 (_1!171 lt!2597) (_2!171 lt!2597)))) (Some!22 (_2!171 (tuple2!343 (_1!171 lt!2597) (_2!171 lt!2597))))))))

(declare-fun b!10723 () Bool)

(declare-fun contains!142 (List!323 tuple2!342) Bool)

(assert (=> b!10723 (= e!6256 (contains!142 (toList!177 lt!2615) (tuple2!343 (_1!171 lt!2597) (_2!171 lt!2597))))))

(assert (= (and d!1179 res!9062) b!10722))

(assert (= (and b!10722 res!9063) b!10723))

(declare-fun m!6937 () Bool)

(assert (=> d!1179 m!6937))

(declare-fun m!6939 () Bool)

(assert (=> d!1179 m!6939))

(declare-fun m!6941 () Bool)

(assert (=> d!1179 m!6941))

(declare-fun m!6943 () Bool)

(assert (=> d!1179 m!6943))

(declare-fun m!6945 () Bool)

(assert (=> b!10722 m!6945))

(declare-fun m!6947 () Bool)

(assert (=> b!10723 m!6947))

(assert (=> b!10673 d!1179))

(declare-fun d!1195 () Bool)

(assert (=> d!1195 (forall!42 (toList!177 (+!15 lm!227 (tuple2!343 (_1!171 lt!2597) (_2!171 lt!2597)))) p!216)))

(declare-fun lt!2643 () Unit!215)

(declare-fun choose!147 (ListLongMap!323 Int (_ BitVec 64) B!352) Unit!215)

(assert (=> d!1195 (= lt!2643 (choose!147 lm!227 p!216 (_1!171 lt!2597) (_2!171 lt!2597)))))

(declare-fun e!6265 () Bool)

(assert (=> d!1195 e!6265))

(declare-fun res!9078 () Bool)

(assert (=> d!1195 (=> (not res!9078) (not e!6265))))

(assert (=> d!1195 (= res!9078 (forall!42 (toList!177 lm!227) p!216))))

(assert (=> d!1195 (= (addValidProp!3 lm!227 p!216 (_1!171 lt!2597) (_2!171 lt!2597)) lt!2643)))

(declare-fun b!10739 () Bool)

(assert (=> b!10739 (= e!6265 (dynLambda!55 p!216 (tuple2!343 (_1!171 lt!2597) (_2!171 lt!2597))))))

(assert (= (and d!1195 res!9078) b!10739))

(declare-fun b_lambda!421 () Bool)

(assert (=> (not b_lambda!421) (not b!10739)))

(declare-fun t!2511 () Bool)

(declare-fun tb!185 () Bool)

(assert (=> (and start!1310 (= p!216 p!216) t!2511) tb!185))

(declare-fun result!323 () Bool)

(assert (=> tb!185 (= result!323 true)))

(assert (=> b!10739 t!2511))

(declare-fun b_and!611 () Bool)

(assert (= b_and!601 (and (=> t!2511 result!323) b_and!611)))

(assert (=> d!1195 m!6873))

(assert (=> d!1195 m!6875))

(declare-fun m!6973 () Bool)

(assert (=> d!1195 m!6973))

(assert (=> d!1195 m!6883))

(declare-fun m!6975 () Bool)

(assert (=> b!10739 m!6975))

(assert (=> b!10673 d!1195))

(declare-fun d!1201 () Bool)

(assert (=> d!1201 (= (head!759 kvs!4) (h!885 kvs!4))))

(assert (=> b!10673 d!1201))

(declare-fun d!1203 () Bool)

(assert (=> d!1203 (= (isEmpty!52 kvs!4) ((_ is Nil!320) kvs!4))))

(assert (=> b!10674 d!1203))

(declare-fun d!1205 () Bool)

(declare-fun res!9082 () Bool)

(declare-fun e!6269 () Bool)

(assert (=> d!1205 (=> res!9082 e!6269)))

(assert (=> d!1205 (= res!9082 ((_ is Nil!320) (toList!177 lm!227)))))

(assert (=> d!1205 (= (forall!42 (toList!177 lm!227) p!216) e!6269)))

(declare-fun b!10744 () Bool)

(declare-fun e!6270 () Bool)

(assert (=> b!10744 (= e!6269 e!6270)))

(declare-fun res!9083 () Bool)

(assert (=> b!10744 (=> (not res!9083) (not e!6270))))

(assert (=> b!10744 (= res!9083 (dynLambda!55 p!216 (h!885 (toList!177 lm!227))))))

(declare-fun b!10745 () Bool)

(assert (=> b!10745 (= e!6270 (forall!42 (t!2494 (toList!177 lm!227)) p!216))))

(assert (= (and d!1205 (not res!9082)) b!10744))

(assert (= (and b!10744 res!9083) b!10745))

(declare-fun b_lambda!425 () Bool)

(assert (=> (not b_lambda!425) (not b!10744)))

(declare-fun t!2515 () Bool)

(declare-fun tb!189 () Bool)

(assert (=> (and start!1310 (= p!216 p!216) t!2515) tb!189))

(declare-fun result!327 () Bool)

(assert (=> tb!189 (= result!327 true)))

(assert (=> b!10744 t!2515))

(declare-fun b_and!615 () Bool)

(assert (= b_and!611 (and (=> t!2515 result!327) b_and!615)))

(declare-fun m!6977 () Bool)

(assert (=> b!10744 m!6977))

(declare-fun m!6979 () Bool)

(assert (=> b!10745 m!6979))

(assert (=> start!1310 d!1205))

(declare-fun d!1207 () Bool)

(declare-fun isStrictlySorted!31 (List!323) Bool)

(assert (=> d!1207 (= (inv!511 lm!227) (isStrictlySorted!31 (toList!177 lm!227)))))

(declare-fun bs!401 () Bool)

(assert (= bs!401 d!1207))

(declare-fun m!6985 () Bool)

(assert (=> bs!401 m!6985))

(assert (=> start!1310 d!1207))

(declare-fun b!10760 () Bool)

(declare-fun e!6280 () Bool)

(declare-fun tp!1662 () Bool)

(assert (=> b!10760 (= e!6280 (and tp_is_empty!525 tp!1662))))

(assert (=> b!10672 (= tp!1646 e!6280)))

(assert (= (and b!10672 ((_ is Cons!319) (toList!177 lm!227))) b!10760))

(declare-fun b!10761 () Bool)

(declare-fun e!6281 () Bool)

(declare-fun tp!1663 () Bool)

(assert (=> b!10761 (= e!6281 (and tp_is_empty!525 tp!1663))))

(assert (=> b!10676 (= tp!1645 e!6281)))

(assert (= (and b!10676 ((_ is Cons!319) (t!2494 kvs!4))) b!10761))

(declare-fun b_lambda!437 () Bool)

(assert (= b_lambda!411 (or (and start!1310 b_free!411) b_lambda!437)))

(declare-fun b_lambda!439 () Bool)

(assert (= b_lambda!421 (or (and start!1310 b_free!411) b_lambda!439)))

(declare-fun b_lambda!441 () Bool)

(assert (= b_lambda!425 (or (and start!1310 b_free!411) b_lambda!441)))

(declare-fun b_lambda!443 () Bool)

(assert (= b_lambda!409 (or (and start!1310 b_free!411) b_lambda!443)))

(check-sat (not d!1195) (not b_lambda!443) (not b!10705) (not b_lambda!439) (not b!10745) (not d!1207) tp_is_empty!525 (not b!10703) b_and!615 (not b!10761) (not b_next!411) (not d!1179) (not b!10723) (not b_lambda!437) (not b!10760) (not b_lambda!441) (not b!10722))
(check-sat b_and!615 (not b_next!411))
