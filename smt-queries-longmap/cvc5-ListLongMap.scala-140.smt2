; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2496 () Bool)

(assert start!2496)

(declare-fun b_free!517 () Bool)

(declare-fun b_next!517 () Bool)

(assert (=> start!2496 (= b_free!517 (not b_next!517))))

(declare-fun tp!2650 () Bool)

(declare-fun b_and!963 () Bool)

(assert (=> start!2496 (= tp!2650 b_and!963)))

(declare-fun res!11740 () Bool)

(declare-fun e!9464 () Bool)

(assert (=> start!2496 (=> (not res!11740) (not e!9464))))

(declare-datatypes ((B!638 0))(
  ( (B!639 (val!417 Int)) )
))
(declare-datatypes ((tuple2!634 0))(
  ( (tuple2!635 (_1!317 (_ BitVec 64)) (_2!317 B!638)) )
))
(declare-datatypes ((List!493 0))(
  ( (Nil!490) (Cons!489 (h!1055 tuple2!634) (t!2931 List!493)) )
))
(declare-datatypes ((ListLongMap!465 0))(
  ( (ListLongMap!466 (toList!248 List!493)) )
))
(declare-fun lm!238 () ListLongMap!465)

(declare-fun p!262 () Int)

(declare-fun forall!122 (List!493 Int) Bool)

(assert (=> start!2496 (= res!11740 (forall!122 (toList!248 lm!238) p!262))))

(assert (=> start!2496 e!9464))

(declare-fun e!9463 () Bool)

(declare-fun inv!824 (ListLongMap!465) Bool)

(assert (=> start!2496 (and (inv!824 lm!238) e!9463)))

(assert (=> start!2496 tp!2650))

(assert (=> start!2496 true))

(declare-fun b!15549 () Bool)

(declare-fun res!11739 () Bool)

(assert (=> b!15549 (=> (not res!11739) (not e!9464))))

(declare-datatypes ((List!494 0))(
  ( (Nil!491) (Cons!490 (h!1056 (_ BitVec 64)) (t!2932 List!494)) )
))
(declare-fun l!1612 () List!494)

(declare-fun isEmpty!132 (List!494) Bool)

(assert (=> b!15549 (= res!11739 (not (isEmpty!132 l!1612)))))

(declare-fun b!15550 () Bool)

(declare-fun ListPrimitiveSize!31 (List!494) Int)

(declare-fun tail!59 (List!494) List!494)

(assert (=> b!15550 (= e!9464 (not (< (ListPrimitiveSize!31 (tail!59 l!1612)) (ListPrimitiveSize!31 l!1612))))))

(declare-fun lt!3801 () (_ BitVec 64))

(declare-fun -!21 (ListLongMap!465 (_ BitVec 64)) ListLongMap!465)

(assert (=> b!15550 (forall!122 (toList!248 (-!21 lm!238 lt!3801)) p!262)))

(declare-datatypes ((Unit!306 0))(
  ( (Unit!307) )
))
(declare-fun lt!3800 () Unit!306)

(declare-fun removeValidProp!14 (ListLongMap!465 Int (_ BitVec 64)) Unit!306)

(assert (=> b!15550 (= lt!3800 (removeValidProp!14 lm!238 p!262 lt!3801))))

(declare-fun head!812 (List!494) (_ BitVec 64))

(assert (=> b!15550 (= lt!3801 (head!812 l!1612))))

(declare-fun b!15551 () Bool)

(declare-fun tp!2651 () Bool)

(assert (=> b!15551 (= e!9463 tp!2651)))

(assert (= (and start!2496 res!11740) b!15549))

(assert (= (and b!15549 res!11739) b!15550))

(assert (= start!2496 b!15551))

(declare-fun m!10481 () Bool)

(assert (=> start!2496 m!10481))

(declare-fun m!10483 () Bool)

(assert (=> start!2496 m!10483))

(declare-fun m!10485 () Bool)

(assert (=> b!15549 m!10485))

(declare-fun m!10487 () Bool)

(assert (=> b!15550 m!10487))

(declare-fun m!10489 () Bool)

(assert (=> b!15550 m!10489))

(declare-fun m!10491 () Bool)

(assert (=> b!15550 m!10491))

(declare-fun m!10493 () Bool)

(assert (=> b!15550 m!10493))

(declare-fun m!10495 () Bool)

(assert (=> b!15550 m!10495))

(declare-fun m!10497 () Bool)

(assert (=> b!15550 m!10497))

(declare-fun m!10499 () Bool)

(assert (=> b!15550 m!10499))

(assert (=> b!15550 m!10497))

(push 1)

(assert (not start!2496))

(assert (not b_next!517))

(assert (not b!15550))

(assert (not b!15551))

(assert b_and!963)

(assert (not b!15549))

(check-sat)

(pop 1)

(push 1)

(assert b_and!963)

(assert (not b_next!517))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!2687 () Bool)

(declare-fun lt!3816 () ListLongMap!465)

(declare-fun contains!198 (ListLongMap!465 (_ BitVec 64)) Bool)

(assert (=> d!2687 (not (contains!198 lt!3816 lt!3801))))

(declare-fun removeStrictlySorted!10 (List!493 (_ BitVec 64)) List!493)

(assert (=> d!2687 (= lt!3816 (ListLongMap!466 (removeStrictlySorted!10 (toList!248 lm!238) lt!3801)))))

(assert (=> d!2687 (= (-!21 lm!238 lt!3801) lt!3816)))

(declare-fun bs!690 () Bool)

(assert (= bs!690 d!2687))

(declare-fun m!10549 () Bool)

(assert (=> bs!690 m!10549))

(declare-fun m!10551 () Bool)

(assert (=> bs!690 m!10551))

(assert (=> b!15550 d!2687))

(declare-fun d!2699 () Bool)

(assert (=> d!2699 (= (tail!59 l!1612) (t!2932 l!1612))))

(assert (=> b!15550 d!2699))

(declare-fun d!2703 () Bool)

(assert (=> d!2703 (forall!122 (toList!248 (-!21 lm!238 lt!3801)) p!262)))

(declare-fun lt!3825 () Unit!306)

(declare-fun choose!174 (ListLongMap!465 Int (_ BitVec 64)) Unit!306)

(assert (=> d!2703 (= lt!3825 (choose!174 lm!238 p!262 lt!3801))))

(assert (=> d!2703 (forall!122 (toList!248 lm!238) p!262)))

(assert (=> d!2703 (= (removeValidProp!14 lm!238 p!262 lt!3801) lt!3825)))

(declare-fun bs!694 () Bool)

(assert (= bs!694 d!2703))

(assert (=> bs!694 m!10487))

(assert (=> bs!694 m!10491))

(declare-fun m!10561 () Bool)

(assert (=> bs!694 m!10561))

(assert (=> bs!694 m!10481))

(assert (=> b!15550 d!2703))

(declare-fun d!2709 () Bool)

(declare-fun lt!3833 () Int)

(assert (=> d!2709 (>= lt!3833 0)))

(declare-fun e!9496 () Int)

(assert (=> d!2709 (= lt!3833 e!9496)))

(declare-fun c!1468 () Bool)

(assert (=> d!2709 (= c!1468 (is-Nil!491 l!1612))))

(assert (=> d!2709 (= (ListPrimitiveSize!31 l!1612) lt!3833)))

(declare-fun b!15596 () Bool)

(assert (=> b!15596 (= e!9496 0)))

(declare-fun b!15597 () Bool)

(assert (=> b!15597 (= e!9496 (+ 1 (ListPrimitiveSize!31 (t!2932 l!1612))))))

(assert (= (and d!2709 c!1468) b!15596))

(assert (= (and d!2709 (not c!1468)) b!15597))

(declare-fun m!10565 () Bool)

(assert (=> b!15597 m!10565))

(assert (=> b!15550 d!2709))

(declare-fun d!2717 () Bool)

(declare-fun res!11771 () Bool)

(declare-fun e!9505 () Bool)

(assert (=> d!2717 (=> res!11771 e!9505)))

(assert (=> d!2717 (= res!11771 (is-Nil!490 (toList!248 (-!21 lm!238 lt!3801))))))

(assert (=> d!2717 (= (forall!122 (toList!248 (-!21 lm!238 lt!3801)) p!262) e!9505)))

(declare-fun b!15608 () Bool)

(declare-fun e!9506 () Bool)

(assert (=> b!15608 (= e!9505 e!9506)))

(declare-fun res!11772 () Bool)

(assert (=> b!15608 (=> (not res!11772) (not e!9506))))

(declare-fun dynLambda!110 (Int tuple2!634) Bool)

(assert (=> b!15608 (= res!11772 (dynLambda!110 p!262 (h!1055 (toList!248 (-!21 lm!238 lt!3801)))))))

(declare-fun b!15609 () Bool)

(assert (=> b!15609 (= e!9506 (forall!122 (t!2931 (toList!248 (-!21 lm!238 lt!3801))) p!262))))

(assert (= (and d!2717 (not res!11771)) b!15608))

(assert (= (and b!15608 res!11772) b!15609))

(declare-fun b_lambda!1049 () Bool)

(assert (=> (not b_lambda!1049) (not b!15608)))

(declare-fun t!2944 () Bool)

(declare-fun tb!435 () Bool)

(assert (=> (and start!2496 (= p!262 p!262) t!2944) tb!435))

(declare-fun result!765 () Bool)

(assert (=> tb!435 (= result!765 true)))

(assert (=> b!15608 t!2944))

(declare-fun b_and!975 () Bool)

(assert (= b_and!963 (and (=> t!2944 result!765) b_and!975)))

(declare-fun m!10575 () Bool)

(assert (=> b!15608 m!10575))

(declare-fun m!10577 () Bool)

(assert (=> b!15609 m!10577))

(assert (=> b!15550 d!2717))

(declare-fun d!2727 () Bool)

(assert (=> d!2727 (= (head!812 l!1612) (h!1056 l!1612))))

(assert (=> b!15550 d!2727))

(declare-fun d!2729 () Bool)

(declare-fun lt!3838 () Int)

(assert (=> d!2729 (>= lt!3838 0)))

(declare-fun e!9507 () Int)

(assert (=> d!2729 (= lt!3838 e!9507)))

(declare-fun c!1471 () Bool)

(assert (=> d!2729 (= c!1471 (is-Nil!491 (tail!59 l!1612)))))

(assert (=> d!2729 (= (ListPrimitiveSize!31 (tail!59 l!1612)) lt!3838)))

(declare-fun b!15610 () Bool)

(assert (=> b!15610 (= e!9507 0)))

(declare-fun b!15611 () Bool)

(assert (=> b!15611 (= e!9507 (+ 1 (ListPrimitiveSize!31 (t!2932 (tail!59 l!1612)))))))

(assert (= (and d!2729 c!1471) b!15610))

(assert (= (and d!2729 (not c!1471)) b!15611))

(declare-fun m!10579 () Bool)

(assert (=> b!15611 m!10579))

(assert (=> b!15550 d!2729))

(declare-fun d!2731 () Bool)

(declare-fun res!11773 () Bool)

(declare-fun e!9508 () Bool)

(assert (=> d!2731 (=> res!11773 e!9508)))

(assert (=> d!2731 (= res!11773 (is-Nil!490 (toList!248 lm!238)))))

(assert (=> d!2731 (= (forall!122 (toList!248 lm!238) p!262) e!9508)))

(declare-fun b!15612 () Bool)

(declare-fun e!9509 () Bool)

(assert (=> b!15612 (= e!9508 e!9509)))

(declare-fun res!11774 () Bool)

(assert (=> b!15612 (=> (not res!11774) (not e!9509))))

(assert (=> b!15612 (= res!11774 (dynLambda!110 p!262 (h!1055 (toList!248 lm!238))))))

(declare-fun b!15613 () Bool)

(assert (=> b!15613 (= e!9509 (forall!122 (t!2931 (toList!248 lm!238)) p!262))))

(assert (= (and d!2731 (not res!11773)) b!15612))

(assert (= (and b!15612 res!11774) b!15613))

(declare-fun b_lambda!1051 () Bool)

(assert (=> (not b_lambda!1051) (not b!15612)))

(declare-fun t!2946 () Bool)

(declare-fun tb!437 () Bool)

(assert (=> (and start!2496 (= p!262 p!262) t!2946) tb!437))

(declare-fun result!767 () Bool)

(assert (=> tb!437 (= result!767 true)))

(assert (=> b!15612 t!2946))

(declare-fun b_and!977 () Bool)

(assert (= b_and!975 (and (=> t!2946 result!767) b_and!977)))

(declare-fun m!10583 () Bool)

(assert (=> b!15612 m!10583))

(declare-fun m!10585 () Bool)

(assert (=> b!15613 m!10585))

(assert (=> start!2496 d!2731))

(declare-fun d!2735 () Bool)

(declare-fun isStrictlySorted!148 (List!493) Bool)

(assert (=> d!2735 (= (inv!824 lm!238) (isStrictlySorted!148 (toList!248 lm!238)))))

(declare-fun bs!696 () Bool)

(assert (= bs!696 d!2735))

(declare-fun m!10591 () Bool)

(assert (=> bs!696 m!10591))

(assert (=> start!2496 d!2735))

(declare-fun d!2739 () Bool)

(assert (=> d!2739 (= (isEmpty!132 l!1612) (is-Nil!491 l!1612))))

(assert (=> b!15549 d!2739))

(declare-fun b!15624 () Bool)

(declare-fun e!9515 () Bool)

(declare-fun tp_is_empty!793 () Bool)

(declare-fun tp!2666 () Bool)

(assert (=> b!15624 (= e!9515 (and tp_is_empty!793 tp!2666))))

(assert (=> b!15551 (= tp!2651 e!9515)))

(assert (= (and b!15551 (is-Cons!489 (toList!248 lm!238))) b!15624))

(declare-fun b_lambda!1055 () Bool)

(assert (= b_lambda!1051 (or (and start!2496 b_free!517) b_lambda!1055)))

(declare-fun b_lambda!1057 () Bool)

(assert (= b_lambda!1049 (or (and start!2496 b_free!517) b_lambda!1057)))

(push 1)

