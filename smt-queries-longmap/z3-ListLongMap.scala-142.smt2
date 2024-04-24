; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2610 () Bool)

(assert start!2610)

(declare-fun b_free!529 () Bool)

(declare-fun b_next!529 () Bool)

(assert (=> start!2610 (= b_free!529 (not b_next!529))))

(declare-fun tp!2704 () Bool)

(declare-fun b_and!1011 () Bool)

(assert (=> start!2610 (= tp!2704 b_and!1011)))

(declare-fun res!11834 () Bool)

(declare-fun e!9598 () Bool)

(assert (=> start!2610 (=> (not res!11834) (not e!9598))))

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

(assert (=> start!2610 (= res!11834 (forall!128 (toList!252 lm!238) p!262))))

(assert (=> start!2610 e!9598))

(declare-fun e!9597 () Bool)

(declare-fun inv!840 (ListLongMap!473) Bool)

(assert (=> start!2610 (and (inv!840 lm!238) e!9597)))

(assert (=> start!2610 tp!2704))

(assert (=> start!2610 true))

(declare-fun b!15735 () Bool)

(declare-fun res!11833 () Bool)

(assert (=> b!15735 (=> (not res!11833) (not e!9598))))

(declare-datatypes ((List!502 0))(
  ( (Nil!499) (Cons!498 (h!1064 (_ BitVec 64)) (t!2976 List!502)) )
))
(declare-fun l!1612 () List!502)

(declare-fun isEmpty!138 (List!502) Bool)

(assert (=> b!15735 (= res!11833 (isEmpty!138 l!1612))))

(declare-fun b!15736 () Bool)

(declare-fun --!7 (ListLongMap!473 List!502) ListLongMap!473)

(assert (=> b!15736 (= e!9598 (not (forall!128 (toList!252 (--!7 lm!238 l!1612)) p!262)))))

(declare-fun b!15737 () Bool)

(declare-fun tp!2705 () Bool)

(assert (=> b!15737 (= e!9597 tp!2705)))

(assert (= (and start!2610 res!11834) b!15735))

(assert (= (and b!15735 res!11833) b!15736))

(assert (= start!2610 b!15737))

(declare-fun m!10779 () Bool)

(assert (=> start!2610 m!10779))

(declare-fun m!10781 () Bool)

(assert (=> start!2610 m!10781))

(declare-fun m!10783 () Bool)

(assert (=> b!15735 m!10783))

(declare-fun m!10785 () Bool)

(assert (=> b!15736 m!10785))

(declare-fun m!10787 () Bool)

(assert (=> b!15736 m!10787))

(check-sat (not start!2610) (not b!15736) (not b!15737) (not b_next!529) (not b!15735) b_and!1011)
(check-sat b_and!1011 (not b_next!529))
(get-model)

(declare-fun d!2829 () Bool)

(get-info :version)

(assert (=> d!2829 (= (isEmpty!138 l!1612) ((_ is Nil!499) l!1612))))

(assert (=> b!15735 d!2829))

(declare-fun d!2831 () Bool)

(declare-fun res!11856 () Bool)

(declare-fun e!9620 () Bool)

(assert (=> d!2831 (=> res!11856 e!9620)))

(assert (=> d!2831 (= res!11856 ((_ is Nil!498) (toList!252 lm!238)))))

(assert (=> d!2831 (= (forall!128 (toList!252 lm!238) p!262) e!9620)))

(declare-fun b!15764 () Bool)

(declare-fun e!9622 () Bool)

(assert (=> b!15764 (= e!9620 e!9622)))

(declare-fun res!11858 () Bool)

(assert (=> b!15764 (=> (not res!11858) (not e!9622))))

(declare-fun dynLambda!111 (Int tuple2!642) Bool)

(assert (=> b!15764 (= res!11858 (dynLambda!111 p!262 (h!1063 (toList!252 lm!238))))))

(declare-fun b!15766 () Bool)

(assert (=> b!15766 (= e!9622 (forall!128 (t!2975 (toList!252 lm!238)) p!262))))

(assert (= (and d!2831 (not res!11856)) b!15764))

(assert (= (and b!15764 res!11858) b!15766))

(declare-fun b_lambda!1117 () Bool)

(assert (=> (not b_lambda!1117) (not b!15764)))

(declare-fun t!2984 () Bool)

(declare-fun tb!467 () Bool)

(assert (=> (and start!2610 (= p!262 p!262) t!2984) tb!467))

(declare-fun result!808 () Bool)

(assert (=> tb!467 (= result!808 true)))

(assert (=> b!15764 t!2984))

(declare-fun b_and!1019 () Bool)

(assert (= b_and!1011 (and (=> t!2984 result!808) b_and!1019)))

(declare-fun m!10810 () Bool)

(assert (=> b!15764 m!10810))

(declare-fun m!10813 () Bool)

(assert (=> b!15766 m!10813))

(assert (=> start!2610 d!2831))

(declare-fun d!2834 () Bool)

(declare-fun isStrictlySorted!141 (List!501) Bool)

(assert (=> d!2834 (= (inv!840 lm!238) (isStrictlySorted!141 (toList!252 lm!238)))))

(declare-fun bs!717 () Bool)

(assert (= bs!717 d!2834))

(declare-fun m!10817 () Bool)

(assert (=> bs!717 m!10817))

(assert (=> start!2610 d!2834))

(declare-fun d!2839 () Bool)

(declare-fun res!11859 () Bool)

(declare-fun e!9623 () Bool)

(assert (=> d!2839 (=> res!11859 e!9623)))

(assert (=> d!2839 (= res!11859 ((_ is Nil!498) (toList!252 (--!7 lm!238 l!1612))))))

(assert (=> d!2839 (= (forall!128 (toList!252 (--!7 lm!238 l!1612)) p!262) e!9623)))

(declare-fun b!15768 () Bool)

(declare-fun e!9624 () Bool)

(assert (=> b!15768 (= e!9623 e!9624)))

(declare-fun res!11860 () Bool)

(assert (=> b!15768 (=> (not res!11860) (not e!9624))))

(assert (=> b!15768 (= res!11860 (dynLambda!111 p!262 (h!1063 (toList!252 (--!7 lm!238 l!1612)))))))

(declare-fun b!15769 () Bool)

(assert (=> b!15769 (= e!9624 (forall!128 (t!2975 (toList!252 (--!7 lm!238 l!1612))) p!262))))

(assert (= (and d!2839 (not res!11859)) b!15768))

(assert (= (and b!15768 res!11860) b!15769))

(declare-fun b_lambda!1119 () Bool)

(assert (=> (not b_lambda!1119) (not b!15768)))

(declare-fun t!2986 () Bool)

(declare-fun tb!469 () Bool)

(assert (=> (and start!2610 (= p!262 p!262) t!2986) tb!469))

(declare-fun result!811 () Bool)

(assert (=> tb!469 (= result!811 true)))

(assert (=> b!15768 t!2986))

(declare-fun b_and!1021 () Bool)

(assert (= b_and!1019 (and (=> t!2986 result!811) b_and!1021)))

(declare-fun m!10819 () Bool)

(assert (=> b!15768 m!10819))

(declare-fun m!10821 () Bool)

(assert (=> b!15769 m!10821))

(assert (=> b!15736 d!2839))

(declare-fun d!2841 () Bool)

(declare-fun c!1488 () Bool)

(assert (=> d!2841 (= c!1488 ((_ is Nil!499) l!1612))))

(declare-fun e!9638 () ListLongMap!473)

(assert (=> d!2841 (= (--!7 lm!238 l!1612) e!9638)))

(declare-fun b!15788 () Bool)

(assert (=> b!15788 (= e!9638 lm!238)))

(declare-fun b!15789 () Bool)

(declare-fun -!28 (ListLongMap!473 (_ BitVec 64)) ListLongMap!473)

(assert (=> b!15789 (= e!9638 (--!7 (-!28 lm!238 (h!1064 l!1612)) (t!2976 l!1612)))))

(assert (= (and d!2841 c!1488) b!15788))

(assert (= (and d!2841 (not c!1488)) b!15789))

(declare-fun m!10831 () Bool)

(assert (=> b!15789 m!10831))

(assert (=> b!15789 m!10831))

(declare-fun m!10833 () Bool)

(assert (=> b!15789 m!10833))

(assert (=> b!15736 d!2841))

(declare-fun b!15794 () Bool)

(declare-fun e!9641 () Bool)

(declare-fun tp_is_empty!805 () Bool)

(declare-fun tp!2720 () Bool)

(assert (=> b!15794 (= e!9641 (and tp_is_empty!805 tp!2720))))

(assert (=> b!15737 (= tp!2705 e!9641)))

(assert (= (and b!15737 ((_ is Cons!497) (toList!252 lm!238))) b!15794))

(declare-fun b_lambda!1125 () Bool)

(assert (= b_lambda!1119 (or (and start!2610 b_free!529) b_lambda!1125)))

(declare-fun b_lambda!1127 () Bool)

(assert (= b_lambda!1117 (or (and start!2610 b_free!529) b_lambda!1127)))

(check-sat (not b!15789) (not b_next!529) (not d!2834) (not b_lambda!1127) b_and!1021 tp_is_empty!805 (not b!15794) (not b!15766) (not b_lambda!1125) (not b!15769))
(check-sat b_and!1021 (not b_next!529))
