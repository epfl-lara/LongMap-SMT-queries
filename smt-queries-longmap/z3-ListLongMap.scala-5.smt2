; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!160 () Bool)

(assert start!160)

(declare-fun b_free!25 () Bool)

(declare-fun b_next!25 () Bool)

(assert (=> start!160 (= b_free!25 (not b_next!25))))

(declare-fun tp!80 () Bool)

(declare-fun b_and!49 () Bool)

(assert (=> start!160 (= tp!80 b_and!49)))

(declare-fun res!4394 () Bool)

(declare-fun e!338 () Bool)

(assert (=> start!160 (=> (not res!4394) (not e!338))))

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

(assert (=> start!160 e!338))

(declare-fun e!339 () Bool)

(declare-fun inv!47 (ListLongMap!29) Bool)

(assert (=> start!160 (and (inv!47 lm!258) e!339)))

(assert (=> start!160 tp!80))

(declare-fun b!1811 () Bool)

(declare-fun size!63 (List!21) Int)

(assert (=> b!1811 (= e!338 (< (size!63 (toList!30 lm!258)) 0))))

(declare-fun b!1812 () Bool)

(declare-fun tp!79 () Bool)

(assert (=> b!1812 (= e!339 tp!79)))

(assert (= (and start!160 res!4394) b!1811))

(assert (= start!160 b!1812))

(declare-fun m!489 () Bool)

(assert (=> start!160 m!489))

(declare-fun m!491 () Bool)

(assert (=> start!160 m!491))

(declare-fun m!493 () Bool)

(assert (=> b!1811 m!493))

(check-sat b_and!49 (not b!1812) (not b_next!25) (not b!1811) (not start!160))
(check-sat b_and!49 (not b_next!25))
(get-model)

(declare-fun d!167 () Bool)

(declare-fun lt!308 () Int)

(assert (=> d!167 (>= lt!308 0)))

(declare-fun e!366 () Int)

(assert (=> d!167 (= lt!308 e!366)))

(declare-fun c!89 () Bool)

(get-info :version)

(assert (=> d!167 (= c!89 ((_ is Nil!18) (toList!30 lm!258)))))

(assert (=> d!167 (= (size!63 (toList!30 lm!258)) lt!308)))

(declare-fun b!1841 () Bool)

(assert (=> b!1841 (= e!366 0)))

(declare-fun b!1842 () Bool)

(assert (=> b!1842 (= e!366 (+ 1 (size!63 (t!2040 (toList!30 lm!258)))))))

(assert (= (and d!167 c!89) b!1841))

(assert (= (and d!167 (not c!89)) b!1842))

(declare-fun m!515 () Bool)

(assert (=> b!1842 m!515))

(assert (=> b!1811 d!167))

(declare-fun d!173 () Bool)

(declare-fun res!4417 () Bool)

(declare-fun e!371 () Bool)

(assert (=> d!173 (=> res!4417 e!371)))

(assert (=> d!173 (= res!4417 ((_ is Nil!18) (toList!30 lm!258)))))

(assert (=> d!173 (= (forall!14 (toList!30 lm!258) p!318) e!371)))

(declare-fun b!1847 () Bool)

(declare-fun e!372 () Bool)

(assert (=> b!1847 (= e!371 e!372)))

(declare-fun res!4418 () Bool)

(assert (=> b!1847 (=> (not res!4418) (not e!372))))

(declare-fun dynLambda!8 (Int tuple2!24) Bool)

(assert (=> b!1847 (= res!4418 (dynLambda!8 p!318 (h!583 (toList!30 lm!258))))))

(declare-fun b!1848 () Bool)

(assert (=> b!1848 (= e!372 (forall!14 (t!2040 (toList!30 lm!258)) p!318))))

(assert (= (and d!173 (not res!4417)) b!1847))

(assert (= (and b!1847 res!4418) b!1848))

(declare-fun b_lambda!53 () Bool)

(assert (=> (not b_lambda!53) (not b!1847)))

(declare-fun t!2048 () Bool)

(declare-fun tb!23 () Bool)

(assert (=> (and start!160 (= p!318 p!318) t!2048) tb!23))

(declare-fun result!35 () Bool)

(assert (=> tb!23 (= result!35 true)))

(assert (=> b!1847 t!2048))

(declare-fun b_and!59 () Bool)

(assert (= b_and!49 (and (=> t!2048 result!35) b_and!59)))

(declare-fun m!521 () Bool)

(assert (=> b!1847 m!521))

(declare-fun m!523 () Bool)

(assert (=> b!1848 m!523))

(assert (=> start!160 d!173))

(declare-fun d!179 () Bool)

(declare-fun isStrictlySorted!6 (List!21) Bool)

(assert (=> d!179 (= (inv!47 lm!258) (isStrictlySorted!6 (toList!30 lm!258)))))

(declare-fun bs!47 () Bool)

(assert (= bs!47 d!179))

(declare-fun m!529 () Bool)

(assert (=> bs!47 m!529))

(assert (=> start!160 d!179))

(declare-fun b!1875 () Bool)

(declare-fun e!387 () Bool)

(declare-fun tp_is_empty!17 () Bool)

(declare-fun tp!101 () Bool)

(assert (=> b!1875 (= e!387 (and tp_is_empty!17 tp!101))))

(assert (=> b!1812 (= tp!79 e!387)))

(assert (= (and b!1812 ((_ is Cons!17) (toList!30 lm!258))) b!1875))

(declare-fun b_lambda!59 () Bool)

(assert (= b_lambda!53 (or (and start!160 b_free!25) b_lambda!59)))

(check-sat (not b!1848) (not d!179) tp_is_empty!17 (not b_next!25) (not b!1875) b_and!59 (not b!1842) (not b_lambda!59))
(check-sat b_and!59 (not b_next!25))
