; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2374 () Bool)

(assert start!2374)

(declare-fun b_free!485 () Bool)

(declare-fun b_next!485 () Bool)

(assert (=> start!2374 (= b_free!485 (not b_next!485))))

(declare-fun tp!2527 () Bool)

(declare-fun b_and!901 () Bool)

(assert (=> start!2374 (= tp!2527 b_and!901)))

(declare-fun res!11605 () Bool)

(declare-fun e!9275 () Bool)

(assert (=> start!2374 (=> (not res!11605) (not e!9275))))

(declare-datatypes ((B!606 0))(
  ( (B!607 (val!401 Int)) )
))
(declare-datatypes ((tuple2!602 0))(
  ( (tuple2!603 (_1!301 (_ BitVec 64)) (_2!301 B!606)) )
))
(declare-datatypes ((List!464 0))(
  ( (Nil!461) (Cons!460 (h!1026 tuple2!602) (t!2872 List!464)) )
))
(declare-datatypes ((ListLongMap!433 0))(
  ( (ListLongMap!434 (toList!232 List!464)) )
))
(declare-fun lm!238 () ListLongMap!433)

(declare-fun p!262 () Int)

(declare-fun forall!109 (List!464 Int) Bool)

(assert (=> start!2374 (= res!11605 (forall!109 (toList!232 lm!238) p!262))))

(assert (=> start!2374 e!9275))

(declare-fun e!9274 () Bool)

(declare-fun inv!778 (ListLongMap!433) Bool)

(assert (=> start!2374 (and (inv!778 lm!238) e!9274)))

(assert (=> start!2374 tp!2527))

(assert (=> start!2374 true))

(declare-fun b!15303 () Bool)

(declare-fun res!11604 () Bool)

(assert (=> b!15303 (=> (not res!11604) (not e!9275))))

(declare-datatypes ((List!465 0))(
  ( (Nil!462) (Cons!461 (h!1027 (_ BitVec 64)) (t!2873 List!465)) )
))
(declare-fun l!1612 () List!465)

(declare-fun isEmpty!122 (List!465) Bool)

(assert (=> b!15303 (= res!11604 (not (isEmpty!122 l!1612)))))

(declare-fun b!15304 () Bool)

(assert (=> b!15304 (= e!9275 (not (not (= l!1612 Nil!462))))))

(declare-fun lt!3696 () (_ BitVec 64))

(declare-fun -!11 (ListLongMap!433 (_ BitVec 64)) ListLongMap!433)

(assert (=> b!15304 (forall!109 (toList!232 (-!11 lm!238 lt!3696)) p!262)))

(declare-datatypes ((Unit!286 0))(
  ( (Unit!287) )
))
(declare-fun lt!3695 () Unit!286)

(declare-fun removeValidProp!4 (ListLongMap!433 Int (_ BitVec 64)) Unit!286)

(assert (=> b!15304 (= lt!3695 (removeValidProp!4 lm!238 p!262 lt!3696))))

(declare-fun head!802 (List!465) (_ BitVec 64))

(assert (=> b!15304 (= lt!3696 (head!802 l!1612))))

(declare-fun b!15305 () Bool)

(declare-fun tp!2528 () Bool)

(assert (=> b!15305 (= e!9274 tp!2528)))

(assert (= (and start!2374 res!11605) b!15303))

(assert (= (and b!15303 res!11604) b!15304))

(assert (= start!2374 b!15305))

(declare-fun m!10197 () Bool)

(assert (=> start!2374 m!10197))

(declare-fun m!10199 () Bool)

(assert (=> start!2374 m!10199))

(declare-fun m!10201 () Bool)

(assert (=> b!15303 m!10201))

(declare-fun m!10203 () Bool)

(assert (=> b!15304 m!10203))

(declare-fun m!10205 () Bool)

(assert (=> b!15304 m!10205))

(declare-fun m!10207 () Bool)

(assert (=> b!15304 m!10207))

(declare-fun m!10209 () Bool)

(assert (=> b!15304 m!10209))

(push 1)

(assert (not b!15303))

(assert (not b!15305))

(assert (not start!2374))

(assert b_and!901)

(assert (not b!15304))

(assert (not b_next!485))

(check-sat)

(pop 1)

(push 1)

(assert b_and!901)

(assert (not b_next!485))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!2575 () Bool)

(declare-fun res!11620 () Bool)

(declare-fun e!9290 () Bool)

(assert (=> d!2575 (=> res!11620 e!9290)))

(assert (=> d!2575 (= res!11620 (is-Nil!461 (toList!232 lm!238)))))

(assert (=> d!2575 (= (forall!109 (toList!232 lm!238) p!262) e!9290)))

(declare-fun b!15320 () Bool)

(declare-fun e!9291 () Bool)

(assert (=> b!15320 (= e!9290 e!9291)))

(declare-fun res!11621 () Bool)

(assert (=> b!15320 (=> (not res!11621) (not e!9291))))

(declare-fun dynLambda!101 (Int tuple2!602) Bool)

(assert (=> b!15320 (= res!11621 (dynLambda!101 p!262 (h!1026 (toList!232 lm!238))))))

(declare-fun b!15321 () Bool)

(assert (=> b!15321 (= e!9291 (forall!109 (t!2872 (toList!232 lm!238)) p!262))))

(assert (= (and d!2575 (not res!11620)) b!15320))

(assert (= (and b!15320 res!11621) b!15321))

(declare-fun b_lambda!984 () Bool)

(assert (=> (not b_lambda!984) (not b!15320)))

(declare-fun t!2876 () Bool)

(declare-fun tb!400 () Bool)

(assert (=> (and start!2374 (= p!262 p!262) t!2876) tb!400))

(declare-fun result!712 () Bool)

(assert (=> tb!400 (= result!712 true)))

(assert (=> b!15320 t!2876))

(declare-fun b_and!904 () Bool)

(assert (= b_and!901 (and (=> t!2876 result!712) b_and!904)))

(declare-fun m!10212 () Bool)

(assert (=> b!15320 m!10212))

(declare-fun m!10215 () Bool)

(assert (=> b!15321 m!10215))

(assert (=> start!2374 d!2575))

(declare-fun d!2579 () Bool)

(declare-fun isStrictlySorted!138 (List!464) Bool)

(assert (=> d!2579 (= (inv!778 lm!238) (isStrictlySorted!138 (toList!232 lm!238)))))

(declare-fun bs!651 () Bool)

(assert (= bs!651 d!2579))

(declare-fun m!10223 () Bool)

(assert (=> bs!651 m!10223))

(assert (=> start!2374 d!2579))

(declare-fun d!2585 () Bool)

(declare-fun res!11624 () Bool)

(declare-fun e!9294 () Bool)

(assert (=> d!2585 (=> res!11624 e!9294)))

(assert (=> d!2585 (= res!11624 (is-Nil!461 (toList!232 (-!11 lm!238 lt!3696))))))

(assert (=> d!2585 (= (forall!109 (toList!232 (-!11 lm!238 lt!3696)) p!262) e!9294)))

(declare-fun b!15324 () Bool)

(declare-fun e!9295 () Bool)

(assert (=> b!15324 (= e!9294 e!9295)))

(declare-fun res!11625 () Bool)

(assert (=> b!15324 (=> (not res!11625) (not e!9295))))

(assert (=> b!15324 (= res!11625 (dynLambda!101 p!262 (h!1026 (toList!232 (-!11 lm!238 lt!3696)))))))

(declare-fun b!15325 () Bool)

(assert (=> b!15325 (= e!9295 (forall!109 (t!2872 (toList!232 (-!11 lm!238 lt!3696))) p!262))))

(assert (= (and d!2585 (not res!11624)) b!15324))

(assert (= (and b!15324 res!11625) b!15325))

(declare-fun b_lambda!989 () Bool)

(assert (=> (not b_lambda!989) (not b!15324)))

(declare-fun t!2881 () Bool)

(declare-fun tb!405 () Bool)

(assert (=> (and start!2374 (= p!262 p!262) t!2881) tb!405))

(declare-fun result!717 () Bool)

(assert (=> tb!405 (= result!717 true)))

(assert (=> b!15324 t!2881))

(declare-fun b_and!909 () Bool)

(assert (= b_and!904 (and (=> t!2881 result!717) b_and!909)))

(declare-fun m!10225 () Bool)

(assert (=> b!15324 m!10225))

(declare-fun m!10227 () Bool)

(assert (=> b!15325 m!10227))

(assert (=> b!15304 d!2585))

(declare-fun d!2587 () Bool)

(declare-fun lt!3705 () ListLongMap!433)

(declare-fun contains!194 (ListLongMap!433 (_ BitVec 64)) Bool)

(assert (=> d!2587 (not (contains!194 lt!3705 lt!3696))))

(declare-fun removeStrictlySorted!6 (List!464 (_ BitVec 64)) List!464)

(assert (=> d!2587 (= lt!3705 (ListLongMap!434 (removeStrictlySorted!6 (toList!232 lm!238) lt!3696)))))

(assert (=> d!2587 (= (-!11 lm!238 lt!3696) lt!3705)))

(declare-fun bs!654 () Bool)

(assert (= bs!654 d!2587))

(declare-fun m!10237 () Bool)

(assert (=> bs!654 m!10237))

(declare-fun m!10239 () Bool)

(assert (=> bs!654 m!10239))

(assert (=> b!15304 d!2587))

(declare-fun d!2593 () Bool)

(assert (=> d!2593 (forall!109 (toList!232 (-!11 lm!238 lt!3696)) p!262)))

(declare-fun lt!3714 () Unit!286)

(declare-fun choose!170 (ListLongMap!433 Int (_ BitVec 64)) Unit!286)

(assert (=> d!2593 (= lt!3714 (choose!170 lm!238 p!262 lt!3696))))

(assert (=> d!2593 (forall!109 (toList!232 lm!238) p!262)))

(assert (=> d!2593 (= (removeValidProp!4 lm!238 p!262 lt!3696) lt!3714)))

(declare-fun bs!659 () Bool)

(assert (= bs!659 d!2593))

(assert (=> bs!659 m!10203))

(assert (=> bs!659 m!10205))

(declare-fun m!10257 () Bool)

(assert (=> bs!659 m!10257))

(assert (=> bs!659 m!10197))

(assert (=> b!15304 d!2593))

(declare-fun d!2611 () Bool)

(assert (=> d!2611 (= (head!802 l!1612) (h!1027 l!1612))))

