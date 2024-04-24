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

(declare-fun res!9096 () Bool)

(declare-fun e!6296 () Bool)

(assert (=> start!1350 (=> (not res!9096) (not e!6296))))

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

(assert (=> start!1350 (= res!9096 (forall!44 (toList!177 lm!227) p!216))))

(assert (=> start!1350 e!6296))

(declare-fun e!6295 () Bool)

(declare-fun inv!518 (ListLongMap!323) Bool)

(assert (=> start!1350 (and (inv!518 lm!227) e!6295)))

(assert (=> start!1350 tp!1676))

(declare-fun e!6294 () Bool)

(assert (=> start!1350 e!6294))

(declare-fun b!10780 () Bool)

(declare-fun tp_is_empty!529 () Bool)

(declare-fun tp!1674 () Bool)

(assert (=> b!10780 (= e!6294 (and tp_is_empty!529 tp!1674))))

(declare-fun b!10781 () Bool)

(declare-fun res!9095 () Bool)

(assert (=> b!10781 (=> (not res!9095) (not e!6296))))

(declare-fun kvs!4 () List!321)

(declare-fun isEmpty!54 (List!321) Bool)

(assert (=> b!10781 (= res!9095 (not (isEmpty!54 kvs!4)))))

(declare-fun b!10782 () Bool)

(declare-fun tp!1675 () Bool)

(assert (=> b!10782 (= e!6295 tp!1675)))

(declare-fun b!10783 () Bool)

(declare-fun res!9097 () Bool)

(assert (=> b!10783 (=> (not res!9097) (not e!6296))))

(assert (=> b!10783 (= res!9097 (forall!44 kvs!4 p!216))))

(declare-fun b!10784 () Bool)

(assert (=> b!10784 (= e!6296 (not (not (= kvs!4 Nil!318))))))

(declare-fun lt!2656 () ListLongMap!323)

(declare-fun lt!2658 () tuple2!342)

(declare-fun +!17 (ListLongMap!323 tuple2!342) ListLongMap!323)

(assert (=> b!10784 (= lt!2656 (+!17 lm!227 lt!2658))))

(assert (=> b!10784 (forall!44 (toList!177 (+!17 lm!227 (tuple2!343 (_1!171 lt!2658) (_2!171 lt!2658)))) p!216)))

(declare-datatypes ((Unit!229 0))(
  ( (Unit!230) )
))
(declare-fun lt!2657 () Unit!229)

(declare-fun addValidProp!5 (ListLongMap!323 Int (_ BitVec 64) B!356) Unit!229)

(assert (=> b!10784 (= lt!2657 (addValidProp!5 lm!227 p!216 (_1!171 lt!2658) (_2!171 lt!2658)))))

(declare-fun head!761 (List!321) tuple2!342)

(assert (=> b!10784 (= lt!2658 (head!761 kvs!4))))

(assert (= (and start!1350 res!9096) b!10783))

(assert (= (and b!10783 res!9097) b!10781))

(assert (= (and b!10781 res!9095) b!10784))

(assert (= start!1350 b!10782))

(get-info :version)

(assert (= (and start!1350 ((_ is Cons!317) kvs!4)) b!10780))

(declare-fun m!6991 () Bool)

(assert (=> start!1350 m!6991))

(declare-fun m!6993 () Bool)

(assert (=> start!1350 m!6993))

(declare-fun m!6995 () Bool)

(assert (=> b!10781 m!6995))

(declare-fun m!6997 () Bool)

(assert (=> b!10783 m!6997))

(declare-fun m!6999 () Bool)

(assert (=> b!10784 m!6999))

(declare-fun m!7001 () Bool)

(assert (=> b!10784 m!7001))

(declare-fun m!7003 () Bool)

(assert (=> b!10784 m!7003))

(declare-fun m!7005 () Bool)

(assert (=> b!10784 m!7005))

(declare-fun m!7007 () Bool)

(assert (=> b!10784 m!7007))

(check-sat (not b!10780) (not start!1350) (not b!10784) (not b!10783) (not b!10781) tp_is_empty!529 (not b!10782) (not b_next!415) b_and!621)
(check-sat b_and!621 (not b_next!415))
(get-model)

(declare-fun d!1217 () Bool)

(assert (=> d!1217 (= (isEmpty!54 kvs!4) ((_ is Nil!318) kvs!4))))

(assert (=> b!10781 d!1217))

(declare-fun d!1221 () Bool)

(declare-fun res!9126 () Bool)

(declare-fun e!6325 () Bool)

(assert (=> d!1221 (=> res!9126 e!6325)))

(assert (=> d!1221 (= res!9126 ((_ is Nil!318) kvs!4))))

(assert (=> d!1221 (= (forall!44 kvs!4 p!216) e!6325)))

(declare-fun b!10825 () Bool)

(declare-fun e!6326 () Bool)

(assert (=> b!10825 (= e!6325 e!6326)))

(declare-fun res!9127 () Bool)

(assert (=> b!10825 (=> (not res!9127) (not e!6326))))

(declare-fun dynLambda!58 (Int tuple2!342) Bool)

(assert (=> b!10825 (= res!9127 (dynLambda!58 p!216 (h!883 kvs!4)))))

(declare-fun b!10826 () Bool)

(assert (=> b!10826 (= e!6326 (forall!44 (t!2516 kvs!4) p!216))))

(assert (= (and d!1221 (not res!9126)) b!10825))

(assert (= (and b!10825 res!9127) b!10826))

(declare-fun b_lambda!456 () Bool)

(assert (=> (not b_lambda!456) (not b!10825)))

(declare-fun t!2521 () Bool)

(declare-fun tb!196 () Bool)

(assert (=> (and start!1350 (= p!216 p!216) t!2521) tb!196))

(declare-fun result!340 () Bool)

(assert (=> tb!196 (= result!340 true)))

(assert (=> b!10825 t!2521))

(declare-fun b_and!629 () Bool)

(assert (= b_and!621 (and (=> t!2521 result!340) b_and!629)))

(declare-fun m!7047 () Bool)

(assert (=> b!10825 m!7047))

(declare-fun m!7051 () Bool)

(assert (=> b!10826 m!7051))

(assert (=> b!10783 d!1221))

(declare-fun d!1227 () Bool)

(declare-fun res!9128 () Bool)

(declare-fun e!6327 () Bool)

(assert (=> d!1227 (=> res!9128 e!6327)))

(assert (=> d!1227 (= res!9128 ((_ is Nil!318) (toList!177 lm!227)))))

(assert (=> d!1227 (= (forall!44 (toList!177 lm!227) p!216) e!6327)))

(declare-fun b!10827 () Bool)

(declare-fun e!6328 () Bool)

(assert (=> b!10827 (= e!6327 e!6328)))

(declare-fun res!9129 () Bool)

(assert (=> b!10827 (=> (not res!9129) (not e!6328))))

(assert (=> b!10827 (= res!9129 (dynLambda!58 p!216 (h!883 (toList!177 lm!227))))))

(declare-fun b!10828 () Bool)

(assert (=> b!10828 (= e!6328 (forall!44 (t!2516 (toList!177 lm!227)) p!216))))

(assert (= (and d!1227 (not res!9128)) b!10827))

(assert (= (and b!10827 res!9129) b!10828))

(declare-fun b_lambda!459 () Bool)

(assert (=> (not b_lambda!459) (not b!10827)))

(declare-fun t!2524 () Bool)

(declare-fun tb!199 () Bool)

(assert (=> (and start!1350 (= p!216 p!216) t!2524) tb!199))

(declare-fun result!343 () Bool)

(assert (=> tb!199 (= result!343 true)))

(assert (=> b!10827 t!2524))

(declare-fun b_and!631 () Bool)

(assert (= b_and!629 (and (=> t!2524 result!343) b_and!631)))

(declare-fun m!7053 () Bool)

(assert (=> b!10827 m!7053))

(declare-fun m!7055 () Bool)

(assert (=> b!10828 m!7055))

(assert (=> start!1350 d!1227))

(declare-fun d!1231 () Bool)

(declare-fun isStrictlySorted!29 (List!321) Bool)

(assert (=> d!1231 (= (inv!518 lm!227) (isStrictlySorted!29 (toList!177 lm!227)))))

(declare-fun bs!405 () Bool)

(assert (= bs!405 d!1231))

(declare-fun m!7057 () Bool)

(assert (=> bs!405 m!7057))

(assert (=> start!1350 d!1231))

(declare-fun d!1233 () Bool)

(declare-fun e!6340 () Bool)

(assert (=> d!1233 e!6340))

(declare-fun res!9144 () Bool)

(assert (=> d!1233 (=> (not res!9144) (not e!6340))))

(declare-fun lt!2691 () ListLongMap!323)

(declare-fun contains!145 (ListLongMap!323 (_ BitVec 64)) Bool)

(assert (=> d!1233 (= res!9144 (contains!145 lt!2691 (_1!171 (tuple2!343 (_1!171 lt!2658) (_2!171 lt!2658)))))))

(declare-fun lt!2689 () List!321)

(assert (=> d!1233 (= lt!2691 (ListLongMap!324 lt!2689))))

(declare-fun lt!2688 () Unit!229)

(declare-fun lt!2690 () Unit!229)

(assert (=> d!1233 (= lt!2688 lt!2690)))

(declare-datatypes ((Option!26 0))(
  ( (Some!25 (v!1340 B!356)) (None!24) )
))
(declare-fun getValueByKey!20 (List!321 (_ BitVec 64)) Option!26)

(assert (=> d!1233 (= (getValueByKey!20 lt!2689 (_1!171 (tuple2!343 (_1!171 lt!2658) (_2!171 lt!2658)))) (Some!25 (_2!171 (tuple2!343 (_1!171 lt!2658) (_2!171 lt!2658)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!4 (List!321 (_ BitVec 64) B!356) Unit!229)

(assert (=> d!1233 (= lt!2690 (lemmaContainsTupThenGetReturnValue!4 lt!2689 (_1!171 (tuple2!343 (_1!171 lt!2658) (_2!171 lt!2658))) (_2!171 (tuple2!343 (_1!171 lt!2658) (_2!171 lt!2658)))))))

(declare-fun insertStrictlySorted!4 (List!321 (_ BitVec 64) B!356) List!321)

(assert (=> d!1233 (= lt!2689 (insertStrictlySorted!4 (toList!177 lm!227) (_1!171 (tuple2!343 (_1!171 lt!2658) (_2!171 lt!2658))) (_2!171 (tuple2!343 (_1!171 lt!2658) (_2!171 lt!2658)))))))

(assert (=> d!1233 (= (+!17 lm!227 (tuple2!343 (_1!171 lt!2658) (_2!171 lt!2658))) lt!2691)))

(declare-fun b!10843 () Bool)

(declare-fun res!9143 () Bool)

(assert (=> b!10843 (=> (not res!9143) (not e!6340))))

(assert (=> b!10843 (= res!9143 (= (getValueByKey!20 (toList!177 lt!2691) (_1!171 (tuple2!343 (_1!171 lt!2658) (_2!171 lt!2658)))) (Some!25 (_2!171 (tuple2!343 (_1!171 lt!2658) (_2!171 lt!2658))))))))

(declare-fun b!10844 () Bool)

(declare-fun contains!146 (List!321 tuple2!342) Bool)

(assert (=> b!10844 (= e!6340 (contains!146 (toList!177 lt!2691) (tuple2!343 (_1!171 lt!2658) (_2!171 lt!2658))))))

(assert (= (and d!1233 res!9144) b!10843))

(assert (= (and b!10843 res!9143) b!10844))

(declare-fun m!7067 () Bool)

(assert (=> d!1233 m!7067))

(declare-fun m!7069 () Bool)

(assert (=> d!1233 m!7069))

(declare-fun m!7071 () Bool)

(assert (=> d!1233 m!7071))

(declare-fun m!7073 () Bool)

(assert (=> d!1233 m!7073))

(declare-fun m!7075 () Bool)

(assert (=> b!10843 m!7075))

(declare-fun m!7077 () Bool)

(assert (=> b!10844 m!7077))

(assert (=> b!10784 d!1233))

(declare-fun d!1241 () Bool)

(declare-fun e!6341 () Bool)

(assert (=> d!1241 e!6341))

(declare-fun res!9146 () Bool)

(assert (=> d!1241 (=> (not res!9146) (not e!6341))))

(declare-fun lt!2695 () ListLongMap!323)

(assert (=> d!1241 (= res!9146 (contains!145 lt!2695 (_1!171 lt!2658)))))

(declare-fun lt!2693 () List!321)

(assert (=> d!1241 (= lt!2695 (ListLongMap!324 lt!2693))))

(declare-fun lt!2692 () Unit!229)

(declare-fun lt!2694 () Unit!229)

(assert (=> d!1241 (= lt!2692 lt!2694)))

(assert (=> d!1241 (= (getValueByKey!20 lt!2693 (_1!171 lt!2658)) (Some!25 (_2!171 lt!2658)))))

(assert (=> d!1241 (= lt!2694 (lemmaContainsTupThenGetReturnValue!4 lt!2693 (_1!171 lt!2658) (_2!171 lt!2658)))))

(assert (=> d!1241 (= lt!2693 (insertStrictlySorted!4 (toList!177 lm!227) (_1!171 lt!2658) (_2!171 lt!2658)))))

(assert (=> d!1241 (= (+!17 lm!227 lt!2658) lt!2695)))

(declare-fun b!10845 () Bool)

(declare-fun res!9145 () Bool)

(assert (=> b!10845 (=> (not res!9145) (not e!6341))))

(assert (=> b!10845 (= res!9145 (= (getValueByKey!20 (toList!177 lt!2695) (_1!171 lt!2658)) (Some!25 (_2!171 lt!2658))))))

(declare-fun b!10846 () Bool)

(assert (=> b!10846 (= e!6341 (contains!146 (toList!177 lt!2695) lt!2658))))

(assert (= (and d!1241 res!9146) b!10845))

(assert (= (and b!10845 res!9145) b!10846))

(declare-fun m!7079 () Bool)

(assert (=> d!1241 m!7079))

(declare-fun m!7081 () Bool)

(assert (=> d!1241 m!7081))

(declare-fun m!7083 () Bool)

(assert (=> d!1241 m!7083))

(declare-fun m!7085 () Bool)

(assert (=> d!1241 m!7085))

(declare-fun m!7087 () Bool)

(assert (=> b!10845 m!7087))

(declare-fun m!7089 () Bool)

(assert (=> b!10846 m!7089))

(assert (=> b!10784 d!1241))

(declare-fun d!1243 () Bool)

(declare-fun res!9147 () Bool)

(declare-fun e!6342 () Bool)

(assert (=> d!1243 (=> res!9147 e!6342)))

(assert (=> d!1243 (= res!9147 ((_ is Nil!318) (toList!177 (+!17 lm!227 (tuple2!343 (_1!171 lt!2658) (_2!171 lt!2658))))))))

(assert (=> d!1243 (= (forall!44 (toList!177 (+!17 lm!227 (tuple2!343 (_1!171 lt!2658) (_2!171 lt!2658)))) p!216) e!6342)))

(declare-fun b!10847 () Bool)

(declare-fun e!6343 () Bool)

(assert (=> b!10847 (= e!6342 e!6343)))

(declare-fun res!9148 () Bool)

(assert (=> b!10847 (=> (not res!9148) (not e!6343))))

(assert (=> b!10847 (= res!9148 (dynLambda!58 p!216 (h!883 (toList!177 (+!17 lm!227 (tuple2!343 (_1!171 lt!2658) (_2!171 lt!2658)))))))))

(declare-fun b!10848 () Bool)

(assert (=> b!10848 (= e!6343 (forall!44 (t!2516 (toList!177 (+!17 lm!227 (tuple2!343 (_1!171 lt!2658) (_2!171 lt!2658))))) p!216))))

(assert (= (and d!1243 (not res!9147)) b!10847))

(assert (= (and b!10847 res!9148) b!10848))

(declare-fun b_lambda!465 () Bool)

(assert (=> (not b_lambda!465) (not b!10847)))

(declare-fun t!2530 () Bool)

(declare-fun tb!205 () Bool)

(assert (=> (and start!1350 (= p!216 p!216) t!2530) tb!205))

(declare-fun result!349 () Bool)

(assert (=> tb!205 (= result!349 true)))

(assert (=> b!10847 t!2530))

(declare-fun b_and!637 () Bool)

(assert (= b_and!631 (and (=> t!2530 result!349) b_and!637)))

(declare-fun m!7091 () Bool)

(assert (=> b!10847 m!7091))

(declare-fun m!7093 () Bool)

(assert (=> b!10848 m!7093))

(assert (=> b!10784 d!1243))

(declare-fun d!1245 () Bool)

(assert (=> d!1245 (= (head!761 kvs!4) (h!883 kvs!4))))

(assert (=> b!10784 d!1245))

(declare-fun d!1247 () Bool)

(assert (=> d!1247 (forall!44 (toList!177 (+!17 lm!227 (tuple2!343 (_1!171 lt!2658) (_2!171 lt!2658)))) p!216)))

(declare-fun lt!2730 () Unit!229)

(declare-fun choose!152 (ListLongMap!323 Int (_ BitVec 64) B!356) Unit!229)

(assert (=> d!1247 (= lt!2730 (choose!152 lm!227 p!216 (_1!171 lt!2658) (_2!171 lt!2658)))))

(declare-fun e!6358 () Bool)

(assert (=> d!1247 e!6358))

(declare-fun res!9171 () Bool)

(assert (=> d!1247 (=> (not res!9171) (not e!6358))))

(assert (=> d!1247 (= res!9171 (forall!44 (toList!177 lm!227) p!216))))

(assert (=> d!1247 (= (addValidProp!5 lm!227 p!216 (_1!171 lt!2658) (_2!171 lt!2658)) lt!2730)))

(declare-fun b!10872 () Bool)

(assert (=> b!10872 (= e!6358 (dynLambda!58 p!216 (tuple2!343 (_1!171 lt!2658) (_2!171 lt!2658))))))

(assert (= (and d!1247 res!9171) b!10872))

(declare-fun b_lambda!471 () Bool)

(assert (=> (not b_lambda!471) (not b!10872)))

(declare-fun t!2536 () Bool)

(declare-fun tb!211 () Bool)

(assert (=> (and start!1350 (= p!216 p!216) t!2536) tb!211))

(declare-fun result!355 () Bool)

(assert (=> tb!211 (= result!355 true)))

(assert (=> b!10872 t!2536))

(declare-fun b_and!643 () Bool)

(assert (= b_and!637 (and (=> t!2536 result!355) b_and!643)))

(assert (=> d!1247 m!6999))

(assert (=> d!1247 m!7001))

(declare-fun m!7151 () Bool)

(assert (=> d!1247 m!7151))

(assert (=> d!1247 m!6991))

(declare-fun m!7153 () Bool)

(assert (=> b!10872 m!7153))

(assert (=> b!10784 d!1247))

(declare-fun b!10877 () Bool)

(declare-fun e!6361 () Bool)

(declare-fun tp!1697 () Bool)

(assert (=> b!10877 (= e!6361 (and tp_is_empty!529 tp!1697))))

(assert (=> b!10782 (= tp!1675 e!6361)))

(assert (= (and b!10782 ((_ is Cons!317) (toList!177 lm!227))) b!10877))

(declare-fun b!10878 () Bool)

(declare-fun e!6362 () Bool)

(declare-fun tp!1698 () Bool)

(assert (=> b!10878 (= e!6362 (and tp_is_empty!529 tp!1698))))

(assert (=> b!10780 (= tp!1674 e!6362)))

(assert (= (and b!10780 ((_ is Cons!317) (t!2516 kvs!4))) b!10878))

(declare-fun b_lambda!473 () Bool)

(assert (= b_lambda!471 (or (and start!1350 b_free!415) b_lambda!473)))

(declare-fun b_lambda!475 () Bool)

(assert (= b_lambda!465 (or (and start!1350 b_free!415) b_lambda!475)))

(declare-fun b_lambda!477 () Bool)

(assert (= b_lambda!459 (or (and start!1350 b_free!415) b_lambda!477)))

(declare-fun b_lambda!479 () Bool)

(assert (= b_lambda!456 (or (and start!1350 b_free!415) b_lambda!479)))

(check-sat (not b!10878) (not b!10877) (not b_lambda!479) (not d!1231) (not d!1247) (not b!10845) (not b!10826) (not b_lambda!475) b_and!643 (not d!1241) (not b!10846) (not b_lambda!477) tp_is_empty!529 (not b!10843) (not b!10844) (not d!1233) (not b!10828) (not b_lambda!473) (not b!10848) (not b_next!415))
(check-sat b_and!643 (not b_next!415))
