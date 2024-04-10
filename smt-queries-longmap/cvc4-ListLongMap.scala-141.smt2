; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2554 () Bool)

(assert start!2554)

(declare-fun b_free!527 () Bool)

(declare-fun b_next!527 () Bool)

(assert (=> start!2554 (= b_free!527 (not b_next!527))))

(declare-fun tp!2689 () Bool)

(declare-fun b_and!985 () Bool)

(assert (=> start!2554 (= tp!2689 b_and!985)))

(declare-fun res!11794 () Bool)

(declare-fun e!9539 () Bool)

(assert (=> start!2554 (=> (not res!11794) (not e!9539))))

(declare-datatypes ((B!648 0))(
  ( (B!649 (val!422 Int)) )
))
(declare-datatypes ((tuple2!644 0))(
  ( (tuple2!645 (_1!322 (_ BitVec 64)) (_2!322 B!648)) )
))
(declare-datatypes ((List!503 0))(
  ( (Nil!500) (Cons!499 (h!1065 tuple2!644) (t!2953 List!503)) )
))
(declare-datatypes ((ListLongMap!475 0))(
  ( (ListLongMap!476 (toList!253 List!503)) )
))
(declare-fun lm!238 () ListLongMap!475)

(declare-fun p!262 () Int)

(declare-fun forall!127 (List!503 Int) Bool)

(assert (=> start!2554 (= res!11794 (forall!127 (toList!253 lm!238) p!262))))

(assert (=> start!2554 e!9539))

(declare-fun e!9538 () Bool)

(declare-fun inv!834 (ListLongMap!475) Bool)

(assert (=> start!2554 (and (inv!834 lm!238) e!9538)))

(assert (=> start!2554 tp!2689))

(assert (=> start!2554 true))

(declare-fun b!15657 () Bool)

(declare-fun res!11793 () Bool)

(assert (=> b!15657 (=> (not res!11793) (not e!9539))))

(declare-datatypes ((List!504 0))(
  ( (Nil!501) (Cons!500 (h!1066 (_ BitVec 64)) (t!2954 List!504)) )
))
(declare-fun l!1612 () List!504)

(declare-fun isEmpty!137 (List!504) Bool)

(assert (=> b!15657 (= res!11793 (not (isEmpty!137 l!1612)))))

(declare-fun b!15658 () Bool)

(declare-fun --!6 (ListLongMap!475 List!504) ListLongMap!475)

(assert (=> b!15658 (= e!9539 (not (forall!127 (toList!253 (--!6 lm!238 l!1612)) p!262)))))

(declare-fun lt!3888 () ListLongMap!475)

(declare-fun lt!3885 () List!504)

(assert (=> b!15658 (forall!127 (toList!253 (--!6 lt!3888 lt!3885)) p!262)))

(declare-datatypes ((Unit!316 0))(
  ( (Unit!317) )
))
(declare-fun lt!3884 () Unit!316)

(declare-fun removeAllValidProp!4 (ListLongMap!475 List!504 Int) Unit!316)

(assert (=> b!15658 (= lt!3884 (removeAllValidProp!4 lt!3888 lt!3885 p!262))))

(declare-fun tail!64 (List!504) List!504)

(assert (=> b!15658 (= lt!3885 (tail!64 l!1612))))

(assert (=> b!15658 (forall!127 (toList!253 lt!3888) p!262)))

(declare-fun lt!3887 () (_ BitVec 64))

(declare-fun -!26 (ListLongMap!475 (_ BitVec 64)) ListLongMap!475)

(assert (=> b!15658 (= lt!3888 (-!26 lm!238 lt!3887))))

(declare-fun lt!3886 () Unit!316)

(declare-fun removeValidProp!19 (ListLongMap!475 Int (_ BitVec 64)) Unit!316)

(assert (=> b!15658 (= lt!3886 (removeValidProp!19 lm!238 p!262 lt!3887))))

(declare-fun head!817 (List!504) (_ BitVec 64))

(assert (=> b!15658 (= lt!3887 (head!817 l!1612))))

(declare-fun b!15659 () Bool)

(declare-fun tp!2690 () Bool)

(assert (=> b!15659 (= e!9538 tp!2690)))

(assert (= (and start!2554 res!11794) b!15657))

(assert (= (and b!15657 res!11793) b!15658))

(assert (= start!2554 b!15659))

(declare-fun m!10653 () Bool)

(assert (=> start!2554 m!10653))

(declare-fun m!10655 () Bool)

(assert (=> start!2554 m!10655))

(declare-fun m!10657 () Bool)

(assert (=> b!15657 m!10657))

(declare-fun m!10659 () Bool)

(assert (=> b!15658 m!10659))

(declare-fun m!10661 () Bool)

(assert (=> b!15658 m!10661))

(declare-fun m!10663 () Bool)

(assert (=> b!15658 m!10663))

(declare-fun m!10665 () Bool)

(assert (=> b!15658 m!10665))

(declare-fun m!10667 () Bool)

(assert (=> b!15658 m!10667))

(declare-fun m!10669 () Bool)

(assert (=> b!15658 m!10669))

(declare-fun m!10671 () Bool)

(assert (=> b!15658 m!10671))

(declare-fun m!10673 () Bool)

(assert (=> b!15658 m!10673))

(declare-fun m!10675 () Bool)

(assert (=> b!15658 m!10675))

(declare-fun m!10677 () Bool)

(assert (=> b!15658 m!10677))

(push 1)

(assert (not b_next!527))

(assert (not b!15658))

(assert (not b!15657))

(assert (not b!15659))

(assert (not start!2554))

(assert b_and!985)

(check-sat)

(pop 1)

(push 1)

(assert b_and!985)

(assert (not b_next!527))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!2751 () Bool)

(declare-fun res!11803 () Bool)

(declare-fun e!9548 () Bool)

(assert (=> d!2751 (=> res!11803 e!9548)))

(assert (=> d!2751 (= res!11803 (is-Nil!500 (toList!253 lm!238)))))

(assert (=> d!2751 (= (forall!127 (toList!253 lm!238) p!262) e!9548)))

(declare-fun b!15668 () Bool)

(declare-fun e!9550 () Bool)

(assert (=> b!15668 (= e!9548 e!9550)))

(declare-fun res!11805 () Bool)

(assert (=> b!15668 (=> (not res!11805) (not e!9550))))

(declare-fun dynLambda!112 (Int tuple2!644) Bool)

(assert (=> b!15668 (= res!11805 (dynLambda!112 p!262 (h!1065 (toList!253 lm!238))))))

(declare-fun b!15670 () Bool)

(assert (=> b!15670 (= e!9550 (forall!127 (t!2953 (toList!253 lm!238)) p!262))))

(assert (= (and d!2751 (not res!11803)) b!15668))

(assert (= (and b!15668 res!11805) b!15670))

(declare-fun b_lambda!1068 () Bool)

(assert (=> (not b_lambda!1068) (not b!15668)))

(declare-fun t!2958 () Bool)

(declare-fun tb!443 () Bool)

(assert (=> (and start!2554 (= p!262 p!262) t!2958) tb!443))

(declare-fun result!778 () Bool)

(assert (=> tb!443 (= result!778 true)))

(assert (=> b!15668 t!2958))

(declare-fun b_and!989 () Bool)

(assert (= b_and!985 (and (=> t!2958 result!778) b_and!989)))

(declare-fun m!10680 () Bool)

(assert (=> b!15668 m!10680))

(declare-fun m!10683 () Bool)

(assert (=> b!15670 m!10683))

(assert (=> start!2554 d!2751))

(declare-fun d!2756 () Bool)

(declare-fun isStrictlySorted!151 (List!503) Bool)

(assert (=> d!2756 (= (inv!834 lm!238) (isStrictlySorted!151 (toList!253 lm!238)))))

(declare-fun bs!703 () Bool)

(assert (= bs!703 d!2756))

(declare-fun m!10691 () Bool)

(assert (=> bs!703 m!10691))

(assert (=> start!2554 d!2756))

(declare-fun d!2763 () Bool)

(assert (=> d!2763 (= (isEmpty!137 l!1612) (is-Nil!501 l!1612))))

(assert (=> b!15657 d!2763))

(declare-fun d!2767 () Bool)

(declare-fun res!11815 () Bool)

(declare-fun e!9560 () Bool)

(assert (=> d!2767 (=> res!11815 e!9560)))

(assert (=> d!2767 (= res!11815 (is-Nil!500 (toList!253 lt!3888)))))

(assert (=> d!2767 (= (forall!127 (toList!253 lt!3888) p!262) e!9560)))

(declare-fun b!15680 () Bool)

(declare-fun e!9561 () Bool)

(assert (=> b!15680 (= e!9560 e!9561)))

(declare-fun res!11816 () Bool)

(assert (=> b!15680 (=> (not res!11816) (not e!9561))))

(assert (=> b!15680 (= res!11816 (dynLambda!112 p!262 (h!1065 (toList!253 lt!3888))))))

(declare-fun b!15681 () Bool)

(assert (=> b!15681 (= e!9561 (forall!127 (t!2953 (toList!253 lt!3888)) p!262))))

(assert (= (and d!2767 (not res!11815)) b!15680))

(assert (= (and b!15680 res!11816) b!15681))

(declare-fun b_lambda!1075 () Bool)

(assert (=> (not b_lambda!1075) (not b!15680)))

(declare-fun t!2964 () Bool)

(declare-fun tb!449 () Bool)

(assert (=> (and start!2554 (= p!262 p!262) t!2964) tb!449))

(declare-fun result!785 () Bool)

(assert (=> tb!449 (= result!785 true)))

(assert (=> b!15680 t!2964))

(declare-fun b_and!995 () Bool)

(assert (= b_and!989 (and (=> t!2964 result!785) b_and!995)))

(declare-fun m!10701 () Bool)

(assert (=> b!15680 m!10701))

(declare-fun m!10703 () Bool)

(assert (=> b!15681 m!10703))

(assert (=> b!15658 d!2767))

(declare-fun d!2773 () Bool)

(assert (=> d!2773 (= (tail!64 l!1612) (t!2954 l!1612))))

(assert (=> b!15658 d!2773))

(declare-fun d!2777 () Bool)

(declare-fun c!1478 () Bool)

(assert (=> d!2777 (= c!1478 (is-Nil!501 l!1612))))

(declare-fun e!9569 () ListLongMap!475)

(assert (=> d!2777 (= (--!6 lm!238 l!1612) e!9569)))

(declare-fun b!15694 () Bool)

(assert (=> b!15694 (= e!9569 lm!238)))

(declare-fun b!15695 () Bool)

(assert (=> b!15695 (= e!9569 (--!6 (-!26 lm!238 (h!1066 l!1612)) (t!2954 l!1612)))))

(assert (= (and d!2777 c!1478) b!15694))

(assert (= (and d!2777 (not c!1478)) b!15695))

(declare-fun m!10713 () Bool)

(assert (=> b!15695 m!10713))

(assert (=> b!15695 m!10713))

(declare-fun m!10715 () Bool)

(assert (=> b!15695 m!10715))

(assert (=> b!15658 d!2777))

(declare-fun d!2787 () Bool)

(assert (=> d!2787 (forall!127 (toList!253 (--!6 lt!3888 lt!3885)) p!262)))

(declare-fun lt!3894 () Unit!316)

(declare-fun choose!179 (ListLongMap!475 List!504 Int) Unit!316)

(assert (=> d!2787 (= lt!3894 (choose!179 lt!3888 lt!3885 p!262))))

(assert (=> d!2787 (forall!127 (toList!253 lt!3888) p!262)))

(assert (=> d!2787 (= (removeAllValidProp!4 lt!3888 lt!3885 p!262) lt!3894)))

(declare-fun bs!706 () Bool)

(assert (= bs!706 d!2787))

(assert (=> bs!706 m!10673))

(assert (=> bs!706 m!10665))

(declare-fun m!10729 () Bool)

(assert (=> bs!706 m!10729))

(assert (=> bs!706 m!10659))

(assert (=> b!15658 d!2787))

(declare-fun d!2795 () Bool)

(declare-fun res!11821 () Bool)

(declare-fun e!9575 () Bool)

(assert (=> d!2795 (=> res!11821 e!9575)))

(assert (=> d!2795 (= res!11821 (is-Nil!500 (toList!253 (--!6 lt!3888 lt!3885))))))

(assert (=> d!2795 (= (forall!127 (toList!253 (--!6 lt!3888 lt!3885)) p!262) e!9575)))

(declare-fun b!15704 () Bool)

(declare-fun e!9576 () Bool)

(assert (=> b!15704 (= e!9575 e!9576)))

(declare-fun res!11822 () Bool)

(assert (=> b!15704 (=> (not res!11822) (not e!9576))))

(assert (=> b!15704 (= res!11822 (dynLambda!112 p!262 (h!1065 (toList!253 (--!6 lt!3888 lt!3885)))))))

(declare-fun b!15705 () Bool)

(assert (=> b!15705 (= e!9576 (forall!127 (t!2953 (toList!253 (--!6 lt!3888 lt!3885))) p!262))))

(assert (= (and d!2795 (not res!11821)) b!15704))

(assert (= (and b!15704 res!11822) b!15705))

(declare-fun b_lambda!1081 () Bool)

(assert (=> (not b_lambda!1081) (not b!15704)))

(declare-fun t!2970 () Bool)

(declare-fun tb!455 () Bool)

(assert (=> (and start!2554 (= p!262 p!262) t!2970) tb!455))

(declare-fun result!791 () Bool)

(assert (=> tb!455 (= result!791 true)))

(assert (=> b!15704 t!2970))

(declare-fun b_and!1001 () Bool)

(assert (= b_and!995 (and (=> t!2970 result!791) b_and!1001)))

(declare-fun m!10731 () Bool)

(assert (=> b!15704 m!10731))

(declare-fun m!10733 () Bool)

(assert (=> b!15705 m!10733))

(assert (=> b!15658 d!2795))

(declare-fun d!2797 () Bool)

