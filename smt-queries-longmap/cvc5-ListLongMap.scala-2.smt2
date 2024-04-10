; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112 () Bool)

(assert start!112)

(declare-fun b_free!7 () Bool)

(declare-fun b_next!7 () Bool)

(assert (=> start!112 (= b_free!7 (not b_next!7))))

(declare-fun tp!14 () Bool)

(declare-fun b_and!19 () Bool)

(assert (=> start!112 (= tp!14 b_and!19)))

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

(assert (=> start!112 tp!14))

(declare-fun b!1681 () Bool)

(declare-fun res!4309 () Bool)

(assert (=> b!1681 (=> (not res!4309) (not e!240))))

(declare-fun isEmpty!10 (ListLongMap!11) Bool)

(assert (=> b!1681 (= res!4309 (not (isEmpty!10 lm!258)))))

(declare-fun b!1682 () Bool)

(assert (=> b!1682 (= e!240 (= (toList!21 lm!258) Nil!9))))

(declare-fun b!1683 () Bool)

(declare-fun tp!13 () Bool)

(assert (=> b!1683 (= e!239 tp!13)))

(assert (= (and start!112 res!4310) b!1681))

(assert (= (and b!1681 res!4309) b!1682))

(assert (= start!112 b!1683))

(declare-fun m!387 () Bool)

(assert (=> start!112 m!387))

(declare-fun m!389 () Bool)

(assert (=> start!112 m!389))

(declare-fun m!391 () Bool)

(assert (=> b!1681 m!391))

(push 1)

(assert (not start!112))

(assert (not b!1681))

(assert (not b!1683))

(assert (not b_next!7))

(assert b_and!19)

(check-sat)

(pop 1)

(push 1)

(assert b_and!19)

(assert (not b_next!7))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!121 () Bool)

(declare-fun res!4327 () Bool)

(declare-fun e!257 () Bool)

(assert (=> d!121 (=> res!4327 e!257)))

(assert (=> d!121 (= res!4327 (is-Nil!9 (toList!21 lm!258)))))

(assert (=> d!121 (= (forall!8 (toList!21 lm!258) p!318) e!257)))

(declare-fun b!1706 () Bool)

(declare-fun e!258 () Bool)

(assert (=> b!1706 (= e!257 e!258)))

(declare-fun res!4328 () Bool)

(assert (=> b!1706 (=> (not res!4328) (not e!258))))

(declare-fun dynLambda!3 (Int tuple2!6) Bool)

(assert (=> b!1706 (= res!4328 (dynLambda!3 p!318 (h!574 (toList!21 lm!258))))))

(declare-fun b!1707 () Bool)

(assert (=> b!1707 (= e!258 (forall!8 (t!2019 (toList!21 lm!258)) p!318))))

(assert (= (and d!121 (not res!4327)) b!1706))

(assert (= (and b!1706 res!4328) b!1707))

(declare-fun b_lambda!25 () Bool)

(assert (=> (not b_lambda!25) (not b!1706)))

(declare-fun t!2023 () Bool)

(declare-fun tb!7 () Bool)

(assert (=> (and start!112 (= p!318 p!318) t!2023) tb!7))

(declare-fun result!13 () Bool)

(assert (=> tb!7 (= result!13 true)))

(assert (=> b!1706 t!2023))

(declare-fun b_and!25 () Bool)

(assert (= b_and!19 (and (=> t!2023 result!13) b_and!25)))

(declare-fun m!407 () Bool)

(assert (=> b!1706 m!407))

(declare-fun m!409 () Bool)

(assert (=> b!1707 m!409))

(assert (=> start!112 d!121))

(declare-fun d!129 () Bool)

(declare-fun isStrictlySorted!1 (List!12) Bool)

(assert (=> d!129 (= (inv!23 lm!258) (isStrictlySorted!1 (toList!21 lm!258)))))

(declare-fun bs!32 () Bool)

(assert (= bs!32 d!129))

(declare-fun m!413 () Bool)

(assert (=> bs!32 m!413))

(assert (=> start!112 d!129))

(declare-fun d!133 () Bool)

(declare-fun isEmpty!15 (List!12) Bool)

(assert (=> d!133 (= (isEmpty!10 lm!258) (isEmpty!15 (toList!21 lm!258)))))

(declare-fun bs!33 () Bool)

(assert (= bs!33 d!133))

(declare-fun m!419 () Bool)

(assert (=> bs!33 m!419))

(assert (=> b!1681 d!133))

(declare-fun b!1724 () Bool)

(declare-fun e!273 () Bool)

(declare-fun tp_is_empty!7 () Bool)

(declare-fun tp!29 () Bool)

(assert (=> b!1724 (= e!273 (and tp_is_empty!7 tp!29))))

(assert (=> b!1683 (= tp!13 e!273)))

(assert (= (and b!1683 (is-Cons!8 (toList!21 lm!258))) b!1724))

(declare-fun b_lambda!31 () Bool)

(assert (= b_lambda!25 (or (and start!112 b_free!7) b_lambda!31)))

(push 1)

(assert (not b!1707))

(assert tp_is_empty!7)

(assert (not b!1724))

(assert (not d!133))

(assert (not b_lambda!31))

(assert (not b_next!7))

(assert b_and!25)

(assert (not d!129))

(check-sat)

(pop 1)

(push 1)

(assert b_and!25)

(assert (not b_next!7))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!139 () Bool)

(declare-fun res!4341 () Bool)

(declare-fun e!280 () Bool)

(assert (=> d!139 (=> res!4341 e!280)))

(assert (=> d!139 (= res!4341 (is-Nil!9 (t!2019 (toList!21 lm!258))))))

(assert (=> d!139 (= (forall!8 (t!2019 (toList!21 lm!258)) p!318) e!280)))

(declare-fun b!1735 () Bool)

(declare-fun e!281 () Bool)

(assert (=> b!1735 (= e!280 e!281)))

(declare-fun res!4342 () Bool)

(assert (=> b!1735 (=> (not res!4342) (not e!281))))

(assert (=> b!1735 (= res!4342 (dynLambda!3 p!318 (h!574 (t!2019 (toList!21 lm!258)))))))

(declare-fun b!1736 () Bool)

(assert (=> b!1736 (= e!281 (forall!8 (t!2019 (t!2019 (toList!21 lm!258))) p!318))))

(assert (= (and d!139 (not res!4341)) b!1735))

(assert (= (and b!1735 res!4342) b!1736))

(declare-fun b_lambda!37 () Bool)

(assert (=> (not b_lambda!37) (not b!1735)))

(declare-fun t!2029 () Bool)

(declare-fun tb!13 () Bool)

(assert (=> (and start!112 (= p!318 p!318) t!2029) tb!13))

(declare-fun result!25 () Bool)

(assert (=> tb!13 (= result!25 true)))

(assert (=> b!1735 t!2029))

(declare-fun b_and!31 () Bool)

(assert (= b_and!25 (and (=> t!2029 result!25) b_and!31)))

(declare-fun m!429 () Bool)

(assert (=> b!1735 m!429))

(declare-fun m!431 () Bool)

(assert (=> b!1736 m!431))

(assert (=> b!1707 d!139))

(declare-fun d!141 () Bool)

(declare-fun res!4347 () Bool)

(declare-fun e!286 () Bool)

(assert (=> d!141 (=> res!4347 e!286)))

(assert (=> d!141 (= res!4347 (or (is-Nil!9 (toList!21 lm!258)) (is-Nil!9 (t!2019 (toList!21 lm!258)))))))

(assert (=> d!141 (= (isStrictlySorted!1 (toList!21 lm!258)) e!286)))

(declare-fun b!1741 () Bool)

(declare-fun e!287 () Bool)

(assert (=> b!1741 (= e!286 e!287)))

(declare-fun res!4348 () Bool)

(assert (=> b!1741 (=> (not res!4348) (not e!287))))

(assert (=> b!1741 (= res!4348 (bvslt (_1!3 (h!574 (toList!21 lm!258))) (_1!3 (h!574 (t!2019 (toList!21 lm!258))))))))

(declare-fun b!1742 () Bool)

(assert (=> b!1742 (= e!287 (isStrictlySorted!1 (t!2019 (toList!21 lm!258))))))

(assert (= (and d!141 (not res!4347)) b!1741))

(assert (= (and b!1741 res!4348) b!1742))

(declare-fun m!433 () Bool)

(assert (=> b!1742 m!433))

(assert (=> d!129 d!141))

(declare-fun d!145 () Bool)

(assert (=> d!145 (= (isEmpty!15 (toList!21 lm!258)) (is-Nil!9 (toList!21 lm!258)))))

(assert (=> d!133 d!145))

(declare-fun b!1743 () Bool)

(declare-fun e!288 () Bool)

(declare-fun tp!36 () Bool)

(assert (=> b!1743 (= e!288 (and tp_is_empty!7 tp!36))))

(assert (=> b!1724 (= tp!29 e!288)))

(assert (= (and b!1724 (is-Cons!8 (t!2019 (toList!21 lm!258)))) b!1743))

(declare-fun b_lambda!39 () Bool)

(assert (= b_lambda!37 (or (and start!112 b_free!7) b_lambda!39)))

(push 1)

(assert (not b!1736))

(assert b_and!31)

(assert tp_is_empty!7)

(assert (not b_lambda!31))

(assert (not b_next!7))

(assert (not b!1743))

(assert (not b_lambda!39))

(assert (not b!1742))

(check-sat)

(pop 1)

(push 1)

(assert b_and!31)

(assert (not b_next!7))

(check-sat)

(pop 1)

