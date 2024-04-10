; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1282 () Bool)

(assert start!1282)

(declare-fun b_free!401 () Bool)

(declare-fun b_next!401 () Bool)

(assert (=> start!1282 (= b_free!401 (not b_next!401))))

(declare-fun tp!1589 () Bool)

(declare-fun b_and!571 () Bool)

(assert (=> start!1282 (= tp!1589 b_and!571)))

(declare-fun b!10582 () Bool)

(declare-fun e!6144 () Bool)

(declare-datatypes ((B!342 0))(
  ( (B!343 (val!266 Int)) )
))
(declare-datatypes ((tuple2!332 0))(
  ( (tuple2!333 (_1!166 (_ BitVec 64)) (_2!166 B!342)) )
))
(declare-datatypes ((List!318 0))(
  ( (Nil!315) (Cons!314 (h!880 tuple2!332) (t!2477 List!318)) )
))
(declare-fun kvs!4 () List!318)

(assert (=> b!10582 (= e!6144 (= kvs!4 Nil!315))))

(declare-fun b!10583 () Bool)

(declare-fun e!6146 () Bool)

(declare-fun tp_is_empty!515 () Bool)

(declare-fun tp!1587 () Bool)

(assert (=> b!10583 (= e!6146 (and tp_is_empty!515 tp!1587))))

(declare-fun b!10584 () Bool)

(declare-fun res!8978 () Bool)

(assert (=> b!10584 (=> (not res!8978) (not e!6144))))

(declare-fun p!216 () Int)

(declare-fun forall!40 (List!318 Int) Bool)

(assert (=> b!10584 (= res!8978 (forall!40 kvs!4 p!216))))

(declare-fun res!8979 () Bool)

(assert (=> start!1282 (=> (not res!8979) (not e!6144))))

(declare-datatypes ((ListLongMap!313 0))(
  ( (ListLongMap!314 (toList!172 List!318)) )
))
(declare-fun lm!227 () ListLongMap!313)

(assert (=> start!1282 (= res!8979 (forall!40 (toList!172 lm!227) p!216))))

(assert (=> start!1282 e!6144))

(declare-fun e!6145 () Bool)

(declare-fun inv!496 (ListLongMap!313) Bool)

(assert (=> start!1282 (and (inv!496 lm!227) e!6145)))

(assert (=> start!1282 tp!1589))

(assert (=> start!1282 e!6146))

(declare-fun b!10585 () Bool)

(declare-fun tp!1588 () Bool)

(assert (=> b!10585 (= e!6145 tp!1588)))

(declare-fun b!10586 () Bool)

(declare-fun res!8980 () Bool)

(assert (=> b!10586 (=> (not res!8980) (not e!6144))))

(declare-fun isEmpty!50 (List!318) Bool)

(assert (=> b!10586 (= res!8980 (not (isEmpty!50 kvs!4)))))

(assert (= (and start!1282 res!8979) b!10584))

(assert (= (and b!10584 res!8978) b!10586))

(assert (= (and b!10586 res!8980) b!10582))

(assert (= start!1282 b!10585))

(assert (= (and start!1282 (is-Cons!314 kvs!4)) b!10583))

(declare-fun m!6813 () Bool)

(assert (=> b!10584 m!6813))

(declare-fun m!6815 () Bool)

(assert (=> start!1282 m!6815))

(declare-fun m!6817 () Bool)

(assert (=> start!1282 m!6817))

(declare-fun m!6819 () Bool)

(assert (=> b!10586 m!6819))

(push 1)

(assert (not start!1282))

(assert (not b!10583))

(assert (not b!10585))

(assert (not b!10584))

(assert (not b!10586))

(assert tp_is_empty!515)

(assert (not b_next!401))

(assert b_and!571)

(check-sat)

(pop 1)

(push 1)

(assert b_and!571)

(assert (not b_next!401))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!1141 () Bool)

(assert (=> d!1141 (= (isEmpty!50 kvs!4) (is-Nil!315 kvs!4))))

(assert (=> b!10586 d!1141))

(declare-fun d!1145 () Bool)

(declare-fun res!8999 () Bool)

(declare-fun e!6165 () Bool)

(assert (=> d!1145 (=> res!8999 e!6165)))

(assert (=> d!1145 (= res!8999 (is-Nil!315 kvs!4))))

(assert (=> d!1145 (= (forall!40 kvs!4 p!216) e!6165)))

(declare-fun b!10605 () Bool)

(declare-fun e!6166 () Bool)

(assert (=> b!10605 (= e!6165 e!6166)))

(declare-fun res!9000 () Bool)

(assert (=> b!10605 (=> (not res!9000) (not e!6166))))

(declare-fun dynLambda!54 (Int tuple2!332) Bool)

(assert (=> b!10605 (= res!9000 (dynLambda!54 p!216 (h!880 kvs!4)))))

(declare-fun b!10606 () Bool)

(assert (=> b!10606 (= e!6166 (forall!40 (t!2477 kvs!4) p!216))))

(assert (= (and d!1145 (not res!8999)) b!10605))

(assert (= (and b!10605 res!9000) b!10606))

(declare-fun b_lambda!389 () Bool)

(assert (=> (not b_lambda!389) (not b!10605)))

(declare-fun t!2485 () Bool)

(declare-fun tb!165 () Bool)

(assert (=> (and start!1282 (= p!216 p!216) t!2485) tb!165))

(declare-fun result!298 () Bool)

(assert (=> tb!165 (= result!298 true)))

(assert (=> b!10605 t!2485))

(declare-fun b_and!579 () Bool)

(assert (= b_and!571 (and (=> t!2485 result!298) b_and!579)))

(declare-fun m!6835 () Bool)

(assert (=> b!10605 m!6835))

(declare-fun m!6837 () Bool)

(assert (=> b!10606 m!6837))

(assert (=> b!10584 d!1145))

(declare-fun d!1155 () Bool)

(declare-fun res!9001 () Bool)

(declare-fun e!6169 () Bool)

(assert (=> d!1155 (=> res!9001 e!6169)))

(assert (=> d!1155 (= res!9001 (is-Nil!315 (toList!172 lm!227)))))

(assert (=> d!1155 (= (forall!40 (toList!172 lm!227) p!216) e!6169)))

(declare-fun b!10611 () Bool)

(declare-fun e!6170 () Bool)

(assert (=> b!10611 (= e!6169 e!6170)))

(declare-fun res!9002 () Bool)

(assert (=> b!10611 (=> (not res!9002) (not e!6170))))

(assert (=> b!10611 (= res!9002 (dynLambda!54 p!216 (h!880 (toList!172 lm!227))))))

(declare-fun b!10612 () Bool)

(assert (=> b!10612 (= e!6170 (forall!40 (t!2477 (toList!172 lm!227)) p!216))))

(assert (= (and d!1155 (not res!9001)) b!10611))

(assert (= (and b!10611 res!9002) b!10612))

