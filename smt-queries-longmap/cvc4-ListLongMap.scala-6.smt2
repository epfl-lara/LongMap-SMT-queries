; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!188 () Bool)

(assert start!188)

(declare-fun b_free!35 () Bool)

(declare-fun b_next!35 () Bool)

(assert (=> start!188 (= b_free!35 (not b_next!35))))

(declare-fun tp!119 () Bool)

(declare-fun b_and!65 () Bool)

(assert (=> start!188 (= tp!119 b_and!65)))

(declare-fun res!4445 () Bool)

(declare-fun e!405 () Bool)

(assert (=> start!188 (=> (not res!4445) (not e!405))))

(declare-datatypes ((B!270 0))(
  ( (B!271 (val!17 Int)) )
))
(declare-datatypes ((tuple2!34 0))(
  ( (tuple2!35 (_1!17 (_ BitVec 64)) (_2!17 B!270)) )
))
(declare-datatypes ((List!26 0))(
  ( (Nil!23) (Cons!22 (h!588 tuple2!34) (t!2051 List!26)) )
))
(declare-datatypes ((ListLongMap!39 0))(
  ( (ListLongMap!40 (toList!35 List!26)) )
))
(declare-fun lm!258 () ListLongMap!39)

(declare-fun p!318 () Int)

(declare-fun forall!19 (List!26 Int) Bool)

(assert (=> start!188 (= res!4445 (forall!19 (toList!35 lm!258) p!318))))

(assert (=> start!188 e!405))

(declare-fun e!404 () Bool)

(declare-fun inv!57 (ListLongMap!39) Bool)

(assert (=> start!188 (and (inv!57 lm!258) e!404)))

(assert (=> start!188 tp!119))

(assert (=> start!188 true))

(declare-fun b!1909 () Bool)

(declare-fun res!4444 () Bool)

(assert (=> b!1909 (=> (not res!4444) (not e!405))))

(declare-fun k!394 () (_ BitVec 64))

(declare-fun head!748 (List!26) tuple2!34)

(assert (=> b!1909 (= res!4444 (not (= (_1!17 (head!748 (toList!35 lm!258))) k!394)))))

(declare-fun b!1908 () Bool)

(declare-fun res!4443 () Bool)

(assert (=> b!1908 (=> (not res!4443) (not e!405))))

(declare-fun isEmpty!21 (ListLongMap!39) Bool)

(assert (=> b!1908 (= res!4443 (not (isEmpty!21 lm!258)))))

(declare-fun b!1910 () Bool)

(declare-fun tail!34 (ListLongMap!39) ListLongMap!39)

(assert (=> b!1910 (= e!405 (not (forall!19 (toList!35 (tail!34 lm!258)) p!318)))))

(declare-fun b!1911 () Bool)

(declare-fun tp!118 () Bool)

(assert (=> b!1911 (= e!404 tp!118)))

(assert (= (and start!188 res!4445) b!1908))

(assert (= (and b!1908 res!4443) b!1909))

(assert (= (and b!1909 res!4444) b!1910))

(assert (= start!188 b!1911))

(declare-fun m!555 () Bool)

(assert (=> start!188 m!555))

(declare-fun m!557 () Bool)

(assert (=> start!188 m!557))

(declare-fun m!559 () Bool)

(assert (=> b!1909 m!559))

(declare-fun m!561 () Bool)

(assert (=> b!1908 m!561))

(declare-fun m!563 () Bool)

(assert (=> b!1910 m!563))

(declare-fun m!565 () Bool)

(assert (=> b!1910 m!565))

(push 1)

(assert (not b!1910))

(assert (not b!1909))

(assert (not start!188))

(assert (not b!1908))

(assert (not b!1911))

(assert (not b_next!35))

(assert b_and!65)

(check-sat)

(pop 1)

(push 1)

(assert b_and!65)

(assert (not b_next!35))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!183 () Bool)

(declare-fun res!4456 () Bool)

(declare-fun e!416 () Bool)

(assert (=> d!183 (=> res!4456 e!416)))

(assert (=> d!183 (= res!4456 (is-Nil!23 (toList!35 lm!258)))))

(assert (=> d!183 (= (forall!19 (toList!35 lm!258) p!318) e!416)))

(declare-fun b!1922 () Bool)

(declare-fun e!417 () Bool)

(assert (=> b!1922 (= e!416 e!417)))

(declare-fun res!4457 () Bool)

(assert (=> b!1922 (=> (not res!4457) (not e!417))))

(declare-fun dynLambda!11 (Int tuple2!34) Bool)

(assert (=> b!1922 (= res!4457 (dynLambda!11 p!318 (h!588 (toList!35 lm!258))))))

(declare-fun b!1923 () Bool)

(assert (=> b!1923 (= e!417 (forall!19 (t!2051 (toList!35 lm!258)) p!318))))

(assert (= (and d!183 (not res!4456)) b!1922))

(assert (= (and b!1922 res!4457) b!1923))

(declare-fun b_lambda!63 () Bool)

(assert (=> (not b_lambda!63) (not b!1922)))

(declare-fun t!2055 () Bool)

(declare-fun tb!27 () Bool)

(assert (=> (and start!188 (= p!318 p!318) t!2055) tb!27))

(declare-fun result!45 () Bool)

(assert (=> tb!27 (= result!45 true)))

(assert (=> b!1922 t!2055))

(declare-fun b_and!69 () Bool)

(assert (= b_and!65 (and (=> t!2055 result!45) b_and!69)))

(declare-fun m!573 () Bool)

(assert (=> b!1922 m!573))

(declare-fun m!575 () Bool)

(assert (=> b!1923 m!575))

(assert (=> start!188 d!183))

(declare-fun d!193 () Bool)

(declare-fun isStrictlySorted!8 (List!26) Bool)

(assert (=> d!193 (= (inv!57 lm!258) (isStrictlySorted!8 (toList!35 lm!258)))))

(declare-fun bs!53 () Bool)

(assert (= bs!53 d!193))

(declare-fun m!587 () Bool)

(assert (=> bs!53 m!587))

(assert (=> start!188 d!193))

(declare-fun d!201 () Bool)

(declare-fun res!4466 () Bool)

(declare-fun e!426 () Bool)

(assert (=> d!201 (=> res!4466 e!426)))

(assert (=> d!201 (= res!4466 (is-Nil!23 (toList!35 (tail!34 lm!258))))))

(assert (=> d!201 (= (forall!19 (toList!35 (tail!34 lm!258)) p!318) e!426)))

(declare-fun b!1932 () Bool)

(declare-fun e!427 () Bool)

(assert (=> b!1932 (= e!426 e!427)))

(declare-fun res!4467 () Bool)

(assert (=> b!1932 (=> (not res!4467) (not e!427))))

(assert (=> b!1932 (= res!4467 (dynLambda!11 p!318 (h!588 (toList!35 (tail!34 lm!258)))))))

(declare-fun b!1933 () Bool)

(assert (=> b!1933 (= e!427 (forall!19 (t!2051 (toList!35 (tail!34 lm!258))) p!318))))

(assert (= (and d!201 (not res!4466)) b!1932))

(assert (= (and b!1932 res!4467) b!1933))

(declare-fun b_lambda!69 () Bool)

(assert (=> (not b_lambda!69) (not b!1932)))

(declare-fun t!2061 () Bool)

(declare-fun tb!33 () Bool)

(assert (=> (and start!188 (= p!318 p!318) t!2061) tb!33))

(declare-fun result!51 () Bool)

(assert (=> tb!33 (= result!51 true)))

(assert (=> b!1932 t!2061))

(declare-fun b_and!75 () Bool)

(assert (= b_and!69 (and (=> t!2061 result!51) b_and!75)))

(declare-fun m!593 () Bool)

(assert (=> b!1932 m!593))

(declare-fun m!595 () Bool)

(assert (=> b!1933 m!595))

(assert (=> b!1910 d!201))

(declare-fun d!209 () Bool)

(declare-fun tail!37 (List!26) List!26)

(assert (=> d!209 (= (tail!34 lm!258) (ListLongMap!40 (tail!37 (toList!35 lm!258))))))

(declare-fun bs!57 () Bool)

(assert (= bs!57 d!209))

(declare-fun m!603 () Bool)

(assert (=> bs!57 m!603))

(assert (=> b!1910 d!209))

(declare-fun d!213 () Bool)

(assert (=> d!213 (= (head!748 (toList!35 lm!258)) (h!588 (toList!35 lm!258)))))

(assert (=> b!1909 d!213))

(declare-fun d!217 () Bool)

(declare-fun isEmpty!24 (List!26) Bool)

(assert (=> d!217 (= (isEmpty!21 lm!258) (isEmpty!24 (toList!35 lm!258)))))

(declare-fun bs!59 () Bool)

(assert (= bs!59 d!217))

(declare-fun m!607 () Bool)

(assert (=> bs!59 m!607))

(assert (=> b!1908 d!217))

(declare-fun b!1950 () Bool)

(declare-fun e!438 () Bool)

(declare-fun tp_is_empty!23 () Bool)

(declare-fun tp!128 () Bool)

(assert (=> b!1950 (= e!438 (and tp_is_empty!23 tp!128))))

(assert (=> b!1911 (= tp!118 e!438)))

(assert (= (and b!1911 (is-Cons!22 (toList!35 lm!258))) b!1950))

(declare-fun b_lambda!81 () Bool)

(assert (= b_lambda!69 (or (and start!188 b_free!35) b_lambda!81)))

(declare-fun b_lambda!83 () Bool)

(assert (= b_lambda!63 (or (and start!188 b_free!35) b_lambda!83)))

(push 1)

(assert (not d!209))

(assert (not b_lambda!81))

(assert (not b!1923))

(assert (not b_lambda!83))

(assert b_and!75)

(assert (not b!1933))

(assert (not d!193))

(assert (not b_next!35))

(assert (not b!1950))

(assert (not d!217))

(assert tp_is_empty!23)

(check-sat)

(pop 1)

(push 1)

(assert b_and!75)

(assert (not b_next!35))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!239 () Bool)

(assert (=> d!239 (= (tail!37 (toList!35 lm!258)) (t!2051 (toList!35 lm!258)))))

