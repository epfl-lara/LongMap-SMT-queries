; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2416 () Bool)

(assert start!2416)

(declare-fun b_free!491 () Bool)

(declare-fun b_next!491 () Bool)

(assert (=> start!2416 (= b_free!491 (not b_next!491))))

(declare-fun tp!2554 () Bool)

(declare-fun b_and!919 () Bool)

(assert (=> start!2416 (= tp!2554 b_and!919)))

(declare-fun res!11646 () Bool)

(declare-fun e!9325 () Bool)

(assert (=> start!2416 (=> (not res!11646) (not e!9325))))

(declare-datatypes ((B!612 0))(
  ( (B!613 (val!404 Int)) )
))
(declare-datatypes ((tuple2!604 0))(
  ( (tuple2!605 (_1!302 (_ BitVec 64)) (_2!302 B!612)) )
))
(declare-datatypes ((List!466 0))(
  ( (Nil!463) (Cons!462 (h!1028 tuple2!604) (t!2886 List!466)) )
))
(declare-datatypes ((ListLongMap!435 0))(
  ( (ListLongMap!436 (toList!233 List!466)) )
))
(declare-fun lm!238 () ListLongMap!435)

(declare-fun p!262 () Int)

(declare-fun forall!112 (List!466 Int) Bool)

(assert (=> start!2416 (= res!11646 (forall!112 (toList!233 lm!238) p!262))))

(assert (=> start!2416 e!9325))

(declare-fun e!9326 () Bool)

(declare-fun inv!786 (ListLongMap!435) Bool)

(assert (=> start!2416 (and (inv!786 lm!238) e!9326)))

(assert (=> start!2416 tp!2554))

(assert (=> start!2416 true))

(declare-fun b!15369 () Bool)

(declare-fun res!11647 () Bool)

(assert (=> b!15369 (=> (not res!11647) (not e!9325))))

(declare-datatypes ((List!467 0))(
  ( (Nil!464) (Cons!463 (h!1029 (_ BitVec 64)) (t!2887 List!467)) )
))
(declare-fun l!1612 () List!467)

(declare-fun isEmpty!125 (List!467) Bool)

(assert (=> b!15369 (= res!11647 (not (isEmpty!125 l!1612)))))

(declare-fun b!15370 () Bool)

(assert (=> b!15370 (= e!9325 (not (not (= l!1612 Nil!464))))))

(declare-fun lt!3732 () (_ BitVec 64))

(declare-fun -!14 (ListLongMap!435 (_ BitVec 64)) ListLongMap!435)

(assert (=> b!15370 (forall!112 (toList!233 (-!14 lm!238 lt!3732)) p!262)))

(declare-datatypes ((Unit!302 0))(
  ( (Unit!303) )
))
(declare-fun lt!3731 () Unit!302)

(declare-fun removeValidProp!7 (ListLongMap!435 Int (_ BitVec 64)) Unit!302)

(assert (=> b!15370 (= lt!3731 (removeValidProp!7 lm!238 p!262 lt!3732))))

(declare-fun head!805 (List!467) (_ BitVec 64))

(assert (=> b!15370 (= lt!3732 (head!805 l!1612))))

(declare-fun b!15371 () Bool)

(declare-fun tp!2555 () Bool)

(assert (=> b!15371 (= e!9326 tp!2555)))

(assert (= (and start!2416 res!11646) b!15369))

(assert (= (and b!15369 res!11647) b!15370))

(assert (= start!2416 b!15371))

(declare-fun m!10279 () Bool)

(assert (=> start!2416 m!10279))

(declare-fun m!10281 () Bool)

(assert (=> start!2416 m!10281))

(declare-fun m!10283 () Bool)

(assert (=> b!15369 m!10283))

(declare-fun m!10285 () Bool)

(assert (=> b!15370 m!10285))

(declare-fun m!10287 () Bool)

(assert (=> b!15370 m!10287))

(declare-fun m!10289 () Bool)

(assert (=> b!15370 m!10289))

(declare-fun m!10291 () Bool)

(assert (=> b!15370 m!10291))

(push 1)

(assert (not b!15370))

(assert (not start!2416))

(assert (not b!15369))

(assert b_and!919)

(assert (not b!15371))

(assert (not b_next!491))

(check-sat)

(pop 1)

(push 1)

(assert b_and!919)

(assert (not b_next!491))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!2617 () Bool)

(declare-fun res!11656 () Bool)

(declare-fun e!9335 () Bool)

(assert (=> d!2617 (=> res!11656 e!9335)))

(assert (=> d!2617 (= res!11656 (is-Nil!463 (toList!233 (-!14 lm!238 lt!3732))))))

(assert (=> d!2617 (= (forall!112 (toList!233 (-!14 lm!238 lt!3732)) p!262) e!9335)))

(declare-fun b!15380 () Bool)

(declare-fun e!9336 () Bool)

(assert (=> b!15380 (= e!9335 e!9336)))

(declare-fun res!11657 () Bool)

(assert (=> b!15380 (=> (not res!11657) (not e!9336))))

(declare-fun dynLambda!101 (Int tuple2!604) Bool)

(assert (=> b!15380 (= res!11657 (dynLambda!101 p!262 (h!1028 (toList!233 (-!14 lm!238 lt!3732)))))))

(declare-fun b!15381 () Bool)

(assert (=> b!15381 (= e!9336 (forall!112 (t!2886 (toList!233 (-!14 lm!238 lt!3732))) p!262))))

(assert (= (and d!2617 (not res!11656)) b!15380))

(assert (= (and b!15380 res!11657) b!15381))

(declare-fun b_lambda!1007 () Bool)

(assert (=> (not b_lambda!1007) (not b!15380)))

(declare-fun t!2889 () Bool)

(declare-fun tb!411 () Bool)

(assert (=> (and start!2416 (= p!262 p!262) t!2889) tb!411))

(declare-fun result!729 () Bool)

(assert (=> tb!411 (= result!729 true)))

(assert (=> b!15380 t!2889))

(declare-fun b_and!921 () Bool)

(assert (= b_and!919 (and (=> t!2889 result!729) b_and!921)))

(declare-fun m!10293 () Bool)

(assert (=> b!15380 m!10293))

(declare-fun m!10295 () Bool)

(assert (=> b!15381 m!10295))

(assert (=> b!15370 d!2617))

(declare-fun d!2623 () Bool)

(declare-fun lt!3735 () ListLongMap!435)

(declare-fun contains!192 (ListLongMap!435 (_ BitVec 64)) Bool)

(assert (=> d!2623 (not (contains!192 lt!3735 lt!3732))))

(declare-fun removeStrictlySorted!6 (List!466 (_ BitVec 64)) List!466)

(assert (=> d!2623 (= lt!3735 (ListLongMap!436 (removeStrictlySorted!6 (toList!233 lm!238) lt!3732)))))

(assert (=> d!2623 (= (-!14 lm!238 lt!3732) lt!3735)))

(declare-fun bs!663 () Bool)

(assert (= bs!663 d!2623))

(declare-fun m!10305 () Bool)

(assert (=> bs!663 m!10305))

(declare-fun m!10307 () Bool)

(assert (=> bs!663 m!10307))

(assert (=> b!15370 d!2623))

(declare-fun d!2629 () Bool)

(assert (=> d!2629 (forall!112 (toList!233 (-!14 lm!238 lt!3732)) p!262)))

(declare-fun lt!3741 () Unit!302)

(declare-fun choose!170 (ListLongMap!435 Int (_ BitVec 64)) Unit!302)

(assert (=> d!2629 (= lt!3741 (choose!170 lm!238 p!262 lt!3732))))

(assert (=> d!2629 (forall!112 (toList!233 lm!238) p!262)))

(assert (=> d!2629 (= (removeValidProp!7 lm!238 p!262 lt!3732) lt!3741)))

(declare-fun bs!665 () Bool)

(assert (= bs!665 d!2629))

(assert (=> bs!665 m!10285))

(assert (=> bs!665 m!10287))

(declare-fun m!10313 () Bool)

(assert (=> bs!665 m!10313))

(assert (=> bs!665 m!10279))

(assert (=> b!15370 d!2629))

(declare-fun d!2633 () Bool)

(assert (=> d!2633 (= (head!805 l!1612) (h!1029 l!1612))))

(assert (=> b!15370 d!2633))

(declare-fun d!2635 () Bool)

(declare-fun res!11666 () Bool)

(declare-fun e!9345 () Bool)

(assert (=> d!2635 (=> res!11666 e!9345)))

(assert (=> d!2635 (= res!11666 (is-Nil!463 (toList!233 lm!238)))))

(assert (=> d!2635 (= (forall!112 (toList!233 lm!238) p!262) e!9345)))

(declare-fun b!15390 () Bool)

(declare-fun e!9346 () Bool)

(assert (=> b!15390 (= e!9345 e!9346)))

(declare-fun res!11667 () Bool)

(assert (=> b!15390 (=> (not res!11667) (not e!9346))))

(assert (=> b!15390 (= res!11667 (dynLambda!101 p!262 (h!1028 (toList!233 lm!238))))))

(declare-fun b!15391 () Bool)

(assert (=> b!15391 (= e!9346 (forall!112 (t!2886 (toList!233 lm!238)) p!262))))

(assert (= (and d!2635 (not res!11666)) b!15390))

(assert (= (and b!15390 res!11667) b!15391))

(declare-fun b_lambda!1013 () Bool)

(assert (=> (not b_lambda!1013) (not b!15390)))

(declare-fun t!2895 () Bool)

(declare-fun tb!417 () Bool)

(assert (=> (and start!2416 (= p!262 p!262) t!2895) tb!417))

(declare-fun result!735 () Bool)

(assert (=> tb!417 (= result!735 true)))

(assert (=> b!15390 t!2895))

(declare-fun b_and!927 () Bool)

(assert (= b_and!921 (and (=> t!2895 result!735) b_and!927)))

(declare-fun m!10317 () Bool)

(assert (=> b!15390 m!10317))

(declare-fun m!10321 () Bool)

(assert (=> b!15391 m!10321))

(assert (=> start!2416 d!2635))

(declare-fun d!2637 () Bool)

(declare-fun isStrictlySorted!136 (List!466) Bool)

(assert (=> d!2637 (= (inv!786 lm!238) (isStrictlySorted!136 (toList!233 lm!238)))))

(declare-fun bs!667 () Bool)

(assert (= bs!667 d!2637))

(declare-fun m!10323 () Bool)

(assert (=> bs!667 m!10323))

(assert (=> start!2416 d!2637))

(declare-fun d!2641 () Bool)

(assert (=> d!2641 (= (isEmpty!125 l!1612) (is-Nil!464 l!1612))))

(assert (=> b!15369 d!2641))

(declare-fun b!15396 () Bool)

(declare-fun e!9349 () Bool)

(declare-fun tp_is_empty!781 () Bool)

(declare-fun tp!2558 () Bool)

(assert (=> b!15396 (= e!9349 (and tp_is_empty!781 tp!2558))))

(assert (=> b!15371 (= tp!2555 e!9349)))

(assert (= (and b!15371 (is-Cons!462 (toList!233 lm!238))) b!15396))

(declare-fun b_lambda!1015 () Bool)

(assert (= b_lambda!1007 (or (and start!2416 b_free!491) b_lambda!1015)))

(declare-fun b_lambda!1017 () Bool)

(assert (= b_lambda!1013 (or (and start!2416 b_free!491) b_lambda!1017)))

(push 1)

(assert (not b_lambda!1017))

(assert (not b!15381))

(assert (not b!15396))

(assert (not d!2637))

(assert (not d!2629))

(assert b_and!927)

(assert (not b_lambda!1015))

(assert (not d!2623))

(assert tp_is_empty!781)

(assert (not b!15391))

(assert (not b_next!491))

(check-sat)

(pop 1)

(push 1)

(assert b_and!927)

(assert (not b_next!491))

(check-sat)

(pop 1)

