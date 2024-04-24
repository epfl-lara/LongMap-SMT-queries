; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!160 () Bool)

(assert start!160)

(declare-fun b_free!25 () Bool)

(declare-fun b_next!25 () Bool)

(assert (=> start!160 (= b_free!25 (not b_next!25))))

(declare-fun tp!79 () Bool)

(declare-fun b_and!49 () Bool)

(assert (=> start!160 (= tp!79 b_and!49)))

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

(assert (=> start!160 tp!79))

(declare-fun b!1811 () Bool)

(declare-fun size!63 (List!21) Int)

(assert (=> b!1811 (= e!339 (< (size!63 (toList!30 lm!258)) 0))))

(declare-fun b!1812 () Bool)

(declare-fun tp!80 () Bool)

(assert (=> b!1812 (= e!338 tp!80)))

(assert (= (and start!160 res!4394) b!1811))

(assert (= start!160 b!1812))

(declare-fun m!489 () Bool)

(assert (=> start!160 m!489))

(declare-fun m!491 () Bool)

(assert (=> start!160 m!491))

(declare-fun m!493 () Bool)

(assert (=> b!1811 m!493))

(check-sat b_and!49 (not b!1811) (not start!160) (not b!1812) (not b_next!25))
(check-sat b_and!49 (not b_next!25))
(get-model)

(declare-fun d!163 () Bool)

(declare-fun lt!312 () Int)

(assert (=> d!163 (>= lt!312 0)))

(declare-fun e!358 () Int)

(assert (=> d!163 (= lt!312 e!358)))

(declare-fun c!93 () Bool)

(get-info :version)

(assert (=> d!163 (= c!93 ((_ is Nil!18) (toList!30 lm!258)))))

(assert (=> d!163 (= (size!63 (toList!30 lm!258)) lt!312)))

(declare-fun b!1837 () Bool)

(assert (=> b!1837 (= e!358 0)))

(declare-fun b!1838 () Bool)

(assert (=> b!1838 (= e!358 (+ 1 (size!63 (t!2040 (toList!30 lm!258)))))))

(assert (= (and d!163 c!93) b!1837))

(assert (= (and d!163 (not c!93)) b!1838))

(declare-fun m!507 () Bool)

(assert (=> b!1838 m!507))

(assert (=> b!1811 d!163))

(declare-fun d!169 () Bool)

(declare-fun res!4407 () Bool)

(declare-fun e!367 () Bool)

(assert (=> d!169 (=> res!4407 e!367)))

(assert (=> d!169 (= res!4407 ((_ is Nil!18) (toList!30 lm!258)))))

(assert (=> d!169 (= (forall!14 (toList!30 lm!258) p!318) e!367)))

(declare-fun b!1849 () Bool)

(declare-fun e!368 () Bool)

(assert (=> b!1849 (= e!367 e!368)))

(declare-fun res!4408 () Bool)

(assert (=> b!1849 (=> (not res!4408) (not e!368))))

(declare-fun dynLambda!6 (Int tuple2!24) Bool)

(assert (=> b!1849 (= res!4408 (dynLambda!6 p!318 (h!583 (toList!30 lm!258))))))

(declare-fun b!1850 () Bool)

(assert (=> b!1850 (= e!368 (forall!14 (t!2040 (toList!30 lm!258)) p!318))))

(assert (= (and d!169 (not res!4407)) b!1849))

(assert (= (and b!1849 res!4408) b!1850))

(declare-fun b_lambda!49 () Bool)

(assert (=> (not b_lambda!49) (not b!1849)))

(declare-fun t!2044 () Bool)

(declare-fun tb!19 () Bool)

(assert (=> (and start!160 (= p!318 p!318) t!2044) tb!19))

(declare-fun result!31 () Bool)

(assert (=> tb!19 (= result!31 true)))

(assert (=> b!1849 t!2044))

(declare-fun b_and!55 () Bool)

(assert (= b_and!49 (and (=> t!2044 result!31) b_and!55)))

(declare-fun m!513 () Bool)

(assert (=> b!1849 m!513))

(declare-fun m!515 () Bool)

(assert (=> b!1850 m!515))

(assert (=> start!160 d!169))

(declare-fun d!175 () Bool)

(declare-fun isStrictlySorted!4 (List!21) Bool)

(assert (=> d!175 (= (inv!47 lm!258) (isStrictlySorted!4 (toList!30 lm!258)))))

(declare-fun bs!45 () Bool)

(assert (= bs!45 d!175))

(declare-fun m!525 () Bool)

(assert (=> bs!45 m!525))

(assert (=> start!160 d!175))

(declare-fun b!1865 () Bool)

(declare-fun e!381 () Bool)

(declare-fun tp_is_empty!13 () Bool)

(declare-fun tp!95 () Bool)

(assert (=> b!1865 (= e!381 (and tp_is_empty!13 tp!95))))

(assert (=> b!1812 (= tp!80 e!381)))

(assert (= (and b!1812 ((_ is Cons!17) (toList!30 lm!258))) b!1865))

(declare-fun b_lambda!55 () Bool)

(assert (= b_lambda!49 (or (and start!160 b_free!25) b_lambda!55)))

(check-sat (not b_lambda!55) b_and!55 (not d!175) (not b!1838) (not b_next!25) tp_is_empty!13 (not b!1850) (not b!1865))
(check-sat b_and!55 (not b_next!25))
