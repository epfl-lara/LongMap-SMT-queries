; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1402 () Bool)

(assert start!1402)

(declare-fun b_free!431 () Bool)

(declare-fun b_next!431 () Bool)

(assert (=> start!1402 (= b_free!431 (not b_next!431))))

(declare-fun tp!1760 () Bool)

(declare-fun b_and!661 () Bool)

(assert (=> start!1402 (= tp!1760 b_and!661)))

(declare-fun res!9232 () Bool)

(declare-fun e!6438 () Bool)

(assert (=> start!1402 (=> (not res!9232) (not e!6438))))

(declare-datatypes ((B!372 0))(
  ( (B!373 (val!281 Int)) )
))
(declare-datatypes ((tuple2!362 0))(
  ( (tuple2!363 (_1!181 (_ BitVec 64)) (_2!181 B!372)) )
))
(declare-datatypes ((List!333 0))(
  ( (Nil!330) (Cons!329 (h!895 tuple2!362) (t!2552 List!333)) )
))
(declare-datatypes ((ListLongMap!343 0))(
  ( (ListLongMap!344 (toList!187 List!333)) )
))
(declare-fun lm!227 () ListLongMap!343)

(declare-fun p!216 () Int)

(declare-fun forall!52 (List!333 Int) Bool)

(assert (=> start!1402 (= res!9232 (forall!52 (toList!187 lm!227) p!216))))

(assert (=> start!1402 e!6438))

(declare-fun e!6440 () Bool)

(declare-fun inv!536 (ListLongMap!343) Bool)

(assert (=> start!1402 (and (inv!536 lm!227) e!6440)))

(assert (=> start!1402 tp!1760))

(declare-fun e!6439 () Bool)

(assert (=> start!1402 e!6439))

(declare-fun b!10985 () Bool)

(declare-fun res!9231 () Bool)

(assert (=> b!10985 (=> (not res!9231) (not e!6438))))

(declare-fun kvs!4 () List!333)

(assert (=> b!10985 (= res!9231 (forall!52 kvs!4 p!216))))

(declare-fun b!10988 () Bool)

(declare-fun tp_is_empty!545 () Bool)

(declare-fun tp!1758 () Bool)

(assert (=> b!10988 (= e!6439 (and tp_is_empty!545 tp!1758))))

(declare-fun b!10987 () Bool)

(declare-fun tp!1759 () Bool)

(assert (=> b!10987 (= e!6440 tp!1759)))

(declare-fun b!10986 () Bool)

(declare-fun ListPrimitiveSize!9 (List!333) Int)

(assert (=> b!10986 (= e!6438 (< (ListPrimitiveSize!9 kvs!4) 0))))

(assert (= (and start!1402 res!9232) b!10985))

(assert (= (and b!10985 res!9231) b!10986))

(assert (= start!1402 b!10987))

(assert (= (and start!1402 (is-Cons!329 kvs!4)) b!10988))

(declare-fun m!7251 () Bool)

(assert (=> start!1402 m!7251))

(declare-fun m!7253 () Bool)

(assert (=> start!1402 m!7253))

(declare-fun m!7255 () Bool)

(assert (=> b!10985 m!7255))

(declare-fun m!7257 () Bool)

(assert (=> b!10986 m!7257))

(push 1)

(assert (not b!10987))

(assert tp_is_empty!545)

(assert (not b!10985))

(assert (not b!10986))

(assert (not start!1402))

(assert (not b_next!431))

(assert b_and!661)

(assert (not b!10988))

(check-sat)

(pop 1)

(push 1)

(assert b_and!661)

(assert (not b_next!431))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!1277 () Bool)

(declare-fun res!9243 () Bool)

(declare-fun e!6453 () Bool)

(assert (=> d!1277 (=> res!9243 e!6453)))

(assert (=> d!1277 (= res!9243 (is-Nil!330 kvs!4))))

(assert (=> d!1277 (= (forall!52 kvs!4 p!216) e!6453)))

(declare-fun b!11003 () Bool)

(declare-fun e!6454 () Bool)

(assert (=> b!11003 (= e!6453 e!6454)))

(declare-fun res!9244 () Bool)

(assert (=> b!11003 (=> (not res!9244) (not e!6454))))

(declare-fun dynLambda!62 (Int tuple2!362) Bool)

(assert (=> b!11003 (= res!9244 (dynLambda!62 p!216 (h!895 kvs!4)))))

(declare-fun b!11004 () Bool)

(assert (=> b!11004 (= e!6454 (forall!52 (t!2552 kvs!4) p!216))))

(assert (= (and d!1277 (not res!9243)) b!11003))

(assert (= (and b!11003 res!9244) b!11004))

(declare-fun b_lambda!505 () Bool)

(assert (=> (not b_lambda!505) (not b!11003)))

(declare-fun t!2556 () Bool)

(declare-fun tb!221 () Bool)

(assert (=> (and start!1402 (= p!216 p!216) t!2556) tb!221))

(declare-fun result!371 () Bool)

(assert (=> tb!221 (= result!371 true)))

(assert (=> b!11003 t!2556))

(declare-fun b_and!665 () Bool)

(assert (= b_and!661 (and (=> t!2556 result!371) b_and!665)))

(declare-fun m!7263 () Bool)

(assert (=> b!11003 m!7263))

(declare-fun m!7265 () Bool)

(assert (=> b!11004 m!7265))

(assert (=> b!10985 d!1277))

(declare-fun d!1283 () Bool)

(declare-fun lt!2760 () Int)

(assert (=> d!1283 (>= lt!2760 0)))

(declare-fun e!6465 () Int)

(assert (=> d!1283 (= lt!2760 e!6465)))

(declare-fun c!953 () Bool)

(assert (=> d!1283 (= c!953 (is-Nil!330 kvs!4))))

(assert (=> d!1283 (= (ListPrimitiveSize!9 kvs!4) lt!2760)))

(declare-fun b!11021 () Bool)

(assert (=> b!11021 (= e!6465 0)))

(declare-fun b!11022 () Bool)

(assert (=> b!11022 (= e!6465 (+ 1 (ListPrimitiveSize!9 (t!2552 kvs!4))))))

(assert (= (and d!1283 c!953) b!11021))

(assert (= (and d!1283 (not c!953)) b!11022))

(declare-fun m!7271 () Bool)

(assert (=> b!11022 m!7271))

(assert (=> b!10986 d!1283))

(declare-fun d!1289 () Bool)

(declare-fun res!9253 () Bool)

(declare-fun e!6470 () Bool)

(assert (=> d!1289 (=> res!9253 e!6470)))

(assert (=> d!1289 (= res!9253 (is-Nil!330 (toList!187 lm!227)))))

(assert (=> d!1289 (= (forall!52 (toList!187 lm!227) p!216) e!6470)))

(declare-fun b!11027 () Bool)

(declare-fun e!6471 () Bool)

(assert (=> b!11027 (= e!6470 e!6471)))

(declare-fun res!9254 () Bool)

(assert (=> b!11027 (=> (not res!9254) (not e!6471))))

(assert (=> b!11027 (= res!9254 (dynLambda!62 p!216 (h!895 (toList!187 lm!227))))))

(declare-fun b!11028 () Bool)

(assert (=> b!11028 (= e!6471 (forall!52 (t!2552 (toList!187 lm!227)) p!216))))

(assert (= (and d!1289 (not res!9253)) b!11027))

(assert (= (and b!11027 res!9254) b!11028))

(declare-fun b_lambda!511 () Bool)

(assert (=> (not b_lambda!511) (not b!11027)))

(declare-fun t!2562 () Bool)

(declare-fun tb!227 () Bool)

(assert (=> (and start!1402 (= p!216 p!216) t!2562) tb!227))

(declare-fun result!377 () Bool)

(assert (=> tb!227 (= result!377 true)))

(assert (=> b!11027 t!2562))

(declare-fun b_and!671 () Bool)

(assert (= b_and!665 (and (=> t!2562 result!377) b_and!671)))

(declare-fun m!7281 () Bool)

(assert (=> b!11027 m!7281))

(declare-fun m!7283 () Bool)

(assert (=> b!11028 m!7283))

(assert (=> start!1402 d!1289))

(declare-fun d!1295 () Bool)

(declare-fun isStrictlySorted!36 (List!333) Bool)

(assert (=> d!1295 (= (inv!536 lm!227) (isStrictlySorted!36 (toList!187 lm!227)))))

