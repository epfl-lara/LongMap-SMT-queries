; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2610 () Bool)

(assert start!2610)

(declare-fun b_free!529 () Bool)

(declare-fun b_next!529 () Bool)

(assert (=> start!2610 (= b_free!529 (not b_next!529))))

(declare-fun tp!2705 () Bool)

(declare-fun b_and!1011 () Bool)

(assert (=> start!2610 (= tp!2705 b_and!1011)))

(declare-fun res!11835 () Bool)

(declare-fun e!9601 () Bool)

(assert (=> start!2610 (=> (not res!11835) (not e!9601))))

(declare-datatypes ((B!650 0))(
  ( (B!651 (val!423 Int)) )
))
(declare-datatypes ((tuple2!646 0))(
  ( (tuple2!647 (_1!323 (_ BitVec 64)) (_2!323 B!650)) )
))
(declare-datatypes ((List!505 0))(
  ( (Nil!502) (Cons!501 (h!1067 tuple2!646) (t!2979 List!505)) )
))
(declare-datatypes ((ListLongMap!477 0))(
  ( (ListLongMap!478 (toList!254 List!505)) )
))
(declare-fun lm!238 () ListLongMap!477)

(declare-fun p!262 () Int)

(declare-fun forall!128 (List!505 Int) Bool)

(assert (=> start!2610 (= res!11835 (forall!128 (toList!254 lm!238) p!262))))

(assert (=> start!2610 e!9601))

(declare-fun e!9602 () Bool)

(declare-fun inv!840 (ListLongMap!477) Bool)

(assert (=> start!2610 (and (inv!840 lm!238) e!9602)))

(assert (=> start!2610 tp!2705))

(assert (=> start!2610 true))

(declare-fun b!15741 () Bool)

(declare-fun res!11836 () Bool)

(assert (=> b!15741 (=> (not res!11836) (not e!9601))))

(declare-datatypes ((List!506 0))(
  ( (Nil!503) (Cons!502 (h!1068 (_ BitVec 64)) (t!2980 List!506)) )
))
(declare-fun l!1612 () List!506)

(declare-fun isEmpty!138 (List!506) Bool)

(assert (=> b!15741 (= res!11836 (isEmpty!138 l!1612))))

(declare-fun b!15742 () Bool)

(declare-fun --!7 (ListLongMap!477 List!506) ListLongMap!477)

(assert (=> b!15742 (= e!9601 (not (forall!128 (toList!254 (--!7 lm!238 l!1612)) p!262)))))

(declare-fun b!15743 () Bool)

(declare-fun tp!2704 () Bool)

(assert (=> b!15743 (= e!9602 tp!2704)))

(assert (= (and start!2610 res!11835) b!15741))

(assert (= (and b!15741 res!11836) b!15742))

(assert (= start!2610 b!15743))

(declare-fun m!10787 () Bool)

(assert (=> start!2610 m!10787))

(declare-fun m!10789 () Bool)

(assert (=> start!2610 m!10789))

(declare-fun m!10791 () Bool)

(assert (=> b!15741 m!10791))

(declare-fun m!10793 () Bool)

(assert (=> b!15742 m!10793))

(declare-fun m!10795 () Bool)

(assert (=> b!15742 m!10795))

(push 1)

(assert (not b!15743))

(assert (not b_next!529))

(assert (not b!15742))

(assert (not b!15741))

(assert (not start!2610))

(assert b_and!1011)

(check-sat)

(pop 1)

(push 1)

(assert b_and!1011)

(assert (not b_next!529))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!2829 () Bool)

(declare-fun res!11857 () Bool)

(declare-fun e!9623 () Bool)

(assert (=> d!2829 (=> res!11857 e!9623)))

(assert (=> d!2829 (= res!11857 (is-Nil!502 (toList!254 (--!7 lm!238 l!1612))))))

(assert (=> d!2829 (= (forall!128 (toList!254 (--!7 lm!238 l!1612)) p!262) e!9623)))

(declare-fun b!15770 () Bool)

(declare-fun e!9624 () Bool)

(assert (=> b!15770 (= e!9623 e!9624)))

(declare-fun res!11858 () Bool)

(assert (=> b!15770 (=> (not res!11858) (not e!9624))))

(declare-fun dynLambda!114 (Int tuple2!646) Bool)

(assert (=> b!15770 (= res!11858 (dynLambda!114 p!262 (h!1067 (toList!254 (--!7 lm!238 l!1612)))))))

(declare-fun b!15771 () Bool)

(assert (=> b!15771 (= e!9624 (forall!128 (t!2979 (toList!254 (--!7 lm!238 l!1612))) p!262))))

(assert (= (and d!2829 (not res!11857)) b!15770))

(assert (= (and b!15770 res!11858) b!15771))

(declare-fun b_lambda!1115 () Bool)

(assert (=> (not b_lambda!1115) (not b!15770)))

(declare-fun t!2986 () Bool)

(declare-fun tb!465 () Bool)

(assert (=> (and start!2610 (= p!262 p!262) t!2986) tb!465))

(declare-fun result!807 () Bool)

(assert (=> tb!465 (= result!807 true)))

(assert (=> b!15770 t!2986))

(declare-fun b_and!1017 () Bool)

(assert (= b_and!1011 (and (=> t!2986 result!807) b_and!1017)))

(declare-fun m!10817 () Bool)

(assert (=> b!15770 m!10817))

(declare-fun m!10819 () Bool)

(assert (=> b!15771 m!10819))

(assert (=> b!15742 d!2829))

(declare-fun d!2839 () Bool)

(declare-fun c!1489 () Bool)

(assert (=> d!2839 (= c!1489 (is-Nil!503 l!1612))))

(declare-fun e!9637 () ListLongMap!477)

(assert (=> d!2839 (= (--!7 lm!238 l!1612) e!9637)))

(declare-fun b!15788 () Bool)

(assert (=> b!15788 (= e!9637 lm!238)))

(declare-fun b!15789 () Bool)

(declare-fun -!27 (ListLongMap!477 (_ BitVec 64)) ListLongMap!477)

(assert (=> b!15789 (= e!9637 (--!7 (-!27 lm!238 (h!1068 l!1612)) (t!2980 l!1612)))))

(assert (= (and d!2839 c!1489) b!15788))

(assert (= (and d!2839 (not c!1489)) b!15789))

(declare-fun m!10829 () Bool)

(assert (=> b!15789 m!10829))

(assert (=> b!15789 m!10829))

(declare-fun m!10831 () Bool)

(assert (=> b!15789 m!10831))

(assert (=> b!15742 d!2839))

(declare-fun d!2845 () Bool)

(assert (=> d!2845 (= (isEmpty!138 l!1612) (is-Nil!503 l!1612))))

(assert (=> b!15741 d!2845))

(declare-fun d!2849 () Bool)

(declare-fun res!11869 () Bool)

(declare-fun e!9643 () Bool)

(assert (=> d!2849 (=> res!11869 e!9643)))

(assert (=> d!2849 (= res!11869 (is-Nil!502 (toList!254 lm!238)))))

(assert (=> d!2849 (= (forall!128 (toList!254 lm!238) p!262) e!9643)))

(declare-fun b!15798 () Bool)

(declare-fun e!9644 () Bool)

(assert (=> b!15798 (= e!9643 e!9644)))

(declare-fun res!11870 () Bool)

(assert (=> b!15798 (=> (not res!11870) (not e!9644))))

(assert (=> b!15798 (= res!11870 (dynLambda!114 p!262 (h!1067 (toList!254 lm!238))))))

(declare-fun b!15799 () Bool)

(assert (=> b!15799 (= e!9644 (forall!128 (t!2979 (toList!254 lm!238)) p!262))))

(assert (= (and d!2849 (not res!11869)) b!15798))

(assert (= (and b!15798 res!11870) b!15799))

(declare-fun b_lambda!1123 () Bool)

(assert (=> (not b_lambda!1123) (not b!15798)))

(declare-fun t!2994 () Bool)

(declare-fun tb!473 () Bool)

(assert (=> (and start!2610 (= p!262 p!262) t!2994) tb!473))

(declare-fun result!815 () Bool)

(assert (=> tb!473 (= result!815 true)))

(assert (=> b!15798 t!2994))

(declare-fun b_and!1025 () Bool)

(assert (= b_and!1017 (and (=> t!2994 result!815) b_and!1025)))

(declare-fun m!10841 () Bool)

(assert (=> b!15798 m!10841))

(declare-fun m!10843 () Bool)

(assert (=> b!15799 m!10843))

(assert (=> start!2610 d!2849))

(declare-fun d!2853 () Bool)

(declare-fun isStrictlySorted!152 (List!505) Bool)

(assert (=> d!2853 (= (inv!840 lm!238) (isStrictlySorted!152 (toList!254 lm!238)))))

(declare-fun bs!718 () Bool)

(assert (= bs!718 d!2853))

(declare-fun m!10855 () Bool)

(assert (=> bs!718 m!10855))

(assert (=> start!2610 d!2853))

(declare-fun b!15813 () Bool)

(declare-fun e!9653 () Bool)

(declare-fun tp_is_empty!807 () Bool)

(declare-fun tp!2723 () Bool)

(assert (=> b!15813 (= e!9653 (and tp_is_empty!807 tp!2723))))

(assert (=> b!15743 (= tp!2704 e!9653)))

(assert (= (and b!15743 (is-Cons!501 (toList!254 lm!238))) b!15813))

(declare-fun b_lambda!1129 () Bool)

(assert (= b_lambda!1115 (or (and start!2610 b_free!529) b_lambda!1129)))

(declare-fun b_lambda!1133 () Bool)

(assert (= b_lambda!1123 (or (and start!2610 b_free!529) b_lambda!1133)))

(push 1)

(assert b_and!1025)

(assert (not d!2853))

(assert (not b_lambda!1133))

(assert (not b!15771))

(assert (not b!15799))

(assert (not b!15789))

(assert (not b!15813))

(assert (not b_lambda!1129))

(assert tp_is_empty!807)

(assert (not b_next!529))

(check-sat)

(pop 1)

(push 1)

(assert b_and!1025)

(assert (not b_next!529))

(check-sat)

(pop 1)

