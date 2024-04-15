; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

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
(declare-datatypes ((tuple2!642 0))(
  ( (tuple2!643 (_1!321 (_ BitVec 64)) (_2!321 B!650)) )
))
(declare-datatypes ((List!501 0))(
  ( (Nil!498) (Cons!497 (h!1063 tuple2!642) (t!2975 List!501)) )
))
(declare-datatypes ((ListLongMap!473 0))(
  ( (ListLongMap!474 (toList!252 List!501)) )
))
(declare-fun lm!238 () ListLongMap!473)

(declare-fun p!262 () Int)

(declare-fun forall!128 (List!501 Int) Bool)

(assert (=> start!2610 (= res!11835 (forall!128 (toList!252 lm!238) p!262))))

(assert (=> start!2610 e!9601))

(declare-fun e!9602 () Bool)

(declare-fun inv!840 (ListLongMap!473) Bool)

(assert (=> start!2610 (and (inv!840 lm!238) e!9602)))

(assert (=> start!2610 tp!2705))

(assert (=> start!2610 true))

(declare-fun b!15741 () Bool)

(declare-fun res!11836 () Bool)

(assert (=> b!15741 (=> (not res!11836) (not e!9601))))

(declare-datatypes ((List!502 0))(
  ( (Nil!499) (Cons!498 (h!1064 (_ BitVec 64)) (t!2976 List!502)) )
))
(declare-fun l!1612 () List!502)

(declare-fun isEmpty!138 (List!502) Bool)

(assert (=> b!15741 (= res!11836 (isEmpty!138 l!1612))))

(declare-fun b!15742 () Bool)

(declare-fun --!7 (ListLongMap!473 List!502) ListLongMap!473)

(assert (=> b!15742 (= e!9601 (not (forall!128 (toList!252 (--!7 lm!238 l!1612)) p!262)))))

(declare-fun b!15743 () Bool)

(declare-fun tp!2704 () Bool)

(assert (=> b!15743 (= e!9602 tp!2704)))

(assert (= (and start!2610 res!11835) b!15741))

(assert (= (and b!15741 res!11836) b!15742))

(assert (= start!2610 b!15743))

(declare-fun m!10779 () Bool)

(assert (=> start!2610 m!10779))

(declare-fun m!10781 () Bool)

(assert (=> start!2610 m!10781))

(declare-fun m!10783 () Bool)

(assert (=> b!15741 m!10783))

(declare-fun m!10785 () Bool)

(assert (=> b!15742 m!10785))

(declare-fun m!10787 () Bool)

(assert (=> b!15742 m!10787))

(check-sat b_and!1011 (not b!15743) (not b_next!529) (not start!2610) (not b!15742) (not b!15741))
(check-sat b_and!1011 (not b_next!529))
(get-model)

(declare-fun d!2837 () Bool)

(get-info :version)

(assert (=> d!2837 (= (isEmpty!138 l!1612) ((_ is Nil!499) l!1612))))

(assert (=> b!15741 d!2837))

(declare-fun d!2839 () Bool)

(declare-fun res!11865 () Bool)

(declare-fun e!9631 () Bool)

(assert (=> d!2839 (=> res!11865 e!9631)))

(assert (=> d!2839 (= res!11865 ((_ is Nil!498) (toList!252 (--!7 lm!238 l!1612))))))

(assert (=> d!2839 (= (forall!128 (toList!252 (--!7 lm!238 l!1612)) p!262) e!9631)))

(declare-fun b!15778 () Bool)

(declare-fun e!9632 () Bool)

(assert (=> b!15778 (= e!9631 e!9632)))

(declare-fun res!11866 () Bool)

(assert (=> b!15778 (=> (not res!11866) (not e!9632))))

(declare-fun dynLambda!115 (Int tuple2!642) Bool)

(assert (=> b!15778 (= res!11866 (dynLambda!115 p!262 (h!1063 (toList!252 (--!7 lm!238 l!1612)))))))

(declare-fun b!15779 () Bool)

(assert (=> b!15779 (= e!9632 (forall!128 (t!2975 (toList!252 (--!7 lm!238 l!1612))) p!262))))

(assert (= (and d!2839 (not res!11865)) b!15778))

(assert (= (and b!15778 res!11866) b!15779))

(declare-fun b_lambda!1119 () Bool)

(assert (=> (not b_lambda!1119) (not b!15778)))

(declare-fun t!2986 () Bool)

(declare-fun tb!469 () Bool)

(assert (=> (and start!2610 (= p!262 p!262) t!2986) tb!469))

(declare-fun result!811 () Bool)

(assert (=> tb!469 (= result!811 true)))

(assert (=> b!15778 t!2986))

(declare-fun b_and!1021 () Bool)

(assert (= b_and!1011 (and (=> t!2986 result!811) b_and!1021)))

(declare-fun m!10817 () Bool)

(assert (=> b!15778 m!10817))

(declare-fun m!10819 () Bool)

(assert (=> b!15779 m!10819))

(assert (=> b!15742 d!2839))

(declare-fun d!2845 () Bool)

(declare-fun c!1490 () Bool)

(assert (=> d!2845 (= c!1490 ((_ is Nil!499) l!1612))))

(declare-fun e!9642 () ListLongMap!473)

(assert (=> d!2845 (= (--!7 lm!238 l!1612) e!9642)))

(declare-fun b!15794 () Bool)

(assert (=> b!15794 (= e!9642 lm!238)))

(declare-fun b!15795 () Bool)

(declare-fun -!28 (ListLongMap!473 (_ BitVec 64)) ListLongMap!473)

(assert (=> b!15795 (= e!9642 (--!7 (-!28 lm!238 (h!1064 l!1612)) (t!2976 l!1612)))))

(assert (= (and d!2845 c!1490) b!15794))

(assert (= (and d!2845 (not c!1490)) b!15795))

(declare-fun m!10831 () Bool)

(assert (=> b!15795 m!10831))

(assert (=> b!15795 m!10831))

(declare-fun m!10833 () Bool)

(assert (=> b!15795 m!10833))

(assert (=> b!15742 d!2845))

(declare-fun d!2853 () Bool)

(declare-fun res!11871 () Bool)

(declare-fun e!9643 () Bool)

(assert (=> d!2853 (=> res!11871 e!9643)))

(assert (=> d!2853 (= res!11871 ((_ is Nil!498) (toList!252 lm!238)))))

(assert (=> d!2853 (= (forall!128 (toList!252 lm!238) p!262) e!9643)))

(declare-fun b!15796 () Bool)

(declare-fun e!9644 () Bool)

(assert (=> b!15796 (= e!9643 e!9644)))

(declare-fun res!11872 () Bool)

(assert (=> b!15796 (=> (not res!11872) (not e!9644))))

(assert (=> b!15796 (= res!11872 (dynLambda!115 p!262 (h!1063 (toList!252 lm!238))))))

(declare-fun b!15797 () Bool)

(assert (=> b!15797 (= e!9644 (forall!128 (t!2975 (toList!252 lm!238)) p!262))))

(assert (= (and d!2853 (not res!11871)) b!15796))

(assert (= (and b!15796 res!11872) b!15797))

(declare-fun b_lambda!1125 () Bool)

(assert (=> (not b_lambda!1125) (not b!15796)))

(declare-fun t!2992 () Bool)

(declare-fun tb!475 () Bool)

(assert (=> (and start!2610 (= p!262 p!262) t!2992) tb!475))

(declare-fun result!817 () Bool)

(assert (=> tb!475 (= result!817 true)))

(assert (=> b!15796 t!2992))

(declare-fun b_and!1027 () Bool)

(assert (= b_and!1021 (and (=> t!2992 result!817) b_and!1027)))

(declare-fun m!10839 () Bool)

(assert (=> b!15796 m!10839))

(declare-fun m!10841 () Bool)

(assert (=> b!15797 m!10841))

(assert (=> start!2610 d!2853))

(declare-fun d!2857 () Bool)

(declare-fun isStrictlySorted!148 (List!501) Bool)

(assert (=> d!2857 (= (inv!840 lm!238) (isStrictlySorted!148 (toList!252 lm!238)))))

(declare-fun bs!719 () Bool)

(assert (= bs!719 d!2857))

(declare-fun m!10849 () Bool)

(assert (=> bs!719 m!10849))

(assert (=> start!2610 d!2857))

(declare-fun b!15818 () Bool)

(declare-fun e!9656 () Bool)

(declare-fun tp_is_empty!809 () Bool)

(declare-fun tp!2726 () Bool)

(assert (=> b!15818 (= e!9656 (and tp_is_empty!809 tp!2726))))

(assert (=> b!15743 (= tp!2704 e!9656)))

(assert (= (and b!15743 ((_ is Cons!497) (toList!252 lm!238))) b!15818))

(declare-fun b_lambda!1135 () Bool)

(assert (= b_lambda!1125 (or (and start!2610 b_free!529) b_lambda!1135)))

(declare-fun b_lambda!1137 () Bool)

(assert (= b_lambda!1119 (or (and start!2610 b_free!529) b_lambda!1137)))

(check-sat (not b_lambda!1137) tp_is_empty!809 (not b!15818) (not b!15795) (not b!15779) (not b!15797) (not b_lambda!1135) (not d!2857) b_and!1027 (not b_next!529))
(check-sat b_and!1027 (not b_next!529))
