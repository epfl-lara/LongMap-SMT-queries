; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1398 () Bool)

(assert start!1398)

(declare-fun b_free!427 () Bool)

(declare-fun b_next!427 () Bool)

(assert (=> start!1398 (= b_free!427 (not b_next!427))))

(declare-fun tp!1741 () Bool)

(declare-fun b_and!657 () Bool)

(assert (=> start!1398 (= tp!1741 b_and!657)))

(declare-fun b!10963 () Bool)

(declare-fun e!6421 () Bool)

(declare-fun tp!1742 () Bool)

(assert (=> b!10963 (= e!6421 tp!1742)))

(declare-fun b!10962 () Bool)

(declare-fun e!6422 () Bool)

(declare-datatypes ((B!368 0))(
  ( (B!369 (val!279 Int)) )
))
(declare-datatypes ((tuple2!358 0))(
  ( (tuple2!359 (_1!179 (_ BitVec 64)) (_2!179 B!368)) )
))
(declare-datatypes ((List!331 0))(
  ( (Nil!328) (Cons!327 (h!893 tuple2!358) (t!2550 List!331)) )
))
(declare-fun kvs!4 () List!331)

(declare-fun ListPrimitiveSize!7 (List!331) Int)

(assert (=> b!10962 (= e!6422 (< (ListPrimitiveSize!7 kvs!4) 0))))

(declare-fun b!10964 () Bool)

(declare-fun e!6420 () Bool)

(declare-fun tp_is_empty!541 () Bool)

(declare-fun tp!1740 () Bool)

(assert (=> b!10964 (= e!6420 (and tp_is_empty!541 tp!1740))))

(declare-fun b!10961 () Bool)

(declare-fun res!9219 () Bool)

(assert (=> b!10961 (=> (not res!9219) (not e!6422))))

(declare-fun p!216 () Int)

(declare-fun forall!50 (List!331 Int) Bool)

(assert (=> b!10961 (= res!9219 (forall!50 kvs!4 p!216))))

(declare-fun res!9220 () Bool)

(assert (=> start!1398 (=> (not res!9220) (not e!6422))))

(declare-datatypes ((ListLongMap!339 0))(
  ( (ListLongMap!340 (toList!185 List!331)) )
))
(declare-fun lm!227 () ListLongMap!339)

(assert (=> start!1398 (= res!9220 (forall!50 (toList!185 lm!227) p!216))))

(assert (=> start!1398 e!6422))

(declare-fun inv!534 (ListLongMap!339) Bool)

(assert (=> start!1398 (and (inv!534 lm!227) e!6421)))

(assert (=> start!1398 tp!1741))

(assert (=> start!1398 e!6420))

(assert (= (and start!1398 res!9220) b!10961))

(assert (= (and b!10961 res!9219) b!10962))

(assert (= start!1398 b!10963))

(assert (= (and start!1398 (is-Cons!327 kvs!4)) b!10964))

(declare-fun m!7235 () Bool)

(assert (=> b!10962 m!7235))

(declare-fun m!7237 () Bool)

(assert (=> b!10961 m!7237))

(declare-fun m!7239 () Bool)

(assert (=> start!1398 m!7239))

(declare-fun m!7241 () Bool)

(assert (=> start!1398 m!7241))

(push 1)

(assert tp_is_empty!541)

(assert (not b_next!427))

(assert b_and!657)

(assert (not b!10964))

(assert (not start!1398))

(assert (not b!10961))

(assert (not b!10962))

(assert (not b!10963))

(check-sat)

(pop 1)

(push 1)

(assert b_and!657)

(assert (not b_next!427))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!1275 () Bool)

(declare-fun res!9241 () Bool)

(declare-fun e!6451 () Bool)

(assert (=> d!1275 (=> res!9241 e!6451)))

(assert (=> d!1275 (= res!9241 (is-Nil!328 kvs!4))))

(assert (=> d!1275 (= (forall!50 kvs!4 p!216) e!6451)))

(declare-fun b!11001 () Bool)

(declare-fun e!6452 () Bool)

(assert (=> b!11001 (= e!6451 e!6452)))

(declare-fun res!9242 () Bool)

(assert (=> b!11001 (=> (not res!9242) (not e!6452))))

(declare-fun dynLambda!61 (Int tuple2!358) Bool)

(assert (=> b!11001 (= res!9242 (dynLambda!61 p!216 (h!893 kvs!4)))))

(declare-fun b!11002 () Bool)

(assert (=> b!11002 (= e!6452 (forall!50 (t!2550 kvs!4) p!216))))

(assert (= (and d!1275 (not res!9241)) b!11001))

(assert (= (and b!11001 res!9242) b!11002))

(declare-fun b_lambda!503 () Bool)

(assert (=> (not b_lambda!503) (not b!11001)))

(declare-fun t!2554 () Bool)

(declare-fun tb!219 () Bool)

(assert (=> (and start!1398 (= p!216 p!216) t!2554) tb!219))

(declare-fun result!369 () Bool)

(assert (=> tb!219 (= result!369 true)))

(assert (=> b!11001 t!2554))

(declare-fun b_and!663 () Bool)

(assert (= b_and!657 (and (=> t!2554 result!369) b_and!663)))

(declare-fun m!7259 () Bool)

(assert (=> b!11001 m!7259))

(declare-fun m!7261 () Bool)

(assert (=> b!11002 m!7261))

(assert (=> b!10961 d!1275))

(declare-fun d!1281 () Bool)

(declare-fun lt!2759 () Int)

(assert (=> d!1281 (>= lt!2759 0)))

(declare-fun e!6464 () Int)

(assert (=> d!1281 (= lt!2759 e!6464)))

(declare-fun c!952 () Bool)

(assert (=> d!1281 (= c!952 (is-Nil!328 kvs!4))))

(assert (=> d!1281 (= (ListPrimitiveSize!7 kvs!4) lt!2759)))

(declare-fun b!11019 () Bool)

(assert (=> b!11019 (= e!6464 0)))

(declare-fun b!11020 () Bool)

(assert (=> b!11020 (= e!6464 (+ 1 (ListPrimitiveSize!7 (t!2550 kvs!4))))))

(assert (= (and d!1281 c!952) b!11019))

(assert (= (and d!1281 (not c!952)) b!11020))

(declare-fun m!7269 () Bool)

(assert (=> b!11020 m!7269))

(assert (=> b!10962 d!1281))

(declare-fun d!1287 () Bool)

(declare-fun res!9251 () Bool)

(declare-fun e!6468 () Bool)

(assert (=> d!1287 (=> res!9251 e!6468)))

(assert (=> d!1287 (= res!9251 (is-Nil!328 (toList!185 lm!227)))))

(assert (=> d!1287 (= (forall!50 (toList!185 lm!227) p!216) e!6468)))

(declare-fun b!11025 () Bool)

(declare-fun e!6469 () Bool)

(assert (=> b!11025 (= e!6468 e!6469)))

(declare-fun res!9252 () Bool)

(assert (=> b!11025 (=> (not res!9252) (not e!6469))))

(assert (=> b!11025 (= res!9252 (dynLambda!61 p!216 (h!893 (toList!185 lm!227))))))

(declare-fun b!11026 () Bool)

(assert (=> b!11026 (= e!6469 (forall!50 (t!2550 (toList!185 lm!227)) p!216))))

(assert (= (and d!1287 (not res!9251)) b!11025))

(assert (= (and b!11025 res!9252) b!11026))

(declare-fun b_lambda!509 () Bool)

(assert (=> (not b_lambda!509) (not b!11025)))

(declare-fun t!2560 () Bool)

(declare-fun tb!225 () Bool)

(assert (=> (and start!1398 (= p!216 p!216) t!2560) tb!225))

(declare-fun result!375 () Bool)

(assert (=> tb!225 (= result!375 true)))

(assert (=> b!11025 t!2560))

(declare-fun b_and!669 () Bool)

(assert (= b_and!663 (and (=> t!2560 result!375) b_and!669)))

(declare-fun m!7277 () Bool)

(assert (=> b!11025 m!7277))

(declare-fun m!7279 () Bool)

(assert (=> b!11026 m!7279))

(assert (=> start!1398 d!1287))

(declare-fun d!1293 () Bool)

(declare-fun isStrictlySorted!35 (List!331) Bool)

(assert (=> d!1293 (= (inv!534 lm!227) (isStrictlySorted!35 (toList!185 lm!227)))))

(declare-fun bs!415 () Bool)

(assert (= bs!415 d!1293))

(declare-fun m!7287 () Bool)

(assert (=> bs!415 m!7287))

(assert (=> start!1398 d!1293))

(declare-fun b!11040 () Bool)

(declare-fun e!6478 () Bool)

(declare-fun tp!1765 () Bool)

(assert (=> b!11040 (= e!6478 (and tp_is_empty!541 tp!1765))))

(assert (=> b!10963 (= tp!1742 e!6478)))

(assert (= (and b!10963 (is-Cons!327 (toList!185 lm!227))) b!11040))

(declare-fun b!11045 () Bool)

(declare-fun e!6482 () Bool)

(declare-fun tp!1769 () Bool)

(assert (=> b!11045 (= e!6482 (and tp_is_empty!541 tp!1769))))

(assert (=> b!10964 (= tp!1740 e!6482)))

(assert (= (and b!10964 (is-Cons!327 (t!2550 kvs!4))) b!11045))

(declare-fun b_lambda!515 () Bool)

(assert (= b_lambda!503 (or (and start!1398 b_free!427) b_lambda!515)))

(declare-fun b_lambda!519 () Bool)

(assert (= b_lambda!509 (or (and start!1398 b_free!427) b_lambda!519)))

(push 1)

