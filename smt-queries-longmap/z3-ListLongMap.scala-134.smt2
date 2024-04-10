; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2372 () Bool)

(assert start!2372)

(declare-fun b_free!483 () Bool)

(declare-fun b_next!483 () Bool)

(assert (=> start!2372 (= b_free!483 (not b_next!483))))

(declare-fun tp!2521 () Bool)

(declare-fun b_and!899 () Bool)

(assert (=> start!2372 (= tp!2521 b_and!899)))

(declare-fun res!11599 () Bool)

(declare-fun e!9269 () Bool)

(assert (=> start!2372 (=> (not res!11599) (not e!9269))))

(declare-datatypes ((B!604 0))(
  ( (B!605 (val!400 Int)) )
))
(declare-datatypes ((tuple2!600 0))(
  ( (tuple2!601 (_1!300 (_ BitVec 64)) (_2!300 B!604)) )
))
(declare-datatypes ((List!462 0))(
  ( (Nil!459) (Cons!458 (h!1024 tuple2!600) (t!2870 List!462)) )
))
(declare-datatypes ((ListLongMap!431 0))(
  ( (ListLongMap!432 (toList!231 List!462)) )
))
(declare-fun lm!238 () ListLongMap!431)

(declare-fun p!262 () Int)

(declare-fun forall!108 (List!462 Int) Bool)

(assert (=> start!2372 (= res!11599 (forall!108 (toList!231 lm!238) p!262))))

(assert (=> start!2372 e!9269))

(declare-fun e!9268 () Bool)

(declare-fun inv!777 (ListLongMap!431) Bool)

(assert (=> start!2372 (and (inv!777 lm!238) e!9268)))

(assert (=> start!2372 tp!2521))

(assert (=> start!2372 true))

(declare-fun b!15294 () Bool)

(declare-fun res!11598 () Bool)

(assert (=> b!15294 (=> (not res!11598) (not e!9269))))

(declare-datatypes ((List!463 0))(
  ( (Nil!460) (Cons!459 (h!1025 (_ BitVec 64)) (t!2871 List!463)) )
))
(declare-fun l!1612 () List!463)

(declare-fun isEmpty!121 (List!463) Bool)

(assert (=> b!15294 (= res!11598 (not (isEmpty!121 l!1612)))))

(declare-fun b!15295 () Bool)

(assert (=> b!15295 (= e!9269 (not (not (= l!1612 Nil!460))))))

(declare-fun lt!3690 () (_ BitVec 64))

(declare-fun -!10 (ListLongMap!431 (_ BitVec 64)) ListLongMap!431)

(assert (=> b!15295 (forall!108 (toList!231 (-!10 lm!238 lt!3690)) p!262)))

(declare-datatypes ((Unit!284 0))(
  ( (Unit!285) )
))
(declare-fun lt!3689 () Unit!284)

(declare-fun removeValidProp!3 (ListLongMap!431 Int (_ BitVec 64)) Unit!284)

(assert (=> b!15295 (= lt!3689 (removeValidProp!3 lm!238 p!262 lt!3690))))

(declare-fun head!801 (List!463) (_ BitVec 64))

(assert (=> b!15295 (= lt!3690 (head!801 l!1612))))

(declare-fun b!15296 () Bool)

(declare-fun tp!2522 () Bool)

(assert (=> b!15296 (= e!9268 tp!2522)))

(assert (= (and start!2372 res!11599) b!15294))

(assert (= (and b!15294 res!11598) b!15295))

(assert (= start!2372 b!15296))

(declare-fun m!10183 () Bool)

(assert (=> start!2372 m!10183))

(declare-fun m!10185 () Bool)

(assert (=> start!2372 m!10185))

(declare-fun m!10187 () Bool)

(assert (=> b!15294 m!10187))

(declare-fun m!10189 () Bool)

(assert (=> b!15295 m!10189))

(declare-fun m!10191 () Bool)

(assert (=> b!15295 m!10191))

(declare-fun m!10193 () Bool)

(assert (=> b!15295 m!10193))

(declare-fun m!10195 () Bool)

(assert (=> b!15295 m!10195))

(check-sat (not b!15295) (not b_next!483) (not b!15294) (not b!15296) (not start!2372) b_and!899)
(check-sat b_and!899 (not b_next!483))
(get-model)

(declare-fun d!2577 () Bool)

(declare-fun res!11622 () Bool)

(declare-fun e!9292 () Bool)

(assert (=> d!2577 (=> res!11622 e!9292)))

(get-info :version)

(assert (=> d!2577 (= res!11622 ((_ is Nil!459) (toList!231 (-!10 lm!238 lt!3690))))))

(assert (=> d!2577 (= (forall!108 (toList!231 (-!10 lm!238 lt!3690)) p!262) e!9292)))

(declare-fun b!15322 () Bool)

(declare-fun e!9293 () Bool)

(assert (=> b!15322 (= e!9292 e!9293)))

(declare-fun res!11623 () Bool)

(assert (=> b!15322 (=> (not res!11623) (not e!9293))))

(declare-fun dynLambda!99 (Int tuple2!600) Bool)

(assert (=> b!15322 (= res!11623 (dynLambda!99 p!262 (h!1024 (toList!231 (-!10 lm!238 lt!3690)))))))

(declare-fun b!15323 () Bool)

(assert (=> b!15323 (= e!9293 (forall!108 (t!2870 (toList!231 (-!10 lm!238 lt!3690))) p!262))))

(assert (= (and d!2577 (not res!11622)) b!15322))

(assert (= (and b!15322 res!11623) b!15323))

(declare-fun b_lambda!987 () Bool)

(assert (=> (not b_lambda!987) (not b!15322)))

(declare-fun t!2879 () Bool)

(declare-fun tb!403 () Bool)

(assert (=> (and start!2372 (= p!262 p!262) t!2879) tb!403))

(declare-fun result!715 () Bool)

(assert (=> tb!403 (= result!715 true)))

(assert (=> b!15322 t!2879))

(declare-fun b_and!907 () Bool)

(assert (= b_and!899 (and (=> t!2879 result!715) b_and!907)))

(declare-fun m!10219 () Bool)

(assert (=> b!15322 m!10219))

(declare-fun m!10221 () Bool)

(assert (=> b!15323 m!10221))

(assert (=> b!15295 d!2577))

(declare-fun d!2583 () Bool)

(declare-fun lt!3702 () ListLongMap!431)

(declare-fun contains!192 (ListLongMap!431 (_ BitVec 64)) Bool)

(assert (=> d!2583 (not (contains!192 lt!3702 lt!3690))))

(declare-fun removeStrictlySorted!4 (List!462 (_ BitVec 64)) List!462)

(assert (=> d!2583 (= lt!3702 (ListLongMap!432 (removeStrictlySorted!4 (toList!231 lm!238) lt!3690)))))

(assert (=> d!2583 (= (-!10 lm!238 lt!3690) lt!3702)))

(declare-fun bs!653 () Bool)

(assert (= bs!653 d!2583))

(declare-fun m!10231 () Bool)

(assert (=> bs!653 m!10231))

(declare-fun m!10235 () Bool)

(assert (=> bs!653 m!10235))

(assert (=> b!15295 d!2583))

(declare-fun d!2591 () Bool)

(assert (=> d!2591 (forall!108 (toList!231 (-!10 lm!238 lt!3690)) p!262)))

(declare-fun lt!3710 () Unit!284)

(declare-fun choose!168 (ListLongMap!431 Int (_ BitVec 64)) Unit!284)

(assert (=> d!2591 (= lt!3710 (choose!168 lm!238 p!262 lt!3690))))

(assert (=> d!2591 (forall!108 (toList!231 lm!238) p!262)))

(assert (=> d!2591 (= (removeValidProp!3 lm!238 p!262 lt!3690) lt!3710)))

(declare-fun bs!655 () Bool)

(assert (= bs!655 d!2591))

(assert (=> bs!655 m!10189))

(assert (=> bs!655 m!10191))

(declare-fun m!10241 () Bool)

(assert (=> bs!655 m!10241))

(assert (=> bs!655 m!10183))

(assert (=> b!15295 d!2591))

(declare-fun d!2595 () Bool)

(assert (=> d!2595 (= (head!801 l!1612) (h!1025 l!1612))))

(assert (=> b!15295 d!2595))

(declare-fun d!2599 () Bool)

(declare-fun res!11626 () Bool)

(declare-fun e!9296 () Bool)

(assert (=> d!2599 (=> res!11626 e!9296)))

(assert (=> d!2599 (= res!11626 ((_ is Nil!459) (toList!231 lm!238)))))

(assert (=> d!2599 (= (forall!108 (toList!231 lm!238) p!262) e!9296)))

(declare-fun b!15326 () Bool)

(declare-fun e!9297 () Bool)

(assert (=> b!15326 (= e!9296 e!9297)))

(declare-fun res!11627 () Bool)

(assert (=> b!15326 (=> (not res!11627) (not e!9297))))

(assert (=> b!15326 (= res!11627 (dynLambda!99 p!262 (h!1024 (toList!231 lm!238))))))

(declare-fun b!15327 () Bool)

(assert (=> b!15327 (= e!9297 (forall!108 (t!2870 (toList!231 lm!238)) p!262))))

(assert (= (and d!2599 (not res!11626)) b!15326))

(assert (= (and b!15326 res!11627) b!15327))

(declare-fun b_lambda!991 () Bool)

(assert (=> (not b_lambda!991) (not b!15326)))

(declare-fun t!2883 () Bool)

(declare-fun tb!407 () Bool)

(assert (=> (and start!2372 (= p!262 p!262) t!2883) tb!407))

(declare-fun result!719 () Bool)

(assert (=> tb!407 (= result!719 true)))

(assert (=> b!15326 t!2883))

(declare-fun b_and!911 () Bool)

(assert (= b_and!907 (and (=> t!2883 result!719) b_and!911)))

(declare-fun m!10245 () Bool)

(assert (=> b!15326 m!10245))

(declare-fun m!10247 () Bool)

(assert (=> b!15327 m!10247))

(assert (=> start!2372 d!2599))

(declare-fun d!2603 () Bool)

(declare-fun isStrictlySorted!139 (List!462) Bool)

(assert (=> d!2603 (= (inv!777 lm!238) (isStrictlySorted!139 (toList!231 lm!238)))))

(declare-fun bs!657 () Bool)

(assert (= bs!657 d!2603))

(declare-fun m!10253 () Bool)

(assert (=> bs!657 m!10253))

(assert (=> start!2372 d!2603))

(declare-fun d!2607 () Bool)

(assert (=> d!2607 (= (isEmpty!121 l!1612) ((_ is Nil!460) l!1612))))

(assert (=> b!15294 d!2607))

(declare-fun b!15338 () Bool)

(declare-fun e!9304 () Bool)

(declare-fun tp_is_empty!777 () Bool)

(declare-fun tp!2533 () Bool)

(assert (=> b!15338 (= e!9304 (and tp_is_empty!777 tp!2533))))

(assert (=> b!15296 (= tp!2522 e!9304)))

(assert (= (and b!15296 ((_ is Cons!458) (toList!231 lm!238))) b!15338))

(declare-fun b_lambda!996 () Bool)

(assert (= b_lambda!991 (or (and start!2372 b_free!483) b_lambda!996)))

(declare-fun b_lambda!1000 () Bool)

(assert (= b_lambda!987 (or (and start!2372 b_free!483) b_lambda!1000)))

(check-sat (not d!2583) (not b_lambda!996) tp_is_empty!777 (not b_lambda!1000) (not d!2591) (not b_next!483) (not b!15323) b_and!911 (not b!15327) (not b!15338) (not d!2603))
(check-sat b_and!911 (not b_next!483))
