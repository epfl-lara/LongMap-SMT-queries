; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2412 () Bool)

(assert start!2412)

(declare-fun b_free!487 () Bool)

(declare-fun b_next!487 () Bool)

(assert (=> start!2412 (= b_free!487 (not b_next!487))))

(declare-fun tp!2543 () Bool)

(declare-fun b_and!915 () Bool)

(assert (=> start!2412 (= tp!2543 b_and!915)))

(declare-fun res!11635 () Bool)

(declare-fun e!9314 () Bool)

(assert (=> start!2412 (=> (not res!11635) (not e!9314))))

(declare-datatypes ((B!608 0))(
  ( (B!609 (val!402 Int)) )
))
(declare-datatypes ((tuple2!604 0))(
  ( (tuple2!605 (_1!302 (_ BitVec 64)) (_2!302 B!608)) )
))
(declare-datatypes ((List!466 0))(
  ( (Nil!463) (Cons!462 (h!1028 tuple2!604) (t!2886 List!466)) )
))
(declare-datatypes ((ListLongMap!435 0))(
  ( (ListLongMap!436 (toList!233 List!466)) )
))
(declare-fun lm!238 () ListLongMap!435)

(declare-fun p!262 () Int)

(declare-fun forall!110 (List!466 Int) Bool)

(assert (=> start!2412 (= res!11635 (forall!110 (toList!233 lm!238) p!262))))

(assert (=> start!2412 e!9314))

(declare-fun e!9313 () Bool)

(declare-fun inv!784 (ListLongMap!435) Bool)

(assert (=> start!2412 (and (inv!784 lm!238) e!9313)))

(assert (=> start!2412 tp!2543))

(assert (=> start!2412 true))

(declare-fun b!15351 () Bool)

(declare-fun res!11634 () Bool)

(assert (=> b!15351 (=> (not res!11634) (not e!9314))))

(declare-datatypes ((List!467 0))(
  ( (Nil!464) (Cons!463 (h!1029 (_ BitVec 64)) (t!2887 List!467)) )
))
(declare-fun l!1612 () List!467)

(declare-fun isEmpty!123 (List!467) Bool)

(assert (=> b!15351 (= res!11634 (not (isEmpty!123 l!1612)))))

(declare-fun b!15352 () Bool)

(assert (=> b!15352 (= e!9314 (not (not (= l!1612 Nil!464))))))

(declare-fun lt!3719 () (_ BitVec 64))

(declare-fun -!12 (ListLongMap!435 (_ BitVec 64)) ListLongMap!435)

(assert (=> b!15352 (forall!110 (toList!233 (-!12 lm!238 lt!3719)) p!262)))

(declare-datatypes ((Unit!288 0))(
  ( (Unit!289) )
))
(declare-fun lt!3720 () Unit!288)

(declare-fun removeValidProp!5 (ListLongMap!435 Int (_ BitVec 64)) Unit!288)

(assert (=> b!15352 (= lt!3720 (removeValidProp!5 lm!238 p!262 lt!3719))))

(declare-fun head!803 (List!467) (_ BitVec 64))

(assert (=> b!15352 (= lt!3719 (head!803 l!1612))))

(declare-fun b!15353 () Bool)

(declare-fun tp!2542 () Bool)

(assert (=> b!15353 (= e!9313 tp!2542)))

(assert (= (and start!2412 res!11635) b!15351))

(assert (= (and b!15351 res!11634) b!15352))

(assert (= start!2412 b!15353))

(declare-fun m!10259 () Bool)

(assert (=> start!2412 m!10259))

(declare-fun m!10261 () Bool)

(assert (=> start!2412 m!10261))

(declare-fun m!10263 () Bool)

(assert (=> b!15351 m!10263))

(declare-fun m!10265 () Bool)

(assert (=> b!15352 m!10265))

(declare-fun m!10267 () Bool)

(assert (=> b!15352 m!10267))

(declare-fun m!10269 () Bool)

(assert (=> b!15352 m!10269))

(declare-fun m!10271 () Bool)

(assert (=> b!15352 m!10271))

(push 1)

(assert b_and!915)

(assert (not b_next!487))

(assert (not b!15353))

(assert (not start!2412))

(assert (not b!15352))

(assert (not b!15351))

(check-sat)

(pop 1)

(push 1)

(assert b_and!915)

(assert (not b_next!487))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!2619 () Bool)

(declare-fun res!11662 () Bool)

(declare-fun e!9341 () Bool)

(assert (=> d!2619 (=> res!11662 e!9341)))

(assert (=> d!2619 (= res!11662 (is-Nil!463 (toList!233 (-!12 lm!238 lt!3719))))))

(assert (=> d!2619 (= (forall!110 (toList!233 (-!12 lm!238 lt!3719)) p!262) e!9341)))

(declare-fun b!15386 () Bool)

(declare-fun e!9342 () Bool)

(assert (=> b!15386 (= e!9341 e!9342)))

(declare-fun res!11663 () Bool)

(assert (=> b!15386 (=> (not res!11663) (not e!9342))))

(declare-fun dynLambda!104 (Int tuple2!604) Bool)

(assert (=> b!15386 (= res!11663 (dynLambda!104 p!262 (h!1028 (toList!233 (-!12 lm!238 lt!3719)))))))

(declare-fun b!15387 () Bool)

(assert (=> b!15387 (= e!9342 (forall!110 (t!2886 (toList!233 (-!12 lm!238 lt!3719))) p!262))))

(assert (= (and d!2619 (not res!11662)) b!15386))

(assert (= (and b!15386 res!11663) b!15387))

(declare-fun b_lambda!1009 () Bool)

(assert (=> (not b_lambda!1009) (not b!15386)))

(declare-fun t!2895 () Bool)

(declare-fun tb!413 () Bool)

(assert (=> (and start!2412 (= p!262 p!262) t!2895) tb!413))

(declare-fun result!731 () Bool)

(assert (=> tb!413 (= result!731 true)))

(assert (=> b!15386 t!2895))

(declare-fun b_and!923 () Bool)

(assert (= b_and!915 (and (=> t!2895 result!731) b_and!923)))

(declare-fun m!10305 () Bool)

(assert (=> b!15386 m!10305))

(declare-fun m!10307 () Bool)

(assert (=> b!15387 m!10307))

(assert (=> b!15352 d!2619))

(declare-fun d!2625 () Bool)

(declare-fun lt!3741 () ListLongMap!435)

(declare-fun contains!197 (ListLongMap!435 (_ BitVec 64)) Bool)

(assert (=> d!2625 (not (contains!197 lt!3741 lt!3719))))

(declare-fun removeStrictlySorted!9 (List!466 (_ BitVec 64)) List!466)

(assert (=> d!2625 (= lt!3741 (ListLongMap!436 (removeStrictlySorted!9 (toList!233 lm!238) lt!3719)))))

(assert (=> d!2625 (= (-!12 lm!238 lt!3719) lt!3741)))

(declare-fun bs!665 () Bool)

(assert (= bs!665 d!2625))

(declare-fun m!10317 () Bool)

(assert (=> bs!665 m!10317))

(declare-fun m!10321 () Bool)

(assert (=> bs!665 m!10321))

(assert (=> b!15352 d!2625))

(declare-fun d!2633 () Bool)

(assert (=> d!2633 (forall!110 (toList!233 (-!12 lm!238 lt!3719)) p!262)))

(declare-fun lt!3749 () Unit!288)

(declare-fun choose!173 (ListLongMap!435 Int (_ BitVec 64)) Unit!288)

(assert (=> d!2633 (= lt!3749 (choose!173 lm!238 p!262 lt!3719))))

(assert (=> d!2633 (forall!110 (toList!233 lm!238) p!262)))

(assert (=> d!2633 (= (removeValidProp!5 lm!238 p!262 lt!3719) lt!3749)))

(declare-fun bs!668 () Bool)

(assert (= bs!668 d!2633))

(assert (=> bs!668 m!10265))

(assert (=> bs!668 m!10267))

(declare-fun m!10333 () Bool)

(assert (=> bs!668 m!10333))

(assert (=> bs!668 m!10259))

(assert (=> b!15352 d!2633))

(declare-fun d!2643 () Bool)

(assert (=> d!2643 (= (head!803 l!1612) (h!1029 l!1612))))

(assert (=> b!15352 d!2643))

(declare-fun d!2649 () Bool)

(declare-fun res!11670 () Bool)

(declare-fun e!9352 () Bool)

(assert (=> d!2649 (=> res!11670 e!9352)))

(assert (=> d!2649 (= res!11670 (is-Nil!463 (toList!233 lm!238)))))

(assert (=> d!2649 (= (forall!110 (toList!233 lm!238) p!262) e!9352)))

(declare-fun b!15399 () Bool)

(declare-fun e!9353 () Bool)

(assert (=> b!15399 (= e!9352 e!9353)))

(declare-fun res!11671 () Bool)

(assert (=> b!15399 (=> (not res!11671) (not e!9353))))

(assert (=> b!15399 (= res!11671 (dynLambda!104 p!262 (h!1028 (toList!233 lm!238))))))

(declare-fun b!15400 () Bool)

(assert (=> b!15400 (= e!9353 (forall!110 (t!2886 (toList!233 lm!238)) p!262))))

