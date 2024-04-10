; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2614 () Bool)

(assert start!2614)

(declare-fun b_free!533 () Bool)

(declare-fun b_next!533 () Bool)

(assert (=> start!2614 (= b_free!533 (not b_next!533))))

(declare-fun tp!2716 () Bool)

(declare-fun b_and!1015 () Bool)

(assert (=> start!2614 (= tp!2716 b_and!1015)))

(declare-fun res!11847 () Bool)

(declare-fun e!9614 () Bool)

(assert (=> start!2614 (=> (not res!11847) (not e!9614))))

(declare-datatypes ((B!654 0))(
  ( (B!655 (val!425 Int)) )
))
(declare-datatypes ((tuple2!650 0))(
  ( (tuple2!651 (_1!325 (_ BitVec 64)) (_2!325 B!654)) )
))
(declare-datatypes ((List!509 0))(
  ( (Nil!506) (Cons!505 (h!1071 tuple2!650) (t!2983 List!509)) )
))
(declare-datatypes ((ListLongMap!481 0))(
  ( (ListLongMap!482 (toList!256 List!509)) )
))
(declare-fun lm!238 () ListLongMap!481)

(declare-fun p!262 () Int)

(declare-fun forall!130 (List!509 Int) Bool)

(assert (=> start!2614 (= res!11847 (forall!130 (toList!256 lm!238) p!262))))

(assert (=> start!2614 e!9614))

(declare-fun e!9613 () Bool)

(declare-fun inv!842 (ListLongMap!481) Bool)

(assert (=> start!2614 (and (inv!842 lm!238) e!9613)))

(assert (=> start!2614 tp!2716))

(assert (=> start!2614 true))

(declare-fun b!15759 () Bool)

(declare-fun res!11848 () Bool)

(assert (=> b!15759 (=> (not res!11848) (not e!9614))))

(declare-datatypes ((List!510 0))(
  ( (Nil!507) (Cons!506 (h!1072 (_ BitVec 64)) (t!2984 List!510)) )
))
(declare-fun l!1612 () List!510)

(declare-fun isEmpty!140 (List!510) Bool)

(assert (=> b!15759 (= res!11848 (isEmpty!140 l!1612))))

(declare-fun b!15760 () Bool)

(declare-fun --!9 (ListLongMap!481 List!510) ListLongMap!481)

(assert (=> b!15760 (= e!9614 (not (forall!130 (toList!256 (--!9 lm!238 l!1612)) p!262)))))

(declare-fun b!15761 () Bool)

(declare-fun tp!2717 () Bool)

(assert (=> b!15761 (= e!9613 tp!2717)))

(assert (= (and start!2614 res!11847) b!15759))

(assert (= (and b!15759 res!11848) b!15760))

(assert (= start!2614 b!15761))

(declare-fun m!10807 () Bool)

(assert (=> start!2614 m!10807))

(declare-fun m!10809 () Bool)

(assert (=> start!2614 m!10809))

(declare-fun m!10811 () Bool)

(assert (=> b!15759 m!10811))

(declare-fun m!10813 () Bool)

(assert (=> b!15760 m!10813))

(declare-fun m!10815 () Bool)

(assert (=> b!15760 m!10815))

(push 1)

(assert (not b_next!533))

(assert (not b!15759))

(assert (not start!2614))

(assert (not b!15760))

(assert b_and!1015)

(assert (not b!15761))

(check-sat)

(pop 1)

(push 1)

(assert b_and!1015)

(assert (not b_next!533))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!2831 () Bool)

(assert (=> d!2831 (= (isEmpty!140 l!1612) (is-Nil!507 l!1612))))

(assert (=> b!15759 d!2831))

(declare-fun d!2833 () Bool)

(declare-fun res!11859 () Bool)

(declare-fun e!9625 () Bool)

(assert (=> d!2833 (=> res!11859 e!9625)))

(assert (=> d!2833 (= res!11859 (is-Nil!506 (toList!256 (--!9 lm!238 l!1612))))))

(assert (=> d!2833 (= (forall!130 (toList!256 (--!9 lm!238 l!1612)) p!262) e!9625)))

(declare-fun b!15772 () Bool)

(declare-fun e!9626 () Bool)

(assert (=> b!15772 (= e!9625 e!9626)))

(declare-fun res!11860 () Bool)

(assert (=> b!15772 (=> (not res!11860) (not e!9626))))

(declare-fun dynLambda!115 (Int tuple2!650) Bool)

(assert (=> b!15772 (= res!11860 (dynLambda!115 p!262 (h!1071 (toList!256 (--!9 lm!238 l!1612)))))))

(declare-fun b!15773 () Bool)

(assert (=> b!15773 (= e!9626 (forall!130 (t!2983 (toList!256 (--!9 lm!238 l!1612))) p!262))))

(assert (= (and d!2833 (not res!11859)) b!15772))

(assert (= (and b!15772 res!11860) b!15773))

(declare-fun b_lambda!1117 () Bool)

(assert (=> (not b_lambda!1117) (not b!15772)))

(declare-fun t!2988 () Bool)

(declare-fun tb!467 () Bool)

(assert (=> (and start!2614 (= p!262 p!262) t!2988) tb!467))

(declare-fun result!809 () Bool)

(assert (=> tb!467 (= result!809 true)))

(assert (=> b!15772 t!2988))

(declare-fun b_and!1019 () Bool)

(assert (= b_and!1015 (and (=> t!2988 result!809) b_and!1019)))

(declare-fun m!10821 () Bool)

(assert (=> b!15772 m!10821))

(declare-fun m!10823 () Bool)

(assert (=> b!15773 m!10823))

(assert (=> b!15760 d!2833))

(declare-fun d!2841 () Bool)

(declare-fun c!1490 () Bool)

(assert (=> d!2841 (= c!1490 (is-Nil!507 l!1612))))

(declare-fun e!9638 () ListLongMap!481)

(assert (=> d!2841 (= (--!9 lm!238 l!1612) e!9638)))

(declare-fun b!15790 () Bool)

(assert (=> b!15790 (= e!9638 lm!238)))

(declare-fun b!15791 () Bool)

(declare-fun -!28 (ListLongMap!481 (_ BitVec 64)) ListLongMap!481)

(assert (=> b!15791 (= e!9638 (--!9 (-!28 lm!238 (h!1072 l!1612)) (t!2984 l!1612)))))

(assert (= (and d!2841 c!1490) b!15790))

(assert (= (and d!2841 (not c!1490)) b!15791))

(declare-fun m!10833 () Bool)

(assert (=> b!15791 m!10833))

(assert (=> b!15791 m!10833))

(declare-fun m!10835 () Bool)

(assert (=> b!15791 m!10835))

(assert (=> b!15760 d!2841))

(declare-fun d!2847 () Bool)

(declare-fun res!11867 () Bool)

(declare-fun e!9641 () Bool)

(assert (=> d!2847 (=> res!11867 e!9641)))

(assert (=> d!2847 (= res!11867 (is-Nil!506 (toList!256 lm!238)))))

(assert (=> d!2847 (= (forall!130 (toList!256 lm!238) p!262) e!9641)))

(declare-fun b!15796 () Bool)

(declare-fun e!9642 () Bool)

(assert (=> b!15796 (= e!9641 e!9642)))

(declare-fun res!11868 () Bool)

(assert (=> b!15796 (=> (not res!11868) (not e!9642))))

(assert (=> b!15796 (= res!11868 (dynLambda!115 p!262 (h!1071 (toList!256 lm!238))))))

(declare-fun b!15797 () Bool)

(assert (=> b!15797 (= e!9642 (forall!130 (t!2983 (toList!256 lm!238)) p!262))))

(assert (= (and d!2847 (not res!11867)) b!15796))

(assert (= (and b!15796 res!11868) b!15797))

(declare-fun b_lambda!1121 () Bool)

(assert (=> (not b_lambda!1121) (not b!15796)))

(declare-fun t!2992 () Bool)

(declare-fun tb!471 () Bool)

(assert (=> (and start!2614 (= p!262 p!262) t!2992) tb!471))

(declare-fun result!813 () Bool)

(assert (=> tb!471 (= result!813 true)))

(assert (=> b!15796 t!2992))

(declare-fun b_and!1023 () Bool)

(assert (= b_and!1019 (and (=> t!2992 result!813) b_and!1023)))

(declare-fun m!10837 () Bool)

(assert (=> b!15796 m!10837))

(declare-fun m!10839 () Bool)

(assert (=> b!15797 m!10839))

(assert (=> start!2614 d!2847))

(declare-fun d!2851 () Bool)

(declare-fun isStrictlySorted!154 (List!509) Bool)

(assert (=> d!2851 (= (inv!842 lm!238) (isStrictlySorted!154 (toList!256 lm!238)))))

(declare-fun bs!717 () Bool)

(assert (= bs!717 d!2851))

(declare-fun m!10853 () Bool)

(assert (=> bs!717 m!10853))

(assert (=> start!2614 d!2851))

(declare-fun b!15812 () Bool)

(declare-fun e!9652 () Bool)

(declare-fun tp_is_empty!805 () Bool)

(declare-fun tp!2722 () Bool)

(assert (=> b!15812 (= e!9652 (and tp_is_empty!805 tp!2722))))

(assert (=> b!15761 (= tp!2717 e!9652)))

(assert (= (and b!15761 (is-Cons!505 (toList!256 lm!238))) b!15812))

(declare-fun b_lambda!1127 () Bool)

(assert (= b_lambda!1121 (or (and start!2614 b_free!533) b_lambda!1127)))

(declare-fun b_lambda!1131 () Bool)

