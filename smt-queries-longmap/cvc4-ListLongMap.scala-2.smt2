; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116 () Bool)

(assert start!116)

(declare-fun b_free!11 () Bool)

(declare-fun b_next!11 () Bool)

(assert (=> start!116 (= b_free!11 (not b_next!11))))

(declare-fun tp!25 () Bool)

(declare-fun b_and!23 () Bool)

(assert (=> start!116 (= tp!25 b_and!23)))

(declare-fun res!4321 () Bool)

(declare-fun e!251 () Bool)

(assert (=> start!116 (=> (not res!4321) (not e!251))))

(declare-datatypes ((B!246 0))(
  ( (B!247 (val!5 Int)) )
))
(declare-datatypes ((tuple2!10 0))(
  ( (tuple2!11 (_1!5 (_ BitVec 64)) (_2!5 B!246)) )
))
(declare-datatypes ((List!14 0))(
  ( (Nil!11) (Cons!10 (h!576 tuple2!10) (t!2021 List!14)) )
))
(declare-datatypes ((ListLongMap!15 0))(
  ( (ListLongMap!16 (toList!23 List!14)) )
))
(declare-fun lm!258 () ListLongMap!15)

(declare-fun p!318 () Int)

(declare-fun forall!10 (List!14 Int) Bool)

(assert (=> start!116 (= res!4321 (forall!10 (toList!23 lm!258) p!318))))

(assert (=> start!116 e!251))

(declare-fun e!252 () Bool)

(declare-fun inv!25 (ListLongMap!15) Bool)

(assert (=> start!116 (and (inv!25 lm!258) e!252)))

(assert (=> start!116 tp!25))

(declare-fun b!1699 () Bool)

(declare-fun res!4322 () Bool)

(assert (=> b!1699 (=> (not res!4322) (not e!251))))

(declare-fun isEmpty!12 (ListLongMap!15) Bool)

(assert (=> b!1699 (= res!4322 (not (isEmpty!12 lm!258)))))

(declare-fun b!1700 () Bool)

(assert (=> b!1700 (= e!251 (= (toList!23 lm!258) Nil!11))))

(declare-fun b!1701 () Bool)

(declare-fun tp!26 () Bool)

(assert (=> b!1701 (= e!252 tp!26)))

(assert (= (and start!116 res!4321) b!1699))

(assert (= (and b!1699 res!4322) b!1700))

(assert (= start!116 b!1701))

(declare-fun m!399 () Bool)

(assert (=> start!116 m!399))

(declare-fun m!401 () Bool)

(assert (=> start!116 m!401))

(declare-fun m!403 () Bool)

(assert (=> b!1699 m!403))

(push 1)

(assert (not b!1701))

(assert b_and!23)

(assert (not b!1699))

(assert (not b_next!11))

(assert (not start!116))

(check-sat)

(pop 1)

(push 1)

(assert b_and!23)

(assert (not b_next!11))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!123 () Bool)

(declare-fun isEmpty!13 (List!14) Bool)

(assert (=> d!123 (= (isEmpty!12 lm!258) (isEmpty!13 (toList!23 lm!258)))))

(declare-fun bs!30 () Bool)

(assert (= bs!30 d!123))

(declare-fun m!405 () Bool)

(assert (=> bs!30 m!405))

(assert (=> b!1699 d!123))

(declare-fun d!127 () Bool)

(declare-fun res!4337 () Bool)

(declare-fun e!267 () Bool)

(assert (=> d!127 (=> res!4337 e!267)))

(assert (=> d!127 (= res!4337 (is-Nil!11 (toList!23 lm!258)))))

(assert (=> d!127 (= (forall!10 (toList!23 lm!258) p!318) e!267)))

(declare-fun b!1716 () Bool)

(declare-fun e!268 () Bool)

(assert (=> b!1716 (= e!267 e!268)))

(declare-fun res!4338 () Bool)

(assert (=> b!1716 (=> (not res!4338) (not e!268))))

(declare-fun dynLambda!4 (Int tuple2!10) Bool)

(assert (=> b!1716 (= res!4338 (dynLambda!4 p!318 (h!576 (toList!23 lm!258))))))

(declare-fun b!1717 () Bool)

(assert (=> b!1717 (= e!268 (forall!10 (t!2021 (toList!23 lm!258)) p!318))))

(assert (= (and d!127 (not res!4337)) b!1716))

(assert (= (and b!1716 res!4338) b!1717))

(declare-fun b_lambda!27 () Bool)

(assert (=> (not b_lambda!27) (not b!1716)))

(declare-fun t!2025 () Bool)

(declare-fun tb!9 () Bool)

(assert (=> (and start!116 (= p!318 p!318) t!2025) tb!9))

(declare-fun result!15 () Bool)

(assert (=> tb!9 (= result!15 true)))

(assert (=> b!1716 t!2025))

(declare-fun b_and!27 () Bool)

(assert (= b_and!23 (and (=> t!2025 result!15) b_and!27)))

(declare-fun m!415 () Bool)

(assert (=> b!1716 m!415))

(declare-fun m!417 () Bool)

(assert (=> b!1717 m!417))

(assert (=> start!116 d!127))

(declare-fun d!135 () Bool)

(declare-fun isStrictlySorted!2 (List!14) Bool)

(assert (=> d!135 (= (inv!25 lm!258) (isStrictlySorted!2 (toList!23 lm!258)))))

(declare-fun bs!34 () Bool)

(assert (= bs!34 d!135))

(declare-fun m!425 () Bool)

(assert (=> bs!34 m!425))

(assert (=> start!116 d!135))

(declare-fun b!1729 () Bool)

(declare-fun e!276 () Bool)

(declare-fun tp_is_empty!9 () Bool)

(declare-fun tp!32 () Bool)

(assert (=> b!1729 (= e!276 (and tp_is_empty!9 tp!32))))

(assert (=> b!1701 (= tp!26 e!276)))

(assert (= (and b!1701 (is-Cons!10 (toList!23 lm!258))) b!1729))

(declare-fun b_lambda!33 () Bool)

(assert (= b_lambda!27 (or (and start!116 b_free!11) b_lambda!33)))

(push 1)

(assert (not b!1717))

(assert (not b_next!11))

(assert b_and!27)

(assert (not b!1729))

(assert (not d!135))

(assert (not b_lambda!33))

(assert tp_is_empty!9)

(assert (not d!123))

(check-sat)

(pop 1)

(push 1)

(assert b_and!27)

(assert (not b_next!11))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!143 () Bool)

(declare-fun res!4353 () Bool)

(declare-fun e!293 () Bool)

(assert (=> d!143 (=> res!4353 e!293)))

(assert (=> d!143 (= res!4353 (or (is-Nil!11 (toList!23 lm!258)) (is-Nil!11 (t!2021 (toList!23 lm!258)))))))

(assert (=> d!143 (= (isStrictlySorted!2 (toList!23 lm!258)) e!293)))

(declare-fun b!1748 () Bool)

(declare-fun e!294 () Bool)

(assert (=> b!1748 (= e!293 e!294)))

(declare-fun res!4354 () Bool)

(assert (=> b!1748 (=> (not res!4354) (not e!294))))

(assert (=> b!1748 (= res!4354 (bvslt (_1!5 (h!576 (toList!23 lm!258))) (_1!5 (h!576 (t!2021 (toList!23 lm!258))))))))

(declare-fun b!1749 () Bool)

(assert (=> b!1749 (= e!294 (isStrictlySorted!2 (t!2021 (toList!23 lm!258))))))

(assert (= (and d!143 (not res!4353)) b!1748))

(assert (= (and b!1748 res!4354) b!1749))

(declare-fun m!435 () Bool)

(assert (=> b!1749 m!435))

(assert (=> d!135 d!143))

(declare-fun d!149 () Bool)

(declare-fun res!4355 () Bool)

(declare-fun e!295 () Bool)

(assert (=> d!149 (=> res!4355 e!295)))

(assert (=> d!149 (= res!4355 (is-Nil!11 (t!2021 (toList!23 lm!258))))))

(assert (=> d!149 (= (forall!10 (t!2021 (toList!23 lm!258)) p!318) e!295)))

(declare-fun b!1750 () Bool)

(declare-fun e!296 () Bool)

(assert (=> b!1750 (= e!295 e!296)))

(declare-fun res!4356 () Bool)

