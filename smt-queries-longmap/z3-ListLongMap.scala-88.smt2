; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1254 () Bool)

(assert start!1254)

(declare-fun b_free!391 () Bool)

(declare-fun b_next!391 () Bool)

(assert (=> start!1254 (= b_free!391 (not b_next!391))))

(declare-fun tp!1531 () Bool)

(declare-fun b_and!549 () Bool)

(assert (=> start!1254 (= tp!1531 b_and!549)))

(declare-fun b!10465 () Bool)

(declare-fun res!8911 () Bool)

(declare-fun e!6064 () Bool)

(assert (=> b!10465 (=> (not res!8911) (not e!6064))))

(declare-datatypes ((B!332 0))(
  ( (B!333 (val!261 Int)) )
))
(declare-datatypes ((tuple2!318 0))(
  ( (tuple2!319 (_1!159 (_ BitVec 64)) (_2!159 B!332)) )
))
(declare-datatypes ((List!309 0))(
  ( (Nil!306) (Cons!305 (h!871 tuple2!318) (t!2456 List!309)) )
))
(declare-fun kvs!4 () List!309)

(declare-fun isEmpty!45 (List!309) Bool)

(assert (=> b!10465 (= res!8911 (not (isEmpty!45 kvs!4)))))

(declare-fun res!8909 () Bool)

(assert (=> start!1254 (=> (not res!8909) (not e!6064))))

(declare-datatypes ((ListLongMap!299 0))(
  ( (ListLongMap!300 (toList!165 List!309)) )
))
(declare-fun lm!227 () ListLongMap!299)

(declare-fun p!216 () Int)

(declare-fun forall!35 (List!309 Int) Bool)

(assert (=> start!1254 (= res!8909 (forall!35 (toList!165 lm!227) p!216))))

(assert (=> start!1254 e!6064))

(declare-fun e!6065 () Bool)

(declare-fun inv!486 (ListLongMap!299) Bool)

(assert (=> start!1254 (and (inv!486 lm!227) e!6065)))

(assert (=> start!1254 tp!1531))

(declare-fun e!6063 () Bool)

(assert (=> start!1254 e!6063))

(declare-fun b!10466 () Bool)

(declare-fun res!8910 () Bool)

(assert (=> b!10466 (=> (not res!8910) (not e!6064))))

(assert (=> b!10466 (= res!8910 (forall!35 kvs!4 p!216))))

(declare-fun b!10467 () Bool)

(declare-fun tp_is_empty!505 () Bool)

(declare-fun tp!1530 () Bool)

(assert (=> b!10467 (= e!6063 (and tp_is_empty!505 tp!1530))))

(declare-fun b!10468 () Bool)

(assert (=> b!10468 (= e!6064 (= kvs!4 Nil!306))))

(declare-fun b!10469 () Bool)

(declare-fun tp!1532 () Bool)

(assert (=> b!10469 (= e!6065 tp!1532)))

(assert (= (and start!1254 res!8909) b!10466))

(assert (= (and b!10466 res!8910) b!10465))

(assert (= (and b!10465 res!8911) b!10468))

(assert (= start!1254 b!10469))

(get-info :version)

(assert (= (and start!1254 ((_ is Cons!305) kvs!4)) b!10467))

(declare-fun m!6743 () Bool)

(assert (=> b!10465 m!6743))

(declare-fun m!6745 () Bool)

(assert (=> start!1254 m!6745))

(declare-fun m!6747 () Bool)

(assert (=> start!1254 m!6747))

(declare-fun m!6749 () Bool)

(assert (=> b!10466 m!6749))

(check-sat (not b!10467) (not b!10465) (not b!10469) (not start!1254) (not b!10466) tp_is_empty!505 b_and!549 (not b_next!391))
(check-sat b_and!549 (not b_next!391))
(get-model)

(declare-fun d!1113 () Bool)

(declare-fun res!8934 () Bool)

(declare-fun e!6088 () Bool)

(assert (=> d!1113 (=> res!8934 e!6088)))

(assert (=> d!1113 (= res!8934 ((_ is Nil!306) (toList!165 lm!227)))))

(assert (=> d!1113 (= (forall!35 (toList!165 lm!227) p!216) e!6088)))

(declare-fun b!10504 () Bool)

(declare-fun e!6089 () Bool)

(assert (=> b!10504 (= e!6088 e!6089)))

(declare-fun res!8935 () Bool)

(assert (=> b!10504 (=> (not res!8935) (not e!6089))))

(declare-fun dynLambda!49 (Int tuple2!318) Bool)

(assert (=> b!10504 (= res!8935 (dynLambda!49 p!216 (h!871 (toList!165 lm!227))))))

(declare-fun b!10505 () Bool)

(assert (=> b!10505 (= e!6089 (forall!35 (t!2456 (toList!165 lm!227)) p!216))))

(assert (= (and d!1113 (not res!8934)) b!10504))

(assert (= (and b!10504 res!8935) b!10505))

(declare-fun b_lambda!359 () Bool)

(assert (=> (not b_lambda!359) (not b!10504)))

(declare-fun t!2460 () Bool)

(declare-fun tb!147 () Bool)

(assert (=> (and start!1254 (= p!216 p!216) t!2460) tb!147))

(declare-fun result!273 () Bool)

(assert (=> tb!147 (= result!273 true)))

(assert (=> b!10504 t!2460))

(declare-fun b_and!555 () Bool)

(assert (= b_and!549 (and (=> t!2460 result!273) b_and!555)))

(declare-fun m!6767 () Bool)

(assert (=> b!10504 m!6767))

(declare-fun m!6769 () Bool)

(assert (=> b!10505 m!6769))

(assert (=> start!1254 d!1113))

(declare-fun d!1119 () Bool)

(declare-fun isStrictlySorted!25 (List!309) Bool)

(assert (=> d!1119 (= (inv!486 lm!227) (isStrictlySorted!25 (toList!165 lm!227)))))

(declare-fun bs!384 () Bool)

(assert (= bs!384 d!1119))

(declare-fun m!6771 () Bool)

(assert (=> bs!384 m!6771))

(assert (=> start!1254 d!1119))

(declare-fun d!1121 () Bool)

(declare-fun res!8944 () Bool)

(declare-fun e!6098 () Bool)

(assert (=> d!1121 (=> res!8944 e!6098)))

(assert (=> d!1121 (= res!8944 ((_ is Nil!306) kvs!4))))

(assert (=> d!1121 (= (forall!35 kvs!4 p!216) e!6098)))

(declare-fun b!10514 () Bool)

(declare-fun e!6099 () Bool)

(assert (=> b!10514 (= e!6098 e!6099)))

(declare-fun res!8945 () Bool)

(assert (=> b!10514 (=> (not res!8945) (not e!6099))))

(assert (=> b!10514 (= res!8945 (dynLambda!49 p!216 (h!871 kvs!4)))))

(declare-fun b!10515 () Bool)

(assert (=> b!10515 (= e!6099 (forall!35 (t!2456 kvs!4) p!216))))

(assert (= (and d!1121 (not res!8944)) b!10514))

(assert (= (and b!10514 res!8945) b!10515))

(declare-fun b_lambda!361 () Bool)

(assert (=> (not b_lambda!361) (not b!10514)))

(declare-fun t!2462 () Bool)

(declare-fun tb!149 () Bool)

(assert (=> (and start!1254 (= p!216 p!216) t!2462) tb!149))

(declare-fun result!275 () Bool)

(assert (=> tb!149 (= result!275 true)))

(assert (=> b!10514 t!2462))

(declare-fun b_and!557 () Bool)

(assert (= b_and!555 (and (=> t!2462 result!275) b_and!557)))

(declare-fun m!6773 () Bool)

(assert (=> b!10514 m!6773))

(declare-fun m!6775 () Bool)

(assert (=> b!10515 m!6775))

(assert (=> b!10466 d!1121))

(declare-fun d!1123 () Bool)

(assert (=> d!1123 (= (isEmpty!45 kvs!4) ((_ is Nil!306) kvs!4))))

(assert (=> b!10465 d!1123))

(declare-fun b!10524 () Bool)

(declare-fun e!6106 () Bool)

(declare-fun tp!1553 () Bool)

(assert (=> b!10524 (= e!6106 (and tp_is_empty!505 tp!1553))))

(assert (=> b!10469 (= tp!1532 e!6106)))

(assert (= (and b!10469 ((_ is Cons!305) (toList!165 lm!227))) b!10524))

(declare-fun b!10525 () Bool)

(declare-fun e!6107 () Bool)

(declare-fun tp!1554 () Bool)

(assert (=> b!10525 (= e!6107 (and tp_is_empty!505 tp!1554))))

(assert (=> b!10467 (= tp!1530 e!6107)))

(assert (= (and b!10467 ((_ is Cons!305) (t!2456 kvs!4))) b!10525))

(declare-fun b_lambda!367 () Bool)

(assert (= b_lambda!361 (or (and start!1254 b_free!391) b_lambda!367)))

(declare-fun b_lambda!369 () Bool)

(assert (= b_lambda!359 (or (and start!1254 b_free!391) b_lambda!369)))

(check-sat (not b!10525) tp_is_empty!505 (not b_lambda!367) (not b!10515) (not b!10505) (not b!10524) (not d!1119) b_and!557 (not b_lambda!369) (not b_next!391))
(check-sat b_and!557 (not b_next!391))
