; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2374 () Bool)

(assert start!2374)

(declare-fun b_free!485 () Bool)

(declare-fun b_next!485 () Bool)

(assert (=> start!2374 (= b_free!485 (not b_next!485))))

(declare-fun tp!2528 () Bool)

(declare-fun b_and!901 () Bool)

(assert (=> start!2374 (= tp!2528 b_and!901)))

(declare-fun res!11605 () Bool)

(declare-fun e!9275 () Bool)

(assert (=> start!2374 (=> (not res!11605) (not e!9275))))

(declare-datatypes ((B!606 0))(
  ( (B!607 (val!401 Int)) )
))
(declare-datatypes ((tuple2!598 0))(
  ( (tuple2!599 (_1!299 (_ BitVec 64)) (_2!299 B!606)) )
))
(declare-datatypes ((List!460 0))(
  ( (Nil!457) (Cons!456 (h!1022 tuple2!598) (t!2868 List!460)) )
))
(declare-datatypes ((ListLongMap!429 0))(
  ( (ListLongMap!430 (toList!230 List!460)) )
))
(declare-fun lm!238 () ListLongMap!429)

(declare-fun p!262 () Int)

(declare-fun forall!109 (List!460 Int) Bool)

(assert (=> start!2374 (= res!11605 (forall!109 (toList!230 lm!238) p!262))))

(assert (=> start!2374 e!9275))

(declare-fun e!9274 () Bool)

(declare-fun inv!778 (ListLongMap!429) Bool)

(assert (=> start!2374 (and (inv!778 lm!238) e!9274)))

(assert (=> start!2374 tp!2528))

(assert (=> start!2374 true))

(declare-fun b!15303 () Bool)

(declare-fun res!11604 () Bool)

(assert (=> b!15303 (=> (not res!11604) (not e!9275))))

(declare-datatypes ((List!461 0))(
  ( (Nil!458) (Cons!457 (h!1023 (_ BitVec 64)) (t!2869 List!461)) )
))
(declare-fun l!1612 () List!461)

(declare-fun isEmpty!122 (List!461) Bool)

(assert (=> b!15303 (= res!11604 (not (isEmpty!122 l!1612)))))

(declare-fun b!15304 () Bool)

(assert (=> b!15304 (= e!9275 (not (not (= l!1612 Nil!458))))))

(declare-fun lt!3696 () (_ BitVec 64))

(declare-fun -!11 (ListLongMap!429 (_ BitVec 64)) ListLongMap!429)

(assert (=> b!15304 (forall!109 (toList!230 (-!11 lm!238 lt!3696)) p!262)))

(declare-datatypes ((Unit!296 0))(
  ( (Unit!297) )
))
(declare-fun lt!3695 () Unit!296)

(declare-fun removeValidProp!4 (ListLongMap!429 Int (_ BitVec 64)) Unit!296)

(assert (=> b!15304 (= lt!3695 (removeValidProp!4 lm!238 p!262 lt!3696))))

(declare-fun head!802 (List!461) (_ BitVec 64))

(assert (=> b!15304 (= lt!3696 (head!802 l!1612))))

(declare-fun b!15305 () Bool)

(declare-fun tp!2527 () Bool)

(assert (=> b!15305 (= e!9274 tp!2527)))

(assert (= (and start!2374 res!11605) b!15303))

(assert (= (and b!15303 res!11604) b!15304))

(assert (= start!2374 b!15305))

(declare-fun m!10189 () Bool)

(assert (=> start!2374 m!10189))

(declare-fun m!10191 () Bool)

(assert (=> start!2374 m!10191))

(declare-fun m!10193 () Bool)

(assert (=> b!15303 m!10193))

(declare-fun m!10195 () Bool)

(assert (=> b!15304 m!10195))

(declare-fun m!10197 () Bool)

(assert (=> b!15304 m!10197))

(declare-fun m!10199 () Bool)

(assert (=> b!15304 m!10199))

(declare-fun m!10201 () Bool)

(assert (=> b!15304 m!10201))

(push 1)

(assert (not b_next!485))

(assert (not b!15303))

(assert (not b!15304))

(assert (not start!2374))

(assert (not b!15305))

(assert b_and!901)

(check-sat)

(pop 1)

(push 1)

(assert b_and!901)

(assert (not b_next!485))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!2573 () Bool)

(declare-fun res!11610 () Bool)

(declare-fun e!9280 () Bool)

(assert (=> d!2573 (=> res!11610 e!9280)))

(assert (=> d!2573 (= res!11610 (is-Nil!457 (toList!230 (-!11 lm!238 lt!3696))))))

(assert (=> d!2573 (= (forall!109 (toList!230 (-!11 lm!238 lt!3696)) p!262) e!9280)))

(declare-fun b!15310 () Bool)

(declare-fun e!9281 () Bool)

(assert (=> b!15310 (= e!9280 e!9281)))

(declare-fun res!11611 () Bool)

(assert (=> b!15310 (=> (not res!11611) (not e!9281))))

(declare-fun dynLambda!98 (Int tuple2!598) Bool)

(assert (=> b!15310 (= res!11611 (dynLambda!98 p!262 (h!1022 (toList!230 (-!11 lm!238 lt!3696)))))))

(declare-fun b!15311 () Bool)

(assert (=> b!15311 (= e!9281 (forall!109 (t!2868 (toList!230 (-!11 lm!238 lt!3696))) p!262))))

(assert (= (and d!2573 (not res!11610)) b!15310))

(assert (= (and b!15310 res!11611) b!15311))

(declare-fun b_lambda!983 () Bool)

(assert (=> (not b_lambda!983) (not b!15310)))

(declare-fun t!2871 () Bool)

(declare-fun tb!399 () Bool)

(assert (=> (and start!2374 (= p!262 p!262) t!2871) tb!399))

(declare-fun result!711 () Bool)

(assert (=> tb!399 (= result!711 true)))

(assert (=> b!15310 t!2871))

(declare-fun b_and!903 () Bool)

(assert (= b_and!901 (and (=> t!2871 result!711) b_and!903)))

(declare-fun m!10203 () Bool)

(assert (=> b!15310 m!10203))

(declare-fun m!10205 () Bool)

(assert (=> b!15311 m!10205))

(assert (=> b!15304 d!2573))

(declare-fun d!2581 () Bool)

(declare-fun lt!3699 () ListLongMap!429)

(declare-fun contains!190 (ListLongMap!429 (_ BitVec 64)) Bool)

(assert (=> d!2581 (not (contains!190 lt!3699 lt!3696))))

(declare-fun removeStrictlySorted!4 (List!460 (_ BitVec 64)) List!460)

(assert (=> d!2581 (= lt!3699 (ListLongMap!430 (removeStrictlySorted!4 (toList!230 lm!238) lt!3696)))))

(assert (=> d!2581 (= (-!11 lm!238 lt!3696) lt!3699)))

(declare-fun bs!652 () Bool)

(assert (= bs!652 d!2581))

(declare-fun m!10217 () Bool)

(assert (=> bs!652 m!10217))

(declare-fun m!10219 () Bool)

(assert (=> bs!652 m!10219))

(assert (=> b!15304 d!2581))

(declare-fun d!2589 () Bool)

(assert (=> d!2589 (forall!109 (toList!230 (-!11 lm!238 lt!3696)) p!262)))

(declare-fun lt!3702 () Unit!296)

(declare-fun choose!168 (ListLongMap!429 Int (_ BitVec 64)) Unit!296)

(assert (=> d!2589 (= lt!3702 (choose!168 lm!238 p!262 lt!3696))))

(assert (=> d!2589 (forall!109 (toList!230 lm!238) p!262)))

(assert (=> d!2589 (= (removeValidProp!4 lm!238 p!262 lt!3696) lt!3702)))

(declare-fun bs!653 () Bool)

(assert (= bs!653 d!2589))

(assert (=> bs!653 m!10195))

(assert (=> bs!653 m!10197))

(declare-fun m!10225 () Bool)

(assert (=> bs!653 m!10225))

(assert (=> bs!653 m!10189))

(assert (=> b!15304 d!2589))

(declare-fun d!2593 () Bool)

(assert (=> d!2593 (= (head!802 l!1612) (h!1023 l!1612))))

(assert (=> b!15304 d!2593))

(declare-fun d!2595 () Bool)

(declare-fun res!11626 () Bool)

(declare-fun e!9296 () Bool)

(assert (=> d!2595 (=> res!11626 e!9296)))

(assert (=> d!2595 (= res!11626 (is-Nil!457 (toList!230 lm!238)))))

(assert (=> d!2595 (= (forall!109 (toList!230 lm!238) p!262) e!9296)))

(declare-fun b!15326 () Bool)

(declare-fun e!9297 () Bool)

(assert (=> b!15326 (= e!9296 e!9297)))

(declare-fun res!11627 () Bool)

(assert (=> b!15326 (=> (not res!11627) (not e!9297))))

(assert (=> b!15326 (= res!11627 (dynLambda!98 p!262 (h!1022 (toList!230 lm!238))))))

(declare-fun b!15327 () Bool)

(assert (=> b!15327 (= e!9297 (forall!109 (t!2868 (toList!230 lm!238)) p!262))))

(assert (= (and d!2595 (not res!11626)) b!15326))

(assert (= (and b!15326 res!11627) b!15327))

(declare-fun b_lambda!991 () Bool)

(assert (=> (not b_lambda!991) (not b!15326)))

(declare-fun t!2879 () Bool)

(declare-fun tb!407 () Bool)

(assert (=> (and start!2374 (= p!262 p!262) t!2879) tb!407))

(declare-fun result!719 () Bool)

(assert (=> tb!407 (= result!719 true)))

(assert (=> b!15326 t!2879))

(declare-fun b_and!911 () Bool)

(assert (= b_and!903 (and (=> t!2879 result!719) b_and!911)))

(declare-fun m!10231 () Bool)

(assert (=> b!15326 m!10231))

(declare-fun m!10233 () Bool)

(assert (=> b!15327 m!10233))

(assert (=> start!2374 d!2595))

(declare-fun d!2599 () Bool)

(declare-fun isStrictlySorted!134 (List!460) Bool)

(assert (=> d!2599 (= (inv!778 lm!238) (isStrictlySorted!134 (toList!230 lm!238)))))

(declare-fun bs!655 () Bool)

(assert (= bs!655 d!2599))

(declare-fun m!10235 () Bool)

(assert (=> bs!655 m!10235))

(assert (=> start!2374 d!2599))

(declare-fun d!2601 () Bool)

(assert (=> d!2601 (= (isEmpty!122 l!1612) (is-Nil!458 l!1612))))

(assert (=> b!15303 d!2601))

(declare-fun b!15332 () Bool)

(declare-fun e!9300 () Bool)

(declare-fun tp_is_empty!775 () Bool)

(declare-fun tp!2531 () Bool)

(assert (=> b!15332 (= e!9300 (and tp_is_empty!775 tp!2531))))

(assert (=> b!15305 (= tp!2527 e!9300)))

(assert (= (and b!15305 (is-Cons!456 (toList!230 lm!238))) b!15332))

(declare-fun b_lambda!993 () Bool)

(assert (= b_lambda!983 (or (and start!2374 b_free!485) b_lambda!993)))

(declare-fun b_lambda!995 () Bool)

(assert (= b_lambda!991 (or (and start!2374 b_free!485) b_lambda!995)))

(push 1)

(assert (not b_next!485))

(assert (not b!15327))

(assert (not b!15311))

(assert (not d!2589))

(assert (not b!15332))

(assert tp_is_empty!775)

(assert (not b_lambda!993))

(assert (not d!2599))

(assert (not d!2581))

(assert b_and!911)

(assert (not b_lambda!995))

(check-sat)

(pop 1)

(push 1)

(assert b_and!911)

(assert (not b_next!485))

(check-sat)

(pop 1)

