; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2416 () Bool)

(assert start!2416)

(declare-fun b_free!491 () Bool)

(declare-fun b_next!491 () Bool)

(assert (=> start!2416 (= b_free!491 (not b_next!491))))

(declare-fun tp!2555 () Bool)

(declare-fun b_and!919 () Bool)

(assert (=> start!2416 (= tp!2555 b_and!919)))

(declare-fun res!11646 () Bool)

(declare-fun e!9326 () Bool)

(assert (=> start!2416 (=> (not res!11646) (not e!9326))))

(declare-datatypes ((B!612 0))(
  ( (B!613 (val!404 Int)) )
))
(declare-datatypes ((tuple2!608 0))(
  ( (tuple2!609 (_1!304 (_ BitVec 64)) (_2!304 B!612)) )
))
(declare-datatypes ((List!470 0))(
  ( (Nil!467) (Cons!466 (h!1032 tuple2!608) (t!2890 List!470)) )
))
(declare-datatypes ((ListLongMap!439 0))(
  ( (ListLongMap!440 (toList!235 List!470)) )
))
(declare-fun lm!238 () ListLongMap!439)

(declare-fun p!262 () Int)

(declare-fun forall!112 (List!470 Int) Bool)

(assert (=> start!2416 (= res!11646 (forall!112 (toList!235 lm!238) p!262))))

(assert (=> start!2416 e!9326))

(declare-fun e!9325 () Bool)

(declare-fun inv!786 (ListLongMap!439) Bool)

(assert (=> start!2416 (and (inv!786 lm!238) e!9325)))

(assert (=> start!2416 tp!2555))

(assert (=> start!2416 true))

(declare-fun b!15369 () Bool)

(declare-fun res!11647 () Bool)

(assert (=> b!15369 (=> (not res!11647) (not e!9326))))

(declare-datatypes ((List!471 0))(
  ( (Nil!468) (Cons!467 (h!1033 (_ BitVec 64)) (t!2891 List!471)) )
))
(declare-fun l!1612 () List!471)

(declare-fun isEmpty!125 (List!471) Bool)

(assert (=> b!15369 (= res!11647 (not (isEmpty!125 l!1612)))))

(declare-fun b!15370 () Bool)

(assert (=> b!15370 (= e!9326 (not (not (= l!1612 Nil!468))))))

(declare-fun lt!3732 () (_ BitVec 64))

(declare-fun -!14 (ListLongMap!439 (_ BitVec 64)) ListLongMap!439)

(assert (=> b!15370 (forall!112 (toList!235 (-!14 lm!238 lt!3732)) p!262)))

(declare-datatypes ((Unit!292 0))(
  ( (Unit!293) )
))
(declare-fun lt!3731 () Unit!292)

(declare-fun removeValidProp!7 (ListLongMap!439 Int (_ BitVec 64)) Unit!292)

(assert (=> b!15370 (= lt!3731 (removeValidProp!7 lm!238 p!262 lt!3732))))

(declare-fun head!805 (List!471) (_ BitVec 64))

(assert (=> b!15370 (= lt!3732 (head!805 l!1612))))

(declare-fun b!15371 () Bool)

(declare-fun tp!2554 () Bool)

(assert (=> b!15371 (= e!9325 tp!2554)))

(assert (= (and start!2416 res!11646) b!15369))

(assert (= (and b!15369 res!11647) b!15370))

(assert (= start!2416 b!15371))

(declare-fun m!10287 () Bool)

(assert (=> start!2416 m!10287))

(declare-fun m!10289 () Bool)

(assert (=> start!2416 m!10289))

(declare-fun m!10291 () Bool)

(assert (=> b!15369 m!10291))

(declare-fun m!10293 () Bool)

(assert (=> b!15370 m!10293))

(declare-fun m!10295 () Bool)

(assert (=> b!15370 m!10295))

(declare-fun m!10297 () Bool)

(assert (=> b!15370 m!10297))

(declare-fun m!10299 () Bool)

(assert (=> b!15370 m!10299))

(push 1)

(assert (not b!15369))

(assert (not b_next!491))

(assert (not b!15371))

(assert b_and!919)

(assert (not b!15370))

(assert (not start!2416))

(check-sat)

(pop 1)

(push 1)

(assert b_and!919)

(assert (not b_next!491))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!2617 () Bool)

(declare-fun res!11660 () Bool)

(declare-fun e!9339 () Bool)

(assert (=> d!2617 (=> res!11660 e!9339)))

(assert (=> d!2617 (= res!11660 (is-Nil!467 (toList!235 (-!14 lm!238 lt!3732))))))

(assert (=> d!2617 (= (forall!112 (toList!235 (-!14 lm!238 lt!3732)) p!262) e!9339)))

(declare-fun b!15384 () Bool)

(declare-fun e!9340 () Bool)

(assert (=> b!15384 (= e!9339 e!9340)))

(declare-fun res!11661 () Bool)

(assert (=> b!15384 (=> (not res!11661) (not e!9340))))

(declare-fun dynLambda!102 (Int tuple2!608) Bool)

(assert (=> b!15384 (= res!11661 (dynLambda!102 p!262 (h!1032 (toList!235 (-!14 lm!238 lt!3732)))))))

(declare-fun b!15385 () Bool)

(assert (=> b!15385 (= e!9340 (forall!112 (t!2890 (toList!235 (-!14 lm!238 lt!3732))) p!262))))

(assert (= (and d!2617 (not res!11660)) b!15384))

(assert (= (and b!15384 res!11661) b!15385))

(declare-fun b_lambda!1007 () Bool)

(assert (=> (not b_lambda!1007) (not b!15384)))

(declare-fun t!2893 () Bool)

(declare-fun tb!411 () Bool)

(assert (=> (and start!2416 (= p!262 p!262) t!2893) tb!411))

(declare-fun result!729 () Bool)

(assert (=> tb!411 (= result!729 true)))

(assert (=> b!15384 t!2893))

(declare-fun b_and!921 () Bool)

(assert (= b_and!919 (and (=> t!2893 result!729) b_and!921)))

(declare-fun m!10301 () Bool)

(assert (=> b!15384 m!10301))

(declare-fun m!10303 () Bool)

(assert (=> b!15385 m!10303))

(assert (=> b!15370 d!2617))

(declare-fun d!2623 () Bool)

(declare-fun lt!3735 () ListLongMap!439)

(declare-fun contains!195 (ListLongMap!439 (_ BitVec 64)) Bool)

(assert (=> d!2623 (not (contains!195 lt!3735 lt!3732))))

(declare-fun removeStrictlySorted!7 (List!470 (_ BitVec 64)) List!470)

(assert (=> d!2623 (= lt!3735 (ListLongMap!440 (removeStrictlySorted!7 (toList!235 lm!238) lt!3732)))))

(assert (=> d!2623 (= (-!14 lm!238 lt!3732) lt!3735)))

(declare-fun bs!663 () Bool)

(assert (= bs!663 d!2623))

(declare-fun m!10309 () Bool)

(assert (=> bs!663 m!10309))

(declare-fun m!10311 () Bool)

(assert (=> bs!663 m!10311))

(assert (=> b!15370 d!2623))

(declare-fun d!2627 () Bool)

(assert (=> d!2627 (forall!112 (toList!235 (-!14 lm!238 lt!3732)) p!262)))

(declare-fun lt!3740 () Unit!292)

(declare-fun choose!171 (ListLongMap!439 Int (_ BitVec 64)) Unit!292)

(assert (=> d!2627 (= lt!3740 (choose!171 lm!238 p!262 lt!3732))))

(assert (=> d!2627 (forall!112 (toList!235 lm!238) p!262)))

(assert (=> d!2627 (= (removeValidProp!7 lm!238 p!262 lt!3732) lt!3740)))

(declare-fun bs!664 () Bool)

(assert (= bs!664 d!2627))

(assert (=> bs!664 m!10293))

(assert (=> bs!664 m!10295))

(declare-fun m!10319 () Bool)

(assert (=> bs!664 m!10319))

(assert (=> bs!664 m!10287))

(assert (=> b!15370 d!2627))

(declare-fun d!2631 () Bool)

(assert (=> d!2631 (= (head!805 l!1612) (h!1033 l!1612))))

(assert (=> b!15370 d!2631))

(declare-fun d!2635 () Bool)

(declare-fun res!11666 () Bool)

(declare-fun e!9345 () Bool)

(assert (=> d!2635 (=> res!11666 e!9345)))

(assert (=> d!2635 (= res!11666 (is-Nil!467 (toList!235 lm!238)))))

(assert (=> d!2635 (= (forall!112 (toList!235 lm!238) p!262) e!9345)))

(declare-fun b!15390 () Bool)

(declare-fun e!9346 () Bool)

(assert (=> b!15390 (= e!9345 e!9346)))

(declare-fun res!11667 () Bool)

(assert (=> b!15390 (=> (not res!11667) (not e!9346))))

(assert (=> b!15390 (= res!11667 (dynLambda!102 p!262 (h!1032 (toList!235 lm!238))))))

(declare-fun b!15391 () Bool)

(assert (=> b!15391 (= e!9346 (forall!112 (t!2890 (toList!235 lm!238)) p!262))))

(assert (= (and d!2635 (not res!11666)) b!15390))

(assert (= (and b!15390 res!11667) b!15391))

(declare-fun b_lambda!1013 () Bool)

(assert (=> (not b_lambda!1013) (not b!15390)))

(declare-fun t!2899 () Bool)

(declare-fun tb!417 () Bool)

(assert (=> (and start!2416 (= p!262 p!262) t!2899) tb!417))

(declare-fun result!735 () Bool)

(assert (=> tb!417 (= result!735 true)))

(assert (=> b!15390 t!2899))

(declare-fun b_and!927 () Bool)

(assert (= b_and!921 (and (=> t!2899 result!735) b_and!927)))

(declare-fun m!10327 () Bool)

(assert (=> b!15390 m!10327))

(declare-fun m!10329 () Bool)

(assert (=> b!15391 m!10329))

(assert (=> start!2416 d!2635))

(declare-fun d!2639 () Bool)

(declare-fun isStrictlySorted!141 (List!470) Bool)

(assert (=> d!2639 (= (inv!786 lm!238) (isStrictlySorted!141 (toList!235 lm!238)))))

(declare-fun bs!667 () Bool)

(assert (= bs!667 d!2639))

(declare-fun m!10331 () Bool)

(assert (=> bs!667 m!10331))

(assert (=> start!2416 d!2639))

(declare-fun d!2641 () Bool)

(assert (=> d!2641 (= (isEmpty!125 l!1612) (is-Nil!468 l!1612))))

(assert (=> b!15369 d!2641))

(declare-fun b!15396 () Bool)

(declare-fun e!9349 () Bool)

(declare-fun tp_is_empty!781 () Bool)

(declare-fun tp!2558 () Bool)

(assert (=> b!15396 (= e!9349 (and tp_is_empty!781 tp!2558))))

(assert (=> b!15371 (= tp!2554 e!9349)))

(assert (= (and b!15371 (is-Cons!466 (toList!235 lm!238))) b!15396))

(declare-fun b_lambda!1015 () Bool)

(assert (= b_lambda!1007 (or (and start!2416 b_free!491) b_lambda!1015)))

(declare-fun b_lambda!1017 () Bool)

(assert (= b_lambda!1013 (or (and start!2416 b_free!491) b_lambda!1017)))

(push 1)

