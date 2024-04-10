; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2370 () Bool)

(assert start!2370)

(declare-fun b_free!481 () Bool)

(declare-fun b_next!481 () Bool)

(assert (=> start!2370 (= b_free!481 (not b_next!481))))

(declare-fun tp!2515 () Bool)

(declare-fun b_and!897 () Bool)

(assert (=> start!2370 (= tp!2515 b_and!897)))

(declare-fun res!11592 () Bool)

(declare-fun e!9263 () Bool)

(assert (=> start!2370 (=> (not res!11592) (not e!9263))))

(declare-datatypes ((B!602 0))(
  ( (B!603 (val!399 Int)) )
))
(declare-datatypes ((tuple2!598 0))(
  ( (tuple2!599 (_1!299 (_ BitVec 64)) (_2!299 B!602)) )
))
(declare-datatypes ((List!460 0))(
  ( (Nil!457) (Cons!456 (h!1022 tuple2!598) (t!2868 List!460)) )
))
(declare-datatypes ((ListLongMap!429 0))(
  ( (ListLongMap!430 (toList!230 List!460)) )
))
(declare-fun lm!238 () ListLongMap!429)

(declare-fun p!262 () Int)

(declare-fun forall!107 (List!460 Int) Bool)

(assert (=> start!2370 (= res!11592 (forall!107 (toList!230 lm!238) p!262))))

(assert (=> start!2370 e!9263))

(declare-fun e!9262 () Bool)

(declare-fun inv!776 (ListLongMap!429) Bool)

(assert (=> start!2370 (and (inv!776 lm!238) e!9262)))

(assert (=> start!2370 tp!2515))

(assert (=> start!2370 true))

(declare-fun b!15285 () Bool)

(declare-fun res!11593 () Bool)

(assert (=> b!15285 (=> (not res!11593) (not e!9263))))

(declare-datatypes ((List!461 0))(
  ( (Nil!458) (Cons!457 (h!1023 (_ BitVec 64)) (t!2869 List!461)) )
))
(declare-fun l!1612 () List!461)

(declare-fun isEmpty!120 (List!461) Bool)

(assert (=> b!15285 (= res!11593 (not (isEmpty!120 l!1612)))))

(declare-fun b!15286 () Bool)

(assert (=> b!15286 (= e!9263 (not (not (= l!1612 Nil!458))))))

(declare-fun lt!3683 () (_ BitVec 64))

(declare-fun -!9 (ListLongMap!429 (_ BitVec 64)) ListLongMap!429)

(assert (=> b!15286 (forall!107 (toList!230 (-!9 lm!238 lt!3683)) p!262)))

(declare-datatypes ((Unit!282 0))(
  ( (Unit!283) )
))
(declare-fun lt!3684 () Unit!282)

(declare-fun removeValidProp!2 (ListLongMap!429 Int (_ BitVec 64)) Unit!282)

(assert (=> b!15286 (= lt!3684 (removeValidProp!2 lm!238 p!262 lt!3683))))

(declare-fun head!800 (List!461) (_ BitVec 64))

(assert (=> b!15286 (= lt!3683 (head!800 l!1612))))

(declare-fun b!15287 () Bool)

(declare-fun tp!2516 () Bool)

(assert (=> b!15287 (= e!9262 tp!2516)))

(assert (= (and start!2370 res!11592) b!15285))

(assert (= (and b!15285 res!11593) b!15286))

(assert (= start!2370 b!15287))

(declare-fun m!10169 () Bool)

(assert (=> start!2370 m!10169))

(declare-fun m!10171 () Bool)

(assert (=> start!2370 m!10171))

(declare-fun m!10173 () Bool)

(assert (=> b!15285 m!10173))

(declare-fun m!10175 () Bool)

(assert (=> b!15286 m!10175))

(declare-fun m!10177 () Bool)

(assert (=> b!15286 m!10177))

(declare-fun m!10179 () Bool)

(assert (=> b!15286 m!10179))

(declare-fun m!10181 () Bool)

(assert (=> b!15286 m!10181))

(push 1)

(assert (not b!15285))

(assert b_and!897)

(assert (not b!15287))

(assert (not b_next!481))

(assert (not b!15286))

(assert (not start!2370))

(check-sat)

(pop 1)

(push 1)

(assert b_and!897)

(assert (not b_next!481))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!2573 () Bool)

(declare-fun res!11618 () Bool)

(declare-fun e!9288 () Bool)

(assert (=> d!2573 (=> res!11618 e!9288)))

(assert (=> d!2573 (= res!11618 (is-Nil!457 (toList!230 (-!9 lm!238 lt!3683))))))

(assert (=> d!2573 (= (forall!107 (toList!230 (-!9 lm!238 lt!3683)) p!262) e!9288)))

(declare-fun b!15318 () Bool)

(declare-fun e!9289 () Bool)

(assert (=> b!15318 (= e!9288 e!9289)))

(declare-fun res!11619 () Bool)

(assert (=> b!15318 (=> (not res!11619) (not e!9289))))

(declare-fun dynLambda!100 (Int tuple2!598) Bool)

(assert (=> b!15318 (= res!11619 (dynLambda!100 p!262 (h!1022 (toList!230 (-!9 lm!238 lt!3683)))))))

(declare-fun b!15319 () Bool)

(assert (=> b!15319 (= e!9289 (forall!107 (t!2868 (toList!230 (-!9 lm!238 lt!3683))) p!262))))

(assert (= (and d!2573 (not res!11618)) b!15318))

(assert (= (and b!15318 res!11619) b!15319))

(declare-fun b_lambda!985 () Bool)

(assert (=> (not b_lambda!985) (not b!15318)))

(declare-fun t!2877 () Bool)

(declare-fun tb!401 () Bool)

(assert (=> (and start!2370 (= p!262 p!262) t!2877) tb!401))

(declare-fun result!713 () Bool)

(assert (=> tb!401 (= result!713 true)))

(assert (=> b!15318 t!2877))

(declare-fun b_and!905 () Bool)

(assert (= b_and!897 (and (=> t!2877 result!713) b_and!905)))

(declare-fun m!10213 () Bool)

(assert (=> b!15318 m!10213))

(declare-fun m!10217 () Bool)

(assert (=> b!15319 m!10217))

(assert (=> b!15286 d!2573))

(declare-fun d!2581 () Bool)

(declare-fun lt!3701 () ListLongMap!429)

(declare-fun contains!193 (ListLongMap!429 (_ BitVec 64)) Bool)

(assert (=> d!2581 (not (contains!193 lt!3701 lt!3683))))

(declare-fun removeStrictlySorted!5 (List!460 (_ BitVec 64)) List!460)

(assert (=> d!2581 (= lt!3701 (ListLongMap!430 (removeStrictlySorted!5 (toList!230 lm!238) lt!3683)))))

(assert (=> d!2581 (= (-!9 lm!238 lt!3683) lt!3701)))

(declare-fun bs!652 () Bool)

(assert (= bs!652 d!2581))

(declare-fun m!10229 () Bool)

(assert (=> bs!652 m!10229))

(declare-fun m!10233 () Bool)

(assert (=> bs!652 m!10233))

(assert (=> b!15286 d!2581))

(declare-fun d!2589 () Bool)

(assert (=> d!2589 (forall!107 (toList!230 (-!9 lm!238 lt!3683)) p!262)))

(declare-fun lt!3711 () Unit!282)

(declare-fun choose!169 (ListLongMap!429 Int (_ BitVec 64)) Unit!282)

(assert (=> d!2589 (= lt!3711 (choose!169 lm!238 p!262 lt!3683))))

(assert (=> d!2589 (forall!107 (toList!230 lm!238) p!262)))

(assert (=> d!2589 (= (removeValidProp!2 lm!238 p!262 lt!3683) lt!3711)))

(declare-fun bs!656 () Bool)

(assert (= bs!656 d!2589))

(assert (=> bs!656 m!10175))

(assert (=> bs!656 m!10177))

(declare-fun m!10243 () Bool)

(assert (=> bs!656 m!10243))

(assert (=> bs!656 m!10169))

(assert (=> b!15286 d!2589))

(declare-fun d!2597 () Bool)

(assert (=> d!2597 (= (head!800 l!1612) (h!1023 l!1612))))

(assert (=> b!15286 d!2597))

(declare-fun d!2601 () Bool)

(declare-fun res!11628 () Bool)

(declare-fun e!9298 () Bool)

(assert (=> d!2601 (=> res!11628 e!9298)))

(assert (=> d!2601 (= res!11628 (is-Nil!457 (toList!230 lm!238)))))

(assert (=> d!2601 (= (forall!107 (toList!230 lm!238) p!262) e!9298)))

(declare-fun b!15328 () Bool)

(declare-fun e!9299 () Bool)

(assert (=> b!15328 (= e!9298 e!9299)))

(declare-fun res!11629 () Bool)

(assert (=> b!15328 (=> (not res!11629) (not e!9299))))

(assert (=> b!15328 (= res!11629 (dynLambda!100 p!262 (h!1022 (toList!230 lm!238))))))

(declare-fun b!15329 () Bool)

(assert (=> b!15329 (= e!9299 (forall!107 (t!2868 (toList!230 lm!238)) p!262))))

(assert (= (and d!2601 (not res!11628)) b!15328))

(assert (= (and b!15328 res!11629) b!15329))

(declare-fun b_lambda!993 () Bool)

(assert (=> (not b_lambda!993) (not b!15328)))

(declare-fun t!2885 () Bool)

(declare-fun tb!409 () Bool)

(assert (=> (and start!2370 (= p!262 p!262) t!2885) tb!409))

(declare-fun result!721 () Bool)

(assert (=> tb!409 (= result!721 true)))

(assert (=> b!15328 t!2885))

(declare-fun b_and!913 () Bool)

(assert (= b_and!905 (and (=> t!2885 result!721) b_and!913)))

(declare-fun m!10249 () Bool)

(assert (=> b!15328 m!10249))

(declare-fun m!10251 () Bool)

(assert (=> b!15329 m!10251))

(assert (=> start!2370 d!2601))

(declare-fun d!2605 () Bool)

(declare-fun isStrictlySorted!140 (List!460) Bool)

(assert (=> d!2605 (= (inv!776 lm!238) (isStrictlySorted!140 (toList!230 lm!238)))))

(declare-fun bs!658 () Bool)

(assert (= bs!658 d!2605))

(declare-fun m!10255 () Bool)

(assert (=> bs!658 m!10255))

(assert (=> start!2370 d!2605))

(declare-fun d!2609 () Bool)

(assert (=> d!2609 (= (isEmpty!120 l!1612) (is-Nil!458 l!1612))))

(assert (=> b!15285 d!2609))

(declare-fun b!15339 () Bool)

(declare-fun e!9305 () Bool)

(declare-fun tp_is_empty!775 () Bool)

(declare-fun tp!2534 () Bool)

(assert (=> b!15339 (= e!9305 (and tp_is_empty!775 tp!2534))))

(assert (=> b!15287 (= tp!2516 e!9305)))

(assert (= (and b!15287 (is-Cons!456 (toList!230 lm!238))) b!15339))

(declare-fun b_lambda!997 () Bool)

(assert (= b_lambda!985 (or (and start!2370 b_free!481) b_lambda!997)))

(declare-fun b_lambda!1001 () Bool)

(assert (= b_lambda!993 (or (and start!2370 b_free!481) b_lambda!1001)))

(push 1)

