; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1398 () Bool)

(assert start!1398)

(declare-fun b_free!427 () Bool)

(declare-fun b_next!427 () Bool)

(assert (=> start!1398 (= b_free!427 (not b_next!427))))

(declare-fun tp!1741 () Bool)

(declare-fun b_and!657 () Bool)

(assert (=> start!1398 (= tp!1741 b_and!657)))

(declare-fun b!10961 () Bool)

(declare-fun res!9219 () Bool)

(declare-fun e!6422 () Bool)

(assert (=> b!10961 (=> (not res!9219) (not e!6422))))

(declare-datatypes ((B!368 0))(
  ( (B!369 (val!279 Int)) )
))
(declare-datatypes ((tuple2!354 0))(
  ( (tuple2!355 (_1!177 (_ BitVec 64)) (_2!177 B!368)) )
))
(declare-datatypes ((List!327 0))(
  ( (Nil!324) (Cons!323 (h!889 tuple2!354) (t!2546 List!327)) )
))
(declare-fun kvs!4 () List!327)

(declare-fun p!216 () Int)

(declare-fun forall!50 (List!327 Int) Bool)

(assert (=> b!10961 (= res!9219 (forall!50 kvs!4 p!216))))

(declare-fun res!9220 () Bool)

(assert (=> start!1398 (=> (not res!9220) (not e!6422))))

(declare-datatypes ((ListLongMap!335 0))(
  ( (ListLongMap!336 (toList!183 List!327)) )
))
(declare-fun lm!227 () ListLongMap!335)

(assert (=> start!1398 (= res!9220 (forall!50 (toList!183 lm!227) p!216))))

(assert (=> start!1398 e!6422))

(declare-fun e!6420 () Bool)

(declare-fun inv!534 (ListLongMap!335) Bool)

(assert (=> start!1398 (and (inv!534 lm!227) e!6420)))

(assert (=> start!1398 tp!1741))

(declare-fun e!6421 () Bool)

(assert (=> start!1398 e!6421))

(declare-fun b!10964 () Bool)

(declare-fun tp_is_empty!541 () Bool)

(declare-fun tp!1742 () Bool)

(assert (=> b!10964 (= e!6421 (and tp_is_empty!541 tp!1742))))

(declare-fun b!10962 () Bool)

(declare-fun ListPrimitiveSize!7 (List!327) Int)

(assert (=> b!10962 (= e!6422 (< (ListPrimitiveSize!7 kvs!4) 0))))

(declare-fun b!10963 () Bool)

(declare-fun tp!1740 () Bool)

(assert (=> b!10963 (= e!6420 tp!1740)))

(assert (= (and start!1398 res!9220) b!10961))

(assert (= (and b!10961 res!9219) b!10962))

(assert (= start!1398 b!10963))

(get-info :version)

(assert (= (and start!1398 ((_ is Cons!323) kvs!4)) b!10964))

(declare-fun m!7235 () Bool)

(assert (=> b!10961 m!7235))

(declare-fun m!7237 () Bool)

(assert (=> start!1398 m!7237))

(declare-fun m!7239 () Bool)

(assert (=> start!1398 m!7239))

(declare-fun m!7241 () Bool)

(assert (=> b!10962 m!7241))

(check-sat (not b!10961) (not b!10962) (not b!10963) tp_is_empty!541 (not start!1398) (not b_next!427) b_and!657 (not b!10964))
(check-sat b_and!657 (not b_next!427))
(get-model)

(declare-fun d!1275 () Bool)

(declare-fun lt!2754 () Int)

(assert (=> d!1275 (>= lt!2754 0)))

(declare-fun e!6443 () Int)

(assert (=> d!1275 (= lt!2754 e!6443)))

(declare-fun c!947 () Bool)

(assert (=> d!1275 (= c!947 ((_ is Nil!324) kvs!4))))

(assert (=> d!1275 (= (ListPrimitiveSize!7 kvs!4) lt!2754)))

(declare-fun b!10993 () Bool)

(assert (=> b!10993 (= e!6443 0)))

(declare-fun b!10994 () Bool)

(assert (=> b!10994 (= e!6443 (+ 1 (ListPrimitiveSize!7 (t!2546 kvs!4))))))

(assert (= (and d!1275 c!947) b!10993))

(assert (= (and d!1275 (not c!947)) b!10994))

(declare-fun m!7259 () Bool)

(assert (=> b!10994 m!7259))

(assert (=> b!10962 d!1275))

(declare-fun d!1277 () Bool)

(declare-fun res!9237 () Bool)

(declare-fun e!6448 () Bool)

(assert (=> d!1277 (=> res!9237 e!6448)))

(assert (=> d!1277 (= res!9237 ((_ is Nil!324) (toList!183 lm!227)))))

(assert (=> d!1277 (= (forall!50 (toList!183 lm!227) p!216) e!6448)))

(declare-fun b!10999 () Bool)

(declare-fun e!6449 () Bool)

(assert (=> b!10999 (= e!6448 e!6449)))

(declare-fun res!9238 () Bool)

(assert (=> b!10999 (=> (not res!9238) (not e!6449))))

(declare-fun dynLambda!61 (Int tuple2!354) Bool)

(assert (=> b!10999 (= res!9238 (dynLambda!61 p!216 (h!889 (toList!183 lm!227))))))

(declare-fun b!11000 () Bool)

(assert (=> b!11000 (= e!6449 (forall!50 (t!2546 (toList!183 lm!227)) p!216))))

(assert (= (and d!1277 (not res!9237)) b!10999))

(assert (= (and b!10999 res!9238) b!11000))

(declare-fun b_lambda!503 () Bool)

(assert (=> (not b_lambda!503) (not b!10999)))

(declare-fun t!2550 () Bool)

(declare-fun tb!219 () Bool)

(assert (=> (and start!1398 (= p!216 p!216) t!2550) tb!219))

(declare-fun result!369 () Bool)

(assert (=> tb!219 (= result!369 true)))

(assert (=> b!10999 t!2550))

(declare-fun b_and!663 () Bool)

(assert (= b_and!657 (and (=> t!2550 result!369) b_and!663)))

(declare-fun m!7261 () Bool)

(assert (=> b!10999 m!7261))

(declare-fun m!7263 () Bool)

(assert (=> b!11000 m!7263))

(assert (=> start!1398 d!1277))

(declare-fun d!1283 () Bool)

(declare-fun isStrictlySorted!35 (List!327) Bool)

(assert (=> d!1283 (= (inv!534 lm!227) (isStrictlySorted!35 (toList!183 lm!227)))))

(declare-fun bs!414 () Bool)

(assert (= bs!414 d!1283))

(declare-fun m!7265 () Bool)

(assert (=> bs!414 m!7265))

(assert (=> start!1398 d!1283))

(declare-fun d!1285 () Bool)

(declare-fun res!9245 () Bool)

(declare-fun e!6458 () Bool)

(assert (=> d!1285 (=> res!9245 e!6458)))

(assert (=> d!1285 (= res!9245 ((_ is Nil!324) kvs!4))))

(assert (=> d!1285 (= (forall!50 kvs!4 p!216) e!6458)))

(declare-fun b!11011 () Bool)

(declare-fun e!6459 () Bool)

(assert (=> b!11011 (= e!6458 e!6459)))

(declare-fun res!9246 () Bool)

(assert (=> b!11011 (=> (not res!9246) (not e!6459))))

(assert (=> b!11011 (= res!9246 (dynLambda!61 p!216 (h!889 kvs!4)))))

(declare-fun b!11012 () Bool)

(assert (=> b!11012 (= e!6459 (forall!50 (t!2546 kvs!4) p!216))))

(assert (= (and d!1285 (not res!9245)) b!11011))

(assert (= (and b!11011 res!9246) b!11012))

(declare-fun b_lambda!505 () Bool)

(assert (=> (not b_lambda!505) (not b!11011)))

(declare-fun t!2552 () Bool)

(declare-fun tb!221 () Bool)

(assert (=> (and start!1398 (= p!216 p!216) t!2552) tb!221))

(declare-fun result!371 () Bool)

(assert (=> tb!221 (= result!371 true)))

(assert (=> b!11011 t!2552))

(declare-fun b_and!665 () Bool)

(assert (= b_and!663 (and (=> t!2552 result!371) b_and!665)))

(declare-fun m!7267 () Bool)

(assert (=> b!11011 m!7267))

(declare-fun m!7269 () Bool)

(assert (=> b!11012 m!7269))

(assert (=> b!10961 d!1285))

(declare-fun b!11019 () Bool)

(declare-fun e!6463 () Bool)

(declare-fun tp!1763 () Bool)

(assert (=> b!11019 (= e!6463 (and tp_is_empty!541 tp!1763))))

(assert (=> b!10963 (= tp!1740 e!6463)))

(assert (= (and b!10963 ((_ is Cons!323) (toList!183 lm!227))) b!11019))

(declare-fun b!11020 () Bool)

(declare-fun e!6464 () Bool)

(declare-fun tp!1764 () Bool)

(assert (=> b!11020 (= e!6464 (and tp_is_empty!541 tp!1764))))

(assert (=> b!10964 (= tp!1742 e!6464)))

(assert (= (and b!10964 ((_ is Cons!323) (t!2546 kvs!4))) b!11020))

(declare-fun b_lambda!509 () Bool)

(assert (= b_lambda!505 (or (and start!1398 b_free!427) b_lambda!509)))

(declare-fun b_lambda!511 () Bool)

(assert (= b_lambda!503 (or (and start!1398 b_free!427) b_lambda!511)))

(check-sat (not b!10994) (not b!11020) tp_is_empty!541 (not b!11012) b_and!665 (not b!11019) (not b_lambda!509) (not d!1283) (not b_lambda!511) (not b!11000) (not b_next!427))
(check-sat b_and!665 (not b_next!427))
