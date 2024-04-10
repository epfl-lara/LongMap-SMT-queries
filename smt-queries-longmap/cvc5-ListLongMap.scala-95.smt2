; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1422 () Bool)

(assert start!1422)

(declare-fun b_free!433 () Bool)

(declare-fun b_next!433 () Bool)

(assert (=> start!1422 (= b_free!433 (not b_next!433))))

(declare-fun tp!1781 () Bool)

(declare-fun b_and!675 () Bool)

(assert (=> start!1422 (= tp!1781 b_and!675)))

(declare-fun b!11059 () Bool)

(declare-fun e!6494 () Bool)

(declare-fun tp!1780 () Bool)

(assert (=> b!11059 (= e!6494 tp!1780)))

(declare-fun b!11060 () Bool)

(declare-fun e!6493 () Bool)

(declare-fun p!216 () Int)

(declare-datatypes ((B!374 0))(
  ( (B!375 (val!282 Int)) )
))
(declare-datatypes ((tuple2!364 0))(
  ( (tuple2!365 (_1!182 (_ BitVec 64)) (_2!182 B!374)) )
))
(declare-datatypes ((List!334 0))(
  ( (Nil!331) (Cons!330 (h!896 tuple2!364) (t!2567 List!334)) )
))
(declare-fun kvs!4 () List!334)

(declare-fun dynLambda!64 (Int tuple2!364) Bool)

(declare-fun head!767 (List!334) tuple2!364)

(assert (=> b!11060 (= e!6493 (not (dynLambda!64 p!216 (head!767 kvs!4))))))

(declare-fun b!11061 () Bool)

(declare-fun res!9264 () Bool)

(assert (=> b!11061 (=> (not res!9264) (not e!6493))))

(declare-fun isEmpty!60 (List!334) Bool)

(assert (=> b!11061 (= res!9264 (not (isEmpty!60 kvs!4)))))

(declare-fun res!9265 () Bool)

(assert (=> start!1422 (=> (not res!9265) (not e!6493))))

(declare-datatypes ((ListLongMap!345 0))(
  ( (ListLongMap!346 (toList!188 List!334)) )
))
(declare-fun lm!227 () ListLongMap!345)

(declare-fun forall!53 (List!334 Int) Bool)

(assert (=> start!1422 (= res!9265 (forall!53 (toList!188 lm!227) p!216))))

(assert (=> start!1422 e!6493))

(declare-fun inv!542 (ListLongMap!345) Bool)

(assert (=> start!1422 (and (inv!542 lm!227) e!6494)))

(assert (=> start!1422 tp!1781))

(declare-fun e!6492 () Bool)

(assert (=> start!1422 e!6492))

(declare-fun b!11062 () Bool)

(declare-fun tp_is_empty!547 () Bool)

(declare-fun tp!1779 () Bool)

(assert (=> b!11062 (= e!6492 (and tp_is_empty!547 tp!1779))))

(declare-fun b!11063 () Bool)

(declare-fun res!9263 () Bool)

(assert (=> b!11063 (=> (not res!9263) (not e!6493))))

(assert (=> b!11063 (= res!9263 (forall!53 kvs!4 p!216))))

(assert (= (and start!1422 res!9265) b!11063))

(assert (= (and b!11063 res!9263) b!11061))

(assert (= (and b!11061 res!9264) b!11060))

(assert (= start!1422 b!11059))

(assert (= (and start!1422 (is-Cons!330 kvs!4)) b!11062))

(declare-fun b_lambda!527 () Bool)

(assert (=> (not b_lambda!527) (not b!11060)))

(declare-fun t!2566 () Bool)

(declare-fun tb!231 () Bool)

(assert (=> (and start!1422 (= p!216 p!216) t!2566) tb!231))

(declare-fun result!387 () Bool)

(assert (=> tb!231 (= result!387 true)))

(assert (=> b!11060 t!2566))

(declare-fun b_and!677 () Bool)

(assert (= b_and!675 (and (=> t!2566 result!387) b_and!677)))

(declare-fun m!7295 () Bool)

(assert (=> b!11060 m!7295))

(assert (=> b!11060 m!7295))

(declare-fun m!7297 () Bool)

(assert (=> b!11060 m!7297))

(declare-fun m!7299 () Bool)

(assert (=> b!11061 m!7299))

(declare-fun m!7301 () Bool)

(assert (=> start!1422 m!7301))

(declare-fun m!7303 () Bool)

(assert (=> start!1422 m!7303))

(declare-fun m!7305 () Bool)

(assert (=> b!11063 m!7305))

(push 1)

(assert b_and!677)

(assert (not b!11059))

(assert (not b!11061))

(assert (not b!11062))

(assert (not start!1422))

(assert (not b!11063))

(assert (not b_lambda!527))

(assert (not b!11060))

(assert tp_is_empty!547)

(assert (not b_next!433))

(check-sat)

(pop 1)

(push 1)

(assert b_and!677)

(assert (not b_next!433))

(check-sat)

(get-model)

(pop 1)

(declare-fun b_lambda!535 () Bool)

(assert (= b_lambda!527 (or (and start!1422 b_free!433) b_lambda!535)))

(push 1)

(assert b_and!677)

(assert (not b!11059))

(assert (not b_lambda!535))

(assert (not b!11061))

(assert (not b!11062))

(assert (not start!1422))

(assert (not b!11063))

(assert (not b!11060))

(assert tp_is_empty!547)

(assert (not b_next!433))

(check-sat)

(pop 1)

(push 1)

(assert b_and!677)

(assert (not b_next!433))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!1303 () Bool)

(assert (=> d!1303 (= (head!767 kvs!4) (h!896 kvs!4))))

(assert (=> b!11060 d!1303))

(declare-fun d!1305 () Bool)

(assert (=> d!1305 (= (isEmpty!60 kvs!4) (is-Nil!331 kvs!4))))

(assert (=> b!11061 d!1305))

(declare-fun d!1309 () Bool)

(declare-fun res!9298 () Bool)

(declare-fun e!6527 () Bool)

(assert (=> d!1309 (=> res!9298 e!6527)))

(assert (=> d!1309 (= res!9298 (is-Nil!331 (toList!188 lm!227)))))

(assert (=> d!1309 (= (forall!53 (toList!188 lm!227) p!216) e!6527)))

(declare-fun b!11108 () Bool)

(declare-fun e!6528 () Bool)

(assert (=> b!11108 (= e!6527 e!6528)))

(declare-fun res!9299 () Bool)

(assert (=> b!11108 (=> (not res!9299) (not e!6528))))

(assert (=> b!11108 (= res!9299 (dynLambda!64 p!216 (h!896 (toList!188 lm!227))))))

(declare-fun b!11109 () Bool)

(assert (=> b!11109 (= e!6528 (forall!53 (t!2567 (toList!188 lm!227)) p!216))))

(assert (= (and d!1309 (not res!9298)) b!11108))

(assert (= (and b!11108 res!9299) b!11109))

(declare-fun b_lambda!541 () Bool)

(assert (=> (not b_lambda!541) (not b!11108)))

(declare-fun t!2577 () Bool)

(declare-fun tb!239 () Bool)

(assert (=> (and start!1422 (= p!216 p!216) t!2577) tb!239))

(declare-fun result!395 () Bool)

(assert (=> tb!239 (= result!395 true)))

(assert (=> b!11108 t!2577))

(declare-fun b_and!689 () Bool)

(assert (= b_and!677 (and (=> t!2577 result!395) b_and!689)))

(declare-fun m!7335 () Bool)

(assert (=> b!11108 m!7335))

(declare-fun m!7337 () Bool)

(assert (=> b!11109 m!7337))

(assert (=> start!1422 d!1309))

(declare-fun d!1319 () Bool)

(declare-fun isStrictlySorted!37 (List!334) Bool)

(assert (=> d!1319 (= (inv!542 lm!227) (isStrictlySorted!37 (toList!188 lm!227)))))

(declare-fun bs!420 () Bool)

(assert (= bs!420 d!1319))

(declare-fun m!7347 () Bool)

(assert (=> bs!420 m!7347))

(assert (=> start!1422 d!1319))

(declare-fun d!1325 () Bool)

(declare-fun res!9304 () Bool)

(declare-fun e!6533 () Bool)

(assert (=> d!1325 (=> res!9304 e!6533)))

(assert (=> d!1325 (= res!9304 (is-Nil!331 kvs!4))))

(assert (=> d!1325 (= (forall!53 kvs!4 p!216) e!6533)))

(declare-fun b!11114 () Bool)

(declare-fun e!6534 () Bool)

(assert (=> b!11114 (= e!6533 e!6534)))

(declare-fun res!9305 () Bool)

(assert (=> b!11114 (=> (not res!9305) (not e!6534))))

(assert (=> b!11114 (= res!9305 (dynLambda!64 p!216 (h!896 kvs!4)))))

(declare-fun b!11115 () Bool)

(assert (=> b!11115 (= e!6534 (forall!53 (t!2567 kvs!4) p!216))))

(assert (= (and d!1325 (not res!9304)) b!11114))

(assert (= (and b!11114 res!9305) b!11115))

(declare-fun b_lambda!547 () Bool)

(assert (=> (not b_lambda!547) (not b!11114)))

(declare-fun t!2583 () Bool)

(declare-fun tb!245 () Bool)

(assert (=> (and start!1422 (= p!216 p!216) t!2583) tb!245))

(declare-fun result!401 () Bool)

(assert (=> tb!245 (= result!401 true)))

(assert (=> b!11114 t!2583))

(declare-fun b_and!695 () Bool)

(assert (= b_and!689 (and (=> t!2583 result!401) b_and!695)))

(declare-fun m!7353 () Bool)

(assert (=> b!11114 m!7353))

(declare-fun m!7355 () Bool)

(assert (=> b!11115 m!7355))

(assert (=> b!11063 d!1325))

(declare-fun b!11127 () Bool)

(declare-fun e!6542 () Bool)

(declare-fun tp!1805 () Bool)

(assert (=> b!11127 (= e!6542 (and tp_is_empty!547 tp!1805))))

(assert (=> b!11059 (= tp!1780 e!6542)))

(assert (= (and b!11059 (is-Cons!330 (toList!188 lm!227))) b!11127))

(declare-fun b!11131 () Bool)

(declare-fun e!6544 () Bool)

(declare-fun tp!1807 () Bool)

(assert (=> b!11131 (= e!6544 (and tp_is_empty!547 tp!1807))))

(assert (=> b!11062 (= tp!1779 e!6544)))

(assert (= (and b!11062 (is-Cons!330 (t!2567 kvs!4))) b!11131))

(declare-fun b_lambda!555 () Bool)

(assert (= b_lambda!541 (or (and start!1422 b_free!433) b_lambda!555)))

(declare-fun b_lambda!557 () Bool)

(assert (= b_lambda!547 (or (and start!1422 b_free!433) b_lambda!557)))

(push 1)

