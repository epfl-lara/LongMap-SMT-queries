; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2340 () Bool)

(assert start!2340)

(declare-fun b_free!469 () Bool)

(declare-fun b_next!469 () Bool)

(assert (=> start!2340 (= b_free!469 (not b_next!469))))

(declare-fun tp!2471 () Bool)

(declare-fun b_and!879 () Bool)

(assert (=> start!2340 (= tp!2471 b_and!879)))

(declare-fun res!11557 () Bool)

(declare-fun e!9209 () Bool)

(assert (=> start!2340 (=> (not res!11557) (not e!9209))))

(declare-datatypes ((B!590 0))(
  ( (B!591 (val!393 Int)) )
))
(declare-datatypes ((tuple2!586 0))(
  ( (tuple2!587 (_1!293 (_ BitVec 64)) (_2!293 B!590)) )
))
(declare-datatypes ((List!451 0))(
  ( (Nil!448) (Cons!447 (h!1013 tuple2!586) (t!2853 List!451)) )
))
(declare-datatypes ((ListLongMap!417 0))(
  ( (ListLongMap!418 (toList!224 List!451)) )
))
(declare-fun lm!238 () ListLongMap!417)

(declare-fun p!262 () Int)

(declare-fun forall!104 (List!451 Int) Bool)

(assert (=> start!2340 (= res!11557 (forall!104 (toList!224 lm!238) p!262))))

(assert (=> start!2340 e!9209))

(declare-fun e!9208 () Bool)

(declare-fun inv!760 (ListLongMap!417) Bool)

(assert (=> start!2340 (and (inv!760 lm!238) e!9208)))

(assert (=> start!2340 tp!2471))

(assert (=> start!2340 true))

(declare-fun b!15216 () Bool)

(declare-fun res!11556 () Bool)

(assert (=> b!15216 (=> (not res!11556) (not e!9209))))

(declare-datatypes ((List!452 0))(
  ( (Nil!449) (Cons!448 (h!1014 (_ BitVec 64)) (t!2854 List!452)) )
))
(declare-fun l!1612 () List!452)

(declare-fun isEmpty!117 (List!452) Bool)

(assert (=> b!15216 (= res!11556 (not (isEmpty!117 l!1612)))))

(declare-fun b!15217 () Bool)

(assert (=> b!15217 (= e!9209 (= l!1612 Nil!449))))

(declare-fun b!15218 () Bool)

(declare-fun tp!2470 () Bool)

(assert (=> b!15218 (= e!9208 tp!2470)))

(assert (= (and start!2340 res!11557) b!15216))

(assert (= (and b!15216 res!11556) b!15217))

(assert (= start!2340 b!15218))

(declare-fun m!10127 () Bool)

(assert (=> start!2340 m!10127))

(declare-fun m!10129 () Bool)

(assert (=> start!2340 m!10129))

(declare-fun m!10131 () Bool)

(assert (=> b!15216 m!10131))

(push 1)

(assert (not b_next!469))

(assert (not b!15218))

(assert b_and!879)

(assert (not b!15216))

(assert (not start!2340))

(check-sat)

(pop 1)

(push 1)

(assert b_and!879)

(assert (not b_next!469))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!2551 () Bool)

(declare-fun res!11582 () Bool)

(declare-fun e!9234 () Bool)

(assert (=> d!2551 (=> res!11582 e!9234)))

(assert (=> d!2551 (= res!11582 (is-Nil!448 (toList!224 lm!238)))))

(assert (=> d!2551 (= (forall!104 (toList!224 lm!238) p!262) e!9234)))

(declare-fun b!15249 () Bool)

(declare-fun e!9235 () Bool)

(assert (=> b!15249 (= e!9234 e!9235)))

(declare-fun res!11583 () Bool)

(assert (=> b!15249 (=> (not res!11583) (not e!9235))))

(declare-fun dynLambda!96 (Int tuple2!586) Bool)

(assert (=> b!15249 (= res!11583 (dynLambda!96 p!262 (h!1013 (toList!224 lm!238))))))

(declare-fun b!15250 () Bool)

(assert (=> b!15250 (= e!9235 (forall!104 (t!2853 (toList!224 lm!238)) p!262))))

(assert (= (and d!2551 (not res!11582)) b!15249))

(assert (= (and b!15249 res!11583) b!15250))

(declare-fun b_lambda!971 () Bool)

(assert (=> (not b_lambda!971) (not b!15249)))

(declare-fun t!2860 () Bool)

(declare-fun tb!393 () Bool)

(assert (=> (and start!2340 (= p!262 p!262) t!2860) tb!393))

(declare-fun result!699 () Bool)

(assert (=> tb!393 (= result!699 true)))

(assert (=> b!15249 t!2860))

(declare-fun b_and!885 () Bool)

(assert (= b_and!879 (and (=> t!2860 result!699) b_and!885)))

(declare-fun m!10145 () Bool)

(assert (=> b!15249 m!10145))

(declare-fun m!10147 () Bool)

(assert (=> b!15250 m!10147))

(assert (=> start!2340 d!2551))

(declare-fun d!2557 () Bool)

(declare-fun isStrictlySorted!136 (List!451) Bool)

(assert (=> d!2557 (= (inv!760 lm!238) (isStrictlySorted!136 (toList!224 lm!238)))))

(declare-fun bs!642 () Bool)

(assert (= bs!642 d!2557))

(declare-fun m!10157 () Bool)

(assert (=> bs!642 m!10157))

(assert (=> start!2340 d!2557))

(declare-fun d!2563 () Bool)

(assert (=> d!2563 (= (isEmpty!117 l!1612) (is-Nil!449 l!1612))))

(assert (=> b!15216 d!2563))

(declare-fun b!15267 () Bool)

(declare-fun e!9246 () Bool)

(declare-fun tp_is_empty!769 () Bool)

(declare-fun tp!2490 () Bool)

(assert (=> b!15267 (= e!9246 (and tp_is_empty!769 tp!2490))))

(assert (=> b!15218 (= tp!2470 e!9246)))

(assert (= (and b!15218 (is-Cons!447 (toList!224 lm!238))) b!15267))

(declare-fun b_lambda!977 () Bool)

(assert (= b_lambda!971 (or (and start!2340 b_free!469) b_lambda!977)))

(push 1)

