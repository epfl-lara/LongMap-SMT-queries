; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!88420 () Bool)

(assert start!88420)

(declare-fun res!682382 () Bool)

(declare-fun e!572370 () Bool)

(assert (=> start!88420 (=> (not res!682382) (not e!572370))))

(declare-datatypes ((B!1586 0))(
  ( (B!1587 (val!11877 Int)) )
))
(declare-datatypes ((tuple2!15380 0))(
  ( (tuple2!15381 (_1!7701 (_ BitVec 64)) (_2!7701 B!1586)) )
))
(declare-datatypes ((List!21600 0))(
  ( (Nil!21597) (Cons!21596 (h!22794 tuple2!15380) (t!30592 List!21600)) )
))
(declare-fun l!1036 () List!21600)

(declare-fun isStrictlySorted!632 (List!21600) Bool)

(assert (=> start!88420 (= res!682382 (isStrictlySorted!632 l!1036))))

(assert (=> start!88420 e!572370))

(declare-fun e!572369 () Bool)

(assert (=> start!88420 e!572369))

(assert (=> start!88420 true))

(declare-fun b!1017356 () Bool)

(declare-fun res!682381 () Bool)

(assert (=> b!1017356 (=> (not res!682381) (not e!572370))))

(declare-fun key!271 () (_ BitVec 64))

(declare-datatypes ((Option!622 0))(
  ( (Some!621 (v!14469 B!1586)) (None!620) )
))
(declare-fun isDefined!419 (Option!622) Bool)

(declare-fun getValueByKey!571 (List!21600 (_ BitVec 64)) Option!622)

(assert (=> b!1017356 (= res!682381 (isDefined!419 (getValueByKey!571 l!1036 key!271)))))

(declare-fun b!1017357 () Bool)

(declare-fun ListPrimitiveSize!127 (List!21600) Int)

(assert (=> b!1017357 (= e!572370 (< (ListPrimitiveSize!127 l!1036) 0))))

(declare-fun b!1017358 () Bool)

(declare-fun tp_is_empty!23653 () Bool)

(declare-fun tp!70901 () Bool)

(assert (=> b!1017358 (= e!572369 (and tp_is_empty!23653 tp!70901))))

(assert (= (and start!88420 res!682382) b!1017356))

(assert (= (and b!1017356 res!682381) b!1017357))

(get-info :version)

(assert (= (and start!88420 ((_ is Cons!21596) l!1036)) b!1017358))

(declare-fun m!938221 () Bool)

(assert (=> start!88420 m!938221))

(declare-fun m!938223 () Bool)

(assert (=> b!1017356 m!938223))

(assert (=> b!1017356 m!938223))

(declare-fun m!938225 () Bool)

(assert (=> b!1017356 m!938225))

(declare-fun m!938227 () Bool)

(assert (=> b!1017357 m!938227))

(check-sat (not b!1017356) (not b!1017358) (not start!88420) (not b!1017357) tp_is_empty!23653)
(check-sat)
(get-model)

(declare-fun d!121481 () Bool)

(declare-fun res!682403 () Bool)

(declare-fun e!572393 () Bool)

(assert (=> d!121481 (=> res!682403 e!572393)))

(assert (=> d!121481 (= res!682403 (or ((_ is Nil!21597) l!1036) ((_ is Nil!21597) (t!30592 l!1036))))))

(assert (=> d!121481 (= (isStrictlySorted!632 l!1036) e!572393)))

(declare-fun b!1017389 () Bool)

(declare-fun e!572394 () Bool)

(assert (=> b!1017389 (= e!572393 e!572394)))

(declare-fun res!682404 () Bool)

(assert (=> b!1017389 (=> (not res!682404) (not e!572394))))

(assert (=> b!1017389 (= res!682404 (bvslt (_1!7701 (h!22794 l!1036)) (_1!7701 (h!22794 (t!30592 l!1036)))))))

(declare-fun b!1017390 () Bool)

(assert (=> b!1017390 (= e!572394 (isStrictlySorted!632 (t!30592 l!1036)))))

(assert (= (and d!121481 (not res!682403)) b!1017389))

(assert (= (and b!1017389 res!682404) b!1017390))

(declare-fun m!938245 () Bool)

(assert (=> b!1017390 m!938245))

(assert (=> start!88420 d!121481))

(declare-fun d!121487 () Bool)

(declare-fun lt!449265 () Int)

(assert (=> d!121487 (>= lt!449265 0)))

(declare-fun e!572402 () Int)

(assert (=> d!121487 (= lt!449265 e!572402)))

(declare-fun c!102980 () Bool)

(assert (=> d!121487 (= c!102980 ((_ is Nil!21597) l!1036))))

(assert (=> d!121487 (= (ListPrimitiveSize!127 l!1036) lt!449265)))

(declare-fun b!1017403 () Bool)

(assert (=> b!1017403 (= e!572402 0)))

(declare-fun b!1017404 () Bool)

(assert (=> b!1017404 (= e!572402 (+ 1 (ListPrimitiveSize!127 (t!30592 l!1036))))))

(assert (= (and d!121487 c!102980) b!1017403))

(assert (= (and d!121487 (not c!102980)) b!1017404))

(declare-fun m!938253 () Bool)

(assert (=> b!1017404 m!938253))

(assert (=> b!1017357 d!121487))

(declare-fun d!121495 () Bool)

(declare-fun isEmpty!914 (Option!622) Bool)

(assert (=> d!121495 (= (isDefined!419 (getValueByKey!571 l!1036 key!271)) (not (isEmpty!914 (getValueByKey!571 l!1036 key!271))))))

(declare-fun bs!29583 () Bool)

(assert (= bs!29583 d!121495))

(assert (=> bs!29583 m!938223))

(declare-fun m!938257 () Bool)

(assert (=> bs!29583 m!938257))

(assert (=> b!1017356 d!121495))

(declare-fun d!121499 () Bool)

(declare-fun c!102996 () Bool)

(assert (=> d!121499 (= c!102996 (and ((_ is Cons!21596) l!1036) (= (_1!7701 (h!22794 l!1036)) key!271)))))

(declare-fun e!572422 () Option!622)

(assert (=> d!121499 (= (getValueByKey!571 l!1036 key!271) e!572422)))

(declare-fun b!1017439 () Bool)

(assert (=> b!1017439 (= e!572422 (Some!621 (_2!7701 (h!22794 l!1036))))))

(declare-fun b!1017440 () Bool)

(declare-fun e!572423 () Option!622)

(assert (=> b!1017440 (= e!572422 e!572423)))

(declare-fun c!102997 () Bool)

(assert (=> b!1017440 (= c!102997 (and ((_ is Cons!21596) l!1036) (not (= (_1!7701 (h!22794 l!1036)) key!271))))))

(declare-fun b!1017441 () Bool)

(assert (=> b!1017441 (= e!572423 (getValueByKey!571 (t!30592 l!1036) key!271))))

(declare-fun b!1017442 () Bool)

(assert (=> b!1017442 (= e!572423 None!620)))

(assert (= (and d!121499 c!102996) b!1017439))

(assert (= (and d!121499 (not c!102996)) b!1017440))

(assert (= (and b!1017440 c!102997) b!1017441))

(assert (= (and b!1017440 (not c!102997)) b!1017442))

(declare-fun m!938263 () Bool)

(assert (=> b!1017441 m!938263))

(assert (=> b!1017356 d!121499))

(declare-fun b!1017462 () Bool)

(declare-fun e!572435 () Bool)

(declare-fun tp!70913 () Bool)

(assert (=> b!1017462 (= e!572435 (and tp_is_empty!23653 tp!70913))))

(assert (=> b!1017358 (= tp!70901 e!572435)))

(assert (= (and b!1017358 ((_ is Cons!21596) (t!30592 l!1036))) b!1017462))

(check-sat (not b!1017404) (not b!1017441) (not d!121495) (not b!1017390) (not b!1017462) tp_is_empty!23653)
(check-sat)
