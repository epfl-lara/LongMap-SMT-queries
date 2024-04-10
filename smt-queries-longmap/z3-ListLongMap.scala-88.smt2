; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1256 () Bool)

(assert start!1256)

(declare-fun b_free!393 () Bool)

(declare-fun b_next!393 () Bool)

(assert (=> start!1256 (= b_free!393 (not b_next!393))))

(declare-fun tp!1539 () Bool)

(declare-fun b_and!551 () Bool)

(assert (=> start!1256 (= tp!1539 b_and!551)))

(declare-fun b!10480 () Bool)

(declare-fun e!6072 () Bool)

(declare-fun tp!1541 () Bool)

(assert (=> b!10480 (= e!6072 tp!1541)))

(declare-fun b!10481 () Bool)

(declare-fun res!8918 () Bool)

(declare-fun e!6074 () Bool)

(assert (=> b!10481 (=> (not res!8918) (not e!6074))))

(declare-datatypes ((B!334 0))(
  ( (B!335 (val!262 Int)) )
))
(declare-datatypes ((tuple2!324 0))(
  ( (tuple2!325 (_1!162 (_ BitVec 64)) (_2!162 B!334)) )
))
(declare-datatypes ((List!314 0))(
  ( (Nil!311) (Cons!310 (h!876 tuple2!324) (t!2461 List!314)) )
))
(declare-fun kvs!4 () List!314)

(declare-fun p!216 () Int)

(declare-fun forall!36 (List!314 Int) Bool)

(assert (=> b!10481 (= res!8918 (forall!36 kvs!4 p!216))))

(declare-fun b!10482 () Bool)

(declare-fun res!8920 () Bool)

(assert (=> b!10482 (=> (not res!8920) (not e!6074))))

(declare-fun isEmpty!46 (List!314) Bool)

(assert (=> b!10482 (= res!8920 (not (isEmpty!46 kvs!4)))))

(declare-fun b!10483 () Bool)

(declare-fun e!6073 () Bool)

(declare-fun tp_is_empty!507 () Bool)

(declare-fun tp!1540 () Bool)

(assert (=> b!10483 (= e!6073 (and tp_is_empty!507 tp!1540))))

(declare-fun res!8919 () Bool)

(assert (=> start!1256 (=> (not res!8919) (not e!6074))))

(declare-datatypes ((ListLongMap!305 0))(
  ( (ListLongMap!306 (toList!168 List!314)) )
))
(declare-fun lm!227 () ListLongMap!305)

(assert (=> start!1256 (= res!8919 (forall!36 (toList!168 lm!227) p!216))))

(assert (=> start!1256 e!6074))

(declare-fun inv!487 (ListLongMap!305) Bool)

(assert (=> start!1256 (and (inv!487 lm!227) e!6072)))

(assert (=> start!1256 tp!1539))

(assert (=> start!1256 e!6073))

(declare-fun b!10484 () Bool)

(assert (=> b!10484 (= e!6074 (= kvs!4 Nil!311))))

(assert (= (and start!1256 res!8919) b!10481))

(assert (= (and b!10481 res!8918) b!10482))

(assert (= (and b!10482 res!8920) b!10484))

(assert (= start!1256 b!10480))

(get-info :version)

(assert (= (and start!1256 ((_ is Cons!310) kvs!4)) b!10483))

(declare-fun m!6751 () Bool)

(assert (=> b!10481 m!6751))

(declare-fun m!6753 () Bool)

(assert (=> b!10482 m!6753))

(declare-fun m!6755 () Bool)

(assert (=> start!1256 m!6755))

(declare-fun m!6757 () Bool)

(assert (=> start!1256 m!6757))

(check-sat (not b_next!393) (not start!1256) tp_is_empty!507 (not b!10480) (not b!10483) b_and!551 (not b!10481) (not b!10482))
(check-sat b_and!551 (not b_next!393))
(get-model)

(declare-fun d!1113 () Bool)

(assert (=> d!1113 (= (isEmpty!46 kvs!4) ((_ is Nil!311) kvs!4))))

(assert (=> b!10482 d!1113))

(declare-fun d!1115 () Bool)

(declare-fun res!8934 () Bool)

(declare-fun e!6088 () Bool)

(assert (=> d!1115 (=> res!8934 e!6088)))

(assert (=> d!1115 (= res!8934 ((_ is Nil!311) (toList!168 lm!227)))))

(assert (=> d!1115 (= (forall!36 (toList!168 lm!227) p!216) e!6088)))

(declare-fun b!10504 () Bool)

(declare-fun e!6089 () Bool)

(assert (=> b!10504 (= e!6088 e!6089)))

(declare-fun res!8935 () Bool)

(assert (=> b!10504 (=> (not res!8935) (not e!6089))))

(declare-fun dynLambda!49 (Int tuple2!324) Bool)

(assert (=> b!10504 (= res!8935 (dynLambda!49 p!216 (h!876 (toList!168 lm!227))))))

(declare-fun b!10505 () Bool)

(assert (=> b!10505 (= e!6089 (forall!36 (t!2461 (toList!168 lm!227)) p!216))))

(assert (= (and d!1115 (not res!8934)) b!10504))

(assert (= (and b!10504 res!8935) b!10505))

(declare-fun b_lambda!359 () Bool)

(assert (=> (not b_lambda!359) (not b!10504)))

(declare-fun t!2464 () Bool)

(declare-fun tb!147 () Bool)

(assert (=> (and start!1256 (= p!216 p!216) t!2464) tb!147))

(declare-fun result!273 () Bool)

(assert (=> tb!147 (= result!273 true)))

(assert (=> b!10504 t!2464))

(declare-fun b_and!555 () Bool)

(assert (= b_and!551 (and (=> t!2464 result!273) b_and!555)))

(declare-fun m!6767 () Bool)

(assert (=> b!10504 m!6767))

(declare-fun m!6769 () Bool)

(assert (=> b!10505 m!6769))

(assert (=> start!1256 d!1115))

(declare-fun d!1121 () Bool)

(declare-fun isStrictlySorted!25 (List!314) Bool)

(assert (=> d!1121 (= (inv!487 lm!227) (isStrictlySorted!25 (toList!168 lm!227)))))

(declare-fun bs!384 () Bool)

(assert (= bs!384 d!1121))

(declare-fun m!6771 () Bool)

(assert (=> bs!384 m!6771))

(assert (=> start!1256 d!1121))

(declare-fun d!1123 () Bool)

(declare-fun res!8948 () Bool)

(declare-fun e!6102 () Bool)

(assert (=> d!1123 (=> res!8948 e!6102)))

(assert (=> d!1123 (= res!8948 ((_ is Nil!311) kvs!4))))

(assert (=> d!1123 (= (forall!36 kvs!4 p!216) e!6102)))

(declare-fun b!10518 () Bool)

(declare-fun e!6103 () Bool)

(assert (=> b!10518 (= e!6102 e!6103)))

(declare-fun res!8949 () Bool)

(assert (=> b!10518 (=> (not res!8949) (not e!6103))))

(assert (=> b!10518 (= res!8949 (dynLambda!49 p!216 (h!876 kvs!4)))))

(declare-fun b!10519 () Bool)

(assert (=> b!10519 (= e!6103 (forall!36 (t!2461 kvs!4) p!216))))

(assert (= (and d!1123 (not res!8948)) b!10518))

(assert (= (and b!10518 res!8949) b!10519))

(declare-fun b_lambda!365 () Bool)

(assert (=> (not b_lambda!365) (not b!10518)))

(declare-fun t!2470 () Bool)

(declare-fun tb!153 () Bool)

(assert (=> (and start!1256 (= p!216 p!216) t!2470) tb!153))

(declare-fun result!279 () Bool)

(assert (=> tb!153 (= result!279 true)))

(assert (=> b!10518 t!2470))

(declare-fun b_and!561 () Bool)

(assert (= b_and!555 (and (=> t!2470 result!279) b_and!561)))

(declare-fun m!6781 () Bool)

(assert (=> b!10518 m!6781))

(declare-fun m!6783 () Bool)

(assert (=> b!10519 m!6783))

(assert (=> b!10481 d!1123))

(declare-fun b!10524 () Bool)

(declare-fun e!6106 () Bool)

(declare-fun tp!1553 () Bool)

(assert (=> b!10524 (= e!6106 (and tp_is_empty!507 tp!1553))))

(assert (=> b!10483 (= tp!1540 e!6106)))

(assert (= (and b!10483 ((_ is Cons!310) (t!2461 kvs!4))) b!10524))

(declare-fun b!10525 () Bool)

(declare-fun e!6107 () Bool)

(declare-fun tp!1554 () Bool)

(assert (=> b!10525 (= e!6107 (and tp_is_empty!507 tp!1554))))

(assert (=> b!10480 (= tp!1541 e!6107)))

(assert (= (and b!10480 ((_ is Cons!310) (toList!168 lm!227))) b!10525))

(declare-fun b_lambda!367 () Bool)

(assert (= b_lambda!365 (or (and start!1256 b_free!393) b_lambda!367)))

(declare-fun b_lambda!369 () Bool)

(assert (= b_lambda!359 (or (and start!1256 b_free!393) b_lambda!369)))

(check-sat (not b_next!393) tp_is_empty!507 b_and!561 (not d!1121) (not b!10524) (not b!10505) (not b!10519) (not b_lambda!369) (not b!10525) (not b_lambda!367))
(check-sat b_and!561 (not b_next!393))
