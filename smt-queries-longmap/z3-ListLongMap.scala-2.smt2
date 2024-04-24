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

(declare-fun res!4309 () Bool)

(declare-fun e!239 () Bool)

(assert (=> start!112 (=> (not res!4309) (not e!239))))

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

(assert (=> start!112 (= res!4309 (forall!8 (toList!21 lm!258) p!318))))

(assert (=> start!112 e!239))

(declare-fun e!240 () Bool)

(declare-fun inv!23 (ListLongMap!11) Bool)

(assert (=> start!112 (and (inv!23 lm!258) e!240)))

(assert (=> start!112 tp!13))

(declare-fun b!1681 () Bool)

(declare-fun res!4310 () Bool)

(assert (=> b!1681 (=> (not res!4310) (not e!239))))

(declare-fun isEmpty!10 (ListLongMap!11) Bool)

(assert (=> b!1681 (= res!4310 (not (isEmpty!10 lm!258)))))

(declare-fun b!1682 () Bool)

(assert (=> b!1682 (= e!239 (= (toList!21 lm!258) Nil!9))))

(declare-fun b!1683 () Bool)

(declare-fun tp!14 () Bool)

(assert (=> b!1683 (= e!240 tp!14)))

(assert (= (and start!112 res!4309) b!1681))

(assert (= (and b!1681 res!4310) b!1682))

(assert (= start!112 b!1683))

(declare-fun m!387 () Bool)

(assert (=> start!112 m!387))

(declare-fun m!389 () Bool)

(assert (=> start!112 m!389))

(declare-fun m!391 () Bool)

(assert (=> b!1681 m!391))

(check-sat (not start!112) b_and!19 (not b!1681) (not b!1683) (not b_next!7))
(check-sat b_and!19 (not b_next!7))
(get-model)

(declare-fun d!121 () Bool)

(declare-fun isEmpty!13 (List!12) Bool)

(assert (=> d!121 (= (isEmpty!10 lm!258) (isEmpty!13 (toList!21 lm!258)))))

(declare-fun bs!30 () Bool)

(assert (= bs!30 d!121))

(declare-fun m!405 () Bool)

(assert (=> bs!30 m!405))

(assert (=> b!1681 d!121))

(declare-fun d!127 () Bool)

(declare-fun res!4335 () Bool)

(declare-fun e!265 () Bool)

(assert (=> d!127 (=> res!4335 e!265)))

(get-info :version)

(assert (=> d!127 (= res!4335 ((_ is Nil!9) (toList!21 lm!258)))))

(assert (=> d!127 (= (forall!8 (toList!21 lm!258) p!318) e!265)))

(declare-fun b!1714 () Bool)

(declare-fun e!266 () Bool)

(assert (=> b!1714 (= e!265 e!266)))

(declare-fun res!4336 () Bool)

(assert (=> b!1714 (=> (not res!4336) (not e!266))))

(declare-fun dynLambda!5 (Int tuple2!6) Bool)

(assert (=> b!1714 (= res!4336 (dynLambda!5 p!318 (h!574 (toList!21 lm!258))))))

(declare-fun b!1715 () Bool)

(assert (=> b!1715 (= e!266 (forall!8 (t!2019 (toList!21 lm!258)) p!318))))

(assert (= (and d!127 (not res!4335)) b!1714))

(assert (= (and b!1714 res!4336) b!1715))

(declare-fun b_lambda!25 () Bool)

(assert (=> (not b_lambda!25) (not b!1714)))

(declare-fun t!2023 () Bool)

(declare-fun tb!7 () Bool)

(assert (=> (and start!112 (= p!318 p!318) t!2023) tb!7))

(declare-fun result!13 () Bool)

(assert (=> tb!7 (= result!13 true)))

(assert (=> b!1714 t!2023))

(declare-fun b_and!25 () Bool)

(assert (= b_and!19 (and (=> t!2023 result!13) b_and!25)))

(declare-fun m!407 () Bool)

(assert (=> b!1714 m!407))

(declare-fun m!409 () Bool)

(assert (=> b!1715 m!409))

(assert (=> start!112 d!127))

(declare-fun d!129 () Bool)

(declare-fun isStrictlySorted!3 (List!12) Bool)

(assert (=> d!129 (= (inv!23 lm!258) (isStrictlySorted!3 (toList!21 lm!258)))))

(declare-fun bs!31 () Bool)

(assert (= bs!31 d!129))

(declare-fun m!419 () Bool)

(assert (=> bs!31 m!419))

(assert (=> start!112 d!129))

(declare-fun b!1733 () Bool)

(declare-fun e!278 () Bool)

(declare-fun tp_is_empty!8 () Bool)

(declare-fun tp!34 () Bool)

(assert (=> b!1733 (= e!278 (and tp_is_empty!8 tp!34))))

(assert (=> b!1683 (= tp!14 e!278)))

(assert (= (and b!1683 ((_ is Cons!8) (toList!21 lm!258))) b!1733))

(declare-fun b_lambda!33 () Bool)

(assert (= b_lambda!25 (or (and start!112 b_free!7) b_lambda!33)))

(check-sat b_and!25 (not d!129) tp_is_empty!8 (not b_lambda!33) (not b_next!7) (not b!1733) (not d!121) (not b!1715))
(check-sat b_and!25 (not b_next!7))
(get-model)

(declare-fun d!143 () Bool)

(declare-fun res!4351 () Bool)

(declare-fun e!290 () Bool)

(assert (=> d!143 (=> res!4351 e!290)))

(assert (=> d!143 (= res!4351 (or ((_ is Nil!9) (toList!21 lm!258)) ((_ is Nil!9) (t!2019 (toList!21 lm!258)))))))

(assert (=> d!143 (= (isStrictlySorted!3 (toList!21 lm!258)) e!290)))

(declare-fun b!1745 () Bool)

(declare-fun e!291 () Bool)

(assert (=> b!1745 (= e!290 e!291)))

(declare-fun res!4352 () Bool)

(assert (=> b!1745 (=> (not res!4352) (not e!291))))

(assert (=> b!1745 (= res!4352 (bvslt (_1!3 (h!574 (toList!21 lm!258))) (_1!3 (h!574 (t!2019 (toList!21 lm!258))))))))

(declare-fun b!1746 () Bool)

(assert (=> b!1746 (= e!291 (isStrictlySorted!3 (t!2019 (toList!21 lm!258))))))

(assert (= (and d!143 (not res!4351)) b!1745))

(assert (= (and b!1745 res!4352) b!1746))

(declare-fun m!433 () Bool)

(assert (=> b!1746 m!433))

(assert (=> d!129 d!143))

(declare-fun d!151 () Bool)

(assert (=> d!151 (= (isEmpty!13 (toList!21 lm!258)) ((_ is Nil!9) (toList!21 lm!258)))))

(assert (=> d!121 d!151))

(declare-fun d!155 () Bool)

(declare-fun res!4361 () Bool)

(declare-fun e!300 () Bool)

(assert (=> d!155 (=> res!4361 e!300)))

(assert (=> d!155 (= res!4361 ((_ is Nil!9) (t!2019 (toList!21 lm!258))))))

(assert (=> d!155 (= (forall!8 (t!2019 (toList!21 lm!258)) p!318) e!300)))

(declare-fun b!1755 () Bool)

(declare-fun e!301 () Bool)

(assert (=> b!1755 (= e!300 e!301)))

(declare-fun res!4362 () Bool)

(assert (=> b!1755 (=> (not res!4362) (not e!301))))

(assert (=> b!1755 (= res!4362 (dynLambda!5 p!318 (h!574 (t!2019 (toList!21 lm!258)))))))

(declare-fun b!1756 () Bool)

(assert (=> b!1756 (= e!301 (forall!8 (t!2019 (t!2019 (toList!21 lm!258))) p!318))))

(assert (= (and d!155 (not res!4361)) b!1755))

(assert (= (and b!1755 res!4362) b!1756))

(declare-fun b_lambda!41 () Bool)

(assert (=> (not b_lambda!41) (not b!1755)))

(declare-fun t!2033 () Bool)

(declare-fun tb!17 () Bool)

(assert (=> (and start!112 (= p!318 p!318) t!2033) tb!17))

(declare-fun result!29 () Bool)

(assert (=> tb!17 (= result!29 true)))

(assert (=> b!1755 t!2033))

(declare-fun b_and!35 () Bool)

(assert (= b_and!25 (and (=> t!2033 result!29) b_and!35)))

(declare-fun m!441 () Bool)

(assert (=> b!1755 m!441))

(declare-fun m!443 () Bool)

(assert (=> b!1756 m!443))

(assert (=> b!1715 d!155))

(declare-fun b!1758 () Bool)

(declare-fun e!303 () Bool)

(declare-fun tp!37 () Bool)

(assert (=> b!1758 (= e!303 (and tp_is_empty!8 tp!37))))

(assert (=> b!1733 (= tp!34 e!303)))

(assert (= (and b!1733 ((_ is Cons!8) (t!2019 (toList!21 lm!258)))) b!1758))

(declare-fun b_lambda!45 () Bool)

(assert (= b_lambda!41 (or (and start!112 b_free!7) b_lambda!45)))

(check-sat (not b_lambda!45) b_and!35 (not b!1756) tp_is_empty!8 (not b!1746) (not b_lambda!33) (not b!1758) (not b_next!7))
(check-sat b_and!35 (not b_next!7))
