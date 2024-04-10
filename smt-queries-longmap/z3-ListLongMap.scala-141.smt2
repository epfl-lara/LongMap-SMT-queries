; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2552 () Bool)

(assert start!2552)

(declare-fun b_free!525 () Bool)

(declare-fun b_next!525 () Bool)

(assert (=> start!2552 (= b_free!525 (not b_next!525))))

(declare-fun tp!2684 () Bool)

(declare-fun b_and!983 () Bool)

(assert (=> start!2552 (= tp!2684 b_and!983)))

(declare-fun res!11788 () Bool)

(declare-fun e!9533 () Bool)

(assert (=> start!2552 (=> (not res!11788) (not e!9533))))

(declare-datatypes ((B!646 0))(
  ( (B!647 (val!421 Int)) )
))
(declare-datatypes ((tuple2!642 0))(
  ( (tuple2!643 (_1!321 (_ BitVec 64)) (_2!321 B!646)) )
))
(declare-datatypes ((List!501 0))(
  ( (Nil!498) (Cons!497 (h!1063 tuple2!642) (t!2951 List!501)) )
))
(declare-datatypes ((ListLongMap!473 0))(
  ( (ListLongMap!474 (toList!252 List!501)) )
))
(declare-fun lm!238 () ListLongMap!473)

(declare-fun p!262 () Int)

(declare-fun forall!126 (List!501 Int) Bool)

(assert (=> start!2552 (= res!11788 (forall!126 (toList!252 lm!238) p!262))))

(assert (=> start!2552 e!9533))

(declare-fun e!9532 () Bool)

(declare-fun inv!833 (ListLongMap!473) Bool)

(assert (=> start!2552 (and (inv!833 lm!238) e!9532)))

(assert (=> start!2552 tp!2684))

(assert (=> start!2552 true))

(declare-fun b!15648 () Bool)

(declare-fun res!11787 () Bool)

(assert (=> b!15648 (=> (not res!11787) (not e!9533))))

(declare-datatypes ((List!502 0))(
  ( (Nil!499) (Cons!498 (h!1064 (_ BitVec 64)) (t!2952 List!502)) )
))
(declare-fun l!1612 () List!502)

(declare-fun isEmpty!136 (List!502) Bool)

(assert (=> b!15648 (= res!11787 (not (isEmpty!136 l!1612)))))

(declare-fun b!15649 () Bool)

(declare-fun --!5 (ListLongMap!473 List!502) ListLongMap!473)

(assert (=> b!15649 (= e!9533 (not (forall!126 (toList!252 (--!5 lm!238 l!1612)) p!262)))))

(declare-fun lt!3871 () ListLongMap!473)

(declare-fun lt!3872 () List!502)

(assert (=> b!15649 (forall!126 (toList!252 (--!5 lt!3871 lt!3872)) p!262)))

(declare-datatypes ((Unit!314 0))(
  ( (Unit!315) )
))
(declare-fun lt!3869 () Unit!314)

(declare-fun removeAllValidProp!3 (ListLongMap!473 List!502 Int) Unit!314)

(assert (=> b!15649 (= lt!3869 (removeAllValidProp!3 lt!3871 lt!3872 p!262))))

(declare-fun tail!63 (List!502) List!502)

(assert (=> b!15649 (= lt!3872 (tail!63 l!1612))))

(assert (=> b!15649 (forall!126 (toList!252 lt!3871) p!262)))

(declare-fun lt!3873 () (_ BitVec 64))

(declare-fun -!25 (ListLongMap!473 (_ BitVec 64)) ListLongMap!473)

(assert (=> b!15649 (= lt!3871 (-!25 lm!238 lt!3873))))

(declare-fun lt!3870 () Unit!314)

(declare-fun removeValidProp!18 (ListLongMap!473 Int (_ BitVec 64)) Unit!314)

(assert (=> b!15649 (= lt!3870 (removeValidProp!18 lm!238 p!262 lt!3873))))

(declare-fun head!816 (List!502) (_ BitVec 64))

(assert (=> b!15649 (= lt!3873 (head!816 l!1612))))

(declare-fun b!15650 () Bool)

(declare-fun tp!2683 () Bool)

(assert (=> b!15650 (= e!9532 tp!2683)))

(assert (= (and start!2552 res!11788) b!15648))

(assert (= (and b!15648 res!11787) b!15649))

(assert (= start!2552 b!15650))

(declare-fun m!10627 () Bool)

(assert (=> start!2552 m!10627))

(declare-fun m!10629 () Bool)

(assert (=> start!2552 m!10629))

(declare-fun m!10631 () Bool)

(assert (=> b!15648 m!10631))

(declare-fun m!10633 () Bool)

(assert (=> b!15649 m!10633))

(declare-fun m!10635 () Bool)

(assert (=> b!15649 m!10635))

(declare-fun m!10637 () Bool)

(assert (=> b!15649 m!10637))

(declare-fun m!10639 () Bool)

(assert (=> b!15649 m!10639))

(declare-fun m!10641 () Bool)

(assert (=> b!15649 m!10641))

(declare-fun m!10643 () Bool)

(assert (=> b!15649 m!10643))

(declare-fun m!10645 () Bool)

(assert (=> b!15649 m!10645))

(declare-fun m!10647 () Bool)

(assert (=> b!15649 m!10647))

(declare-fun m!10649 () Bool)

(assert (=> b!15649 m!10649))

(declare-fun m!10651 () Bool)

(assert (=> b!15649 m!10651))

(check-sat (not b!15649) (not start!2552) (not b!15650) b_and!983 (not b_next!525) (not b!15648))
(check-sat b_and!983 (not b_next!525))
(get-model)

(declare-fun d!2753 () Bool)

(declare-fun res!11811 () Bool)

(declare-fun e!9556 () Bool)

(assert (=> d!2753 (=> res!11811 e!9556)))

(get-info :version)

(assert (=> d!2753 (= res!11811 ((_ is Nil!498) (toList!252 lm!238)))))

(assert (=> d!2753 (= (forall!126 (toList!252 lm!238) p!262) e!9556)))

(declare-fun b!15676 () Bool)

(declare-fun e!9557 () Bool)

(assert (=> b!15676 (= e!9556 e!9557)))

(declare-fun res!11812 () Bool)

(assert (=> b!15676 (=> (not res!11812) (not e!9557))))

(declare-fun dynLambda!113 (Int tuple2!642) Bool)

(assert (=> b!15676 (= res!11812 (dynLambda!113 p!262 (h!1063 (toList!252 lm!238))))))

(declare-fun b!15677 () Bool)

(assert (=> b!15677 (= e!9557 (forall!126 (t!2951 (toList!252 lm!238)) p!262))))

(assert (= (and d!2753 (not res!11811)) b!15676))

(assert (= (and b!15676 res!11812) b!15677))

(declare-fun b_lambda!1071 () Bool)

(assert (=> (not b_lambda!1071) (not b!15676)))

(declare-fun t!2960 () Bool)

(declare-fun tb!445 () Bool)

(assert (=> (and start!2552 (= p!262 p!262) t!2960) tb!445))

(declare-fun result!781 () Bool)

(assert (=> tb!445 (= result!781 true)))

(assert (=> b!15676 t!2960))

(declare-fun b_and!991 () Bool)

(assert (= b_and!983 (and (=> t!2960 result!781) b_and!991)))

(declare-fun m!10687 () Bool)

(assert (=> b!15676 m!10687))

(declare-fun m!10689 () Bool)

(assert (=> b!15677 m!10689))

(assert (=> start!2552 d!2753))

(declare-fun d!2759 () Bool)

(declare-fun isStrictlySorted!149 (List!501) Bool)

(assert (=> d!2759 (= (inv!833 lm!238) (isStrictlySorted!149 (toList!252 lm!238)))))

(declare-fun bs!704 () Bool)

(assert (= bs!704 d!2759))

(declare-fun m!10695 () Bool)

(assert (=> bs!704 m!10695))

(assert (=> start!2552 d!2759))

(declare-fun d!2769 () Bool)

(assert (=> d!2769 (= (isEmpty!136 l!1612) ((_ is Nil!499) l!1612))))

(assert (=> b!15648 d!2769))

(declare-fun d!2775 () Bool)

(assert (=> d!2775 (= (tail!63 l!1612) (t!2952 l!1612))))

(assert (=> b!15649 d!2775))

(declare-fun d!2779 () Bool)

(assert (=> d!2779 (= (head!816 l!1612) (h!1064 l!1612))))

(assert (=> b!15649 d!2779))

(declare-fun d!2781 () Bool)

(declare-fun res!11817 () Bool)

(declare-fun e!9562 () Bool)

(assert (=> d!2781 (=> res!11817 e!9562)))

(assert (=> d!2781 (= res!11817 ((_ is Nil!498) (toList!252 lt!3871)))))

(assert (=> d!2781 (= (forall!126 (toList!252 lt!3871) p!262) e!9562)))

(declare-fun b!15682 () Bool)

(declare-fun e!9563 () Bool)

(assert (=> b!15682 (= e!9562 e!9563)))

(declare-fun res!11818 () Bool)

(assert (=> b!15682 (=> (not res!11818) (not e!9563))))

(assert (=> b!15682 (= res!11818 (dynLambda!113 p!262 (h!1063 (toList!252 lt!3871))))))

(declare-fun b!15683 () Bool)

(assert (=> b!15683 (= e!9563 (forall!126 (t!2951 (toList!252 lt!3871)) p!262))))

(assert (= (and d!2781 (not res!11817)) b!15682))

(assert (= (and b!15682 res!11818) b!15683))

(declare-fun b_lambda!1077 () Bool)

(assert (=> (not b_lambda!1077) (not b!15682)))

(declare-fun t!2966 () Bool)

(declare-fun tb!451 () Bool)

(assert (=> (and start!2552 (= p!262 p!262) t!2966) tb!451))

(declare-fun result!787 () Bool)

(assert (=> tb!451 (= result!787 true)))

(assert (=> b!15682 t!2966))

(declare-fun b_and!997 () Bool)

(assert (= b_and!991 (and (=> t!2966 result!787) b_and!997)))

(declare-fun m!10705 () Bool)

(assert (=> b!15682 m!10705))

(declare-fun m!10707 () Bool)

(assert (=> b!15683 m!10707))

(assert (=> b!15649 d!2781))

(declare-fun d!2783 () Bool)

(declare-fun c!1481 () Bool)

(assert (=> d!2783 (= c!1481 ((_ is Nil!499) lt!3872))))

(declare-fun e!9572 () ListLongMap!473)

(assert (=> d!2783 (= (--!5 lt!3871 lt!3872) e!9572)))

(declare-fun b!15700 () Bool)

(assert (=> b!15700 (= e!9572 lt!3871)))

(declare-fun b!15701 () Bool)

(assert (=> b!15701 (= e!9572 (--!5 (-!25 lt!3871 (h!1064 lt!3872)) (t!2952 lt!3872)))))

(assert (= (and d!2783 c!1481) b!15700))

(assert (= (and d!2783 (not c!1481)) b!15701))

(declare-fun m!10717 () Bool)

(assert (=> b!15701 m!10717))

(assert (=> b!15701 m!10717))

(declare-fun m!10719 () Bool)

(assert (=> b!15701 m!10719))

(assert (=> b!15649 d!2783))

(declare-fun d!2789 () Bool)

(declare-fun res!11819 () Bool)

(declare-fun e!9573 () Bool)

(assert (=> d!2789 (=> res!11819 e!9573)))

(assert (=> d!2789 (= res!11819 ((_ is Nil!498) (toList!252 (--!5 lm!238 l!1612))))))

(assert (=> d!2789 (= (forall!126 (toList!252 (--!5 lm!238 l!1612)) p!262) e!9573)))

(declare-fun b!15702 () Bool)

(declare-fun e!9574 () Bool)

(assert (=> b!15702 (= e!9573 e!9574)))

(declare-fun res!11820 () Bool)

(assert (=> b!15702 (=> (not res!11820) (not e!9574))))

(assert (=> b!15702 (= res!11820 (dynLambda!113 p!262 (h!1063 (toList!252 (--!5 lm!238 l!1612)))))))

(declare-fun b!15703 () Bool)

(assert (=> b!15703 (= e!9574 (forall!126 (t!2951 (toList!252 (--!5 lm!238 l!1612))) p!262))))

(assert (= (and d!2789 (not res!11819)) b!15702))

(assert (= (and b!15702 res!11820) b!15703))

(declare-fun b_lambda!1079 () Bool)

(assert (=> (not b_lambda!1079) (not b!15702)))

(declare-fun t!2968 () Bool)

(declare-fun tb!453 () Bool)

(assert (=> (and start!2552 (= p!262 p!262) t!2968) tb!453))

(declare-fun result!789 () Bool)

(assert (=> tb!453 (= result!789 true)))

(assert (=> b!15702 t!2968))

(declare-fun b_and!999 () Bool)

(assert (= b_and!997 (and (=> t!2968 result!789) b_and!999)))

(declare-fun m!10721 () Bool)

(assert (=> b!15702 m!10721))

(declare-fun m!10723 () Bool)

(assert (=> b!15703 m!10723))

(assert (=> b!15649 d!2789))

(declare-fun d!2791 () Bool)

(assert (=> d!2791 (forall!126 (toList!252 (--!5 lt!3871 lt!3872)) p!262)))

(declare-fun lt!3897 () Unit!314)

(declare-fun choose!177 (ListLongMap!473 List!502 Int) Unit!314)

(assert (=> d!2791 (= lt!3897 (choose!177 lt!3871 lt!3872 p!262))))

(assert (=> d!2791 (forall!126 (toList!252 lt!3871) p!262)))

(assert (=> d!2791 (= (removeAllValidProp!3 lt!3871 lt!3872 p!262) lt!3897)))

(declare-fun bs!707 () Bool)

(assert (= bs!707 d!2791))

(assert (=> bs!707 m!10643))

(assert (=> bs!707 m!10635))

(declare-fun m!10739 () Bool)

(assert (=> bs!707 m!10739))

(assert (=> bs!707 m!10641))

(assert (=> b!15649 d!2791))

(declare-fun d!2803 () Bool)

(declare-fun c!1483 () Bool)

(assert (=> d!2803 (= c!1483 ((_ is Nil!499) l!1612))))

(declare-fun e!9580 () ListLongMap!473)

(assert (=> d!2803 (= (--!5 lm!238 l!1612) e!9580)))

(declare-fun b!15710 () Bool)

(assert (=> b!15710 (= e!9580 lm!238)))

(declare-fun b!15711 () Bool)

(assert (=> b!15711 (= e!9580 (--!5 (-!25 lm!238 (h!1064 l!1612)) (t!2952 l!1612)))))

(assert (= (and d!2803 c!1483) b!15710))

(assert (= (and d!2803 (not c!1483)) b!15711))

(declare-fun m!10743 () Bool)

(assert (=> b!15711 m!10743))

(assert (=> b!15711 m!10743))

(declare-fun m!10747 () Bool)

(assert (=> b!15711 m!10747))

(assert (=> b!15649 d!2803))

(declare-fun d!2807 () Bool)

(declare-fun res!11825 () Bool)

(declare-fun e!9581 () Bool)

(assert (=> d!2807 (=> res!11825 e!9581)))

(assert (=> d!2807 (= res!11825 ((_ is Nil!498) (toList!252 (--!5 lt!3871 lt!3872))))))

(assert (=> d!2807 (= (forall!126 (toList!252 (--!5 lt!3871 lt!3872)) p!262) e!9581)))

(declare-fun b!15712 () Bool)

(declare-fun e!9582 () Bool)

(assert (=> b!15712 (= e!9581 e!9582)))

(declare-fun res!11826 () Bool)

(assert (=> b!15712 (=> (not res!11826) (not e!9582))))

(assert (=> b!15712 (= res!11826 (dynLambda!113 p!262 (h!1063 (toList!252 (--!5 lt!3871 lt!3872)))))))

(declare-fun b!15713 () Bool)

(assert (=> b!15713 (= e!9582 (forall!126 (t!2951 (toList!252 (--!5 lt!3871 lt!3872))) p!262))))

(assert (= (and d!2807 (not res!11825)) b!15712))

(assert (= (and b!15712 res!11826) b!15713))

(declare-fun b_lambda!1085 () Bool)

(assert (=> (not b_lambda!1085) (not b!15712)))

(declare-fun t!2974 () Bool)

(declare-fun tb!459 () Bool)

(assert (=> (and start!2552 (= p!262 p!262) t!2974) tb!459))

(declare-fun result!795 () Bool)

(assert (=> tb!459 (= result!795 true)))

(assert (=> b!15712 t!2974))

(declare-fun b_and!1005 () Bool)

(assert (= b_and!999 (and (=> t!2974 result!795) b_and!1005)))

(declare-fun m!10749 () Bool)

(assert (=> b!15712 m!10749))

(declare-fun m!10751 () Bool)

(assert (=> b!15713 m!10751))

(assert (=> b!15649 d!2807))

(declare-fun d!2809 () Bool)

(declare-fun lt!3906 () ListLongMap!473)

(declare-fun contains!202 (ListLongMap!473 (_ BitVec 64)) Bool)

(assert (=> d!2809 (not (contains!202 lt!3906 lt!3873))))

(declare-fun removeStrictlySorted!14 (List!501 (_ BitVec 64)) List!501)

(assert (=> d!2809 (= lt!3906 (ListLongMap!474 (removeStrictlySorted!14 (toList!252 lm!238) lt!3873)))))

(assert (=> d!2809 (= (-!25 lm!238 lt!3873) lt!3906)))

(declare-fun bs!710 () Bool)

(assert (= bs!710 d!2809))

(declare-fun m!10773 () Bool)

(assert (=> bs!710 m!10773))

(declare-fun m!10775 () Bool)

(assert (=> bs!710 m!10775))

(assert (=> b!15649 d!2809))

(declare-fun d!2823 () Bool)

(assert (=> d!2823 (forall!126 (toList!252 (-!25 lm!238 lt!3873)) p!262)))

(declare-fun lt!3915 () Unit!314)

(declare-fun choose!180 (ListLongMap!473 Int (_ BitVec 64)) Unit!314)

(assert (=> d!2823 (= lt!3915 (choose!180 lm!238 p!262 lt!3873))))

(assert (=> d!2823 (forall!126 (toList!252 lm!238) p!262)))

(assert (=> d!2823 (= (removeValidProp!18 lm!238 p!262 lt!3873) lt!3915)))

(declare-fun bs!713 () Bool)

(assert (= bs!713 d!2823))

(assert (=> bs!713 m!10639))

(declare-fun m!10783 () Bool)

(assert (=> bs!713 m!10783))

(declare-fun m!10785 () Bool)

(assert (=> bs!713 m!10785))

(assert (=> bs!713 m!10627))

(assert (=> b!15649 d!2823))

(declare-fun b!15734 () Bool)

(declare-fun e!9596 () Bool)

(declare-fun tp_is_empty!803 () Bool)

(declare-fun tp!2699 () Bool)

(assert (=> b!15734 (= e!9596 (and tp_is_empty!803 tp!2699))))

(assert (=> b!15650 (= tp!2683 e!9596)))

(assert (= (and b!15650 ((_ is Cons!497) (toList!252 lm!238))) b!15734))

(declare-fun b_lambda!1107 () Bool)

(assert (= b_lambda!1079 (or (and start!2552 b_free!525) b_lambda!1107)))

(declare-fun b_lambda!1109 () Bool)

(assert (= b_lambda!1085 (or (and start!2552 b_free!525) b_lambda!1109)))

(declare-fun b_lambda!1111 () Bool)

(assert (= b_lambda!1077 (or (and start!2552 b_free!525) b_lambda!1111)))

(declare-fun b_lambda!1113 () Bool)

(assert (= b_lambda!1071 (or (and start!2552 b_free!525) b_lambda!1113)))

(check-sat (not b!15683) b_and!1005 (not b_lambda!1111) tp_is_empty!803 (not b!15677) (not b!15703) (not b!15711) (not d!2809) (not d!2823) (not b!15701) (not d!2759) (not b_next!525) (not b_lambda!1113) (not d!2791) (not b!15713) (not b_lambda!1109) (not b!15734) (not b_lambda!1107))
(check-sat b_and!1005 (not b_next!525))
