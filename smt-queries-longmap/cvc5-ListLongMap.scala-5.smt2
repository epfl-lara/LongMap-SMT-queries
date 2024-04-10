; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!160 () Bool)

(assert start!160)

(declare-fun b_free!25 () Bool)

(declare-fun b_next!25 () Bool)

(assert (=> start!160 (= b_free!25 (not b_next!25))))

(declare-fun tp!80 () Bool)

(declare-fun b_and!49 () Bool)

(assert (=> start!160 (= tp!80 b_and!49)))

(declare-fun res!4394 () Bool)

(declare-fun e!339 () Bool)

(assert (=> start!160 (=> (not res!4394) (not e!339))))

(declare-datatypes ((B!260 0))(
  ( (B!261 (val!12 Int)) )
))
(declare-datatypes ((tuple2!24 0))(
  ( (tuple2!25 (_1!12 (_ BitVec 64)) (_2!12 B!260)) )
))
(declare-datatypes ((List!21 0))(
  ( (Nil!18) (Cons!17 (h!583 tuple2!24) (t!2040 List!21)) )
))
(declare-datatypes ((ListLongMap!29 0))(
  ( (ListLongMap!30 (toList!30 List!21)) )
))
(declare-fun lm!258 () ListLongMap!29)

(declare-fun p!318 () Int)

(declare-fun forall!14 (List!21 Int) Bool)

(assert (=> start!160 (= res!4394 (forall!14 (toList!30 lm!258) p!318))))

(assert (=> start!160 e!339))

(declare-fun e!338 () Bool)

(declare-fun inv!47 (ListLongMap!29) Bool)

(assert (=> start!160 (and (inv!47 lm!258) e!338)))

(assert (=> start!160 tp!80))

(declare-fun b!1811 () Bool)

(declare-fun size!63 (List!21) Int)

(assert (=> b!1811 (= e!339 (< (size!63 (toList!30 lm!258)) 0))))

(declare-fun b!1812 () Bool)

(declare-fun tp!79 () Bool)

(assert (=> b!1812 (= e!338 tp!79)))

(assert (= (and start!160 res!4394) b!1811))

(assert (= start!160 b!1812))

(declare-fun m!489 () Bool)

(assert (=> start!160 m!489))

(declare-fun m!491 () Bool)

(assert (=> start!160 m!491))

(declare-fun m!493 () Bool)

(assert (=> b!1811 m!493))

(push 1)

(assert (not start!160))

(assert (not b!1811))

(assert b_and!49)

(assert (not b!1812))

(assert (not b_next!25))

(check-sat)

(pop 1)

(push 1)

(assert b_and!49)

(assert (not b_next!25))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!163 () Bool)

(declare-fun res!4413 () Bool)

(declare-fun e!364 () Bool)

(assert (=> d!163 (=> res!4413 e!364)))

(assert (=> d!163 (= res!4413 (is-Nil!18 (toList!30 lm!258)))))

(assert (=> d!163 (= (forall!14 (toList!30 lm!258) p!318) e!364)))

(declare-fun b!1839 () Bool)

(declare-fun e!368 () Bool)

(assert (=> b!1839 (= e!364 e!368)))

(declare-fun res!4417 () Bool)

(assert (=> b!1839 (=> (not res!4417) (not e!368))))

(declare-fun dynLambda!6 (Int tuple2!24) Bool)

(assert (=> b!1839 (= res!4417 (dynLambda!6 p!318 (h!583 (toList!30 lm!258))))))

(declare-fun b!1841 () Bool)

(assert (=> b!1841 (= e!368 (forall!14 (t!2040 (toList!30 lm!258)) p!318))))

(assert (= (and d!163 (not res!4413)) b!1839))

(assert (= (and b!1839 res!4417) b!1841))

(declare-fun b_lambda!50 () Bool)

(assert (=> (not b_lambda!50) (not b!1839)))

(declare-fun t!2046 () Bool)

(declare-fun tb!21 () Bool)

(assert (=> (and start!160 (= p!318 p!318) t!2046) tb!21))

(declare-fun result!33 () Bool)

(assert (=> tb!21 (= result!33 true)))

(assert (=> b!1839 t!2046))

(declare-fun b_and!57 () Bool)

(assert (= b_and!49 (and (=> t!2046 result!33) b_and!57)))

(declare-fun m!509 () Bool)

(assert (=> b!1839 m!509))

(declare-fun m!515 () Bool)

(assert (=> b!1841 m!515))

(assert (=> start!160 d!163))

(declare-fun d!170 () Bool)

(declare-fun isStrictlySorted!4 (List!21) Bool)

(assert (=> d!170 (= (inv!47 lm!258) (isStrictlySorted!4 (toList!30 lm!258)))))

(declare-fun bs!45 () Bool)

(assert (= bs!45 d!170))

(declare-fun m!521 () Bool)

(assert (=> bs!45 m!521))

(assert (=> start!160 d!170))

(declare-fun d!176 () Bool)

(declare-fun lt!312 () Int)

(assert (=> d!176 (>= lt!312 0)))

(declare-fun e!376 () Int)

(assert (=> d!176 (= lt!312 e!376)))

(declare-fun c!93 () Bool)

(assert (=> d!176 (= c!93 (is-Nil!18 (toList!30 lm!258)))))

(assert (=> d!176 (= (size!63 (toList!30 lm!258)) lt!312)))

(declare-fun b!1855 () Bool)

(assert (=> b!1855 (= e!376 0)))

(declare-fun b!1856 () Bool)

(assert (=> b!1856 (= e!376 (+ 1 (size!63 (t!2040 (toList!30 lm!258)))))))

(assert (= (and d!176 c!93) b!1855))

(assert (= (and d!176 (not c!93)) b!1856))

(declare-fun m!525 () Bool)

(assert (=> b!1856 m!525))

(assert (=> b!1811 d!176))

(declare-fun b!1873 () Bool)

(declare-fun e!385 () Bool)

(declare-fun tp_is_empty!13 () Bool)

(declare-fun tp!99 () Bool)

(assert (=> b!1873 (= e!385 (and tp_is_empty!13 tp!99))))

(assert (=> b!1812 (= tp!79 e!385)))

(assert (= (and b!1812 (is-Cons!17 (toList!30 lm!258))) b!1873))

(declare-fun b_lambda!55 () Bool)

(assert (= b_lambda!50 (or (and start!160 b_free!25) b_lambda!55)))

(push 1)

