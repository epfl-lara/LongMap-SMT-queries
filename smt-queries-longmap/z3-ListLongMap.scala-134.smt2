; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2370 () Bool)

(assert start!2370)

(declare-fun b_free!481 () Bool)

(declare-fun b_next!481 () Bool)

(assert (=> start!2370 (= b_free!481 (not b_next!481))))

(declare-fun tp!2516 () Bool)

(declare-fun b_and!897 () Bool)

(assert (=> start!2370 (= tp!2516 b_and!897)))

(declare-fun res!11591 () Bool)

(declare-fun e!9258 () Bool)

(assert (=> start!2370 (=> (not res!11591) (not e!9258))))

(declare-datatypes ((B!602 0))(
  ( (B!603 (val!399 Int)) )
))
(declare-datatypes ((tuple2!594 0))(
  ( (tuple2!595 (_1!297 (_ BitVec 64)) (_2!297 B!602)) )
))
(declare-datatypes ((List!456 0))(
  ( (Nil!453) (Cons!452 (h!1018 tuple2!594) (t!2864 List!456)) )
))
(declare-datatypes ((ListLongMap!425 0))(
  ( (ListLongMap!426 (toList!228 List!456)) )
))
(declare-fun lm!238 () ListLongMap!425)

(declare-fun p!262 () Int)

(declare-fun forall!107 (List!456 Int) Bool)

(assert (=> start!2370 (= res!11591 (forall!107 (toList!228 lm!238) p!262))))

(assert (=> start!2370 e!9258))

(declare-fun e!9259 () Bool)

(declare-fun inv!776 (ListLongMap!425) Bool)

(assert (=> start!2370 (and (inv!776 lm!238) e!9259)))

(assert (=> start!2370 tp!2516))

(assert (=> start!2370 true))

(declare-fun b!15279 () Bool)

(declare-fun res!11590 () Bool)

(assert (=> b!15279 (=> (not res!11590) (not e!9258))))

(declare-datatypes ((List!457 0))(
  ( (Nil!454) (Cons!453 (h!1019 (_ BitVec 64)) (t!2865 List!457)) )
))
(declare-fun l!1612 () List!457)

(declare-fun isEmpty!120 (List!457) Bool)

(assert (=> b!15279 (= res!11590 (not (isEmpty!120 l!1612)))))

(declare-fun b!15280 () Bool)

(assert (=> b!15280 (= e!9258 (not (not (= l!1612 Nil!454))))))

(declare-fun lt!3683 () (_ BitVec 64))

(declare-fun -!9 (ListLongMap!425 (_ BitVec 64)) ListLongMap!425)

(assert (=> b!15280 (forall!107 (toList!228 (-!9 lm!238 lt!3683)) p!262)))

(declare-datatypes ((Unit!292 0))(
  ( (Unit!293) )
))
(declare-fun lt!3684 () Unit!292)

(declare-fun removeValidProp!2 (ListLongMap!425 Int (_ BitVec 64)) Unit!292)

(assert (=> b!15280 (= lt!3684 (removeValidProp!2 lm!238 p!262 lt!3683))))

(declare-fun head!798 (List!457) (_ BitVec 64))

(assert (=> b!15280 (= lt!3683 (head!798 l!1612))))

(declare-fun b!15281 () Bool)

(declare-fun tp!2515 () Bool)

(assert (=> b!15281 (= e!9259 tp!2515)))

(assert (= (and start!2370 res!11591) b!15279))

(assert (= (and b!15279 res!11590) b!15280))

(assert (= start!2370 b!15281))

(declare-fun m!10161 () Bool)

(assert (=> start!2370 m!10161))

(declare-fun m!10163 () Bool)

(assert (=> start!2370 m!10163))

(declare-fun m!10165 () Bool)

(assert (=> b!15279 m!10165))

(declare-fun m!10167 () Bool)

(assert (=> b!15280 m!10167))

(declare-fun m!10169 () Bool)

(assert (=> b!15280 m!10169))

(declare-fun m!10171 () Bool)

(assert (=> b!15280 m!10171))

(declare-fun m!10173 () Bool)

(assert (=> b!15280 m!10173))

(check-sat (not b_next!481) b_and!897 (not b!15279) (not start!2370) (not b!15280) (not b!15281))
(check-sat b_and!897 (not b_next!481))
(get-model)

(declare-fun d!2571 () Bool)

(get-info :version)

(assert (=> d!2571 (= (isEmpty!120 l!1612) ((_ is Nil!454) l!1612))))

(assert (=> b!15279 d!2571))

(declare-fun d!2573 () Bool)

(declare-fun res!11618 () Bool)

(declare-fun e!9286 () Bool)

(assert (=> d!2573 (=> res!11618 e!9286)))

(assert (=> d!2573 (= res!11618 ((_ is Nil!453) (toList!228 lm!238)))))

(assert (=> d!2573 (= (forall!107 (toList!228 lm!238) p!262) e!9286)))

(declare-fun b!15314 () Bool)

(declare-fun e!9287 () Bool)

(assert (=> b!15314 (= e!9286 e!9287)))

(declare-fun res!11619 () Bool)

(assert (=> b!15314 (=> (not res!11619) (not e!9287))))

(declare-fun dynLambda!100 (Int tuple2!594) Bool)

(assert (=> b!15314 (= res!11619 (dynLambda!100 p!262 (h!1018 (toList!228 lm!238))))))

(declare-fun b!15315 () Bool)

(assert (=> b!15315 (= e!9287 (forall!107 (t!2864 (toList!228 lm!238)) p!262))))

(assert (= (and d!2573 (not res!11618)) b!15314))

(assert (= (and b!15314 res!11619) b!15315))

(declare-fun b_lambda!985 () Bool)

(assert (=> (not b_lambda!985) (not b!15314)))

(declare-fun t!2873 () Bool)

(declare-fun tb!401 () Bool)

(assert (=> (and start!2370 (= p!262 p!262) t!2873) tb!401))

(declare-fun result!713 () Bool)

(assert (=> tb!401 (= result!713 true)))

(assert (=> b!15314 t!2873))

(declare-fun b_and!905 () Bool)

(assert (= b_and!897 (and (=> t!2873 result!713) b_and!905)))

(declare-fun m!10207 () Bool)

(assert (=> b!15314 m!10207))

(declare-fun m!10209 () Bool)

(assert (=> b!15315 m!10209))

(assert (=> start!2370 d!2573))

(declare-fun d!2579 () Bool)

(declare-fun isStrictlySorted!131 (List!456) Bool)

(assert (=> d!2579 (= (inv!776 lm!238) (isStrictlySorted!131 (toList!228 lm!238)))))

(declare-fun bs!651 () Bool)

(assert (= bs!651 d!2579))

(declare-fun m!10215 () Bool)

(assert (=> bs!651 m!10215))

(assert (=> start!2370 d!2579))

(declare-fun d!2583 () Bool)

(declare-fun res!11622 () Bool)

(declare-fun e!9290 () Bool)

(assert (=> d!2583 (=> res!11622 e!9290)))

(assert (=> d!2583 (= res!11622 ((_ is Nil!453) (toList!228 (-!9 lm!238 lt!3683))))))

(assert (=> d!2583 (= (forall!107 (toList!228 (-!9 lm!238 lt!3683)) p!262) e!9290)))

(declare-fun b!15318 () Bool)

(declare-fun e!9291 () Bool)

(assert (=> b!15318 (= e!9290 e!9291)))

(declare-fun res!11623 () Bool)

(assert (=> b!15318 (=> (not res!11623) (not e!9291))))

(assert (=> b!15318 (= res!11623 (dynLambda!100 p!262 (h!1018 (toList!228 (-!9 lm!238 lt!3683)))))))

(declare-fun b!15319 () Bool)

(assert (=> b!15319 (= e!9291 (forall!107 (t!2864 (toList!228 (-!9 lm!238 lt!3683))) p!262))))

(assert (= (and d!2583 (not res!11622)) b!15318))

(assert (= (and b!15318 res!11623) b!15319))

(declare-fun b_lambda!989 () Bool)

(assert (=> (not b_lambda!989) (not b!15318)))

(declare-fun t!2877 () Bool)

(declare-fun tb!405 () Bool)

(assert (=> (and start!2370 (= p!262 p!262) t!2877) tb!405))

(declare-fun result!717 () Bool)

(assert (=> tb!405 (= result!717 true)))

(assert (=> b!15318 t!2877))

(declare-fun b_and!909 () Bool)

(assert (= b_and!905 (and (=> t!2877 result!717) b_and!909)))

(declare-fun m!10217 () Bool)

(assert (=> b!15318 m!10217))

(declare-fun m!10219 () Bool)

(assert (=> b!15319 m!10219))

(assert (=> b!15280 d!2583))

(declare-fun d!2585 () Bool)

(declare-fun lt!3705 () ListLongMap!425)

(declare-fun contains!192 (ListLongMap!425 (_ BitVec 64)) Bool)

(assert (=> d!2585 (not (contains!192 lt!3705 lt!3683))))

(declare-fun removeStrictlySorted!6 (List!456 (_ BitVec 64)) List!456)

(assert (=> d!2585 (= lt!3705 (ListLongMap!426 (removeStrictlySorted!6 (toList!228 lm!238) lt!3683)))))

(assert (=> d!2585 (= (-!9 lm!238 lt!3683) lt!3705)))

(declare-fun bs!654 () Bool)

(assert (= bs!654 d!2585))

(declare-fun m!10229 () Bool)

(assert (=> bs!654 m!10229))

(declare-fun m!10231 () Bool)

(assert (=> bs!654 m!10231))

(assert (=> b!15280 d!2585))

(declare-fun d!2591 () Bool)

(assert (=> d!2591 (forall!107 (toList!228 (-!9 lm!238 lt!3683)) p!262)))

(declare-fun lt!3714 () Unit!292)

(declare-fun choose!172 (ListLongMap!425 Int (_ BitVec 64)) Unit!292)

(assert (=> d!2591 (= lt!3714 (choose!172 lm!238 p!262 lt!3683))))

(assert (=> d!2591 (forall!107 (toList!228 lm!238) p!262)))

(assert (=> d!2591 (= (removeValidProp!2 lm!238 p!262 lt!3683) lt!3714)))

(declare-fun bs!659 () Bool)

(assert (= bs!659 d!2591))

(assert (=> bs!659 m!10167))

(assert (=> bs!659 m!10169))

(declare-fun m!10249 () Bool)

(assert (=> bs!659 m!10249))

(assert (=> bs!659 m!10161))

(assert (=> b!15280 d!2591))

(declare-fun d!2609 () Bool)

(assert (=> d!2609 (= (head!798 l!1612) (h!1019 l!1612))))

(assert (=> b!15280 d!2609))

(declare-fun b!15338 () Bool)

(declare-fun e!9304 () Bool)

(declare-fun tp_is_empty!779 () Bool)

(declare-fun tp!2537 () Bool)

(assert (=> b!15338 (= e!9304 (and tp_is_empty!779 tp!2537))))

(assert (=> b!15281 (= tp!2515 e!9304)))

(assert (= (and b!15281 ((_ is Cons!452) (toList!228 lm!238))) b!15338))

(declare-fun b_lambda!1003 () Bool)

(assert (= b_lambda!985 (or (and start!2370 b_free!481) b_lambda!1003)))

(declare-fun b_lambda!1005 () Bool)

(assert (= b_lambda!989 (or (and start!2370 b_free!481) b_lambda!1005)))

(check-sat (not b!15338) (not b_lambda!1005) (not d!2579) (not d!2585) (not b!15315) (not b!15319) tp_is_empty!779 (not d!2591) (not b_next!481) (not b_lambda!1003) b_and!909)
(check-sat b_and!909 (not b_next!481))
