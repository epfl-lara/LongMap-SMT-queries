; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1350 () Bool)

(assert start!1350)

(declare-fun b_free!415 () Bool)

(declare-fun b_next!415 () Bool)

(assert (=> start!1350 (= b_free!415 (not b_next!415))))

(declare-fun tp!1676 () Bool)

(declare-fun b_and!621 () Bool)

(assert (=> start!1350 (= tp!1676 b_and!621)))

(declare-fun b!10780 () Bool)

(declare-fun e!6296 () Bool)

(declare-fun tp_is_empty!529 () Bool)

(declare-fun tp!1674 () Bool)

(assert (=> b!10780 (= e!6296 (and tp_is_empty!529 tp!1674))))

(declare-fun res!9097 () Bool)

(declare-fun e!6294 () Bool)

(assert (=> start!1350 (=> (not res!9097) (not e!6294))))

(declare-datatypes ((B!356 0))(
  ( (B!357 (val!273 Int)) )
))
(declare-datatypes ((tuple2!342 0))(
  ( (tuple2!343 (_1!171 (_ BitVec 64)) (_2!171 B!356)) )
))
(declare-datatypes ((List!321 0))(
  ( (Nil!318) (Cons!317 (h!883 tuple2!342) (t!2516 List!321)) )
))
(declare-datatypes ((ListLongMap!323 0))(
  ( (ListLongMap!324 (toList!177 List!321)) )
))
(declare-fun lm!227 () ListLongMap!323)

(declare-fun p!216 () Int)

(declare-fun forall!44 (List!321 Int) Bool)

(assert (=> start!1350 (= res!9097 (forall!44 (toList!177 lm!227) p!216))))

(assert (=> start!1350 e!6294))

(declare-fun e!6295 () Bool)

(declare-fun inv!518 (ListLongMap!323) Bool)

(assert (=> start!1350 (and (inv!518 lm!227) e!6295)))

(assert (=> start!1350 tp!1676))

(assert (=> start!1350 e!6296))

(declare-fun b!10781 () Bool)

(declare-fun res!9096 () Bool)

(assert (=> b!10781 (=> (not res!9096) (not e!6294))))

(declare-fun kvs!4 () List!321)

(declare-fun isEmpty!54 (List!321) Bool)

(assert (=> b!10781 (= res!9096 (not (isEmpty!54 kvs!4)))))

(declare-fun b!10782 () Bool)

(declare-fun tp!1675 () Bool)

(assert (=> b!10782 (= e!6295 tp!1675)))

(declare-fun b!10783 () Bool)

(assert (=> b!10783 (= e!6294 (not (not (= kvs!4 Nil!318))))))

(declare-fun lt!2656 () ListLongMap!323)

(declare-fun lt!2657 () tuple2!342)

(declare-fun +!17 (ListLongMap!323 tuple2!342) ListLongMap!323)

(assert (=> b!10783 (= lt!2656 (+!17 lm!227 lt!2657))))

(assert (=> b!10783 (forall!44 (toList!177 (+!17 lm!227 (tuple2!343 (_1!171 lt!2657) (_2!171 lt!2657)))) p!216)))

(declare-datatypes ((Unit!229 0))(
  ( (Unit!230) )
))
(declare-fun lt!2658 () Unit!229)

(declare-fun addValidProp!5 (ListLongMap!323 Int (_ BitVec 64) B!356) Unit!229)

(assert (=> b!10783 (= lt!2658 (addValidProp!5 lm!227 p!216 (_1!171 lt!2657) (_2!171 lt!2657)))))

(declare-fun head!761 (List!321) tuple2!342)

(assert (=> b!10783 (= lt!2657 (head!761 kvs!4))))

(declare-fun b!10784 () Bool)

(declare-fun res!9095 () Bool)

(assert (=> b!10784 (=> (not res!9095) (not e!6294))))

(assert (=> b!10784 (= res!9095 (forall!44 kvs!4 p!216))))

(assert (= (and start!1350 res!9097) b!10784))

(assert (= (and b!10784 res!9095) b!10781))

(assert (= (and b!10781 res!9096) b!10783))

(assert (= start!1350 b!10782))

(get-info :version)

(assert (= (and start!1350 ((_ is Cons!317) kvs!4)) b!10780))

(declare-fun m!6995 () Bool)

(assert (=> start!1350 m!6995))

(declare-fun m!6997 () Bool)

(assert (=> start!1350 m!6997))

(declare-fun m!6999 () Bool)

(assert (=> b!10781 m!6999))

(declare-fun m!7001 () Bool)

(assert (=> b!10783 m!7001))

(declare-fun m!7003 () Bool)

(assert (=> b!10783 m!7003))

(declare-fun m!7005 () Bool)

(assert (=> b!10783 m!7005))

(declare-fun m!7007 () Bool)

(assert (=> b!10783 m!7007))

(declare-fun m!7009 () Bool)

(assert (=> b!10783 m!7009))

(declare-fun m!7011 () Bool)

(assert (=> b!10784 m!7011))

(check-sat (not b!10784) tp_is_empty!529 (not b!10780) (not b!10781) (not start!1350) b_and!621 (not b!10782) (not b!10783) (not b_next!415))
(check-sat b_and!621 (not b_next!415))
(get-model)

(declare-fun d!1219 () Bool)

(assert (=> d!1219 (forall!44 (toList!177 (+!17 lm!227 (tuple2!343 (_1!171 lt!2657) (_2!171 lt!2657)))) p!216)))

(declare-fun lt!2679 () Unit!229)

(declare-fun choose!149 (ListLongMap!323 Int (_ BitVec 64) B!356) Unit!229)

(assert (=> d!1219 (= lt!2679 (choose!149 lm!227 p!216 (_1!171 lt!2657) (_2!171 lt!2657)))))

(declare-fun e!6331 () Bool)

(assert (=> d!1219 e!6331))

(declare-fun res!9132 () Bool)

(assert (=> d!1219 (=> (not res!9132) (not e!6331))))

(assert (=> d!1219 (= res!9132 (forall!44 (toList!177 lm!227) p!216))))

(assert (=> d!1219 (= (addValidProp!5 lm!227 p!216 (_1!171 lt!2657) (_2!171 lt!2657)) lt!2679)))

(declare-fun b!10832 () Bool)

(declare-fun dynLambda!59 (Int tuple2!342) Bool)

(assert (=> b!10832 (= e!6331 (dynLambda!59 p!216 (tuple2!343 (_1!171 lt!2657) (_2!171 lt!2657))))))

(assert (= (and d!1219 res!9132) b!10832))

(declare-fun b_lambda!461 () Bool)

(assert (=> (not b_lambda!461) (not b!10832)))

(declare-fun t!2526 () Bool)

(declare-fun tb!201 () Bool)

(assert (=> (and start!1350 (= p!216 p!216) t!2526) tb!201))

(declare-fun result!345 () Bool)

(assert (=> tb!201 (= result!345 true)))

(assert (=> b!10832 t!2526))

(declare-fun b_and!633 () Bool)

(assert (= b_and!621 (and (=> t!2526 result!345) b_and!633)))

(assert (=> d!1219 m!7001))

(assert (=> d!1219 m!7003))

(declare-fun m!7063 () Bool)

(assert (=> d!1219 m!7063))

(assert (=> d!1219 m!6995))

(declare-fun m!7065 () Bool)

(assert (=> b!10832 m!7065))

(assert (=> b!10783 d!1219))

(declare-fun d!1235 () Bool)

(declare-fun e!6341 () Bool)

(assert (=> d!1235 e!6341))

(declare-fun res!9144 () Bool)

(assert (=> d!1235 (=> (not res!9144) (not e!6341))))

(declare-fun lt!2692 () ListLongMap!323)

(declare-fun contains!145 (ListLongMap!323 (_ BitVec 64)) Bool)

(assert (=> d!1235 (= res!9144 (contains!145 lt!2692 (_1!171 (tuple2!343 (_1!171 lt!2657) (_2!171 lt!2657)))))))

(declare-fun lt!2691 () List!321)

(assert (=> d!1235 (= lt!2692 (ListLongMap!324 lt!2691))))

(declare-fun lt!2693 () Unit!229)

(declare-fun lt!2694 () Unit!229)

(assert (=> d!1235 (= lt!2693 lt!2694)))

(declare-datatypes ((Option!26 0))(
  ( (Some!25 (v!1340 B!356)) (None!24) )
))
(declare-fun getValueByKey!20 (List!321 (_ BitVec 64)) Option!26)

(assert (=> d!1235 (= (getValueByKey!20 lt!2691 (_1!171 (tuple2!343 (_1!171 lt!2657) (_2!171 lt!2657)))) (Some!25 (_2!171 (tuple2!343 (_1!171 lt!2657) (_2!171 lt!2657)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!4 (List!321 (_ BitVec 64) B!356) Unit!229)

(assert (=> d!1235 (= lt!2694 (lemmaContainsTupThenGetReturnValue!4 lt!2691 (_1!171 (tuple2!343 (_1!171 lt!2657) (_2!171 lt!2657))) (_2!171 (tuple2!343 (_1!171 lt!2657) (_2!171 lt!2657)))))))

(declare-fun insertStrictlySorted!4 (List!321 (_ BitVec 64) B!356) List!321)

(assert (=> d!1235 (= lt!2691 (insertStrictlySorted!4 (toList!177 lm!227) (_1!171 (tuple2!343 (_1!171 lt!2657) (_2!171 lt!2657))) (_2!171 (tuple2!343 (_1!171 lt!2657) (_2!171 lt!2657)))))))

(assert (=> d!1235 (= (+!17 lm!227 (tuple2!343 (_1!171 lt!2657) (_2!171 lt!2657))) lt!2692)))

(declare-fun b!10845 () Bool)

(declare-fun res!9145 () Bool)

(assert (=> b!10845 (=> (not res!9145) (not e!6341))))

(assert (=> b!10845 (= res!9145 (= (getValueByKey!20 (toList!177 lt!2692) (_1!171 (tuple2!343 (_1!171 lt!2657) (_2!171 lt!2657)))) (Some!25 (_2!171 (tuple2!343 (_1!171 lt!2657) (_2!171 lt!2657))))))))

(declare-fun b!10846 () Bool)

(declare-fun contains!146 (List!321 tuple2!342) Bool)

(assert (=> b!10846 (= e!6341 (contains!146 (toList!177 lt!2692) (tuple2!343 (_1!171 lt!2657) (_2!171 lt!2657))))))

(assert (= (and d!1235 res!9144) b!10845))

(assert (= (and b!10845 res!9145) b!10846))

(declare-fun m!7081 () Bool)

(assert (=> d!1235 m!7081))

(declare-fun m!7083 () Bool)

(assert (=> d!1235 m!7083))

(declare-fun m!7085 () Bool)

(assert (=> d!1235 m!7085))

(declare-fun m!7087 () Bool)

(assert (=> d!1235 m!7087))

(declare-fun m!7089 () Bool)

(assert (=> b!10845 m!7089))

(declare-fun m!7091 () Bool)

(assert (=> b!10846 m!7091))

(assert (=> b!10783 d!1235))

(declare-fun d!1247 () Bool)

(declare-fun e!6342 () Bool)

(assert (=> d!1247 e!6342))

(declare-fun res!9146 () Bool)

(assert (=> d!1247 (=> (not res!9146) (not e!6342))))

(declare-fun lt!2696 () ListLongMap!323)

(assert (=> d!1247 (= res!9146 (contains!145 lt!2696 (_1!171 lt!2657)))))

(declare-fun lt!2695 () List!321)

(assert (=> d!1247 (= lt!2696 (ListLongMap!324 lt!2695))))

(declare-fun lt!2697 () Unit!229)

(declare-fun lt!2698 () Unit!229)

(assert (=> d!1247 (= lt!2697 lt!2698)))

(assert (=> d!1247 (= (getValueByKey!20 lt!2695 (_1!171 lt!2657)) (Some!25 (_2!171 lt!2657)))))

(assert (=> d!1247 (= lt!2698 (lemmaContainsTupThenGetReturnValue!4 lt!2695 (_1!171 lt!2657) (_2!171 lt!2657)))))

(assert (=> d!1247 (= lt!2695 (insertStrictlySorted!4 (toList!177 lm!227) (_1!171 lt!2657) (_2!171 lt!2657)))))

(assert (=> d!1247 (= (+!17 lm!227 lt!2657) lt!2696)))

(declare-fun b!10847 () Bool)

(declare-fun res!9147 () Bool)

(assert (=> b!10847 (=> (not res!9147) (not e!6342))))

(assert (=> b!10847 (= res!9147 (= (getValueByKey!20 (toList!177 lt!2696) (_1!171 lt!2657)) (Some!25 (_2!171 lt!2657))))))

(declare-fun b!10848 () Bool)

(assert (=> b!10848 (= e!6342 (contains!146 (toList!177 lt!2696) lt!2657))))

(assert (= (and d!1247 res!9146) b!10847))

(assert (= (and b!10847 res!9147) b!10848))

(declare-fun m!7093 () Bool)

(assert (=> d!1247 m!7093))

(declare-fun m!7095 () Bool)

(assert (=> d!1247 m!7095))

(declare-fun m!7097 () Bool)

(assert (=> d!1247 m!7097))

(declare-fun m!7099 () Bool)

(assert (=> d!1247 m!7099))

(declare-fun m!7101 () Bool)

(assert (=> b!10847 m!7101))

(declare-fun m!7103 () Bool)

(assert (=> b!10848 m!7103))

(assert (=> b!10783 d!1247))

(declare-fun d!1249 () Bool)

(declare-fun res!9156 () Bool)

(declare-fun e!6349 () Bool)

(assert (=> d!1249 (=> res!9156 e!6349)))

(assert (=> d!1249 (= res!9156 ((_ is Nil!318) (toList!177 (+!17 lm!227 (tuple2!343 (_1!171 lt!2657) (_2!171 lt!2657))))))))

(assert (=> d!1249 (= (forall!44 (toList!177 (+!17 lm!227 (tuple2!343 (_1!171 lt!2657) (_2!171 lt!2657)))) p!216) e!6349)))

(declare-fun b!10857 () Bool)

(declare-fun e!6350 () Bool)

(assert (=> b!10857 (= e!6349 e!6350)))

(declare-fun res!9157 () Bool)

(assert (=> b!10857 (=> (not res!9157) (not e!6350))))

(assert (=> b!10857 (= res!9157 (dynLambda!59 p!216 (h!883 (toList!177 (+!17 lm!227 (tuple2!343 (_1!171 lt!2657) (_2!171 lt!2657)))))))))

(declare-fun b!10858 () Bool)

(assert (=> b!10858 (= e!6350 (forall!44 (t!2516 (toList!177 (+!17 lm!227 (tuple2!343 (_1!171 lt!2657) (_2!171 lt!2657))))) p!216))))

(assert (= (and d!1249 (not res!9156)) b!10857))

(assert (= (and b!10857 res!9157) b!10858))

(declare-fun b_lambda!469 () Bool)

(assert (=> (not b_lambda!469) (not b!10857)))

(declare-fun t!2534 () Bool)

(declare-fun tb!209 () Bool)

(assert (=> (and start!1350 (= p!216 p!216) t!2534) tb!209))

(declare-fun result!353 () Bool)

(assert (=> tb!209 (= result!353 true)))

(assert (=> b!10857 t!2534))

(declare-fun b_and!641 () Bool)

(assert (= b_and!633 (and (=> t!2534 result!353) b_and!641)))

(declare-fun m!7105 () Bool)

(assert (=> b!10857 m!7105))

(declare-fun m!7109 () Bool)

(assert (=> b!10858 m!7109))

(assert (=> b!10783 d!1249))

(declare-fun d!1251 () Bool)

(assert (=> d!1251 (= (head!761 kvs!4) (h!883 kvs!4))))

(assert (=> b!10783 d!1251))

(declare-fun d!1255 () Bool)

(declare-fun res!9164 () Bool)

(declare-fun e!6354 () Bool)

(assert (=> d!1255 (=> res!9164 e!6354)))

(assert (=> d!1255 (= res!9164 ((_ is Nil!318) (toList!177 lm!227)))))

(assert (=> d!1255 (= (forall!44 (toList!177 lm!227) p!216) e!6354)))

(declare-fun b!10865 () Bool)

(declare-fun e!6355 () Bool)

(assert (=> b!10865 (= e!6354 e!6355)))

(declare-fun res!9165 () Bool)

(assert (=> b!10865 (=> (not res!9165) (not e!6355))))

(assert (=> b!10865 (= res!9165 (dynLambda!59 p!216 (h!883 (toList!177 lm!227))))))

(declare-fun b!10866 () Bool)

(assert (=> b!10866 (= e!6355 (forall!44 (t!2516 (toList!177 lm!227)) p!216))))

(assert (= (and d!1255 (not res!9164)) b!10865))

(assert (= (and b!10865 res!9165) b!10866))

(declare-fun b_lambda!471 () Bool)

(assert (=> (not b_lambda!471) (not b!10865)))

(declare-fun t!2536 () Bool)

(declare-fun tb!211 () Bool)

(assert (=> (and start!1350 (= p!216 p!216) t!2536) tb!211))

(declare-fun result!355 () Bool)

(assert (=> tb!211 (= result!355 true)))

(assert (=> b!10865 t!2536))

(declare-fun b_and!643 () Bool)

(assert (= b_and!641 (and (=> t!2536 result!355) b_and!643)))

(declare-fun m!7121 () Bool)

(assert (=> b!10865 m!7121))

(declare-fun m!7123 () Bool)

(assert (=> b!10866 m!7123))

(assert (=> start!1350 d!1255))

(declare-fun d!1259 () Bool)

(declare-fun isStrictlySorted!34 (List!321) Bool)

(assert (=> d!1259 (= (inv!518 lm!227) (isStrictlySorted!34 (toList!177 lm!227)))))

(declare-fun bs!407 () Bool)

(assert (= bs!407 d!1259))

(declare-fun m!7137 () Bool)

(assert (=> bs!407 m!7137))

(assert (=> start!1350 d!1259))

(declare-fun d!1263 () Bool)

(declare-fun res!9170 () Bool)

(declare-fun e!6359 () Bool)

(assert (=> d!1263 (=> res!9170 e!6359)))

(assert (=> d!1263 (= res!9170 ((_ is Nil!318) kvs!4))))

(assert (=> d!1263 (= (forall!44 kvs!4 p!216) e!6359)))

(declare-fun b!10871 () Bool)

(declare-fun e!6360 () Bool)

(assert (=> b!10871 (= e!6359 e!6360)))

(declare-fun res!9171 () Bool)

(assert (=> b!10871 (=> (not res!9171) (not e!6360))))

(assert (=> b!10871 (= res!9171 (dynLambda!59 p!216 (h!883 kvs!4)))))

(declare-fun b!10872 () Bool)

(assert (=> b!10872 (= e!6360 (forall!44 (t!2516 kvs!4) p!216))))

(assert (= (and d!1263 (not res!9170)) b!10871))

(assert (= (and b!10871 res!9171) b!10872))

(declare-fun b_lambda!475 () Bool)

(assert (=> (not b_lambda!475) (not b!10871)))

(declare-fun t!2540 () Bool)

(declare-fun tb!215 () Bool)

(assert (=> (and start!1350 (= p!216 p!216) t!2540) tb!215))

(declare-fun result!359 () Bool)

(assert (=> tb!215 (= result!359 true)))

(assert (=> b!10871 t!2540))

(declare-fun b_and!647 () Bool)

(assert (= b_and!643 (and (=> t!2540 result!359) b_and!647)))

(declare-fun m!7143 () Bool)

(assert (=> b!10871 m!7143))

(declare-fun m!7147 () Bool)

(assert (=> b!10872 m!7147))

(assert (=> b!10784 d!1263))

(declare-fun d!1267 () Bool)

(assert (=> d!1267 (= (isEmpty!54 kvs!4) ((_ is Nil!318) kvs!4))))

(assert (=> b!10781 d!1267))

(declare-fun b!10885 () Bool)

(declare-fun e!6368 () Bool)

(declare-fun tp!1701 () Bool)

(assert (=> b!10885 (= e!6368 (and tp_is_empty!529 tp!1701))))

(assert (=> b!10782 (= tp!1675 e!6368)))

(assert (= (and b!10782 ((_ is Cons!317) (toList!177 lm!227))) b!10885))

(declare-fun b!10886 () Bool)

(declare-fun e!6369 () Bool)

(declare-fun tp!1702 () Bool)

(assert (=> b!10886 (= e!6369 (and tp_is_empty!529 tp!1702))))

(assert (=> b!10780 (= tp!1674 e!6369)))

(assert (= (and b!10780 ((_ is Cons!317) (t!2516 kvs!4))) b!10886))

(declare-fun b_lambda!485 () Bool)

(assert (= b_lambda!469 (or (and start!1350 b_free!415) b_lambda!485)))

(declare-fun b_lambda!487 () Bool)

(assert (= b_lambda!475 (or (and start!1350 b_free!415) b_lambda!487)))

(declare-fun b_lambda!489 () Bool)

(assert (= b_lambda!471 (or (and start!1350 b_free!415) b_lambda!489)))

(declare-fun b_lambda!491 () Bool)

(assert (= b_lambda!461 (or (and start!1350 b_free!415) b_lambda!491)))

(check-sat b_and!647 (not b_lambda!487) (not b!10872) (not d!1247) tp_is_empty!529 (not b!10845) (not b!10847) (not b_lambda!485) (not b!10886) (not d!1235) (not d!1259) (not b_next!415) (not b!10866) (not d!1219) (not b!10846) (not b!10858) (not b!10885) (not b_lambda!491) (not b!10848) (not b_lambda!489))
(check-sat b_and!647 (not b_next!415))
