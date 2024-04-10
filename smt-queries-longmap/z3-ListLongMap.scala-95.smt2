; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1424 () Bool)

(assert start!1424)

(declare-fun b_free!435 () Bool)

(declare-fun b_next!435 () Bool)

(assert (=> start!1424 (= b_free!435 (not b_next!435))))

(declare-fun tp!1788 () Bool)

(declare-fun b_and!679 () Bool)

(assert (=> start!1424 (= tp!1788 b_and!679)))

(declare-fun res!9272 () Bool)

(declare-fun e!6503 () Bool)

(assert (=> start!1424 (=> (not res!9272) (not e!6503))))

(declare-datatypes ((B!376 0))(
  ( (B!377 (val!283 Int)) )
))
(declare-datatypes ((tuple2!366 0))(
  ( (tuple2!367 (_1!183 (_ BitVec 64)) (_2!183 B!376)) )
))
(declare-datatypes ((List!335 0))(
  ( (Nil!332) (Cons!331 (h!897 tuple2!366) (t!2570 List!335)) )
))
(declare-datatypes ((ListLongMap!347 0))(
  ( (ListLongMap!348 (toList!189 List!335)) )
))
(declare-fun lm!227 () ListLongMap!347)

(declare-fun p!216 () Int)

(declare-fun forall!54 (List!335 Int) Bool)

(assert (=> start!1424 (= res!9272 (forall!54 (toList!189 lm!227) p!216))))

(assert (=> start!1424 e!6503))

(declare-fun e!6502 () Bool)

(declare-fun inv!543 (ListLongMap!347) Bool)

(assert (=> start!1424 (and (inv!543 lm!227) e!6502)))

(assert (=> start!1424 tp!1788))

(declare-fun e!6501 () Bool)

(assert (=> start!1424 e!6501))

(declare-fun b!11074 () Bool)

(declare-fun tp!1790 () Bool)

(assert (=> b!11074 (= e!6502 tp!1790)))

(declare-fun b!11075 () Bool)

(declare-fun res!9274 () Bool)

(assert (=> b!11075 (=> (not res!9274) (not e!6503))))

(declare-fun kvs!4 () List!335)

(assert (=> b!11075 (= res!9274 (forall!54 kvs!4 p!216))))

(declare-fun b!11076 () Bool)

(declare-fun dynLambda!65 (Int tuple2!366) Bool)

(declare-fun head!768 (List!335) tuple2!366)

(assert (=> b!11076 (= e!6503 (not (dynLambda!65 p!216 (head!768 kvs!4))))))

(declare-fun b!11077 () Bool)

(declare-fun tp_is_empty!549 () Bool)

(declare-fun tp!1789 () Bool)

(assert (=> b!11077 (= e!6501 (and tp_is_empty!549 tp!1789))))

(declare-fun b!11078 () Bool)

(declare-fun res!9273 () Bool)

(assert (=> b!11078 (=> (not res!9273) (not e!6503))))

(declare-fun isEmpty!61 (List!335) Bool)

(assert (=> b!11078 (= res!9273 (not (isEmpty!61 kvs!4)))))

(assert (= (and start!1424 res!9272) b!11075))

(assert (= (and b!11075 res!9274) b!11078))

(assert (= (and b!11078 res!9273) b!11076))

(assert (= start!1424 b!11074))

(get-info :version)

(assert (= (and start!1424 ((_ is Cons!331) kvs!4)) b!11077))

(declare-fun b_lambda!529 () Bool)

(assert (=> (not b_lambda!529) (not b!11076)))

(declare-fun t!2569 () Bool)

(declare-fun tb!233 () Bool)

(assert (=> (and start!1424 (= p!216 p!216) t!2569) tb!233))

(declare-fun result!389 () Bool)

(assert (=> tb!233 (= result!389 true)))

(assert (=> b!11076 t!2569))

(declare-fun b_and!681 () Bool)

(assert (= b_and!679 (and (=> t!2569 result!389) b_and!681)))

(declare-fun m!7307 () Bool)

(assert (=> start!1424 m!7307))

(declare-fun m!7309 () Bool)

(assert (=> start!1424 m!7309))

(declare-fun m!7311 () Bool)

(assert (=> b!11075 m!7311))

(declare-fun m!7313 () Bool)

(assert (=> b!11076 m!7313))

(assert (=> b!11076 m!7313))

(declare-fun m!7315 () Bool)

(assert (=> b!11076 m!7315))

(declare-fun m!7317 () Bool)

(assert (=> b!11078 m!7317))

(check-sat b_and!681 (not start!1424) (not b!11075) (not b!11078) tp_is_empty!549 (not b_lambda!529) (not b!11076) (not b!11074) (not b!11077) (not b_next!435))
(check-sat b_and!681 (not b_next!435))
(get-model)

(declare-fun b_lambda!537 () Bool)

(assert (= b_lambda!529 (or (and start!1424 b_free!435) b_lambda!537)))

(check-sat b_and!681 (not start!1424) (not b!11075) (not b!11078) (not b!11076) (not b!11074) (not b!11077) (not b_next!435) tp_is_empty!549 (not b_lambda!537))
(check-sat b_and!681 (not b_next!435))
(get-model)

(declare-fun d!1307 () Bool)

(assert (=> d!1307 (= (head!768 kvs!4) (h!897 kvs!4))))

(assert (=> b!11076 d!1307))

(declare-fun d!1311 () Bool)

(declare-fun res!9300 () Bool)

(declare-fun e!6529 () Bool)

(assert (=> d!1311 (=> res!9300 e!6529)))

(assert (=> d!1311 (= res!9300 ((_ is Nil!332) (toList!189 lm!227)))))

(assert (=> d!1311 (= (forall!54 (toList!189 lm!227) p!216) e!6529)))

(declare-fun b!11110 () Bool)

(declare-fun e!6530 () Bool)

(assert (=> b!11110 (= e!6529 e!6530)))

(declare-fun res!9301 () Bool)

(assert (=> b!11110 (=> (not res!9301) (not e!6530))))

(assert (=> b!11110 (= res!9301 (dynLambda!65 p!216 (h!897 (toList!189 lm!227))))))

(declare-fun b!11111 () Bool)

(assert (=> b!11111 (= e!6530 (forall!54 (t!2570 (toList!189 lm!227)) p!216))))

(assert (= (and d!1311 (not res!9300)) b!11110))

(assert (= (and b!11110 res!9301) b!11111))

(declare-fun b_lambda!543 () Bool)

(assert (=> (not b_lambda!543) (not b!11110)))

(declare-fun t!2579 () Bool)

(declare-fun tb!241 () Bool)

(assert (=> (and start!1424 (= p!216 p!216) t!2579) tb!241))

(declare-fun result!397 () Bool)

(assert (=> tb!241 (= result!397 true)))

(assert (=> b!11110 t!2579))

(declare-fun b_and!691 () Bool)

(assert (= b_and!681 (and (=> t!2579 result!397) b_and!691)))

(declare-fun m!7339 () Bool)

(assert (=> b!11110 m!7339))

(declare-fun m!7341 () Bool)

(assert (=> b!11111 m!7341))

(assert (=> start!1424 d!1311))

(declare-fun d!1321 () Bool)

(declare-fun isStrictlySorted!38 (List!335) Bool)

(assert (=> d!1321 (= (inv!543 lm!227) (isStrictlySorted!38 (toList!189 lm!227)))))

(declare-fun bs!421 () Bool)

(assert (= bs!421 d!1321))

(declare-fun m!7349 () Bool)

(assert (=> bs!421 m!7349))

(assert (=> start!1424 d!1321))

(declare-fun d!1327 () Bool)

(assert (=> d!1327 (= (isEmpty!61 kvs!4) ((_ is Nil!332) kvs!4))))

(assert (=> b!11078 d!1327))

(declare-fun d!1329 () Bool)

(declare-fun res!9306 () Bool)

(declare-fun e!6537 () Bool)

(assert (=> d!1329 (=> res!9306 e!6537)))

(assert (=> d!1329 (= res!9306 ((_ is Nil!332) kvs!4))))

(assert (=> d!1329 (= (forall!54 kvs!4 p!216) e!6537)))

(declare-fun b!11120 () Bool)

(declare-fun e!6538 () Bool)

(assert (=> b!11120 (= e!6537 e!6538)))

(declare-fun res!9307 () Bool)

(assert (=> b!11120 (=> (not res!9307) (not e!6538))))

(assert (=> b!11120 (= res!9307 (dynLambda!65 p!216 (h!897 kvs!4)))))

(declare-fun b!11121 () Bool)

(assert (=> b!11121 (= e!6538 (forall!54 (t!2570 kvs!4) p!216))))

(assert (= (and d!1329 (not res!9306)) b!11120))

(assert (= (and b!11120 res!9307) b!11121))

(declare-fun b_lambda!549 () Bool)

(assert (=> (not b_lambda!549) (not b!11120)))

(declare-fun t!2585 () Bool)

(declare-fun tb!247 () Bool)

(assert (=> (and start!1424 (= p!216 p!216) t!2585) tb!247))

(declare-fun result!407 () Bool)

(assert (=> tb!247 (= result!407 true)))

(assert (=> b!11120 t!2585))

(declare-fun b_and!697 () Bool)

(assert (= b_and!691 (and (=> t!2585 result!407) b_and!697)))

(declare-fun m!7357 () Bool)

(assert (=> b!11120 m!7357))

(declare-fun m!7359 () Bool)

(assert (=> b!11121 m!7359))

(assert (=> b!11075 d!1329))

(declare-fun b!11134 () Bool)

(declare-fun e!6547 () Bool)

(declare-fun tp!1810 () Bool)

(assert (=> b!11134 (= e!6547 (and tp_is_empty!549 tp!1810))))

(assert (=> b!11077 (= tp!1789 e!6547)))

(assert (= (and b!11077 ((_ is Cons!331) (t!2570 kvs!4))) b!11134))

(declare-fun b!11135 () Bool)

(declare-fun e!6548 () Bool)

(declare-fun tp!1811 () Bool)

(assert (=> b!11135 (= e!6548 (and tp_is_empty!549 tp!1811))))

(assert (=> b!11074 (= tp!1790 e!6548)))

(assert (= (and b!11074 ((_ is Cons!331) (toList!189 lm!227))) b!11135))

(declare-fun b_lambda!559 () Bool)

(assert (= b_lambda!543 (or (and start!1424 b_free!435) b_lambda!559)))

(declare-fun b_lambda!561 () Bool)

(assert (= b_lambda!549 (or (and start!1424 b_free!435) b_lambda!561)))

(check-sat (not b_next!435) (not b!11111) (not b!11134) (not b_lambda!561) (not b_lambda!559) tp_is_empty!549 (not b_lambda!537) (not b!11121) (not d!1321) b_and!697 (not b!11135))
(check-sat b_and!697 (not b_next!435))
