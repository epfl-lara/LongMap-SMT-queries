; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1422 () Bool)

(assert start!1422)

(declare-fun b_free!433 () Bool)

(declare-fun b_next!433 () Bool)

(assert (=> start!1422 (= b_free!433 (not b_next!433))))

(declare-fun tp!1780 () Bool)

(declare-fun b_and!675 () Bool)

(assert (=> start!1422 (= tp!1780 b_and!675)))

(declare-fun b!11059 () Bool)

(declare-fun res!9264 () Bool)

(declare-fun e!6492 () Bool)

(assert (=> b!11059 (=> (not res!9264) (not e!6492))))

(declare-datatypes ((B!374 0))(
  ( (B!375 (val!282 Int)) )
))
(declare-datatypes ((tuple2!360 0))(
  ( (tuple2!361 (_1!180 (_ BitVec 64)) (_2!180 B!374)) )
))
(declare-datatypes ((List!330 0))(
  ( (Nil!327) (Cons!326 (h!892 tuple2!360) (t!2563 List!330)) )
))
(declare-fun kvs!4 () List!330)

(declare-fun p!216 () Int)

(declare-fun forall!53 (List!330 Int) Bool)

(assert (=> b!11059 (= res!9264 (forall!53 kvs!4 p!216))))

(declare-fun b!11060 () Bool)

(declare-fun dynLambda!64 (Int tuple2!360) Bool)

(declare-fun head!767 (List!330) tuple2!360)

(assert (=> b!11060 (= e!6492 (not (dynLambda!64 p!216 (head!767 kvs!4))))))

(declare-fun b!11061 () Bool)

(declare-fun res!9265 () Bool)

(assert (=> b!11061 (=> (not res!9265) (not e!6492))))

(declare-fun isEmpty!60 (List!330) Bool)

(assert (=> b!11061 (= res!9265 (not (isEmpty!60 kvs!4)))))

(declare-fun b!11062 () Bool)

(declare-fun e!6494 () Bool)

(declare-fun tp!1779 () Bool)

(assert (=> b!11062 (= e!6494 tp!1779)))

(declare-fun res!9263 () Bool)

(assert (=> start!1422 (=> (not res!9263) (not e!6492))))

(declare-datatypes ((ListLongMap!341 0))(
  ( (ListLongMap!342 (toList!186 List!330)) )
))
(declare-fun lm!227 () ListLongMap!341)

(assert (=> start!1422 (= res!9263 (forall!53 (toList!186 lm!227) p!216))))

(assert (=> start!1422 e!6492))

(declare-fun inv!542 (ListLongMap!341) Bool)

(assert (=> start!1422 (and (inv!542 lm!227) e!6494)))

(assert (=> start!1422 tp!1780))

(declare-fun e!6493 () Bool)

(assert (=> start!1422 e!6493))

(declare-fun b!11063 () Bool)

(declare-fun tp_is_empty!547 () Bool)

(declare-fun tp!1781 () Bool)

(assert (=> b!11063 (= e!6493 (and tp_is_empty!547 tp!1781))))

(assert (= (and start!1422 res!9263) b!11059))

(assert (= (and b!11059 res!9264) b!11061))

(assert (= (and b!11061 res!9265) b!11060))

(assert (= start!1422 b!11062))

(get-info :version)

(assert (= (and start!1422 ((_ is Cons!326) kvs!4)) b!11063))

(declare-fun b_lambda!527 () Bool)

(assert (=> (not b_lambda!527) (not b!11060)))

(declare-fun t!2562 () Bool)

(declare-fun tb!231 () Bool)

(assert (=> (and start!1422 (= p!216 p!216) t!2562) tb!231))

(declare-fun result!387 () Bool)

(assert (=> tb!231 (= result!387 true)))

(assert (=> b!11060 t!2562))

(declare-fun b_and!677 () Bool)

(assert (= b_and!675 (and (=> t!2562 result!387) b_and!677)))

(declare-fun m!7291 () Bool)

(assert (=> b!11059 m!7291))

(declare-fun m!7293 () Bool)

(assert (=> b!11060 m!7293))

(assert (=> b!11060 m!7293))

(declare-fun m!7295 () Bool)

(assert (=> b!11060 m!7295))

(declare-fun m!7297 () Bool)

(assert (=> b!11061 m!7297))

(declare-fun m!7299 () Bool)

(assert (=> start!1422 m!7299))

(declare-fun m!7301 () Bool)

(assert (=> start!1422 m!7301))

(check-sat (not b_lambda!527) (not start!1422) (not b_next!433) (not b!11061) (not b!11059) (not b!11062) (not b!11060) (not b!11063) tp_is_empty!547 b_and!677)
(check-sat b_and!677 (not b_next!433))
(get-model)

(declare-fun b_lambda!533 () Bool)

(assert (= b_lambda!527 (or (and start!1422 b_free!433) b_lambda!533)))

(check-sat (not start!1422) (not b_next!433) (not b!11061) (not b!11059) (not b!11060) (not b!11063) tp_is_empty!547 b_and!677 (not b_lambda!533) (not b!11062))
(check-sat b_and!677 (not b_next!433))
(get-model)

(declare-fun d!1301 () Bool)

(declare-fun res!9288 () Bool)

(declare-fun e!6517 () Bool)

(assert (=> d!1301 (=> res!9288 e!6517)))

(assert (=> d!1301 (= res!9288 ((_ is Nil!327) kvs!4))))

(assert (=> d!1301 (= (forall!53 kvs!4 p!216) e!6517)))

(declare-fun b!11098 () Bool)

(declare-fun e!6518 () Bool)

(assert (=> b!11098 (= e!6517 e!6518)))

(declare-fun res!9289 () Bool)

(assert (=> b!11098 (=> (not res!9289) (not e!6518))))

(assert (=> b!11098 (= res!9289 (dynLambda!64 p!216 (h!892 kvs!4)))))

(declare-fun b!11099 () Bool)

(assert (=> b!11099 (= e!6518 (forall!53 (t!2563 kvs!4) p!216))))

(assert (= (and d!1301 (not res!9288)) b!11098))

(assert (= (and b!11098 res!9289) b!11099))

(declare-fun b_lambda!539 () Bool)

(assert (=> (not b_lambda!539) (not b!11098)))

(declare-fun t!2571 () Bool)

(declare-fun tb!237 () Bool)

(assert (=> (and start!1422 (= p!216 p!216) t!2571) tb!237))

(declare-fun result!393 () Bool)

(assert (=> tb!237 (= result!393 true)))

(assert (=> b!11098 t!2571))

(declare-fun b_and!687 () Bool)

(assert (= b_and!677 (and (=> t!2571 result!393) b_and!687)))

(declare-fun m!7327 () Bool)

(assert (=> b!11098 m!7327))

(declare-fun m!7329 () Bool)

(assert (=> b!11099 m!7329))

(assert (=> b!11059 d!1301))

(declare-fun d!1303 () Bool)

(assert (=> d!1303 (= (head!767 kvs!4) (h!892 kvs!4))))

(assert (=> b!11060 d!1303))

(declare-fun d!1305 () Bool)

(assert (=> d!1305 (= (isEmpty!60 kvs!4) ((_ is Nil!327) kvs!4))))

(assert (=> b!11061 d!1305))

(declare-fun d!1307 () Bool)

(declare-fun res!9290 () Bool)

(declare-fun e!6519 () Bool)

(assert (=> d!1307 (=> res!9290 e!6519)))

(assert (=> d!1307 (= res!9290 ((_ is Nil!327) (toList!186 lm!227)))))

(assert (=> d!1307 (= (forall!53 (toList!186 lm!227) p!216) e!6519)))

(declare-fun b!11100 () Bool)

(declare-fun e!6520 () Bool)

(assert (=> b!11100 (= e!6519 e!6520)))

(declare-fun res!9291 () Bool)

(assert (=> b!11100 (=> (not res!9291) (not e!6520))))

(assert (=> b!11100 (= res!9291 (dynLambda!64 p!216 (h!892 (toList!186 lm!227))))))

(declare-fun b!11101 () Bool)

(assert (=> b!11101 (= e!6520 (forall!53 (t!2563 (toList!186 lm!227)) p!216))))

(assert (= (and d!1307 (not res!9290)) b!11100))

(assert (= (and b!11100 res!9291) b!11101))

(declare-fun b_lambda!541 () Bool)

(assert (=> (not b_lambda!541) (not b!11100)))

(declare-fun t!2573 () Bool)

(declare-fun tb!239 () Bool)

(assert (=> (and start!1422 (= p!216 p!216) t!2573) tb!239))

(declare-fun result!395 () Bool)

(assert (=> tb!239 (= result!395 true)))

(assert (=> b!11100 t!2573))

(declare-fun b_and!689 () Bool)

(assert (= b_and!687 (and (=> t!2573 result!395) b_and!689)))

(declare-fun m!7331 () Bool)

(assert (=> b!11100 m!7331))

(declare-fun m!7333 () Bool)

(assert (=> b!11101 m!7333))

(assert (=> start!1422 d!1307))

(declare-fun d!1313 () Bool)

(declare-fun isStrictlySorted!33 (List!330) Bool)

(assert (=> d!1313 (= (inv!542 lm!227) (isStrictlySorted!33 (toList!186 lm!227)))))

(declare-fun bs!420 () Bool)

(assert (= bs!420 d!1313))

(declare-fun m!7335 () Bool)

(assert (=> bs!420 m!7335))

(assert (=> start!1422 d!1313))

(declare-fun b!11114 () Bool)

(declare-fun e!6531 () Bool)

(declare-fun tp!1802 () Bool)

(assert (=> b!11114 (= e!6531 (and tp_is_empty!547 tp!1802))))

(assert (=> b!11062 (= tp!1779 e!6531)))

(assert (= (and b!11062 ((_ is Cons!326) (toList!186 lm!227))) b!11114))

(declare-fun b!11115 () Bool)

(declare-fun e!6532 () Bool)

(declare-fun tp!1803 () Bool)

(assert (=> b!11115 (= e!6532 (and tp_is_empty!547 tp!1803))))

(assert (=> b!11063 (= tp!1781 e!6532)))

(assert (= (and b!11063 ((_ is Cons!326) (t!2563 kvs!4))) b!11115))

(declare-fun b_lambda!543 () Bool)

(assert (= b_lambda!539 (or (and start!1422 b_free!433) b_lambda!543)))

(declare-fun b_lambda!545 () Bool)

(assert (= b_lambda!541 (or (and start!1422 b_free!433) b_lambda!545)))

(check-sat (not d!1313) tp_is_empty!547 (not b!11114) (not b_lambda!545) (not b_next!433) b_and!689 (not b_lambda!543) (not b_lambda!533) (not b!11115) (not b!11099) (not b!11101))
(check-sat b_and!689 (not b_next!433))
