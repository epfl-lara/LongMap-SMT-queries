; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2612 () Bool)

(assert start!2612)

(declare-fun b_free!531 () Bool)

(declare-fun b_next!531 () Bool)

(assert (=> start!2612 (= b_free!531 (not b_next!531))))

(declare-fun tp!2710 () Bool)

(declare-fun b_and!1013 () Bool)

(assert (=> start!2612 (= tp!2710 b_and!1013)))

(declare-fun res!11841 () Bool)

(declare-fun e!9608 () Bool)

(assert (=> start!2612 (=> (not res!11841) (not e!9608))))

(declare-datatypes ((B!652 0))(
  ( (B!653 (val!424 Int)) )
))
(declare-datatypes ((tuple2!648 0))(
  ( (tuple2!649 (_1!324 (_ BitVec 64)) (_2!324 B!652)) )
))
(declare-datatypes ((List!507 0))(
  ( (Nil!504) (Cons!503 (h!1069 tuple2!648) (t!2981 List!507)) )
))
(declare-datatypes ((ListLongMap!479 0))(
  ( (ListLongMap!480 (toList!255 List!507)) )
))
(declare-fun lm!238 () ListLongMap!479)

(declare-fun p!262 () Int)

(declare-fun forall!129 (List!507 Int) Bool)

(assert (=> start!2612 (= res!11841 (forall!129 (toList!255 lm!238) p!262))))

(assert (=> start!2612 e!9608))

(declare-fun e!9607 () Bool)

(declare-fun inv!841 (ListLongMap!479) Bool)

(assert (=> start!2612 (and (inv!841 lm!238) e!9607)))

(assert (=> start!2612 tp!2710))

(assert (=> start!2612 true))

(declare-fun b!15750 () Bool)

(declare-fun res!11842 () Bool)

(assert (=> b!15750 (=> (not res!11842) (not e!9608))))

(declare-datatypes ((List!508 0))(
  ( (Nil!505) (Cons!504 (h!1070 (_ BitVec 64)) (t!2982 List!508)) )
))
(declare-fun l!1612 () List!508)

(declare-fun isEmpty!139 (List!508) Bool)

(assert (=> b!15750 (= res!11842 (isEmpty!139 l!1612))))

(declare-fun b!15751 () Bool)

(declare-fun --!8 (ListLongMap!479 List!508) ListLongMap!479)

(assert (=> b!15751 (= e!9608 (not (forall!129 (toList!255 (--!8 lm!238 l!1612)) p!262)))))

(declare-fun b!15752 () Bool)

(declare-fun tp!2711 () Bool)

(assert (=> b!15752 (= e!9607 tp!2711)))

(assert (= (and start!2612 res!11841) b!15750))

(assert (= (and b!15750 res!11842) b!15751))

(assert (= start!2612 b!15752))

(declare-fun m!10797 () Bool)

(assert (=> start!2612 m!10797))

(declare-fun m!10799 () Bool)

(assert (=> start!2612 m!10799))

(declare-fun m!10801 () Bool)

(assert (=> b!15750 m!10801))

(declare-fun m!10803 () Bool)

(assert (=> b!15751 m!10803))

(declare-fun m!10805 () Bool)

(assert (=> b!15751 m!10805))

(check-sat (not start!2612) b_and!1013 (not b!15750) (not b!15752) (not b!15751) (not b_next!531))
(check-sat b_and!1013 (not b_next!531))
(get-model)

(declare-fun d!2835 () Bool)

(get-info :version)

(assert (=> d!2835 (= (isEmpty!139 l!1612) ((_ is Nil!505) l!1612))))

(assert (=> b!15750 d!2835))

(declare-fun d!2837 () Bool)

(declare-fun res!11865 () Bool)

(declare-fun e!9631 () Bool)

(assert (=> d!2837 (=> res!11865 e!9631)))

(assert (=> d!2837 (= res!11865 ((_ is Nil!504) (toList!255 (--!8 lm!238 l!1612))))))

(assert (=> d!2837 (= (forall!129 (toList!255 (--!8 lm!238 l!1612)) p!262) e!9631)))

(declare-fun b!15778 () Bool)

(declare-fun e!9632 () Bool)

(assert (=> b!15778 (= e!9631 e!9632)))

(declare-fun res!11866 () Bool)

(assert (=> b!15778 (=> (not res!11866) (not e!9632))))

(declare-fun dynLambda!116 (Int tuple2!648) Bool)

(assert (=> b!15778 (= res!11866 (dynLambda!116 p!262 (h!1069 (toList!255 (--!8 lm!238 l!1612)))))))

(declare-fun b!15779 () Bool)

(assert (=> b!15779 (= e!9632 (forall!129 (t!2981 (toList!255 (--!8 lm!238 l!1612))) p!262))))

(assert (= (and d!2837 (not res!11865)) b!15778))

(assert (= (and b!15778 res!11866) b!15779))

(declare-fun b_lambda!1119 () Bool)

(assert (=> (not b_lambda!1119) (not b!15778)))

(declare-fun t!2990 () Bool)

(declare-fun tb!469 () Bool)

(assert (=> (and start!2612 (= p!262 p!262) t!2990) tb!469))

(declare-fun result!811 () Bool)

(assert (=> tb!469 (= result!811 true)))

(assert (=> b!15778 t!2990))

(declare-fun b_and!1021 () Bool)

(assert (= b_and!1013 (and (=> t!2990 result!811) b_and!1021)))

(declare-fun m!10825 () Bool)

(assert (=> b!15778 m!10825))

(declare-fun m!10827 () Bool)

(assert (=> b!15779 m!10827))

(assert (=> b!15751 d!2837))

(declare-fun d!2843 () Bool)

(declare-fun c!1493 () Bool)

(assert (=> d!2843 (= c!1493 ((_ is Nil!505) l!1612))))

(declare-fun e!9645 () ListLongMap!479)

(assert (=> d!2843 (= (--!8 lm!238 l!1612) e!9645)))

(declare-fun b!15800 () Bool)

(assert (=> b!15800 (= e!9645 lm!238)))

(declare-fun b!15801 () Bool)

(declare-fun -!29 (ListLongMap!479 (_ BitVec 64)) ListLongMap!479)

(assert (=> b!15801 (= e!9645 (--!8 (-!29 lm!238 (h!1070 l!1612)) (t!2982 l!1612)))))

(assert (= (and d!2843 c!1493) b!15800))

(assert (= (and d!2843 (not c!1493)) b!15801))

(declare-fun m!10845 () Bool)

(assert (=> b!15801 m!10845))

(assert (=> b!15801 m!10845))

(declare-fun m!10847 () Bool)

(assert (=> b!15801 m!10847))

(assert (=> b!15751 d!2843))

(declare-fun d!2855 () Bool)

(declare-fun res!11871 () Bool)

(declare-fun e!9646 () Bool)

(assert (=> d!2855 (=> res!11871 e!9646)))

(assert (=> d!2855 (= res!11871 ((_ is Nil!504) (toList!255 lm!238)))))

(assert (=> d!2855 (= (forall!129 (toList!255 lm!238) p!262) e!9646)))

(declare-fun b!15802 () Bool)

(declare-fun e!9647 () Bool)

(assert (=> b!15802 (= e!9646 e!9647)))

(declare-fun res!11872 () Bool)

(assert (=> b!15802 (=> (not res!11872) (not e!9647))))

(assert (=> b!15802 (= res!11872 (dynLambda!116 p!262 (h!1069 (toList!255 lm!238))))))

(declare-fun b!15803 () Bool)

(assert (=> b!15803 (= e!9647 (forall!129 (t!2981 (toList!255 lm!238)) p!262))))

(assert (= (and d!2855 (not res!11871)) b!15802))

(assert (= (and b!15802 res!11872) b!15803))

(declare-fun b_lambda!1125 () Bool)

(assert (=> (not b_lambda!1125) (not b!15802)))

(declare-fun t!2996 () Bool)

(declare-fun tb!475 () Bool)

(assert (=> (and start!2612 (= p!262 p!262) t!2996) tb!475))

(declare-fun result!817 () Bool)

(assert (=> tb!475 (= result!817 true)))

(assert (=> b!15802 t!2996))

(declare-fun b_and!1027 () Bool)

(assert (= b_and!1021 (and (=> t!2996 result!817) b_and!1027)))

(declare-fun m!10849 () Bool)

(assert (=> b!15802 m!10849))

(declare-fun m!10851 () Bool)

(assert (=> b!15803 m!10851))

(assert (=> start!2612 d!2855))

(declare-fun d!2857 () Bool)

(declare-fun isStrictlySorted!153 (List!507) Bool)

(assert (=> d!2857 (= (inv!841 lm!238) (isStrictlySorted!153 (toList!255 lm!238)))))

(declare-fun bs!719 () Bool)

(assert (= bs!719 d!2857))

(declare-fun m!10857 () Bool)

(assert (=> bs!719 m!10857))

(assert (=> start!2612 d!2857))

(declare-fun b!15818 () Bool)

(declare-fun e!9656 () Bool)

(declare-fun tp_is_empty!809 () Bool)

(declare-fun tp!2726 () Bool)

(assert (=> b!15818 (= e!9656 (and tp_is_empty!809 tp!2726))))

(assert (=> b!15752 (= tp!2711 e!9656)))

(assert (= (and b!15752 ((_ is Cons!503) (toList!255 lm!238))) b!15818))

(declare-fun b_lambda!1135 () Bool)

(assert (= b_lambda!1119 (or (and start!2612 b_free!531) b_lambda!1135)))

(declare-fun b_lambda!1137 () Bool)

(assert (= b_lambda!1125 (or (and start!2612 b_free!531) b_lambda!1137)))

(check-sat (not b!15803) b_and!1027 tp_is_empty!809 (not b!15818) (not b!15779) (not b!15801) (not b_lambda!1137) (not b_next!531) (not d!2857) (not b_lambda!1135))
