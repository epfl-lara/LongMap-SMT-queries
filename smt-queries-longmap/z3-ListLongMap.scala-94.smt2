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

(declare-fun b!10964 () Bool)

(declare-fun e!6420 () Bool)

(declare-fun tp_is_empty!541 () Bool)

(declare-fun tp!1742 () Bool)

(assert (=> b!10964 (= e!6420 (and tp_is_empty!541 tp!1742))))

(declare-fun res!9219 () Bool)

(declare-fun e!6421 () Bool)

(assert (=> start!1398 (=> (not res!9219) (not e!6421))))

(declare-datatypes ((B!368 0))(
  ( (B!369 (val!279 Int)) )
))
(declare-datatypes ((tuple2!354 0))(
  ( (tuple2!355 (_1!177 (_ BitVec 64)) (_2!177 B!368)) )
))
(declare-datatypes ((List!327 0))(
  ( (Nil!324) (Cons!323 (h!889 tuple2!354) (t!2546 List!327)) )
))
(declare-datatypes ((ListLongMap!335 0))(
  ( (ListLongMap!336 (toList!183 List!327)) )
))
(declare-fun lm!227 () ListLongMap!335)

(declare-fun p!216 () Int)

(declare-fun forall!50 (List!327 Int) Bool)

(assert (=> start!1398 (= res!9219 (forall!50 (toList!183 lm!227) p!216))))

(assert (=> start!1398 e!6421))

(declare-fun e!6422 () Bool)

(declare-fun inv!534 (ListLongMap!335) Bool)

(assert (=> start!1398 (and (inv!534 lm!227) e!6422)))

(assert (=> start!1398 tp!1741))

(assert (=> start!1398 e!6420))

(declare-fun b!10961 () Bool)

(declare-fun res!9220 () Bool)

(assert (=> b!10961 (=> (not res!9220) (not e!6421))))

(declare-fun kvs!4 () List!327)

(assert (=> b!10961 (= res!9220 (forall!50 kvs!4 p!216))))

(declare-fun b!10962 () Bool)

(declare-fun ListPrimitiveSize!7 (List!327) Int)

(assert (=> b!10962 (= e!6421 (< (ListPrimitiveSize!7 kvs!4) 0))))

(declare-fun b!10963 () Bool)

(declare-fun tp!1740 () Bool)

(assert (=> b!10963 (= e!6422 tp!1740)))

(assert (= (and start!1398 res!9219) b!10961))

(assert (= (and b!10961 res!9220) b!10962))

(assert (= start!1398 b!10963))

(get-info :version)

(assert (= (and start!1398 ((_ is Cons!323) kvs!4)) b!10964))

(declare-fun m!7231 () Bool)

(assert (=> start!1398 m!7231))

(declare-fun m!7233 () Bool)

(assert (=> start!1398 m!7233))

(declare-fun m!7235 () Bool)

(assert (=> b!10961 m!7235))

(declare-fun m!7237 () Bool)

(assert (=> b!10962 m!7237))

(check-sat (not b_next!427) (not b!10964) tp_is_empty!541 b_and!657 (not b!10961) (not start!1398) (not b!10962) (not b!10963))
(check-sat b_and!657 (not b_next!427))
(get-model)

(declare-fun d!1275 () Bool)

(declare-fun res!9242 () Bool)

(declare-fun e!6450 () Bool)

(assert (=> d!1275 (=> res!9242 e!6450)))

(assert (=> d!1275 (= res!9242 ((_ is Nil!324) (toList!183 lm!227)))))

(assert (=> d!1275 (= (forall!50 (toList!183 lm!227) p!216) e!6450)))

(declare-fun b!10998 () Bool)

(declare-fun e!6452 () Bool)

(assert (=> b!10998 (= e!6450 e!6452)))

(declare-fun res!9244 () Bool)

(assert (=> b!10998 (=> (not res!9244) (not e!6452))))

(declare-fun dynLambda!61 (Int tuple2!354) Bool)

(assert (=> b!10998 (= res!9244 (dynLambda!61 p!216 (h!889 (toList!183 lm!227))))))

(declare-fun b!11000 () Bool)

(assert (=> b!11000 (= e!6452 (forall!50 (t!2546 (toList!183 lm!227)) p!216))))

(assert (= (and d!1275 (not res!9242)) b!10998))

(assert (= (and b!10998 res!9244) b!11000))

(declare-fun b_lambda!505 () Bool)

(assert (=> (not b_lambda!505) (not b!10998)))

(declare-fun t!2552 () Bool)

(declare-fun tb!221 () Bool)

(assert (=> (and start!1398 (= p!216 p!216) t!2552) tb!221))

(declare-fun result!370 () Bool)

(assert (=> tb!221 (= result!370 true)))

(assert (=> b!10998 t!2552))

(declare-fun b_and!664 () Bool)

(assert (= b_and!657 (and (=> t!2552 result!370) b_and!664)))

(declare-fun m!7256 () Bool)

(assert (=> b!10998 m!7256))

(declare-fun m!7260 () Bool)

(assert (=> b!11000 m!7260))

(assert (=> start!1398 d!1275))

(declare-fun d!1281 () Bool)

(declare-fun isStrictlySorted!30 (List!327) Bool)

(assert (=> d!1281 (= (inv!534 lm!227) (isStrictlySorted!30 (toList!183 lm!227)))))

(declare-fun bs!414 () Bool)

(assert (= bs!414 d!1281))

(declare-fun m!7263 () Bool)

(assert (=> bs!414 m!7263))

(assert (=> start!1398 d!1281))

(declare-fun d!1285 () Bool)

(declare-fun res!9251 () Bool)

(declare-fun e!6461 () Bool)

(assert (=> d!1285 (=> res!9251 e!6461)))

(assert (=> d!1285 (= res!9251 ((_ is Nil!324) kvs!4))))

(assert (=> d!1285 (= (forall!50 kvs!4 p!216) e!6461)))

(declare-fun b!11011 () Bool)

(declare-fun e!6462 () Bool)

(assert (=> b!11011 (= e!6461 e!6462)))

(declare-fun res!9252 () Bool)

(assert (=> b!11011 (=> (not res!9252) (not e!6462))))

(assert (=> b!11011 (= res!9252 (dynLambda!61 p!216 (h!889 kvs!4)))))

(declare-fun b!11012 () Bool)

(assert (=> b!11012 (= e!6462 (forall!50 (t!2546 kvs!4) p!216))))

(assert (= (and d!1285 (not res!9251)) b!11011))

(assert (= (and b!11011 res!9252) b!11012))

(declare-fun b_lambda!507 () Bool)

(assert (=> (not b_lambda!507) (not b!11011)))

(declare-fun t!2554 () Bool)

(declare-fun tb!223 () Bool)

(assert (=> (and start!1398 (= p!216 p!216) t!2554) tb!223))

(declare-fun result!373 () Bool)

(assert (=> tb!223 (= result!373 true)))

(assert (=> b!11011 t!2554))

(declare-fun b_and!667 () Bool)

(assert (= b_and!664 (and (=> t!2554 result!373) b_and!667)))

(declare-fun m!7267 () Bool)

(assert (=> b!11011 m!7267))

(declare-fun m!7269 () Bool)

(assert (=> b!11012 m!7269))

(assert (=> b!10961 d!1285))

(declare-fun d!1289 () Bool)

(declare-fun lt!2757 () Int)

(assert (=> d!1289 (>= lt!2757 0)))

(declare-fun e!6468 () Int)

(assert (=> d!1289 (= lt!2757 e!6468)))

(declare-fun c!950 () Bool)

(assert (=> d!1289 (= c!950 ((_ is Nil!324) kvs!4))))

(assert (=> d!1289 (= (ListPrimitiveSize!7 kvs!4) lt!2757)))

(declare-fun b!11021 () Bool)

(assert (=> b!11021 (= e!6468 0)))

(declare-fun b!11022 () Bool)

(assert (=> b!11022 (= e!6468 (+ 1 (ListPrimitiveSize!7 (t!2546 kvs!4))))))

(assert (= (and d!1289 c!950) b!11021))

(assert (= (and d!1289 (not c!950)) b!11022))

(declare-fun m!7279 () Bool)

(assert (=> b!11022 m!7279))

(assert (=> b!10962 d!1289))

(declare-fun b!11033 () Bool)

(declare-fun e!6475 () Bool)

(declare-fun tp!1765 () Bool)

(assert (=> b!11033 (= e!6475 (and tp_is_empty!541 tp!1765))))

(assert (=> b!10964 (= tp!1742 e!6475)))

(assert (= (and b!10964 ((_ is Cons!323) (t!2546 kvs!4))) b!11033))

(declare-fun b!11035 () Bool)

(declare-fun e!6477 () Bool)

(declare-fun tp!1767 () Bool)

(assert (=> b!11035 (= e!6477 (and tp_is_empty!541 tp!1767))))

(assert (=> b!10963 (= tp!1740 e!6477)))

(assert (= (and b!10963 ((_ is Cons!323) (toList!183 lm!227))) b!11035))

(declare-fun b_lambda!515 () Bool)

(assert (= b_lambda!507 (or (and start!1398 b_free!427) b_lambda!515)))

(declare-fun b_lambda!519 () Bool)

(assert (= b_lambda!505 (or (and start!1398 b_free!427) b_lambda!519)))

(check-sat (not b_next!427) (not b!11012) (not b!11035) (not b_lambda!519) (not d!1281) (not b_lambda!515) b_and!667 (not b!11022) (not b!11033) tp_is_empty!541 (not b!11000))
(check-sat b_and!667 (not b_next!427))
