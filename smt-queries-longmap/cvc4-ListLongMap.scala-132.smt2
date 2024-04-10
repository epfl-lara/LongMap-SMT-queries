; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2344 () Bool)

(assert start!2344)

(declare-fun b_free!473 () Bool)

(declare-fun b_next!473 () Bool)

(assert (=> start!2344 (= b_free!473 (not b_next!473))))

(declare-fun tp!2482 () Bool)

(declare-fun b_and!883 () Bool)

(assert (=> start!2344 (= tp!2482 b_and!883)))

(declare-fun res!11568 () Bool)

(declare-fun e!9220 () Bool)

(assert (=> start!2344 (=> (not res!11568) (not e!9220))))

(declare-datatypes ((B!594 0))(
  ( (B!595 (val!395 Int)) )
))
(declare-datatypes ((tuple2!590 0))(
  ( (tuple2!591 (_1!295 (_ BitVec 64)) (_2!295 B!594)) )
))
(declare-datatypes ((List!455 0))(
  ( (Nil!452) (Cons!451 (h!1017 tuple2!590) (t!2857 List!455)) )
))
(declare-datatypes ((ListLongMap!421 0))(
  ( (ListLongMap!422 (toList!226 List!455)) )
))
(declare-fun lm!238 () ListLongMap!421)

(declare-fun p!262 () Int)

(declare-fun forall!106 (List!455 Int) Bool)

(assert (=> start!2344 (= res!11568 (forall!106 (toList!226 lm!238) p!262))))

(assert (=> start!2344 e!9220))

(declare-fun e!9221 () Bool)

(declare-fun inv!762 (ListLongMap!421) Bool)

(assert (=> start!2344 (and (inv!762 lm!238) e!9221)))

(assert (=> start!2344 tp!2482))

(assert (=> start!2344 true))

(declare-fun b!15234 () Bool)

(declare-fun res!11569 () Bool)

(assert (=> b!15234 (=> (not res!11569) (not e!9220))))

(declare-datatypes ((List!456 0))(
  ( (Nil!453) (Cons!452 (h!1018 (_ BitVec 64)) (t!2858 List!456)) )
))
(declare-fun l!1612 () List!456)

(declare-fun isEmpty!119 (List!456) Bool)

(assert (=> b!15234 (= res!11569 (not (isEmpty!119 l!1612)))))

(declare-fun b!15235 () Bool)

(assert (=> b!15235 (= e!9220 (= l!1612 Nil!453))))

(declare-fun b!15236 () Bool)

(declare-fun tp!2483 () Bool)

(assert (=> b!15236 (= e!9221 tp!2483)))

(assert (= (and start!2344 res!11568) b!15234))

(assert (= (and b!15234 res!11569) b!15235))

(assert (= start!2344 b!15236))

(declare-fun m!10139 () Bool)

(assert (=> start!2344 m!10139))

(declare-fun m!10141 () Bool)

(assert (=> start!2344 m!10141))

(declare-fun m!10143 () Bool)

(assert (=> b!15234 m!10143))

(push 1)

(assert b_and!883)

(assert (not start!2344))

(assert (not b_next!473))

(assert (not b!15234))

(assert (not b!15236))

(check-sat)

(pop 1)

(push 1)

(assert b_and!883)

(assert (not b_next!473))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!2555 () Bool)

(declare-fun res!11586 () Bool)

(declare-fun e!9238 () Bool)

(assert (=> d!2555 (=> res!11586 e!9238)))

(assert (=> d!2555 (= res!11586 (is-Nil!452 (toList!226 lm!238)))))

(assert (=> d!2555 (= (forall!106 (toList!226 lm!238) p!262) e!9238)))

(declare-fun b!15253 () Bool)

(declare-fun e!9239 () Bool)

(assert (=> b!15253 (= e!9238 e!9239)))

(declare-fun res!11587 () Bool)

(assert (=> b!15253 (=> (not res!11587) (not e!9239))))

(declare-fun dynLambda!98 (Int tuple2!590) Bool)

(assert (=> b!15253 (= res!11587 (dynLambda!98 p!262 (h!1017 (toList!226 lm!238))))))

(declare-fun b!15254 () Bool)

(assert (=> b!15254 (= e!9239 (forall!106 (t!2857 (toList!226 lm!238)) p!262))))

(assert (= (and d!2555 (not res!11586)) b!15253))

(assert (= (and b!15253 res!11587) b!15254))

(declare-fun b_lambda!975 () Bool)

(assert (=> (not b_lambda!975) (not b!15253)))

(declare-fun t!2864 () Bool)

(declare-fun tb!397 () Bool)

(assert (=> (and start!2344 (= p!262 p!262) t!2864) tb!397))

(declare-fun result!703 () Bool)

(assert (=> tb!397 (= result!703 true)))

(assert (=> b!15253 t!2864))

(declare-fun b_and!889 () Bool)

(assert (= b_and!883 (and (=> t!2864 result!703) b_and!889)))

(declare-fun m!10153 () Bool)

(assert (=> b!15253 m!10153))

(declare-fun m!10155 () Bool)

(assert (=> b!15254 m!10155))

(assert (=> start!2344 d!2555))

(declare-fun d!2561 () Bool)

(declare-fun isStrictlySorted!137 (List!455) Bool)

(assert (=> d!2561 (= (inv!762 lm!238) (isStrictlySorted!137 (toList!226 lm!238)))))

(declare-fun bs!644 () Bool)

