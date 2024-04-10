; Options: -q --produce-models --incremental --print-success --lang smt2.6
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

(declare-fun tp!1530 () Bool)

(assert (=> b!10465 (= e!6063 tp!1530)))

(declare-fun b!10466 () Bool)

(declare-fun res!8909 () Bool)

(declare-fun e!6065 () Bool)

(assert (=> b!10466 (=> (not res!8909) (not e!6065))))

(declare-datatypes ((B!332 0))(
  ( (B!333 (val!261 Int)) )
))
(declare-datatypes ((tuple2!322 0))(
  ( (tuple2!323 (_1!161 (_ BitVec 64)) (_2!161 B!332)) )
))
(declare-datatypes ((List!313 0))(
  ( (Nil!310) (Cons!309 (h!875 tuple2!322) (t!2460 List!313)) )
))
(declare-fun kvs!4 () List!313)

(declare-fun p!216 () Int)

(declare-fun forall!35 (List!313 Int) Bool)

(assert (=> b!10466 (= res!8909 (forall!35 kvs!4 p!216))))

(declare-fun res!8911 () Bool)

(assert (=> start!1254 (=> (not res!8911) (not e!6065))))

(declare-datatypes ((ListLongMap!303 0))(
  ( (ListLongMap!304 (toList!167 List!313)) )
))
(declare-fun lm!227 () ListLongMap!303)

(assert (=> start!1254 (= res!8911 (forall!35 (toList!167 lm!227) p!216))))

(assert (=> start!1254 e!6065))

(declare-fun inv!486 (ListLongMap!303) Bool)

(assert (=> start!1254 (and (inv!486 lm!227) e!6063)))

(assert (=> start!1254 tp!1532))

(declare-fun e!6064 () Bool)

(assert (=> start!1254 e!6064))

(declare-fun b!10467 () Bool)

(declare-fun res!8910 () Bool)

(assert (=> b!10467 (=> (not res!8910) (not e!6065))))

(declare-fun isEmpty!45 (List!313) Bool)

(assert (=> b!10467 (= res!8910 (not (isEmpty!45 kvs!4)))))

(declare-fun b!10468 () Bool)

(declare-fun tp_is_empty!505 () Bool)

(declare-fun tp!1531 () Bool)

(assert (=> b!10468 (= e!6064 (and tp_is_empty!505 tp!1531))))

(declare-fun b!10469 () Bool)

(assert (=> b!10469 (= e!6065 (= kvs!4 Nil!310))))

(assert (= (and start!1254 res!8911) b!10466))

(assert (= (and b!10466 res!8909) b!10467))

(assert (= (and b!10467 res!8910) b!10469))

(assert (= start!1254 b!10465))

(assert (= (and start!1254 (is-Cons!309 kvs!4)) b!10468))

(declare-fun m!6743 () Bool)

(assert (=> b!10466 m!6743))

(declare-fun m!6745 () Bool)

(assert (=> start!1254 m!6745))

(declare-fun m!6747 () Bool)

(assert (=> start!1254 m!6747))

(declare-fun m!6749 () Bool)

(assert (=> b!10467 m!6749))

(push 1)

(assert (not b!10468))

(assert tp_is_empty!505)

(assert (not start!1254))

(assert b_and!549)

(assert (not b!10466))

(assert (not b!10467))

(assert (not b!10465))

(assert (not b_next!391))

(check-sat)

(pop 1)

(push 1)

(assert b_and!549)

(assert (not b_next!391))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!1119 () Bool)

(declare-fun res!8946 () Bool)

(declare-fun e!6100 () Bool)

(assert (=> d!1119 (=> res!8946 e!6100)))

(assert (=> d!1119 (= res!8946 (is-Nil!310 kvs!4))))

(assert (=> d!1119 (= (forall!35 kvs!4 p!216) e!6100)))

(declare-fun b!10516 () Bool)

(declare-fun e!6101 () Bool)

(assert (=> b!10516 (= e!6100 e!6101)))

(declare-fun res!8947 () Bool)

(assert (=> b!10516 (=> (not res!8947) (not e!6101))))

(declare-fun dynLambda!50 (Int tuple2!322) Bool)

(assert (=> b!10516 (= res!8947 (dynLambda!50 p!216 (h!875 kvs!4)))))

(declare-fun b!10517 () Bool)

(assert (=> b!10517 (= e!6101 (forall!35 (t!2460 kvs!4) p!216))))

(assert (= (and d!1119 (not res!8946)) b!10516))

(assert (= (and b!10516 res!8947) b!10517))

(declare-fun b_lambda!363 () Bool)

(assert (=> (not b_lambda!363) (not b!10516)))

(declare-fun t!2468 () Bool)

(declare-fun tb!151 () Bool)

(assert (=> (and start!1254 (= p!216 p!216) t!2468) tb!151))

(declare-fun result!277 () Bool)

(assert (=> tb!151 (= result!277 true)))

(assert (=> b!10516 t!2468))

(declare-fun b_and!559 () Bool)

(assert (= b_and!549 (and (=> t!2468 result!277) b_and!559)))

(declare-fun m!6777 () Bool)

(assert (=> b!10516 m!6777))

(declare-fun m!6779 () Bool)

(assert (=> b!10517 m!6779))

(assert (=> b!10466 d!1119))

(declare-fun d!1127 () Bool)

(assert (=> d!1127 (= (isEmpty!45 kvs!4) (is-Nil!310 kvs!4))))

(assert (=> b!10467 d!1127))

(declare-fun d!1129 () Bool)

(declare-fun res!8950 () Bool)

(declare-fun e!6108 () Bool)

(assert (=> d!1129 (=> res!8950 e!6108)))

(assert (=> d!1129 (= res!8950 (is-Nil!310 (toList!167 lm!227)))))

(assert (=> d!1129 (= (forall!35 (toList!167 lm!227) p!216) e!6108)))

(declare-fun b!10526 () Bool)

(declare-fun e!6109 () Bool)

