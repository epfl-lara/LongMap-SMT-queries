; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1426 () Bool)

(assert start!1426)

(declare-fun b_free!437 () Bool)

(declare-fun b_next!437 () Bool)

(assert (=> start!1426 (= b_free!437 (not b_next!437))))

(declare-fun tp!1798 () Bool)

(declare-fun b_and!683 () Bool)

(assert (=> start!1426 (= tp!1798 b_and!683)))

(declare-fun res!9282 () Bool)

(declare-fun e!6510 () Bool)

(assert (=> start!1426 (=> (not res!9282) (not e!6510))))

(declare-datatypes ((B!378 0))(
  ( (B!379 (val!284 Int)) )
))
(declare-datatypes ((tuple2!368 0))(
  ( (tuple2!369 (_1!184 (_ BitVec 64)) (_2!184 B!378)) )
))
(declare-datatypes ((List!336 0))(
  ( (Nil!333) (Cons!332 (h!898 tuple2!368) (t!2573 List!336)) )
))
(declare-datatypes ((ListLongMap!349 0))(
  ( (ListLongMap!350 (toList!190 List!336)) )
))
(declare-fun lm!227 () ListLongMap!349)

(declare-fun p!216 () Int)

(declare-fun forall!55 (List!336 Int) Bool)

(assert (=> start!1426 (= res!9282 (forall!55 (toList!190 lm!227) p!216))))

(assert (=> start!1426 e!6510))

(declare-fun e!6511 () Bool)

(declare-fun inv!544 (ListLongMap!349) Bool)

(assert (=> start!1426 (and (inv!544 lm!227) e!6511)))

(assert (=> start!1426 tp!1798))

(declare-fun e!6512 () Bool)

(assert (=> start!1426 e!6512))

(declare-fun b!11089 () Bool)

(declare-fun res!9281 () Bool)

(assert (=> b!11089 (=> (not res!9281) (not e!6510))))

(declare-fun kvs!4 () List!336)

(assert (=> b!11089 (= res!9281 (forall!55 kvs!4 p!216))))

(declare-fun b!11090 () Bool)

(declare-fun res!9283 () Bool)

(assert (=> b!11090 (=> (not res!9283) (not e!6510))))

(declare-fun isEmpty!62 (List!336) Bool)

(assert (=> b!11090 (= res!9283 (not (isEmpty!62 kvs!4)))))

(declare-fun b!11091 () Bool)

(declare-fun tp_is_empty!551 () Bool)

(declare-fun tp!1797 () Bool)

(assert (=> b!11091 (= e!6512 (and tp_is_empty!551 tp!1797))))

(declare-fun b!11092 () Bool)

(declare-fun dynLambda!66 (Int tuple2!368) Bool)

(declare-fun head!769 (List!336) tuple2!368)

(assert (=> b!11092 (= e!6510 (not (dynLambda!66 p!216 (head!769 kvs!4))))))

(declare-fun b!11093 () Bool)

(declare-fun tp!1799 () Bool)

(assert (=> b!11093 (= e!6511 tp!1799)))

(assert (= (and start!1426 res!9282) b!11089))

(assert (= (and b!11089 res!9281) b!11090))

(assert (= (and b!11090 res!9283) b!11092))

(assert (= start!1426 b!11093))

(assert (= (and start!1426 (is-Cons!332 kvs!4)) b!11091))

(declare-fun b_lambda!531 () Bool)

(assert (=> (not b_lambda!531) (not b!11092)))

(declare-fun t!2572 () Bool)

(declare-fun tb!235 () Bool)

(assert (=> (and start!1426 (= p!216 p!216) t!2572) tb!235))

(declare-fun result!391 () Bool)

(assert (=> tb!235 (= result!391 true)))

(assert (=> b!11092 t!2572))

(declare-fun b_and!685 () Bool)

(assert (= b_and!683 (and (=> t!2572 result!391) b_and!685)))

(declare-fun m!7319 () Bool)

(assert (=> start!1426 m!7319))

(declare-fun m!7321 () Bool)

(assert (=> start!1426 m!7321))

(declare-fun m!7323 () Bool)

(assert (=> b!11089 m!7323))

(declare-fun m!7325 () Bool)

(assert (=> b!11090 m!7325))

(declare-fun m!7327 () Bool)

(assert (=> b!11092 m!7327))

(assert (=> b!11092 m!7327))

(declare-fun m!7329 () Bool)

(assert (=> b!11092 m!7329))

(push 1)

(assert (not b_lambda!531))

(assert tp_is_empty!551)

(assert (not b!11090))

(assert (not b_next!437))

(assert (not start!1426))

(assert (not b!11091))

(assert (not b!11092))

(assert (not b!11089))

(assert b_and!685)

(assert (not b!11093))

(check-sat)

(pop 1)

(push 1)

(assert b_and!685)

(assert (not b_next!437))

(check-sat)

(get-model)

(pop 1)

(declare-fun b_lambda!533 () Bool)

(assert (= b_lambda!531 (or (and start!1426 b_free!437) b_lambda!533)))

(push 1)

(assert tp_is_empty!551)

(assert (not b_lambda!533))

(assert (not b!11090))

(assert (not b_next!437))

(assert (not start!1426))

(assert (not b!11091))

(assert (not b!11092))

(assert (not b!11089))

(assert b_and!685)

(assert (not b!11093))

(check-sat)

(pop 1)

(push 1)

(assert b_and!685)

(assert (not b_next!437))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!1301 () Bool)

(declare-fun res!9288 () Bool)

(declare-fun e!6517 () Bool)

(assert (=> d!1301 (=> res!9288 e!6517)))

(assert (=> d!1301 (= res!9288 (is-Nil!333 kvs!4))))

(assert (=> d!1301 (= (forall!55 kvs!4 p!216) e!6517)))

(declare-fun b!11098 () Bool)

(declare-fun e!6518 () Bool)

(assert (=> b!11098 (= e!6517 e!6518)))

(declare-fun res!9289 () Bool)

(assert (=> b!11098 (=> (not res!9289) (not e!6518))))

(assert (=> b!11098 (= res!9289 (dynLambda!66 p!216 (h!898 kvs!4)))))

(declare-fun b!11099 () Bool)

(assert (=> b!11099 (= e!6518 (forall!55 (t!2573 kvs!4) p!216))))

(assert (= (and d!1301 (not res!9288)) b!11098))

(assert (= (and b!11098 res!9289) b!11099))

(declare-fun b_lambda!539 () Bool)

(assert (=> (not b_lambda!539) (not b!11098)))

(declare-fun t!2575 () Bool)

(declare-fun tb!237 () Bool)

(assert (=> (and start!1426 (= p!216 p!216) t!2575) tb!237))

(declare-fun result!393 () Bool)

(assert (=> tb!237 (= result!393 true)))

(assert (=> b!11098 t!2575))

(declare-fun b_and!687 () Bool)

(assert (= b_and!685 (and (=> t!2575 result!393) b_and!687)))

(declare-fun m!7331 () Bool)

(assert (=> b!11098 m!7331))

(declare-fun m!7333 () Bool)

(assert (=> b!11099 m!7333))

(assert (=> b!11089 d!1301))

(declare-fun d!1313 () Bool)

(assert (=> d!1313 (= (isEmpty!62 kvs!4) (is-Nil!333 kvs!4))))

(assert (=> b!11090 d!1313))

(declare-fun d!1315 () Bool)

(assert (=> d!1315 (= (head!769 kvs!4) (h!898 kvs!4))))

(assert (=> b!11092 d!1315))

(declare-fun d!1317 () Bool)

(declare-fun res!9302 () Bool)

(declare-fun e!6531 () Bool)

(assert (=> d!1317 (=> res!9302 e!6531)))

(assert (=> d!1317 (= res!9302 (is-Nil!333 (toList!190 lm!227)))))

(assert (=> d!1317 (= (forall!55 (toList!190 lm!227) p!216) e!6531)))

(declare-fun b!11112 () Bool)

(declare-fun e!6532 () Bool)

(assert (=> b!11112 (= e!6531 e!6532)))

(declare-fun res!9303 () Bool)

(assert (=> b!11112 (=> (not res!9303) (not e!6532))))

(assert (=> b!11112 (= res!9303 (dynLambda!66 p!216 (h!898 (toList!190 lm!227))))))

(declare-fun b!11113 () Bool)

(assert (=> b!11113 (= e!6532 (forall!55 (t!2573 (toList!190 lm!227)) p!216))))

(assert (= (and d!1317 (not res!9302)) b!11112))

(assert (= (and b!11112 res!9303) b!11113))

(declare-fun b_lambda!545 () Bool)

(assert (=> (not b_lambda!545) (not b!11112)))

(declare-fun t!2581 () Bool)

(declare-fun tb!243 () Bool)

(assert (=> (and start!1426 (= p!216 p!216) t!2581) tb!243))

(declare-fun result!399 () Bool)

(assert (=> tb!243 (= result!399 true)))

(assert (=> b!11112 t!2581))

(declare-fun b_and!693 () Bool)

(assert (= b_and!687 (and (=> t!2581 result!399) b_and!693)))

(declare-fun m!7343 () Bool)

(assert (=> b!11112 m!7343))

(declare-fun m!7345 () Bool)

(assert (=> b!11113 m!7345))

(assert (=> start!1426 d!1317))

(declare-fun d!1323 () Bool)

(declare-fun isStrictlySorted!39 (List!336) Bool)

(assert (=> d!1323 (= (inv!544 lm!227) (isStrictlySorted!39 (toList!190 lm!227)))))

(declare-fun bs!422 () Bool)

(assert (= bs!422 d!1323))

(declare-fun m!7351 () Bool)

(assert (=> bs!422 m!7351))

(assert (=> start!1426 d!1323))

(declare-fun b!11126 () Bool)

(declare-fun e!6541 () Bool)

(declare-fun tp!1804 () Bool)

(assert (=> b!11126 (= e!6541 (and tp_is_empty!551 tp!1804))))

(assert (=> b!11093 (= tp!1799 e!6541)))

(assert (= (and b!11093 (is-Cons!332 (toList!190 lm!227))) b!11126))

(declare-fun b!11128 () Bool)

(declare-fun e!6543 () Bool)

(declare-fun tp!1806 () Bool)

(assert (=> b!11128 (= e!6543 (and tp_is_empty!551 tp!1806))))

(assert (=> b!11091 (= tp!1797 e!6543)))

(assert (= (and b!11091 (is-Cons!332 (t!2573 kvs!4))) b!11128))

(declare-fun b_lambda!551 () Bool)

(assert (= b_lambda!539 (or (and start!1426 b_free!437) b_lambda!551)))

(declare-fun b_lambda!553 () Bool)

(assert (= b_lambda!545 (or (and start!1426 b_free!437) b_lambda!553)))

(push 1)

