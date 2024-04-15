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

(declare-fun e!6492 () Bool)

(declare-fun tp!1779 () Bool)

(assert (=> b!11059 (= e!6492 tp!1779)))

(declare-fun b!11060 () Bool)

(declare-fun e!6494 () Bool)

(declare-fun p!216 () Int)

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

(declare-fun dynLambda!64 (Int tuple2!360) Bool)

(declare-fun head!767 (List!330) tuple2!360)

(assert (=> b!11060 (= e!6494 (not (dynLambda!64 p!216 (head!767 kvs!4))))))

(declare-fun res!9263 () Bool)

(assert (=> start!1422 (=> (not res!9263) (not e!6494))))

(declare-datatypes ((ListLongMap!341 0))(
  ( (ListLongMap!342 (toList!186 List!330)) )
))
(declare-fun lm!227 () ListLongMap!341)

(declare-fun forall!53 (List!330 Int) Bool)

(assert (=> start!1422 (= res!9263 (forall!53 (toList!186 lm!227) p!216))))

(assert (=> start!1422 e!6494))

(declare-fun inv!542 (ListLongMap!341) Bool)

(assert (=> start!1422 (and (inv!542 lm!227) e!6492)))

(assert (=> start!1422 tp!1780))

(declare-fun e!6493 () Bool)

(assert (=> start!1422 e!6493))

(declare-fun b!11061 () Bool)

(declare-fun tp_is_empty!547 () Bool)

(declare-fun tp!1781 () Bool)

(assert (=> b!11061 (= e!6493 (and tp_is_empty!547 tp!1781))))

(declare-fun b!11062 () Bool)

(declare-fun res!9265 () Bool)

(assert (=> b!11062 (=> (not res!9265) (not e!6494))))

(assert (=> b!11062 (= res!9265 (forall!53 kvs!4 p!216))))

(declare-fun b!11063 () Bool)

(declare-fun res!9264 () Bool)

(assert (=> b!11063 (=> (not res!9264) (not e!6494))))

(declare-fun isEmpty!60 (List!330) Bool)

(assert (=> b!11063 (= res!9264 (not (isEmpty!60 kvs!4)))))

(assert (= (and start!1422 res!9263) b!11062))

(assert (= (and b!11062 res!9265) b!11063))

(assert (= (and b!11063 res!9264) b!11060))

(assert (= start!1422 b!11059))

(get-info :version)

(assert (= (and start!1422 ((_ is Cons!326) kvs!4)) b!11061))

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

(declare-fun m!7295 () Bool)

(assert (=> b!11060 m!7295))

(assert (=> b!11060 m!7295))

(declare-fun m!7297 () Bool)

(assert (=> b!11060 m!7297))

(declare-fun m!7299 () Bool)

(assert (=> start!1422 m!7299))

(declare-fun m!7301 () Bool)

(assert (=> start!1422 m!7301))

(declare-fun m!7303 () Bool)

(assert (=> b!11062 m!7303))

(declare-fun m!7305 () Bool)

(assert (=> b!11063 m!7305))

(check-sat b_and!677 (not b!11063) (not b!11059) (not start!1422) tp_is_empty!547 (not b!11061) (not b!11060) (not b_lambda!527) (not b!11062) (not b_next!433))
(check-sat b_and!677 (not b_next!433))
(get-model)

(declare-fun b_lambda!535 () Bool)

(assert (= b_lambda!527 (or (and start!1422 b_free!433) b_lambda!535)))

(check-sat b_and!677 (not b!11063) (not b!11059) (not start!1422) tp_is_empty!547 (not b!11061) (not b!11060) (not b_lambda!535) (not b!11062) (not b_next!433))
(check-sat b_and!677 (not b_next!433))
(get-model)

(declare-fun d!1301 () Bool)

(assert (=> d!1301 (= (head!767 kvs!4) (h!892 kvs!4))))

(assert (=> b!11060 d!1301))

(declare-fun d!1307 () Bool)

(declare-fun res!9296 () Bool)

(declare-fun e!6525 () Bool)

(assert (=> d!1307 (=> res!9296 e!6525)))

(assert (=> d!1307 (= res!9296 ((_ is Nil!327) kvs!4))))

(assert (=> d!1307 (= (forall!53 kvs!4 p!216) e!6525)))

(declare-fun b!11106 () Bool)

(declare-fun e!6526 () Bool)

(assert (=> b!11106 (= e!6525 e!6526)))

(declare-fun res!9297 () Bool)

(assert (=> b!11106 (=> (not res!9297) (not e!6526))))

(assert (=> b!11106 (= res!9297 (dynLambda!64 p!216 (h!892 kvs!4)))))

(declare-fun b!11107 () Bool)

(assert (=> b!11107 (= e!6526 (forall!53 (t!2563 kvs!4) p!216))))

(assert (= (and d!1307 (not res!9296)) b!11106))

(assert (= (and b!11106 res!9297) b!11107))

(declare-fun b_lambda!539 () Bool)

(assert (=> (not b_lambda!539) (not b!11106)))

(declare-fun t!2571 () Bool)

(declare-fun tb!237 () Bool)

(assert (=> (and start!1422 (= p!216 p!216) t!2571) tb!237))

(declare-fun result!393 () Bool)

(assert (=> tb!237 (= result!393 true)))

(assert (=> b!11106 t!2571))

(declare-fun b_and!687 () Bool)

(assert (= b_and!677 (and (=> t!2571 result!393) b_and!687)))

(declare-fun m!7331 () Bool)

(assert (=> b!11106 m!7331))

(declare-fun m!7333 () Bool)

(assert (=> b!11107 m!7333))

(assert (=> b!11062 d!1307))

(declare-fun d!1313 () Bool)

(declare-fun res!9302 () Bool)

(declare-fun e!6531 () Bool)

(assert (=> d!1313 (=> res!9302 e!6531)))

(assert (=> d!1313 (= res!9302 ((_ is Nil!327) (toList!186 lm!227)))))

(assert (=> d!1313 (= (forall!53 (toList!186 lm!227) p!216) e!6531)))

(declare-fun b!11112 () Bool)

(declare-fun e!6532 () Bool)

(assert (=> b!11112 (= e!6531 e!6532)))

(declare-fun res!9303 () Bool)

(assert (=> b!11112 (=> (not res!9303) (not e!6532))))

(assert (=> b!11112 (= res!9303 (dynLambda!64 p!216 (h!892 (toList!186 lm!227))))))

(declare-fun b!11113 () Bool)

(assert (=> b!11113 (= e!6532 (forall!53 (t!2563 (toList!186 lm!227)) p!216))))

(assert (= (and d!1313 (not res!9302)) b!11112))

(assert (= (and b!11112 res!9303) b!11113))

(declare-fun b_lambda!543 () Bool)

(assert (=> (not b_lambda!543) (not b!11112)))

(declare-fun t!2575 () Bool)

(declare-fun tb!241 () Bool)

(assert (=> (and start!1422 (= p!216 p!216) t!2575) tb!241))

(declare-fun result!397 () Bool)

(assert (=> tb!241 (= result!397 true)))

(assert (=> b!11112 t!2575))

(declare-fun b_and!691 () Bool)

(assert (= b_and!687 (and (=> t!2575 result!397) b_and!691)))

(declare-fun m!7339 () Bool)

(assert (=> b!11112 m!7339))

(declare-fun m!7341 () Bool)

(assert (=> b!11113 m!7341))

(assert (=> start!1422 d!1313))

(declare-fun d!1317 () Bool)

(declare-fun isStrictlySorted!37 (List!330) Bool)

(assert (=> d!1317 (= (inv!542 lm!227) (isStrictlySorted!37 (toList!186 lm!227)))))

(declare-fun bs!421 () Bool)

(assert (= bs!421 d!1317))

(declare-fun m!7349 () Bool)

(assert (=> bs!421 m!7349))

(assert (=> start!1422 d!1317))

(declare-fun d!1325 () Bool)

(assert (=> d!1325 (= (isEmpty!60 kvs!4) ((_ is Nil!327) kvs!4))))

(assert (=> b!11063 d!1325))

(declare-fun b!11127 () Bool)

(declare-fun e!6542 () Bool)

(declare-fun tp!1805 () Bool)

(assert (=> b!11127 (= e!6542 (and tp_is_empty!547 tp!1805))))

(assert (=> b!11059 (= tp!1779 e!6542)))

(assert (= (and b!11059 ((_ is Cons!326) (toList!186 lm!227))) b!11127))

(declare-fun b!11129 () Bool)

(declare-fun e!6544 () Bool)

(declare-fun tp!1807 () Bool)

(assert (=> b!11129 (= e!6544 (and tp_is_empty!547 tp!1807))))

(assert (=> b!11061 (= tp!1781 e!6544)))

(assert (= (and b!11061 ((_ is Cons!326) (t!2563 kvs!4))) b!11129))

(declare-fun b_lambda!555 () Bool)

(assert (= b_lambda!539 (or (and start!1422 b_free!433) b_lambda!555)))

(declare-fun b_lambda!557 () Bool)

(assert (= b_lambda!543 (or (and start!1422 b_free!433) b_lambda!557)))

(check-sat (not b!11127) (not b!11107) (not b!11113) (not b!11129) (not d!1317) (not b_lambda!535) (not b_lambda!555) b_and!691 (not b_next!433) (not b_lambda!557) tp_is_empty!547)
(check-sat b_and!691 (not b_next!433))
