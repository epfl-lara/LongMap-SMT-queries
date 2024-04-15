; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2550 () Bool)

(assert start!2550)

(declare-fun b_free!523 () Bool)

(declare-fun b_next!523 () Bool)

(assert (=> start!2550 (= b_free!523 (not b_next!523))))

(declare-fun tp!2678 () Bool)

(declare-fun b_and!981 () Bool)

(assert (=> start!2550 (= tp!2678 b_and!981)))

(declare-fun res!11782 () Bool)

(declare-fun e!9527 () Bool)

(assert (=> start!2550 (=> (not res!11782) (not e!9527))))

(declare-datatypes ((B!644 0))(
  ( (B!645 (val!420 Int)) )
))
(declare-datatypes ((tuple2!636 0))(
  ( (tuple2!637 (_1!318 (_ BitVec 64)) (_2!318 B!644)) )
))
(declare-datatypes ((List!495 0))(
  ( (Nil!492) (Cons!491 (h!1057 tuple2!636) (t!2945 List!495)) )
))
(declare-datatypes ((ListLongMap!467 0))(
  ( (ListLongMap!468 (toList!249 List!495)) )
))
(declare-fun lm!238 () ListLongMap!467)

(declare-fun p!262 () Int)

(declare-fun forall!125 (List!495 Int) Bool)

(assert (=> start!2550 (= res!11782 (forall!125 (toList!249 lm!238) p!262))))

(assert (=> start!2550 e!9527))

(declare-fun e!9526 () Bool)

(declare-fun inv!832 (ListLongMap!467) Bool)

(assert (=> start!2550 (and (inv!832 lm!238) e!9526)))

(assert (=> start!2550 tp!2678))

(assert (=> start!2550 true))

(declare-fun b!15639 () Bool)

(declare-fun res!11781 () Bool)

(assert (=> b!15639 (=> (not res!11781) (not e!9527))))

(declare-datatypes ((List!496 0))(
  ( (Nil!493) (Cons!492 (h!1058 (_ BitVec 64)) (t!2946 List!496)) )
))
(declare-fun l!1612 () List!496)

(declare-fun isEmpty!135 (List!496) Bool)

(assert (=> b!15639 (= res!11781 (not (isEmpty!135 l!1612)))))

(declare-fun b!15640 () Bool)

(declare-fun --!4 (ListLongMap!467 List!496) ListLongMap!467)

(assert (=> b!15640 (= e!9527 (not (forall!125 (toList!249 (--!4 lm!238 l!1612)) p!262)))))

(declare-fun lt!3854 () ListLongMap!467)

(declare-fun lt!3858 () List!496)

(assert (=> b!15640 (forall!125 (toList!249 (--!4 lt!3854 lt!3858)) p!262)))

(declare-datatypes ((Unit!322 0))(
  ( (Unit!323) )
))
(declare-fun lt!3856 () Unit!322)

(declare-fun removeAllValidProp!2 (ListLongMap!467 List!496 Int) Unit!322)

(assert (=> b!15640 (= lt!3856 (removeAllValidProp!2 lt!3854 lt!3858 p!262))))

(declare-fun tail!62 (List!496) List!496)

(assert (=> b!15640 (= lt!3858 (tail!62 l!1612))))

(assert (=> b!15640 (forall!125 (toList!249 lt!3854) p!262)))

(declare-fun lt!3857 () (_ BitVec 64))

(declare-fun -!24 (ListLongMap!467 (_ BitVec 64)) ListLongMap!467)

(assert (=> b!15640 (= lt!3854 (-!24 lm!238 lt!3857))))

(declare-fun lt!3855 () Unit!322)

(declare-fun removeValidProp!17 (ListLongMap!467 Int (_ BitVec 64)) Unit!322)

(assert (=> b!15640 (= lt!3855 (removeValidProp!17 lm!238 p!262 lt!3857))))

(declare-fun head!815 (List!496) (_ BitVec 64))

(assert (=> b!15640 (= lt!3857 (head!815 l!1612))))

(declare-fun b!15641 () Bool)

(declare-fun tp!2677 () Bool)

(assert (=> b!15641 (= e!9526 tp!2677)))

(assert (= (and start!2550 res!11782) b!15639))

(assert (= (and b!15639 res!11781) b!15640))

(assert (= start!2550 b!15641))

(declare-fun m!10593 () Bool)

(assert (=> start!2550 m!10593))

(declare-fun m!10595 () Bool)

(assert (=> start!2550 m!10595))

(declare-fun m!10597 () Bool)

(assert (=> b!15639 m!10597))

(declare-fun m!10599 () Bool)

(assert (=> b!15640 m!10599))

(declare-fun m!10601 () Bool)

(assert (=> b!15640 m!10601))

(declare-fun m!10603 () Bool)

(assert (=> b!15640 m!10603))

(declare-fun m!10605 () Bool)

(assert (=> b!15640 m!10605))

(declare-fun m!10607 () Bool)

(assert (=> b!15640 m!10607))

(declare-fun m!10609 () Bool)

(assert (=> b!15640 m!10609))

(declare-fun m!10611 () Bool)

(assert (=> b!15640 m!10611))

(declare-fun m!10613 () Bool)

(assert (=> b!15640 m!10613))

(declare-fun m!10615 () Bool)

(assert (=> b!15640 m!10615))

(declare-fun m!10617 () Bool)

(assert (=> b!15640 m!10617))

(check-sat b_and!981 (not b!15641) (not start!2550) (not b_next!523) (not b!15640) (not b!15639))
(check-sat b_and!981 (not b_next!523))
(get-model)

(declare-fun d!2755 () Bool)

(get-info :version)

(assert (=> d!2755 (= (isEmpty!135 l!1612) ((_ is Nil!493) l!1612))))

(assert (=> b!15639 d!2755))

(declare-fun d!2759 () Bool)

(assert (=> d!2759 (= (tail!62 l!1612) (t!2946 l!1612))))

(assert (=> b!15640 d!2759))

(declare-fun d!2763 () Bool)

(assert (=> d!2763 (forall!125 (toList!249 (-!24 lm!238 lt!3857)) p!262)))

(declare-fun lt!3891 () Unit!322)

(declare-fun choose!176 (ListLongMap!467 Int (_ BitVec 64)) Unit!322)

(assert (=> d!2763 (= lt!3891 (choose!176 lm!238 p!262 lt!3857))))

(assert (=> d!2763 (forall!125 (toList!249 lm!238) p!262)))

(assert (=> d!2763 (= (removeValidProp!17 lm!238 p!262 lt!3857) lt!3891)))

(declare-fun bs!703 () Bool)

(assert (= bs!703 d!2763))

(assert (=> bs!703 m!10603))

(declare-fun m!10689 () Bool)

(assert (=> bs!703 m!10689))

(declare-fun m!10691 () Bool)

(assert (=> bs!703 m!10691))

(assert (=> bs!703 m!10593))

(assert (=> b!15640 d!2763))

(declare-fun d!2771 () Bool)

(declare-fun res!11813 () Bool)

(declare-fun e!9561 () Bool)

(assert (=> d!2771 (=> res!11813 e!9561)))

(assert (=> d!2771 (= res!11813 ((_ is Nil!492) (toList!249 (--!4 lt!3854 lt!3858))))))

(assert (=> d!2771 (= (forall!125 (toList!249 (--!4 lt!3854 lt!3858)) p!262) e!9561)))

(declare-fun b!15684 () Bool)

(declare-fun e!9562 () Bool)

(assert (=> b!15684 (= e!9561 e!9562)))

(declare-fun res!11814 () Bool)

(assert (=> b!15684 (=> (not res!11814) (not e!9562))))

(declare-fun dynLambda!112 (Int tuple2!636) Bool)

(assert (=> b!15684 (= res!11814 (dynLambda!112 p!262 (h!1057 (toList!249 (--!4 lt!3854 lt!3858)))))))

(declare-fun b!15685 () Bool)

(assert (=> b!15685 (= e!9562 (forall!125 (t!2945 (toList!249 (--!4 lt!3854 lt!3858))) p!262))))

(assert (= (and d!2771 (not res!11813)) b!15684))

(assert (= (and b!15684 res!11814) b!15685))

(declare-fun b_lambda!1073 () Bool)

(assert (=> (not b_lambda!1073) (not b!15684)))

(declare-fun t!2958 () Bool)

(declare-fun tb!447 () Bool)

(assert (=> (and start!2550 (= p!262 p!262) t!2958) tb!447))

(declare-fun result!783 () Bool)

(assert (=> tb!447 (= result!783 true)))

(assert (=> b!15684 t!2958))

(declare-fun b_and!993 () Bool)

(assert (= b_and!981 (and (=> t!2958 result!783) b_and!993)))

(declare-fun m!10695 () Bool)

(assert (=> b!15684 m!10695))

(declare-fun m!10697 () Bool)

(assert (=> b!15685 m!10697))

(assert (=> b!15640 d!2771))

(declare-fun d!2779 () Bool)

(declare-fun lt!3899 () ListLongMap!467)

(declare-fun contains!198 (ListLongMap!467 (_ BitVec 64)) Bool)

(assert (=> d!2779 (not (contains!198 lt!3899 lt!3857))))

(declare-fun removeStrictlySorted!12 (List!495 (_ BitVec 64)) List!495)

(assert (=> d!2779 (= lt!3899 (ListLongMap!468 (removeStrictlySorted!12 (toList!249 lm!238) lt!3857)))))

(assert (=> d!2779 (= (-!24 lm!238 lt!3857) lt!3899)))

(declare-fun bs!706 () Bool)

(assert (= bs!706 d!2779))

(declare-fun m!10715 () Bool)

(assert (=> bs!706 m!10715))

(declare-fun m!10717 () Bool)

(assert (=> bs!706 m!10717))

(assert (=> b!15640 d!2779))

(declare-fun d!2789 () Bool)

(declare-fun c!1482 () Bool)

(assert (=> d!2789 (= c!1482 ((_ is Nil!493) l!1612))))

(declare-fun e!9575 () ListLongMap!467)

(assert (=> d!2789 (= (--!4 lm!238 l!1612) e!9575)))

(declare-fun b!15704 () Bool)

(assert (=> b!15704 (= e!9575 lm!238)))

(declare-fun b!15705 () Bool)

(assert (=> b!15705 (= e!9575 (--!4 (-!24 lm!238 (h!1058 l!1612)) (t!2946 l!1612)))))

(assert (= (and d!2789 c!1482) b!15704))

(assert (= (and d!2789 (not c!1482)) b!15705))

(declare-fun m!10731 () Bool)

(assert (=> b!15705 m!10731))

(assert (=> b!15705 m!10731))

(declare-fun m!10733 () Bool)

(assert (=> b!15705 m!10733))

(assert (=> b!15640 d!2789))

(declare-fun d!2801 () Bool)

(declare-fun res!11821 () Bool)

(declare-fun e!9576 () Bool)

(assert (=> d!2801 (=> res!11821 e!9576)))

(assert (=> d!2801 (= res!11821 ((_ is Nil!492) (toList!249 lt!3854)))))

(assert (=> d!2801 (= (forall!125 (toList!249 lt!3854) p!262) e!9576)))

(declare-fun b!15706 () Bool)

(declare-fun e!9577 () Bool)

(assert (=> b!15706 (= e!9576 e!9577)))

(declare-fun res!11822 () Bool)

(assert (=> b!15706 (=> (not res!11822) (not e!9577))))

(assert (=> b!15706 (= res!11822 (dynLambda!112 p!262 (h!1057 (toList!249 lt!3854))))))

(declare-fun b!15707 () Bool)

(assert (=> b!15707 (= e!9577 (forall!125 (t!2945 (toList!249 lt!3854)) p!262))))

(assert (= (and d!2801 (not res!11821)) b!15706))

(assert (= (and b!15706 res!11822) b!15707))

(declare-fun b_lambda!1081 () Bool)

(assert (=> (not b_lambda!1081) (not b!15706)))

(declare-fun t!2966 () Bool)

(declare-fun tb!455 () Bool)

(assert (=> (and start!2550 (= p!262 p!262) t!2966) tb!455))

(declare-fun result!791 () Bool)

(assert (=> tb!455 (= result!791 true)))

(assert (=> b!15706 t!2966))

(declare-fun b_and!1001 () Bool)

(assert (= b_and!993 (and (=> t!2966 result!791) b_and!1001)))

(declare-fun m!10735 () Bool)

(assert (=> b!15706 m!10735))

(declare-fun m!10737 () Bool)

(assert (=> b!15707 m!10737))

(assert (=> b!15640 d!2801))

(declare-fun d!2803 () Bool)

(assert (=> d!2803 (= (head!815 l!1612) (h!1058 l!1612))))

(assert (=> b!15640 d!2803))

(declare-fun d!2805 () Bool)

(declare-fun c!1483 () Bool)

(assert (=> d!2805 (= c!1483 ((_ is Nil!493) lt!3858))))

(declare-fun e!9578 () ListLongMap!467)

(assert (=> d!2805 (= (--!4 lt!3854 lt!3858) e!9578)))

(declare-fun b!15708 () Bool)

(assert (=> b!15708 (= e!9578 lt!3854)))

(declare-fun b!15709 () Bool)

(assert (=> b!15709 (= e!9578 (--!4 (-!24 lt!3854 (h!1058 lt!3858)) (t!2946 lt!3858)))))

(assert (= (and d!2805 c!1483) b!15708))

(assert (= (and d!2805 (not c!1483)) b!15709))

(declare-fun m!10739 () Bool)

(assert (=> b!15709 m!10739))

(assert (=> b!15709 m!10739))

(declare-fun m!10741 () Bool)

(assert (=> b!15709 m!10741))

(assert (=> b!15640 d!2805))

(declare-fun d!2807 () Bool)

(assert (=> d!2807 (forall!125 (toList!249 (--!4 lt!3854 lt!3858)) p!262)))

(declare-fun lt!3912 () Unit!322)

(declare-fun choose!181 (ListLongMap!467 List!496 Int) Unit!322)

(assert (=> d!2807 (= lt!3912 (choose!181 lt!3854 lt!3858 p!262))))

(assert (=> d!2807 (forall!125 (toList!249 lt!3854) p!262)))

(assert (=> d!2807 (= (removeAllValidProp!2 lt!3854 lt!3858 p!262) lt!3912)))

(declare-fun bs!711 () Bool)

(assert (= bs!711 d!2807))

(assert (=> bs!711 m!10599))

(assert (=> bs!711 m!10605))

(declare-fun m!10751 () Bool)

(assert (=> bs!711 m!10751))

(assert (=> bs!711 m!10607))

(assert (=> b!15640 d!2807))

(declare-fun d!2813 () Bool)

(declare-fun res!11823 () Bool)

(declare-fun e!9582 () Bool)

(assert (=> d!2813 (=> res!11823 e!9582)))

(assert (=> d!2813 (= res!11823 ((_ is Nil!492) (toList!249 (--!4 lm!238 l!1612))))))

(assert (=> d!2813 (= (forall!125 (toList!249 (--!4 lm!238 l!1612)) p!262) e!9582)))

(declare-fun b!15715 () Bool)

(declare-fun e!9583 () Bool)

(assert (=> b!15715 (= e!9582 e!9583)))

(declare-fun res!11824 () Bool)

(assert (=> b!15715 (=> (not res!11824) (not e!9583))))

(assert (=> b!15715 (= res!11824 (dynLambda!112 p!262 (h!1057 (toList!249 (--!4 lm!238 l!1612)))))))

(declare-fun b!15716 () Bool)

(assert (=> b!15716 (= e!9583 (forall!125 (t!2945 (toList!249 (--!4 lm!238 l!1612))) p!262))))

(assert (= (and d!2813 (not res!11823)) b!15715))

(assert (= (and b!15715 res!11824) b!15716))

(declare-fun b_lambda!1091 () Bool)

(assert (=> (not b_lambda!1091) (not b!15715)))

(declare-fun t!2968 () Bool)

(declare-fun tb!457 () Bool)

(assert (=> (and start!2550 (= p!262 p!262) t!2968) tb!457))

(declare-fun result!795 () Bool)

(assert (=> tb!457 (= result!795 true)))

(assert (=> b!15715 t!2968))

(declare-fun b_and!1003 () Bool)

(assert (= b_and!1001 (and (=> t!2968 result!795) b_and!1003)))

(declare-fun m!10753 () Bool)

(assert (=> b!15715 m!10753))

(declare-fun m!10755 () Bool)

(assert (=> b!15716 m!10755))

(assert (=> b!15640 d!2813))

(declare-fun d!2815 () Bool)

(declare-fun res!11825 () Bool)

(declare-fun e!9584 () Bool)

(assert (=> d!2815 (=> res!11825 e!9584)))

(assert (=> d!2815 (= res!11825 ((_ is Nil!492) (toList!249 lm!238)))))

(assert (=> d!2815 (= (forall!125 (toList!249 lm!238) p!262) e!9584)))

(declare-fun b!15717 () Bool)

(declare-fun e!9585 () Bool)

(assert (=> b!15717 (= e!9584 e!9585)))

(declare-fun res!11826 () Bool)

(assert (=> b!15717 (=> (not res!11826) (not e!9585))))

(assert (=> b!15717 (= res!11826 (dynLambda!112 p!262 (h!1057 (toList!249 lm!238))))))

(declare-fun b!15718 () Bool)

(assert (=> b!15718 (= e!9585 (forall!125 (t!2945 (toList!249 lm!238)) p!262))))

(assert (= (and d!2815 (not res!11825)) b!15717))

(assert (= (and b!15717 res!11826) b!15718))

(declare-fun b_lambda!1093 () Bool)

(assert (=> (not b_lambda!1093) (not b!15717)))

(declare-fun t!2970 () Bool)

(declare-fun tb!459 () Bool)

(assert (=> (and start!2550 (= p!262 p!262) t!2970) tb!459))

(declare-fun result!797 () Bool)

(assert (=> tb!459 (= result!797 true)))

(assert (=> b!15717 t!2970))

(declare-fun b_and!1005 () Bool)

(assert (= b_and!1003 (and (=> t!2970 result!797) b_and!1005)))

(declare-fun m!10757 () Bool)

(assert (=> b!15717 m!10757))

(declare-fun m!10759 () Bool)

(assert (=> b!15718 m!10759))

(assert (=> start!2550 d!2815))

(declare-fun d!2817 () Bool)

(declare-fun isStrictlySorted!145 (List!495) Bool)

(assert (=> d!2817 (= (inv!832 lm!238) (isStrictlySorted!145 (toList!249 lm!238)))))

(declare-fun bs!713 () Bool)

(assert (= bs!713 d!2817))

(declare-fun m!10765 () Bool)

(assert (=> bs!713 m!10765))

(assert (=> start!2550 d!2817))

(declare-fun b!15727 () Bool)

(declare-fun e!9592 () Bool)

(declare-fun tp_is_empty!801 () Bool)

(declare-fun tp!2696 () Bool)

(assert (=> b!15727 (= e!9592 (and tp_is_empty!801 tp!2696))))

(assert (=> b!15641 (= tp!2677 e!9592)))

(assert (= (and b!15641 ((_ is Cons!491) (toList!249 lm!238))) b!15727))

(declare-fun b_lambda!1099 () Bool)

(assert (= b_lambda!1073 (or (and start!2550 b_free!523) b_lambda!1099)))

(declare-fun b_lambda!1101 () Bool)

(assert (= b_lambda!1081 (or (and start!2550 b_free!523) b_lambda!1101)))

(declare-fun b_lambda!1103 () Bool)

(assert (= b_lambda!1091 (or (and start!2550 b_free!523) b_lambda!1103)))

(declare-fun b_lambda!1105 () Bool)

(assert (= b_lambda!1093 (or (and start!2550 b_free!523) b_lambda!1105)))

(check-sat (not b!15685) (not d!2817) (not b!15705) (not b_lambda!1105) (not d!2779) (not b!15707) (not b_lambda!1099) (not d!2807) (not b_next!523) (not b!15716) (not b!15718) (not b_lambda!1103) b_and!1005 tp_is_empty!801 (not b!15709) (not b!15727) (not d!2763) (not b_lambda!1101))
(check-sat b_and!1005 (not b_next!523))
