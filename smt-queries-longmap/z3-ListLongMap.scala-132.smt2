; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2340 () Bool)

(assert start!2340)

(declare-fun b_free!469 () Bool)

(declare-fun b_next!469 () Bool)

(assert (=> start!2340 (= b_free!469 (not b_next!469))))

(declare-fun tp!2470 () Bool)

(declare-fun b_and!879 () Bool)

(assert (=> start!2340 (= tp!2470 b_and!879)))

(declare-fun res!11557 () Bool)

(declare-fun e!9209 () Bool)

(assert (=> start!2340 (=> (not res!11557) (not e!9209))))

(declare-datatypes ((B!590 0))(
  ( (B!591 (val!393 Int)) )
))
(declare-datatypes ((tuple2!582 0))(
  ( (tuple2!583 (_1!291 (_ BitVec 64)) (_2!291 B!590)) )
))
(declare-datatypes ((List!447 0))(
  ( (Nil!444) (Cons!443 (h!1009 tuple2!582) (t!2849 List!447)) )
))
(declare-datatypes ((ListLongMap!413 0))(
  ( (ListLongMap!414 (toList!222 List!447)) )
))
(declare-fun lm!238 () ListLongMap!413)

(declare-fun p!262 () Int)

(declare-fun forall!104 (List!447 Int) Bool)

(assert (=> start!2340 (= res!11557 (forall!104 (toList!222 lm!238) p!262))))

(assert (=> start!2340 e!9209))

(declare-fun e!9208 () Bool)

(declare-fun inv!760 (ListLongMap!413) Bool)

(assert (=> start!2340 (and (inv!760 lm!238) e!9208)))

(assert (=> start!2340 tp!2470))

(assert (=> start!2340 true))

(declare-fun b!15216 () Bool)

(declare-fun res!11556 () Bool)

(assert (=> b!15216 (=> (not res!11556) (not e!9209))))

(declare-datatypes ((List!448 0))(
  ( (Nil!445) (Cons!444 (h!1010 (_ BitVec 64)) (t!2850 List!448)) )
))
(declare-fun l!1612 () List!448)

(declare-fun isEmpty!117 (List!448) Bool)

(assert (=> b!15216 (= res!11556 (not (isEmpty!117 l!1612)))))

(declare-fun b!15217 () Bool)

(assert (=> b!15217 (= e!9209 (= l!1612 Nil!445))))

(declare-fun b!15218 () Bool)

(declare-fun tp!2471 () Bool)

(assert (=> b!15218 (= e!9208 tp!2471)))

(assert (= (and start!2340 res!11557) b!15216))

(assert (= (and b!15216 res!11556) b!15217))

(assert (= start!2340 b!15218))

(declare-fun m!10119 () Bool)

(assert (=> start!2340 m!10119))

(declare-fun m!10121 () Bool)

(assert (=> start!2340 m!10121))

(declare-fun m!10123 () Bool)

(assert (=> b!15216 m!10123))

(check-sat (not b_next!469) (not b!15216) b_and!879 (not b!15218) (not start!2340))
(check-sat b_and!879 (not b_next!469))
(get-model)

(declare-fun d!2551 () Bool)

(declare-fun res!11582 () Bool)

(declare-fun e!9234 () Bool)

(assert (=> d!2551 (=> res!11582 e!9234)))

(get-info :version)

(assert (=> d!2551 (= res!11582 ((_ is Nil!444) (toList!222 lm!238)))))

(assert (=> d!2551 (= (forall!104 (toList!222 lm!238) p!262) e!9234)))

(declare-fun b!15249 () Bool)

(declare-fun e!9235 () Bool)

(assert (=> b!15249 (= e!9234 e!9235)))

(declare-fun res!11583 () Bool)

(assert (=> b!15249 (=> (not res!11583) (not e!9235))))

(declare-fun dynLambda!95 (Int tuple2!582) Bool)

(assert (=> b!15249 (= res!11583 (dynLambda!95 p!262 (h!1009 (toList!222 lm!238))))))

(declare-fun b!15250 () Bool)

(assert (=> b!15250 (= e!9235 (forall!104 (t!2849 (toList!222 lm!238)) p!262))))

(assert (= (and d!2551 (not res!11582)) b!15249))

(assert (= (and b!15249 res!11583) b!15250))

(declare-fun b_lambda!971 () Bool)

(assert (=> (not b_lambda!971) (not b!15249)))

(declare-fun t!2856 () Bool)

(declare-fun tb!393 () Bool)

(assert (=> (and start!2340 (= p!262 p!262) t!2856) tb!393))

(declare-fun result!699 () Bool)

(assert (=> tb!393 (= result!699 true)))

(assert (=> b!15249 t!2856))

(declare-fun b_and!885 () Bool)

(assert (= b_and!879 (and (=> t!2856 result!699) b_and!885)))

(declare-fun m!10137 () Bool)

(assert (=> b!15249 m!10137))

(declare-fun m!10139 () Bool)

(assert (=> b!15250 m!10139))

(assert (=> start!2340 d!2551))

(declare-fun d!2557 () Bool)

(declare-fun isStrictlySorted!132 (List!447) Bool)

(assert (=> d!2557 (= (inv!760 lm!238) (isStrictlySorted!132 (toList!222 lm!238)))))

(declare-fun bs!642 () Bool)

(assert (= bs!642 d!2557))

(declare-fun m!10149 () Bool)

(assert (=> bs!642 m!10149))

(assert (=> start!2340 d!2557))

(declare-fun d!2563 () Bool)

(assert (=> d!2563 (= (isEmpty!117 l!1612) ((_ is Nil!445) l!1612))))

(assert (=> b!15216 d!2563))

(declare-fun b!15259 () Bool)

(declare-fun e!9242 () Bool)

(declare-fun tp_is_empty!769 () Bool)

(declare-fun tp!2486 () Bool)

(assert (=> b!15259 (= e!9242 (and tp_is_empty!769 tp!2486))))

(assert (=> b!15218 (= tp!2471 e!9242)))

(assert (= (and b!15218 ((_ is Cons!443) (toList!222 lm!238))) b!15259))

(declare-fun b_lambda!977 () Bool)

(assert (= b_lambda!971 (or (and start!2340 b_free!469) b_lambda!977)))

(check-sat (not b!15250) b_and!885 (not b_next!469) (not d!2557) tp_is_empty!769 (not b_lambda!977) (not b!15259))
(check-sat b_and!885 (not b_next!469))
