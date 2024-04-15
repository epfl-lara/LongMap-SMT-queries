; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112 () Bool)

(assert start!112)

(declare-fun b_free!7 () Bool)

(declare-fun b_next!7 () Bool)

(assert (=> start!112 (= b_free!7 (not b_next!7))))

(declare-fun tp!13 () Bool)

(declare-fun b_and!19 () Bool)

(assert (=> start!112 (= tp!13 b_and!19)))

(declare-fun res!4310 () Bool)

(declare-fun e!240 () Bool)

(assert (=> start!112 (=> (not res!4310) (not e!240))))

(declare-datatypes ((B!242 0))(
  ( (B!243 (val!3 Int)) )
))
(declare-datatypes ((tuple2!6 0))(
  ( (tuple2!7 (_1!3 (_ BitVec 64)) (_2!3 B!242)) )
))
(declare-datatypes ((List!12 0))(
  ( (Nil!9) (Cons!8 (h!574 tuple2!6) (t!2019 List!12)) )
))
(declare-datatypes ((ListLongMap!11 0))(
  ( (ListLongMap!12 (toList!21 List!12)) )
))
(declare-fun lm!258 () ListLongMap!11)

(declare-fun p!318 () Int)

(declare-fun forall!8 (List!12 Int) Bool)

(assert (=> start!112 (= res!4310 (forall!8 (toList!21 lm!258) p!318))))

(assert (=> start!112 e!240))

(declare-fun e!239 () Bool)

(declare-fun inv!23 (ListLongMap!11) Bool)

(assert (=> start!112 (and (inv!23 lm!258) e!239)))

(assert (=> start!112 tp!13))

(declare-fun b!1681 () Bool)

(declare-fun res!4309 () Bool)

(assert (=> b!1681 (=> (not res!4309) (not e!240))))

(declare-fun isEmpty!10 (ListLongMap!11) Bool)

(assert (=> b!1681 (= res!4309 (not (isEmpty!10 lm!258)))))

(declare-fun b!1682 () Bool)

(assert (=> b!1682 (= e!240 (= (toList!21 lm!258) Nil!9))))

(declare-fun b!1683 () Bool)

(declare-fun tp!14 () Bool)

(assert (=> b!1683 (= e!239 tp!14)))

(assert (= (and start!112 res!4310) b!1681))

(assert (= (and b!1681 res!4309) b!1682))

(assert (= start!112 b!1683))

(declare-fun m!387 () Bool)

(assert (=> start!112 m!387))

(declare-fun m!389 () Bool)

(assert (=> start!112 m!389))

(declare-fun m!391 () Bool)

(assert (=> b!1681 m!391))

(check-sat (not b_next!7) (not b!1681) b_and!19 (not start!112) (not b!1683))
(check-sat b_and!19 (not b_next!7))
(get-model)

(declare-fun d!125 () Bool)

(declare-fun isEmpty!13 (List!12) Bool)

(assert (=> d!125 (= (isEmpty!10 lm!258) (isEmpty!13 (toList!21 lm!258)))))

(declare-fun bs!30 () Bool)

(assert (= bs!30 d!125))

(declare-fun m!405 () Bool)

(assert (=> bs!30 m!405))

(assert (=> b!1681 d!125))

(declare-fun d!127 () Bool)

(declare-fun res!4339 () Bool)

(declare-fun e!269 () Bool)

(assert (=> d!127 (=> res!4339 e!269)))

(get-info :version)

(assert (=> d!127 (= res!4339 ((_ is Nil!9) (toList!21 lm!258)))))

(assert (=> d!127 (= (forall!8 (toList!21 lm!258) p!318) e!269)))

(declare-fun b!1718 () Bool)

(declare-fun e!270 () Bool)

(assert (=> b!1718 (= e!269 e!270)))

(declare-fun res!4340 () Bool)

(assert (=> b!1718 (=> (not res!4340) (not e!270))))

(declare-fun dynLambda!5 (Int tuple2!6) Bool)

(assert (=> b!1718 (= res!4340 (dynLambda!5 p!318 (h!574 (toList!21 lm!258))))))

(declare-fun b!1719 () Bool)

(assert (=> b!1719 (= e!270 (forall!8 (t!2019 (toList!21 lm!258)) p!318))))

(assert (= (and d!127 (not res!4339)) b!1718))

(assert (= (and b!1718 res!4340) b!1719))

(declare-fun b_lambda!29 () Bool)

(assert (=> (not b_lambda!29) (not b!1718)))

(declare-fun t!2027 () Bool)

(declare-fun tb!11 () Bool)

(assert (=> (and start!112 (= p!318 p!318) t!2027) tb!11))

(declare-fun result!17 () Bool)

(assert (=> tb!11 (= result!17 true)))

(assert (=> b!1718 t!2027))

(declare-fun b_and!29 () Bool)

(assert (= b_and!19 (and (=> t!2027 result!17) b_and!29)))

(declare-fun m!415 () Bool)

(assert (=> b!1718 m!415))

(declare-fun m!417 () Bool)

(assert (=> b!1719 m!417))

(assert (=> start!112 d!127))

(declare-fun d!133 () Bool)

(declare-fun isStrictlySorted!3 (List!12) Bool)

(assert (=> d!133 (= (inv!23 lm!258) (isStrictlySorted!3 (toList!21 lm!258)))))

(declare-fun bs!33 () Bool)

(assert (= bs!33 d!133))

(declare-fun m!423 () Bool)

(assert (=> bs!33 m!423))

(assert (=> start!112 d!133))

(declare-fun b!1732 () Bool)

(declare-fun e!277 () Bool)

(declare-fun tp_is_empty!11 () Bool)

(declare-fun tp!33 () Bool)

(assert (=> b!1732 (= e!277 (and tp_is_empty!11 tp!33))))

(assert (=> b!1683 (= tp!14 e!277)))

(assert (= (and b!1683 ((_ is Cons!8) (toList!21 lm!258))) b!1732))

(declare-fun b_lambda!33 () Bool)

(assert (= b_lambda!29 (or (and start!112 b_free!7) b_lambda!33)))

(check-sat (not d!125) (not b_next!7) (not b_lambda!33) b_and!29 (not b!1719) (not d!133) (not b!1732) tp_is_empty!11)
(check-sat b_and!29 (not b_next!7))
(get-model)

(declare-fun d!147 () Bool)

(assert (=> d!147 (= (isEmpty!13 (toList!21 lm!258)) ((_ is Nil!9) (toList!21 lm!258)))))

(assert (=> d!125 d!147))

(declare-fun d!149 () Bool)

(declare-fun res!4359 () Bool)

(declare-fun e!298 () Bool)

(assert (=> d!149 (=> res!4359 e!298)))

(assert (=> d!149 (= res!4359 (or ((_ is Nil!9) (toList!21 lm!258)) ((_ is Nil!9) (t!2019 (toList!21 lm!258)))))))

(assert (=> d!149 (= (isStrictlySorted!3 (toList!21 lm!258)) e!298)))

(declare-fun b!1753 () Bool)

(declare-fun e!299 () Bool)

(assert (=> b!1753 (= e!298 e!299)))

(declare-fun res!4360 () Bool)

(assert (=> b!1753 (=> (not res!4360) (not e!299))))

(assert (=> b!1753 (= res!4360 (bvslt (_1!3 (h!574 (toList!21 lm!258))) (_1!3 (h!574 (t!2019 (toList!21 lm!258))))))))

(declare-fun b!1754 () Bool)

(assert (=> b!1754 (= e!299 (isStrictlySorted!3 (t!2019 (toList!21 lm!258))))))

(assert (= (and d!149 (not res!4359)) b!1753))

(assert (= (and b!1753 res!4360) b!1754))

(declare-fun m!437 () Bool)

(assert (=> b!1754 m!437))

(assert (=> d!133 d!149))

(declare-fun d!155 () Bool)

(declare-fun res!4363 () Bool)

(declare-fun e!302 () Bool)

(assert (=> d!155 (=> res!4363 e!302)))

(assert (=> d!155 (= res!4363 ((_ is Nil!9) (t!2019 (toList!21 lm!258))))))

(assert (=> d!155 (= (forall!8 (t!2019 (toList!21 lm!258)) p!318) e!302)))

(declare-fun b!1757 () Bool)

(declare-fun e!303 () Bool)

(assert (=> b!1757 (= e!302 e!303)))

(declare-fun res!4364 () Bool)

(assert (=> b!1757 (=> (not res!4364) (not e!303))))

(assert (=> b!1757 (= res!4364 (dynLambda!5 p!318 (h!574 (t!2019 (toList!21 lm!258)))))))

(declare-fun b!1758 () Bool)

(assert (=> b!1758 (= e!303 (forall!8 (t!2019 (t!2019 (toList!21 lm!258))) p!318))))

(assert (= (and d!155 (not res!4363)) b!1757))

(assert (= (and b!1757 res!4364) b!1758))

(declare-fun b_lambda!41 () Bool)

(assert (=> (not b_lambda!41) (not b!1757)))

(declare-fun t!2033 () Bool)

(declare-fun tb!17 () Bool)

(assert (=> (and start!112 (= p!318 p!318) t!2033) tb!17))

(declare-fun result!29 () Bool)

(assert (=> tb!17 (= result!29 true)))

(assert (=> b!1757 t!2033))

(declare-fun b_and!35 () Bool)

(assert (= b_and!29 (and (=> t!2033 result!29) b_and!35)))

(declare-fun m!443 () Bool)

(assert (=> b!1757 m!443))

(declare-fun m!445 () Bool)

(assert (=> b!1758 m!445))

(assert (=> b!1719 d!155))

(declare-fun b!1761 () Bool)

(declare-fun e!306 () Bool)

(declare-fun tp!38 () Bool)

(assert (=> b!1761 (= e!306 (and tp_is_empty!11 tp!38))))

(assert (=> b!1732 (= tp!33 e!306)))

(assert (= (and b!1732 ((_ is Cons!8) (t!2019 (toList!21 lm!258)))) b!1761))

(declare-fun b_lambda!47 () Bool)

(assert (= b_lambda!41 (or (and start!112 b_free!7) b_lambda!47)))

(check-sat b_and!35 (not b_next!7) (not b_lambda!33) (not b!1754) (not b!1758) tp_is_empty!11 (not b!1761) (not b_lambda!47))
(check-sat b_and!35 (not b_next!7))
