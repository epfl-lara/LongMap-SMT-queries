; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!378 () Bool)

(assert start!378)

(declare-fun b_free!51 () Bool)

(declare-fun b_next!51 () Bool)

(assert (=> start!378 (= b_free!51 (not b_next!51))))

(declare-fun tp!202 () Bool)

(declare-fun b_and!171 () Bool)

(assert (=> start!378 (= tp!202 b_and!171)))

(declare-fun b!2379 () Bool)

(assert (=> b!2379 true))

(assert (=> b!2379 true))

(declare-fun lambda!38 () Int)

(declare-fun order!17 () Int)

(declare-fun order!19 () Int)

(declare-fun p!318 () Int)

(declare-fun dynLambda!29 (Int Int) Int)

(declare-fun dynLambda!30 (Int Int) Int)

(assert (=> b!2379 (< (dynLambda!29 order!17 p!318) (dynLambda!30 order!19 lambda!38))))

(declare-fun b!2377 () Bool)

(declare-fun res!4712 () Bool)

(declare-fun e!744 () Bool)

(assert (=> b!2377 (=> (not res!4712) (not e!744))))

(declare-fun e!742 () Bool)

(assert (=> b!2377 (= res!4712 e!742)))

(declare-fun res!4710 () Bool)

(assert (=> b!2377 (=> res!4710 e!742)))

(declare-datatypes ((B!286 0))(
  ( (B!287 (val!25 Int)) )
))
(declare-datatypes ((tuple2!50 0))(
  ( (tuple2!51 (_1!25 (_ BitVec 64)) (_2!25 B!286)) )
))
(declare-datatypes ((List!34 0))(
  ( (Nil!31) (Cons!30 (h!596 tuple2!50) (t!2143 List!34)) )
))
(declare-datatypes ((ListLongMap!55 0))(
  ( (ListLongMap!56 (toList!43 List!34)) )
))
(declare-fun lm!258 () ListLongMap!55)

(declare-fun isEmpty!38 (ListLongMap!55) Bool)

(assert (=> b!2377 (= res!4710 (isEmpty!38 lm!258))))

(declare-fun k0!394 () (_ BitVec 64))

(declare-datatypes ((Option!11 0))(
  ( (Some!10 (v!1103 B!286)) (None!9) )
))
(declare-fun forall!31 (Option!11 Int) Bool)

(declare-fun getValueByKey!5 (List!34 (_ BitVec 64)) Option!11)

(assert (=> b!2379 (= e!744 (not (forall!31 (getValueByKey!5 (toList!43 lm!258) k0!394) lambda!38)))))

(declare-fun b!2378 () Bool)

(declare-fun head!756 (List!34) tuple2!50)

(assert (=> b!2378 (= e!742 (= (_1!25 (head!756 (toList!43 lm!258))) k0!394))))

(declare-fun b!2380 () Bool)

(declare-fun e!743 () Bool)

(declare-fun tp!203 () Bool)

(assert (=> b!2380 (= e!743 tp!203)))

(declare-fun res!4711 () Bool)

(assert (=> start!378 (=> (not res!4711) (not e!744))))

(declare-fun forall!32 (List!34 Int) Bool)

(assert (=> start!378 (= res!4711 (forall!32 (toList!43 lm!258) p!318))))

(assert (=> start!378 e!744))

(declare-fun inv!80 (ListLongMap!55) Bool)

(assert (=> start!378 (and (inv!80 lm!258) e!743)))

(assert (=> start!378 tp!202))

(assert (=> start!378 true))

(assert (= (and start!378 res!4711) b!2377))

(assert (= (and b!2377 (not res!4710)) b!2378))

(assert (= (and b!2377 res!4712) b!2379))

(assert (= start!378 b!2380))

(declare-fun m!1005 () Bool)

(assert (=> b!2377 m!1005))

(declare-fun m!1007 () Bool)

(assert (=> b!2379 m!1007))

(assert (=> b!2379 m!1007))

(declare-fun m!1009 () Bool)

(assert (=> b!2379 m!1009))

(declare-fun m!1011 () Bool)

(assert (=> b!2378 m!1011))

(declare-fun m!1013 () Bool)

(assert (=> start!378 m!1013))

(declare-fun m!1015 () Bool)

(assert (=> start!378 m!1015))

(check-sat (not b_next!51) (not start!378) (not b!2379) (not b!2377) b_and!171 (not b!2378) (not b!2380))
(check-sat b_and!171 (not b_next!51))
(get-model)

(declare-fun d!489 () Bool)

(assert (=> d!489 (= (head!756 (toList!43 lm!258)) (h!596 (toList!43 lm!258)))))

(assert (=> b!2378 d!489))

(declare-fun d!491 () Bool)

(declare-fun res!4733 () Bool)

(declare-fun e!766 () Bool)

(assert (=> d!491 (=> res!4733 e!766)))

(get-info :version)

(assert (=> d!491 (= res!4733 (not ((_ is Some!10) (getValueByKey!5 (toList!43 lm!258) k0!394))))))

(assert (=> d!491 (= (forall!31 (getValueByKey!5 (toList!43 lm!258) k0!394) lambda!38) e!766)))

(declare-fun b!2416 () Bool)

(declare-fun dynLambda!35 (Int B!286) Bool)

(assert (=> b!2416 (= e!766 (dynLambda!35 lambda!38 (v!1103 (getValueByKey!5 (toList!43 lm!258) k0!394))))))

(assert (= (and d!491 (not res!4733)) b!2416))

(declare-fun b_lambda!275 () Bool)

(assert (=> (not b_lambda!275) (not b!2416)))

(declare-fun m!1039 () Bool)

(assert (=> b!2416 m!1039))

(assert (=> b!2379 d!491))

(declare-fun b!2451 () Bool)

(declare-fun e!789 () Option!11)

(declare-fun e!790 () Option!11)

(assert (=> b!2451 (= e!789 e!790)))

(declare-fun c!165 () Bool)

(assert (=> b!2451 (= c!165 (and ((_ is Cons!30) (toList!43 lm!258)) (not (= (_1!25 (h!596 (toList!43 lm!258))) k0!394))))))

(declare-fun b!2450 () Bool)

(assert (=> b!2450 (= e!789 (Some!10 (_2!25 (h!596 (toList!43 lm!258)))))))

(declare-fun b!2452 () Bool)

(assert (=> b!2452 (= e!790 (getValueByKey!5 (t!2143 (toList!43 lm!258)) k0!394))))

(declare-fun b!2453 () Bool)

(assert (=> b!2453 (= e!790 None!9)))

(declare-fun d!499 () Bool)

(declare-fun c!164 () Bool)

(assert (=> d!499 (= c!164 (and ((_ is Cons!30) (toList!43 lm!258)) (= (_1!25 (h!596 (toList!43 lm!258))) k0!394)))))

(assert (=> d!499 (= (getValueByKey!5 (toList!43 lm!258) k0!394) e!789)))

(assert (= (and d!499 c!164) b!2450))

(assert (= (and d!499 (not c!164)) b!2451))

(assert (= (and b!2451 c!165) b!2452))

(assert (= (and b!2451 (not c!165)) b!2453))

(declare-fun m!1045 () Bool)

(assert (=> b!2452 m!1045))

(assert (=> b!2379 d!499))

(declare-fun d!507 () Bool)

(declare-fun res!4747 () Bool)

(declare-fun e!799 () Bool)

(assert (=> d!507 (=> res!4747 e!799)))

(assert (=> d!507 (= res!4747 ((_ is Nil!31) (toList!43 lm!258)))))

(assert (=> d!507 (= (forall!32 (toList!43 lm!258) p!318) e!799)))

(declare-fun b!2466 () Bool)

(declare-fun e!800 () Bool)

(assert (=> b!2466 (= e!799 e!800)))

(declare-fun res!4748 () Bool)

(assert (=> b!2466 (=> (not res!4748) (not e!800))))

(declare-fun dynLambda!38 (Int tuple2!50) Bool)

(assert (=> b!2466 (= res!4748 (dynLambda!38 p!318 (h!596 (toList!43 lm!258))))))

(declare-fun b!2467 () Bool)

(assert (=> b!2467 (= e!800 (forall!32 (t!2143 (toList!43 lm!258)) p!318))))

(assert (= (and d!507 (not res!4747)) b!2466))

(assert (= (and b!2466 res!4748) b!2467))

(declare-fun b_lambda!281 () Bool)

(assert (=> (not b_lambda!281) (not b!2466)))

(declare-fun t!2150 () Bool)

(declare-fun tb!113 () Bool)

(assert (=> (and start!378 (= p!318 p!318) t!2150) tb!113))

(declare-fun result!151 () Bool)

(assert (=> tb!113 (= result!151 true)))

(assert (=> b!2466 t!2150))

(declare-fun b_and!179 () Bool)

(assert (= b_and!171 (and (=> t!2150 result!151) b_and!179)))

(declare-fun m!1057 () Bool)

(assert (=> b!2466 m!1057))

(declare-fun m!1059 () Bool)

(assert (=> b!2467 m!1059))

(assert (=> start!378 d!507))

(declare-fun d!515 () Bool)

(declare-fun isStrictlySorted!18 (List!34) Bool)

(assert (=> d!515 (= (inv!80 lm!258) (isStrictlySorted!18 (toList!43 lm!258)))))

(declare-fun bs!117 () Bool)

(assert (= bs!117 d!515))

(declare-fun m!1065 () Bool)

(assert (=> bs!117 m!1065))

(assert (=> start!378 d!515))

(declare-fun d!521 () Bool)

(declare-fun isEmpty!42 (List!34) Bool)

(assert (=> d!521 (= (isEmpty!38 lm!258) (isEmpty!42 (toList!43 lm!258)))))

(declare-fun bs!118 () Bool)

(assert (= bs!118 d!521))

(declare-fun m!1067 () Bool)

(assert (=> bs!118 m!1067))

(assert (=> b!2377 d!521))

(declare-fun b!2478 () Bool)

(declare-fun e!807 () Bool)

(declare-fun tp_is_empty!41 () Bool)

(declare-fun tp!218 () Bool)

(assert (=> b!2478 (= e!807 (and tp_is_empty!41 tp!218))))

(assert (=> b!2380 (= tp!203 e!807)))

(assert (= (and b!2380 ((_ is Cons!30) (toList!43 lm!258))) b!2478))

(declare-fun b_lambda!295 () Bool)

(assert (= b_lambda!281 (or (and start!378 b_free!51) b_lambda!295)))

(declare-fun b_lambda!297 () Bool)

(assert (= b_lambda!275 (or b!2379 b_lambda!297)))

(declare-fun bs!119 () Bool)

(declare-fun d!523 () Bool)

(assert (= bs!119 (and d!523 b!2379)))

(assert (=> bs!119 (= (dynLambda!35 lambda!38 (v!1103 (getValueByKey!5 (toList!43 lm!258) k0!394))) (dynLambda!38 p!318 (tuple2!51 k0!394 (v!1103 (getValueByKey!5 (toList!43 lm!258) k0!394)))))))

(declare-fun b_lambda!299 () Bool)

(assert (=> (not b_lambda!299) (not bs!119)))

(declare-fun t!2156 () Bool)

(declare-fun tb!119 () Bool)

(assert (=> (and start!378 (= p!318 p!318) t!2156) tb!119))

(declare-fun result!161 () Bool)

(assert (=> tb!119 (= result!161 true)))

(assert (=> bs!119 t!2156))

(declare-fun b_and!185 () Bool)

(assert (= b_and!179 (and (=> t!2156 result!161) b_and!185)))

(declare-fun m!1069 () Bool)

(assert (=> bs!119 m!1069))

(assert (=> b!2416 d!523))

(check-sat tp_is_empty!41 (not b_next!51) (not b_lambda!295) (not d!515) (not d!521) (not b!2478) (not b_lambda!299) b_and!185 (not b!2452) (not b_lambda!297) (not b!2467))
(check-sat b_and!185 (not b_next!51))
(get-model)

(declare-fun b_lambda!301 () Bool)

(assert (= b_lambda!299 (or (and start!378 b_free!51) b_lambda!301)))

(check-sat tp_is_empty!41 (not b_next!51) (not b_lambda!295) (not d!515) (not d!521) (not b!2478) b_and!185 (not b!2452) (not b_lambda!297) (not b_lambda!301) (not b!2467))
(check-sat b_and!185 (not b_next!51))
(get-model)

(declare-fun d!529 () Bool)

(assert (=> d!529 (= (isEmpty!42 (toList!43 lm!258)) ((_ is Nil!31) (toList!43 lm!258)))))

(assert (=> d!521 d!529))

(declare-fun d!533 () Bool)

(declare-fun res!4761 () Bool)

(declare-fun e!820 () Bool)

(assert (=> d!533 (=> res!4761 e!820)))

(assert (=> d!533 (= res!4761 (or ((_ is Nil!31) (toList!43 lm!258)) ((_ is Nil!31) (t!2143 (toList!43 lm!258)))))))

(assert (=> d!533 (= (isStrictlySorted!18 (toList!43 lm!258)) e!820)))

(declare-fun b!2491 () Bool)

(declare-fun e!821 () Bool)

(assert (=> b!2491 (= e!820 e!821)))

(declare-fun res!4762 () Bool)

(assert (=> b!2491 (=> (not res!4762) (not e!821))))

(assert (=> b!2491 (= res!4762 (bvslt (_1!25 (h!596 (toList!43 lm!258))) (_1!25 (h!596 (t!2143 (toList!43 lm!258))))))))

(declare-fun b!2492 () Bool)

(assert (=> b!2492 (= e!821 (isStrictlySorted!18 (t!2143 (toList!43 lm!258))))))

(assert (= (and d!533 (not res!4761)) b!2491))

(assert (= (and b!2491 res!4762) b!2492))

(declare-fun m!1077 () Bool)

(assert (=> b!2492 m!1077))

(assert (=> d!515 d!533))

(declare-fun d!537 () Bool)

(declare-fun res!4763 () Bool)

(declare-fun e!824 () Bool)

(assert (=> d!537 (=> res!4763 e!824)))

(assert (=> d!537 (= res!4763 ((_ is Nil!31) (t!2143 (toList!43 lm!258))))))

(assert (=> d!537 (= (forall!32 (t!2143 (toList!43 lm!258)) p!318) e!824)))

(declare-fun b!2497 () Bool)

(declare-fun e!825 () Bool)

(assert (=> b!2497 (= e!824 e!825)))

(declare-fun res!4764 () Bool)

(assert (=> b!2497 (=> (not res!4764) (not e!825))))

(assert (=> b!2497 (= res!4764 (dynLambda!38 p!318 (h!596 (t!2143 (toList!43 lm!258)))))))

(declare-fun b!2498 () Bool)

(assert (=> b!2498 (= e!825 (forall!32 (t!2143 (t!2143 (toList!43 lm!258))) p!318))))

(assert (= (and d!537 (not res!4763)) b!2497))

(assert (= (and b!2497 res!4764) b!2498))

(declare-fun b_lambda!309 () Bool)

(assert (=> (not b_lambda!309) (not b!2497)))

(declare-fun t!2160 () Bool)

(declare-fun tb!123 () Bool)

(assert (=> (and start!378 (= p!318 p!318) t!2160) tb!123))

(declare-fun result!165 () Bool)

(assert (=> tb!123 (= result!165 true)))

(assert (=> b!2497 t!2160))

(declare-fun b_and!189 () Bool)

(assert (= b_and!185 (and (=> t!2160 result!165) b_and!189)))

(declare-fun m!1081 () Bool)

(assert (=> b!2497 m!1081))

(declare-fun m!1083 () Bool)

(assert (=> b!2498 m!1083))

(assert (=> b!2467 d!537))

(declare-fun b!2501 () Bool)

(declare-fun e!827 () Option!11)

(declare-fun e!828 () Option!11)

(assert (=> b!2501 (= e!827 e!828)))

(declare-fun c!171 () Bool)

(assert (=> b!2501 (= c!171 (and ((_ is Cons!30) (t!2143 (toList!43 lm!258))) (not (= (_1!25 (h!596 (t!2143 (toList!43 lm!258)))) k0!394))))))

(declare-fun b!2500 () Bool)

(assert (=> b!2500 (= e!827 (Some!10 (_2!25 (h!596 (t!2143 (toList!43 lm!258))))))))

(declare-fun b!2502 () Bool)

(assert (=> b!2502 (= e!828 (getValueByKey!5 (t!2143 (t!2143 (toList!43 lm!258))) k0!394))))

(declare-fun b!2503 () Bool)

(assert (=> b!2503 (= e!828 None!9)))

(declare-fun d!539 () Bool)

(declare-fun c!170 () Bool)

(assert (=> d!539 (= c!170 (and ((_ is Cons!30) (t!2143 (toList!43 lm!258))) (= (_1!25 (h!596 (t!2143 (toList!43 lm!258)))) k0!394)))))

(assert (=> d!539 (= (getValueByKey!5 (t!2143 (toList!43 lm!258)) k0!394) e!827)))

(assert (= (and d!539 c!170) b!2500))

(assert (= (and d!539 (not c!170)) b!2501))

(assert (= (and b!2501 c!171) b!2502))

(assert (= (and b!2501 (not c!171)) b!2503))

(declare-fun m!1085 () Bool)

(assert (=> b!2502 m!1085))

(assert (=> b!2452 d!539))

(declare-fun b!2504 () Bool)

(declare-fun e!829 () Bool)

(declare-fun tp!220 () Bool)

(assert (=> b!2504 (= e!829 (and tp_is_empty!41 tp!220))))

(assert (=> b!2478 (= tp!218 e!829)))

(assert (= (and b!2478 ((_ is Cons!30) (t!2143 (toList!43 lm!258)))) b!2504))

(declare-fun b_lambda!313 () Bool)

(assert (= b_lambda!309 (or (and start!378 b_free!51) b_lambda!313)))

(check-sat tp_is_empty!41 (not b_lambda!295) (not b!2504) b_and!189 (not b!2498) (not b_next!51) (not b!2502) (not b_lambda!313) (not b_lambda!297) (not b_lambda!301) (not b!2492))
(check-sat b_and!189 (not b_next!51))
