; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2414 () Bool)

(assert start!2414)

(declare-fun b_free!489 () Bool)

(declare-fun b_next!489 () Bool)

(assert (=> start!2414 (= b_free!489 (not b_next!489))))

(declare-fun tp!2548 () Bool)

(declare-fun b_and!917 () Bool)

(assert (=> start!2414 (= tp!2548 b_and!917)))

(declare-fun res!11640 () Bool)

(declare-fun e!9319 () Bool)

(assert (=> start!2414 (=> (not res!11640) (not e!9319))))

(declare-datatypes ((B!610 0))(
  ( (B!611 (val!403 Int)) )
))
(declare-datatypes ((tuple2!606 0))(
  ( (tuple2!607 (_1!303 (_ BitVec 64)) (_2!303 B!610)) )
))
(declare-datatypes ((List!468 0))(
  ( (Nil!465) (Cons!464 (h!1030 tuple2!606) (t!2888 List!468)) )
))
(declare-datatypes ((ListLongMap!437 0))(
  ( (ListLongMap!438 (toList!234 List!468)) )
))
(declare-fun lm!238 () ListLongMap!437)

(declare-fun p!262 () Int)

(declare-fun forall!111 (List!468 Int) Bool)

(assert (=> start!2414 (= res!11640 (forall!111 (toList!234 lm!238) p!262))))

(assert (=> start!2414 e!9319))

(declare-fun e!9320 () Bool)

(declare-fun inv!785 (ListLongMap!437) Bool)

(assert (=> start!2414 (and (inv!785 lm!238) e!9320)))

(assert (=> start!2414 tp!2548))

(assert (=> start!2414 true))

(declare-fun b!15360 () Bool)

(declare-fun res!11641 () Bool)

(assert (=> b!15360 (=> (not res!11641) (not e!9319))))

(declare-datatypes ((List!469 0))(
  ( (Nil!466) (Cons!465 (h!1031 (_ BitVec 64)) (t!2889 List!469)) )
))
(declare-fun l!1612 () List!469)

(declare-fun isEmpty!124 (List!469) Bool)

(assert (=> b!15360 (= res!11641 (not (isEmpty!124 l!1612)))))

(declare-fun b!15361 () Bool)

(assert (=> b!15361 (= e!9319 (not (not (= l!1612 Nil!466))))))

(declare-fun lt!3725 () (_ BitVec 64))

(declare-fun -!13 (ListLongMap!437 (_ BitVec 64)) ListLongMap!437)

(assert (=> b!15361 (forall!111 (toList!234 (-!13 lm!238 lt!3725)) p!262)))

(declare-datatypes ((Unit!290 0))(
  ( (Unit!291) )
))
(declare-fun lt!3726 () Unit!290)

(declare-fun removeValidProp!6 (ListLongMap!437 Int (_ BitVec 64)) Unit!290)

(assert (=> b!15361 (= lt!3726 (removeValidProp!6 lm!238 p!262 lt!3725))))

(declare-fun head!804 (List!469) (_ BitVec 64))

(assert (=> b!15361 (= lt!3725 (head!804 l!1612))))

(declare-fun b!15362 () Bool)

(declare-fun tp!2549 () Bool)

(assert (=> b!15362 (= e!9320 tp!2549)))

(assert (= (and start!2414 res!11640) b!15360))

(assert (= (and b!15360 res!11641) b!15361))

(assert (= start!2414 b!15362))

(declare-fun m!10273 () Bool)

(assert (=> start!2414 m!10273))

(declare-fun m!10275 () Bool)

(assert (=> start!2414 m!10275))

(declare-fun m!10277 () Bool)

(assert (=> b!15360 m!10277))

(declare-fun m!10279 () Bool)

(assert (=> b!15361 m!10279))

(declare-fun m!10281 () Bool)

(assert (=> b!15361 m!10281))

(declare-fun m!10283 () Bool)

(assert (=> b!15361 m!10283))

(declare-fun m!10285 () Bool)

(assert (=> b!15361 m!10285))

(check-sat (not b!15361) (not start!2414) (not b_next!489) b_and!917 (not b!15360) (not b!15362))
(check-sat b_and!917 (not b_next!489))
(get-model)

(declare-fun d!2621 () Bool)

(declare-fun res!11664 () Bool)

(declare-fun e!9343 () Bool)

(assert (=> d!2621 (=> res!11664 e!9343)))

(get-info :version)

(assert (=> d!2621 (= res!11664 ((_ is Nil!465) (toList!234 (-!13 lm!238 lt!3725))))))

(assert (=> d!2621 (= (forall!111 (toList!234 (-!13 lm!238 lt!3725)) p!262) e!9343)))

(declare-fun b!15388 () Bool)

(declare-fun e!9344 () Bool)

(assert (=> b!15388 (= e!9343 e!9344)))

(declare-fun res!11665 () Bool)

(assert (=> b!15388 (=> (not res!11665) (not e!9344))))

(declare-fun dynLambda!103 (Int tuple2!606) Bool)

(assert (=> b!15388 (= res!11665 (dynLambda!103 p!262 (h!1030 (toList!234 (-!13 lm!238 lt!3725)))))))

(declare-fun b!15389 () Bool)

(assert (=> b!15389 (= e!9344 (forall!111 (t!2888 (toList!234 (-!13 lm!238 lt!3725))) p!262))))

(assert (= (and d!2621 (not res!11664)) b!15388))

(assert (= (and b!15388 res!11665) b!15389))

(declare-fun b_lambda!1011 () Bool)

(assert (=> (not b_lambda!1011) (not b!15388)))

(declare-fun t!2897 () Bool)

(declare-fun tb!415 () Bool)

(assert (=> (and start!2414 (= p!262 p!262) t!2897) tb!415))

(declare-fun result!733 () Bool)

(assert (=> tb!415 (= result!733 true)))

(assert (=> b!15388 t!2897))

(declare-fun b_and!925 () Bool)

(assert (= b_and!917 (and (=> t!2897 result!733) b_and!925)))

(declare-fun m!10313 () Bool)

(assert (=> b!15388 m!10313))

(declare-fun m!10315 () Bool)

(assert (=> b!15389 m!10315))

(assert (=> b!15361 d!2621))

(declare-fun d!2629 () Bool)

(declare-fun lt!3744 () ListLongMap!437)

(declare-fun contains!196 (ListLongMap!437 (_ BitVec 64)) Bool)

(assert (=> d!2629 (not (contains!196 lt!3744 lt!3725))))

(declare-fun removeStrictlySorted!8 (List!468 (_ BitVec 64)) List!468)

(assert (=> d!2629 (= lt!3744 (ListLongMap!438 (removeStrictlySorted!8 (toList!234 lm!238) lt!3725)))))

(assert (=> d!2629 (= (-!13 lm!238 lt!3725) lt!3744)))

(declare-fun bs!666 () Bool)

(assert (= bs!666 d!2629))

(declare-fun m!10323 () Bool)

(assert (=> bs!666 m!10323))

(declare-fun m!10325 () Bool)

(assert (=> bs!666 m!10325))

(assert (=> b!15361 d!2629))

(declare-fun d!2637 () Bool)

(assert (=> d!2637 (forall!111 (toList!234 (-!13 lm!238 lt!3725)) p!262)))

(declare-fun lt!3750 () Unit!290)

(declare-fun choose!172 (ListLongMap!437 Int (_ BitVec 64)) Unit!290)

(assert (=> d!2637 (= lt!3750 (choose!172 lm!238 p!262 lt!3725))))

(assert (=> d!2637 (forall!111 (toList!234 lm!238) p!262)))

(assert (=> d!2637 (= (removeValidProp!6 lm!238 p!262 lt!3725) lt!3750)))

(declare-fun bs!669 () Bool)

(assert (= bs!669 d!2637))

(assert (=> bs!669 m!10279))

(assert (=> bs!669 m!10281))

(declare-fun m!10335 () Bool)

(assert (=> bs!669 m!10335))

(assert (=> bs!669 m!10273))

(assert (=> b!15361 d!2637))

(declare-fun d!2645 () Bool)

(assert (=> d!2645 (= (head!804 l!1612) (h!1031 l!1612))))

(assert (=> b!15361 d!2645))

(declare-fun d!2647 () Bool)

(declare-fun res!11668 () Bool)

(declare-fun e!9350 () Bool)

(assert (=> d!2647 (=> res!11668 e!9350)))

(assert (=> d!2647 (= res!11668 ((_ is Nil!465) (toList!234 lm!238)))))

(assert (=> d!2647 (= (forall!111 (toList!234 lm!238) p!262) e!9350)))

(declare-fun b!15397 () Bool)

(declare-fun e!9351 () Bool)

(assert (=> b!15397 (= e!9350 e!9351)))

(declare-fun res!11669 () Bool)

(assert (=> b!15397 (=> (not res!11669) (not e!9351))))

(assert (=> b!15397 (= res!11669 (dynLambda!103 p!262 (h!1030 (toList!234 lm!238))))))

(declare-fun b!15398 () Bool)

(assert (=> b!15398 (= e!9351 (forall!111 (t!2888 (toList!234 lm!238)) p!262))))

(assert (= (and d!2647 (not res!11668)) b!15397))

(assert (= (and b!15397 res!11669) b!15398))

(declare-fun b_lambda!1019 () Bool)

(assert (=> (not b_lambda!1019) (not b!15397)))

(declare-fun t!2901 () Bool)

(declare-fun tb!419 () Bool)

(assert (=> (and start!2414 (= p!262 p!262) t!2901) tb!419))

(declare-fun result!739 () Bool)

(assert (=> tb!419 (= result!739 true)))

(assert (=> b!15397 t!2901))

(declare-fun b_and!929 () Bool)

(assert (= b_and!925 (and (=> t!2901 result!739) b_and!929)))

(declare-fun m!10337 () Bool)

(assert (=> b!15397 m!10337))

(declare-fun m!10339 () Bool)

(assert (=> b!15398 m!10339))

(assert (=> start!2414 d!2647))

(declare-fun d!2651 () Bool)

(declare-fun isStrictlySorted!142 (List!468) Bool)

(assert (=> d!2651 (= (inv!785 lm!238) (isStrictlySorted!142 (toList!234 lm!238)))))

(declare-fun bs!670 () Bool)

(assert (= bs!670 d!2651))

(declare-fun m!10345 () Bool)

(assert (=> bs!670 m!10345))

(assert (=> start!2414 d!2651))

(declare-fun d!2655 () Bool)

(assert (=> d!2655 (= (isEmpty!124 l!1612) ((_ is Nil!466) l!1612))))

(assert (=> b!15360 d!2655))

(declare-fun b!15405 () Bool)

(declare-fun e!9356 () Bool)

(declare-fun tp_is_empty!783 () Bool)

(declare-fun tp!2561 () Bool)

(assert (=> b!15405 (= e!9356 (and tp_is_empty!783 tp!2561))))

(assert (=> b!15362 (= tp!2549 e!9356)))

(assert (= (and b!15362 ((_ is Cons!464) (toList!234 lm!238))) b!15405))

(declare-fun b_lambda!1023 () Bool)

(assert (= b_lambda!1019 (or (and start!2414 b_free!489) b_lambda!1023)))

(declare-fun b_lambda!1025 () Bool)

(assert (= b_lambda!1011 (or (and start!2414 b_free!489) b_lambda!1025)))

(check-sat tp_is_empty!783 (not b_next!489) (not b_lambda!1023) (not b_lambda!1025) (not b!15389) (not b!15398) (not b!15405) (not d!2651) (not d!2637) b_and!929 (not d!2629))
(check-sat b_and!929 (not b_next!489))
