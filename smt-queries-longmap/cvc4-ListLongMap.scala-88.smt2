; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1258 () Bool)

(assert start!1258)

(declare-fun b_free!395 () Bool)

(declare-fun b_next!395 () Bool)

(assert (=> start!1258 (= b_free!395 (not b_next!395))))

(declare-fun tp!1549 () Bool)

(declare-fun b_and!553 () Bool)

(assert (=> start!1258 (= tp!1549 b_and!553)))

(declare-fun b!10495 () Bool)

(declare-fun e!6081 () Bool)

(declare-fun tp!1550 () Bool)

(assert (=> b!10495 (= e!6081 tp!1550)))

(declare-fun b!10496 () Bool)

(declare-fun e!6082 () Bool)

(declare-fun tp_is_empty!509 () Bool)

(declare-fun tp!1548 () Bool)

(assert (=> b!10496 (= e!6082 (and tp_is_empty!509 tp!1548))))

(declare-fun b!10497 () Bool)

(declare-fun res!8929 () Bool)

(declare-fun e!6083 () Bool)

(assert (=> b!10497 (=> (not res!8929) (not e!6083))))

(declare-datatypes ((B!336 0))(
  ( (B!337 (val!263 Int)) )
))
(declare-datatypes ((tuple2!326 0))(
  ( (tuple2!327 (_1!163 (_ BitVec 64)) (_2!163 B!336)) )
))
(declare-datatypes ((List!315 0))(
  ( (Nil!312) (Cons!311 (h!877 tuple2!326) (t!2462 List!315)) )
))
(declare-fun kvs!4 () List!315)

(declare-fun p!216 () Int)

(declare-fun forall!37 (List!315 Int) Bool)

(assert (=> b!10497 (= res!8929 (forall!37 kvs!4 p!216))))

(declare-fun res!8928 () Bool)

(assert (=> start!1258 (=> (not res!8928) (not e!6083))))

(declare-datatypes ((ListLongMap!307 0))(
  ( (ListLongMap!308 (toList!169 List!315)) )
))
(declare-fun lm!227 () ListLongMap!307)

(assert (=> start!1258 (= res!8928 (forall!37 (toList!169 lm!227) p!216))))

(assert (=> start!1258 e!6083))

(declare-fun inv!488 (ListLongMap!307) Bool)

(assert (=> start!1258 (and (inv!488 lm!227) e!6081)))

(assert (=> start!1258 tp!1549))

(assert (=> start!1258 e!6082))

(declare-fun b!10498 () Bool)

(declare-fun res!8927 () Bool)

(assert (=> b!10498 (=> (not res!8927) (not e!6083))))

(declare-fun isEmpty!47 (List!315) Bool)

(assert (=> b!10498 (= res!8927 (not (isEmpty!47 kvs!4)))))

(declare-fun b!10499 () Bool)

(assert (=> b!10499 (= e!6083 (= kvs!4 Nil!312))))

(assert (= (and start!1258 res!8928) b!10497))

(assert (= (and b!10497 res!8929) b!10498))

(assert (= (and b!10498 res!8927) b!10499))

(assert (= start!1258 b!10495))

(assert (= (and start!1258 (is-Cons!311 kvs!4)) b!10496))

(declare-fun m!6759 () Bool)

(assert (=> b!10497 m!6759))

(declare-fun m!6761 () Bool)

(assert (=> start!1258 m!6761))

(declare-fun m!6763 () Bool)

(assert (=> start!1258 m!6763))

(declare-fun m!6765 () Bool)

(assert (=> b!10498 m!6765))

(push 1)

(assert tp_is_empty!509)

(assert (not b!10496))

(assert (not start!1258))

(assert b_and!553)

(assert (not b!10495))

(assert (not b!10498))

(assert (not b!10497))

(assert (not b_next!395))

(check-sat)

(pop 1)

(push 1)

(assert b_and!553)

(assert (not b_next!395))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!1117 () Bool)

(declare-fun res!8944 () Bool)

(declare-fun e!6098 () Bool)

(assert (=> d!1117 (=> res!8944 e!6098)))

(assert (=> d!1117 (= res!8944 (is-Nil!312 (toList!169 lm!227)))))

(assert (=> d!1117 (= (forall!37 (toList!169 lm!227) p!216) e!6098)))

(declare-fun b!10514 () Bool)

(declare-fun e!6099 () Bool)

(assert (=> b!10514 (= e!6098 e!6099)))

(declare-fun res!8945 () Bool)

(assert (=> b!10514 (=> (not res!8945) (not e!6099))))

(declare-fun dynLambda!51 (Int tuple2!326) Bool)

(assert (=> b!10514 (= res!8945 (dynLambda!51 p!216 (h!877 (toList!169 lm!227))))))

(declare-fun b!10515 () Bool)

(assert (=> b!10515 (= e!6099 (forall!37 (t!2462 (toList!169 lm!227)) p!216))))

(assert (= (and d!1117 (not res!8944)) b!10514))

(assert (= (and b!10514 res!8945) b!10515))

(declare-fun b_lambda!361 () Bool)

(assert (=> (not b_lambda!361) (not b!10514)))

(declare-fun t!2466 () Bool)

(declare-fun tb!149 () Bool)

(assert (=> (and start!1258 (= p!216 p!216) t!2466) tb!149))

(declare-fun result!275 () Bool)

(assert (=> tb!149 (= result!275 true)))

(assert (=> b!10514 t!2466))

(declare-fun b_and!557 () Bool)

(assert (= b_and!553 (and (=> t!2466 result!275) b_and!557)))

(declare-fun m!6773 () Bool)

(assert (=> b!10514 m!6773))

(declare-fun m!6775 () Bool)

(assert (=> b!10515 m!6775))

(assert (=> start!1258 d!1117))

(declare-fun d!1125 () Bool)

(declare-fun isStrictlySorted!26 (List!315) Bool)

(assert (=> d!1125 (= (inv!488 lm!227) (isStrictlySorted!26 (toList!169 lm!227)))))

