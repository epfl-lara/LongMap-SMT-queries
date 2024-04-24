; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1254 () Bool)

(assert start!1254)

(declare-fun b_free!391 () Bool)

(declare-fun b_next!391 () Bool)

(assert (=> start!1254 (= b_free!391 (not b_next!391))))

(declare-fun tp!1532 () Bool)

(declare-fun b_and!549 () Bool)

(assert (=> start!1254 (= tp!1532 b_and!549)))

(declare-fun b!10465 () Bool)

(declare-fun e!6063 () Bool)

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

(assert (=> b!10465 (= e!6063 (= kvs!4 Nil!306))))

(declare-fun b!10466 () Bool)

(declare-fun e!6065 () Bool)

(declare-fun tp_is_empty!505 () Bool)

(declare-fun tp!1531 () Bool)

(assert (=> b!10466 (= e!6065 (and tp_is_empty!505 tp!1531))))

(declare-fun b!10467 () Bool)

(declare-fun e!6064 () Bool)

(declare-fun tp!1530 () Bool)

(assert (=> b!10467 (= e!6064 tp!1530)))

(declare-fun b!10468 () Bool)

(declare-fun res!8910 () Bool)

(assert (=> b!10468 (=> (not res!8910) (not e!6063))))

(declare-fun isEmpty!45 (List!309) Bool)

(assert (=> b!10468 (= res!8910 (not (isEmpty!45 kvs!4)))))

(declare-fun b!10469 () Bool)

(declare-fun res!8909 () Bool)

(assert (=> b!10469 (=> (not res!8909) (not e!6063))))

(declare-fun p!216 () Int)

(declare-fun forall!35 (List!309 Int) Bool)

(assert (=> b!10469 (= res!8909 (forall!35 kvs!4 p!216))))

(declare-fun res!8911 () Bool)

(assert (=> start!1254 (=> (not res!8911) (not e!6063))))

(declare-datatypes ((ListLongMap!299 0))(
  ( (ListLongMap!300 (toList!165 List!309)) )
))
(declare-fun lm!227 () ListLongMap!299)

(assert (=> start!1254 (= res!8911 (forall!35 (toList!165 lm!227) p!216))))

(assert (=> start!1254 e!6063))

(declare-fun inv!486 (ListLongMap!299) Bool)

(assert (=> start!1254 (and (inv!486 lm!227) e!6064)))

(assert (=> start!1254 tp!1532))

(assert (=> start!1254 e!6065))

(assert (= (and start!1254 res!8911) b!10469))

(assert (= (and b!10469 res!8909) b!10468))

(assert (= (and b!10468 res!8910) b!10465))

(assert (= start!1254 b!10467))

(get-info :version)

(assert (= (and start!1254 ((_ is Cons!305) kvs!4)) b!10466))

(declare-fun m!6739 () Bool)

(assert (=> b!10468 m!6739))

(declare-fun m!6741 () Bool)

(assert (=> b!10469 m!6741))

(declare-fun m!6743 () Bool)

(assert (=> start!1254 m!6743))

(declare-fun m!6745 () Bool)

(assert (=> start!1254 m!6745))

(check-sat b_and!549 (not b!10469) (not b!10466) (not start!1254) (not b_next!391) (not b!10468) tp_is_empty!505 (not b!10467))
(check-sat b_and!549 (not b_next!391))
(get-model)

(declare-fun d!1113 () Bool)

(assert (=> d!1113 (= (isEmpty!45 kvs!4) ((_ is Nil!306) kvs!4))))

(assert (=> b!10468 d!1113))

(declare-fun d!1115 () Bool)

(declare-fun res!8934 () Bool)

(declare-fun e!6088 () Bool)

(assert (=> d!1115 (=> res!8934 e!6088)))

(assert (=> d!1115 (= res!8934 ((_ is Nil!306) (toList!165 lm!227)))))

(assert (=> d!1115 (= (forall!35 (toList!165 lm!227) p!216) e!6088)))

(declare-fun b!10504 () Bool)

(declare-fun e!6089 () Bool)

(assert (=> b!10504 (= e!6088 e!6089)))

(declare-fun res!8935 () Bool)

(assert (=> b!10504 (=> (not res!8935) (not e!6089))))

(declare-fun dynLambda!49 (Int tuple2!318) Bool)

(assert (=> b!10504 (= res!8935 (dynLambda!49 p!216 (h!871 (toList!165 lm!227))))))

(declare-fun b!10505 () Bool)

(assert (=> b!10505 (= e!6089 (forall!35 (t!2456 (toList!165 lm!227)) p!216))))

(assert (= (and d!1115 (not res!8934)) b!10504))

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

(declare-fun m!6763 () Bool)

(assert (=> b!10504 m!6763))

(declare-fun m!6765 () Bool)

(assert (=> b!10505 m!6765))

(assert (=> start!1254 d!1115))

(declare-fun d!1121 () Bool)

(declare-fun isStrictlySorted!24 (List!309) Bool)

(assert (=> d!1121 (= (inv!486 lm!227) (isStrictlySorted!24 (toList!165 lm!227)))))

(declare-fun bs!384 () Bool)

(assert (= bs!384 d!1121))

(declare-fun m!6767 () Bool)

(assert (=> bs!384 m!6767))

(assert (=> start!1254 d!1121))

(declare-fun d!1123 () Bool)

(declare-fun res!8948 () Bool)

(declare-fun e!6102 () Bool)

(assert (=> d!1123 (=> res!8948 e!6102)))

(assert (=> d!1123 (= res!8948 ((_ is Nil!306) kvs!4))))

(assert (=> d!1123 (= (forall!35 kvs!4 p!216) e!6102)))

(declare-fun b!10518 () Bool)

(declare-fun e!6103 () Bool)

(assert (=> b!10518 (= e!6102 e!6103)))

(declare-fun res!8949 () Bool)

(assert (=> b!10518 (=> (not res!8949) (not e!6103))))

(assert (=> b!10518 (= res!8949 (dynLambda!49 p!216 (h!871 kvs!4)))))

(declare-fun b!10519 () Bool)

(assert (=> b!10519 (= e!6103 (forall!35 (t!2456 kvs!4) p!216))))

(assert (= (and d!1123 (not res!8948)) b!10518))

(assert (= (and b!10518 res!8949) b!10519))

(declare-fun b_lambda!365 () Bool)

(assert (=> (not b_lambda!365) (not b!10518)))

(declare-fun t!2466 () Bool)

(declare-fun tb!153 () Bool)

(assert (=> (and start!1254 (= p!216 p!216) t!2466) tb!153))

(declare-fun result!279 () Bool)

(assert (=> tb!153 (= result!279 true)))

(assert (=> b!10518 t!2466))

(declare-fun b_and!561 () Bool)

(assert (= b_and!555 (and (=> t!2466 result!279) b_and!561)))

(declare-fun m!6777 () Bool)

(assert (=> b!10518 m!6777))

(declare-fun m!6779 () Bool)

(assert (=> b!10519 m!6779))

(assert (=> b!10469 d!1123))

(declare-fun b!10526 () Bool)

(declare-fun e!6108 () Bool)

(declare-fun tp!1553 () Bool)

(assert (=> b!10526 (= e!6108 (and tp_is_empty!505 tp!1553))))

(assert (=> b!10467 (= tp!1530 e!6108)))

(assert (= (and b!10467 ((_ is Cons!305) (toList!165 lm!227))) b!10526))

(declare-fun b!10529 () Bool)

(declare-fun e!6111 () Bool)

(declare-fun tp!1554 () Bool)

(assert (=> b!10529 (= e!6111 (and tp_is_empty!505 tp!1554))))

(assert (=> b!10466 (= tp!1531 e!6111)))

(assert (= (and b!10466 ((_ is Cons!305) (t!2456 kvs!4))) b!10529))

(declare-fun b_lambda!371 () Bool)

(assert (= b_lambda!365 (or (and start!1254 b_free!391) b_lambda!371)))

(declare-fun b_lambda!373 () Bool)

(assert (= b_lambda!359 (or (and start!1254 b_free!391) b_lambda!373)))

(check-sat (not d!1121) (not b!10519) (not b!10526) tp_is_empty!505 (not b_next!391) b_and!561 (not b_lambda!371) (not b!10505) (not b!10529) (not b_lambda!373))
(check-sat b_and!561 (not b_next!391))
