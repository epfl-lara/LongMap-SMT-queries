; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2462 () Bool)

(assert start!2462)

(declare-fun b_free!501 () Bool)

(declare-fun b_next!501 () Bool)

(assert (=> start!2462 (= b_free!501 (not b_next!501))))

(declare-fun tp!2594 () Bool)

(declare-fun b_and!941 () Bool)

(assert (=> start!2462 (= tp!2594 b_and!941)))

(declare-fun res!11695 () Bool)

(declare-fun e!9389 () Bool)

(assert (=> start!2462 (=> (not res!11695) (not e!9389))))

(declare-datatypes ((B!622 0))(
  ( (B!623 (val!409 Int)) )
))
(declare-datatypes ((tuple2!618 0))(
  ( (tuple2!619 (_1!309 (_ BitVec 64)) (_2!309 B!622)) )
))
(declare-datatypes ((List!480 0))(
  ( (Nil!477) (Cons!476 (h!1042 tuple2!618) (t!2912 List!480)) )
))
(declare-datatypes ((ListLongMap!449 0))(
  ( (ListLongMap!450 (toList!240 List!480)) )
))
(declare-fun lm!238 () ListLongMap!449)

(declare-fun p!262 () Int)

(declare-fun forall!117 (List!480 Int) Bool)

(assert (=> start!2462 (= res!11695 (forall!117 (toList!240 lm!238) p!262))))

(assert (=> start!2462 e!9389))

(declare-fun e!9388 () Bool)

(declare-fun inv!801 (ListLongMap!449) Bool)

(assert (=> start!2462 (and (inv!801 lm!238) e!9388)))

(assert (=> start!2462 tp!2594))

(assert (=> start!2462 true))

(declare-fun b!15448 () Bool)

(declare-datatypes ((List!481 0))(
  ( (Nil!478) (Cons!477 (h!1043 (_ BitVec 64)) (t!2913 List!481)) )
))
(declare-fun l!1612 () List!481)

(declare-fun ListPrimitiveSize!29 (List!481) Int)

(assert (=> b!15448 (= e!9389 (< (ListPrimitiveSize!29 l!1612) 0))))

(declare-fun b!15449 () Bool)

(declare-fun tp!2593 () Bool)

(assert (=> b!15449 (= e!9388 tp!2593)))

(assert (= (and start!2462 res!11695) b!15448))

(assert (= start!2462 b!15449))

(declare-fun m!10397 () Bool)

(assert (=> start!2462 m!10397))

(declare-fun m!10399 () Bool)

(assert (=> start!2462 m!10399))

(declare-fun m!10401 () Bool)

(assert (=> b!15448 m!10401))

(check-sat (not start!2462) (not b!15448) (not b!15449) (not b_next!501) b_and!941)
(check-sat b_and!941 (not b_next!501))
(get-model)

(declare-fun d!2667 () Bool)

(declare-fun lt!3774 () Int)

(assert (=> d!2667 (>= lt!3774 0)))

(declare-fun e!9407 () Int)

(assert (=> d!2667 (= lt!3774 e!9407)))

(declare-fun c!1457 () Bool)

(get-info :version)

(assert (=> d!2667 (= c!1457 ((_ is Nil!478) l!1612))))

(assert (=> d!2667 (= (ListPrimitiveSize!29 l!1612) lt!3774)))

(declare-fun b!15472 () Bool)

(assert (=> b!15472 (= e!9407 0)))

(declare-fun b!15473 () Bool)

(assert (=> b!15473 (= e!9407 (+ 1 (ListPrimitiveSize!29 (t!2913 l!1612))))))

(assert (= (and d!2667 c!1457) b!15472))

(assert (= (and d!2667 (not c!1457)) b!15473))

(declare-fun m!10417 () Bool)

(assert (=> b!15473 m!10417))

(assert (=> b!15448 d!2667))

(declare-fun d!2675 () Bool)

(declare-fun res!11713 () Bool)

(declare-fun e!9422 () Bool)

(assert (=> d!2675 (=> res!11713 e!9422)))

(assert (=> d!2675 (= res!11713 ((_ is Nil!477) (toList!240 lm!238)))))

(assert (=> d!2675 (= (forall!117 (toList!240 lm!238) p!262) e!9422)))

(declare-fun b!15493 () Bool)

(declare-fun e!9424 () Bool)

(assert (=> b!15493 (= e!9422 e!9424)))

(declare-fun res!11715 () Bool)

(assert (=> b!15493 (=> (not res!11715) (not e!9424))))

(declare-fun dynLambda!106 (Int tuple2!618) Bool)

(assert (=> b!15493 (= res!11715 (dynLambda!106 p!262 (h!1042 (toList!240 lm!238))))))

(declare-fun b!15495 () Bool)

(assert (=> b!15495 (= e!9424 (forall!117 (t!2912 (toList!240 lm!238)) p!262))))

(assert (= (and d!2675 (not res!11713)) b!15493))

(assert (= (and b!15493 res!11715) b!15495))

(declare-fun b_lambda!1036 () Bool)

(assert (=> (not b_lambda!1036) (not b!15493)))

(declare-fun t!2920 () Bool)

(declare-fun tb!425 () Bool)

(assert (=> (and start!2462 (= p!262 p!262) t!2920) tb!425))

(declare-fun result!752 () Bool)

(assert (=> tb!425 (= result!752 true)))

(assert (=> b!15493 t!2920))

(declare-fun b_and!948 () Bool)

(assert (= b_and!941 (and (=> t!2920 result!752) b_and!948)))

(declare-fun m!10422 () Bool)

(assert (=> b!15493 m!10422))

(declare-fun m!10426 () Bool)

(assert (=> b!15495 m!10426))

(assert (=> start!2462 d!2675))

(declare-fun d!2678 () Bool)

(declare-fun isStrictlySorted!144 (List!480) Bool)

(assert (=> d!2678 (= (inv!801 lm!238) (isStrictlySorted!144 (toList!240 lm!238)))))

(declare-fun bs!679 () Bool)

(assert (= bs!679 d!2678))

(declare-fun m!10429 () Bool)

(assert (=> bs!679 m!10429))

(assert (=> start!2462 d!2678))

(declare-fun b!15505 () Bool)

(declare-fun e!9430 () Bool)

(declare-fun tp_is_empty!791 () Bool)

(declare-fun tp!2608 () Bool)

(assert (=> b!15505 (= e!9430 (and tp_is_empty!791 tp!2608))))

(assert (=> b!15449 (= tp!2593 e!9430)))

(assert (= (and b!15449 ((_ is Cons!476) (toList!240 lm!238))) b!15505))

(declare-fun b_lambda!1039 () Bool)

(assert (= b_lambda!1036 (or (and start!2462 b_free!501) b_lambda!1039)))

(check-sat (not b!15495) (not b!15505) b_and!948 tp_is_empty!791 (not b_next!501) (not d!2678) (not b_lambda!1039) (not b!15473))
(check-sat b_and!948 (not b_next!501))
