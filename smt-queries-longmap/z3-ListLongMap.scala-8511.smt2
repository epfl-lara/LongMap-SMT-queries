; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103792 () Bool)

(assert start!103792)

(declare-fun b!1242622 () Bool)

(declare-fun res!828683 () Bool)

(declare-fun e!704438 () Bool)

(assert (=> b!1242622 (=> (not res!828683) (not e!704438))))

(declare-datatypes ((B!1892 0))(
  ( (B!1893 (val!15708 Int)) )
))
(declare-datatypes ((tuple2!20372 0))(
  ( (tuple2!20373 (_1!10197 (_ BitVec 64)) (_2!10197 B!1892)) )
))
(declare-datatypes ((List!27435 0))(
  ( (Nil!27432) (Cons!27431 (h!28640 tuple2!20372) (t!40892 List!27435)) )
))
(declare-fun l!644 () List!27435)

(declare-fun isStrictlySorted!762 (List!27435) Bool)

(assert (=> b!1242622 (= res!828683 (isStrictlySorted!762 l!644))))

(declare-fun res!828684 () Bool)

(assert (=> start!103792 (=> (not res!828684) (not e!704438))))

(declare-fun key1!25 () (_ BitVec 64))

(declare-fun key2!15 () (_ BitVec 64))

(assert (=> start!103792 (= res!828684 (not (= key1!25 key2!15)))))

(assert (=> start!103792 e!704438))

(assert (=> start!103792 true))

(declare-fun e!704439 () Bool)

(assert (=> start!103792 e!704439))

(declare-fun tp_is_empty!31291 () Bool)

(assert (=> start!103792 tp_is_empty!31291))

(declare-fun b!1242623 () Bool)

(declare-fun res!828682 () Bool)

(assert (=> b!1242623 (=> (not res!828682) (not e!704438))))

(get-info :version)

(assert (=> b!1242623 (= res!828682 (not ((_ is Cons!27431) l!644)))))

(declare-fun b!1242624 () Bool)

(declare-fun v1!20 () B!1892)

(declare-fun insertStrictlySorted!441 (List!27435 (_ BitVec 64) B!1892) List!27435)

(declare-fun removeStrictlySorted!133 (List!27435 (_ BitVec 64)) List!27435)

(assert (=> b!1242624 (= e!704438 (not (= (insertStrictlySorted!441 (removeStrictlySorted!133 l!644 key2!15) key1!25 v1!20) (removeStrictlySorted!133 (insertStrictlySorted!441 l!644 key1!25 v1!20) key2!15))))))

(declare-fun b!1242625 () Bool)

(declare-fun tp!92765 () Bool)

(assert (=> b!1242625 (= e!704439 (and tp_is_empty!31291 tp!92765))))

(assert (= (and start!103792 res!828684) b!1242622))

(assert (= (and b!1242622 res!828683) b!1242623))

(assert (= (and b!1242623 res!828682) b!1242624))

(assert (= (and start!103792 ((_ is Cons!27431) l!644)) b!1242625))

(declare-fun m!1144885 () Bool)

(assert (=> b!1242622 m!1144885))

(declare-fun m!1144887 () Bool)

(assert (=> b!1242624 m!1144887))

(assert (=> b!1242624 m!1144887))

(declare-fun m!1144889 () Bool)

(assert (=> b!1242624 m!1144889))

(declare-fun m!1144891 () Bool)

(assert (=> b!1242624 m!1144891))

(assert (=> b!1242624 m!1144891))

(declare-fun m!1144893 () Bool)

(assert (=> b!1242624 m!1144893))

(check-sat (not b!1242624) (not b!1242622) (not b!1242625) tp_is_empty!31291)
(check-sat)
(get-model)

(declare-fun d!136763 () Bool)

(declare-fun e!704501 () Bool)

(assert (=> d!136763 e!704501))

(declare-fun res!828722 () Bool)

(assert (=> d!136763 (=> (not res!828722) (not e!704501))))

(declare-fun lt!562102 () List!27435)

(assert (=> d!136763 (= res!828722 (isStrictlySorted!762 lt!562102))))

(declare-fun e!704493 () List!27435)

(assert (=> d!136763 (= lt!562102 e!704493)))

(declare-fun c!121703 () Bool)

(assert (=> d!136763 (= c!121703 (and ((_ is Cons!27431) (removeStrictlySorted!133 l!644 key2!15)) (bvslt (_1!10197 (h!28640 (removeStrictlySorted!133 l!644 key2!15))) key1!25)))))

(assert (=> d!136763 (isStrictlySorted!762 (removeStrictlySorted!133 l!644 key2!15))))

(assert (=> d!136763 (= (insertStrictlySorted!441 (removeStrictlySorted!133 l!644 key2!15) key1!25 v1!20) lt!562102)))

(declare-fun b!1242731 () Bool)

(declare-fun call!61360 () List!27435)

(assert (=> b!1242731 (= e!704493 call!61360)))

(declare-fun b!1242733 () Bool)

(declare-fun e!704495 () List!27435)

(assert (=> b!1242733 (= e!704495 (insertStrictlySorted!441 (t!40892 (removeStrictlySorted!133 l!644 key2!15)) key1!25 v1!20))))

(declare-fun b!1242734 () Bool)

(declare-fun e!704494 () List!27435)

(declare-fun call!61358 () List!27435)

(assert (=> b!1242734 (= e!704494 call!61358)))

(declare-fun b!1242736 () Bool)

(declare-fun contains!7368 (List!27435 tuple2!20372) Bool)

(assert (=> b!1242736 (= e!704501 (contains!7368 lt!562102 (tuple2!20373 key1!25 v1!20)))))

(declare-fun bm!61356 () Bool)

(assert (=> bm!61356 (= call!61358 call!61360)))

(declare-fun c!121705 () Bool)

(declare-fun c!121706 () Bool)

(declare-fun b!1242737 () Bool)

(assert (=> b!1242737 (= e!704495 (ite c!121706 (t!40892 (removeStrictlySorted!133 l!644 key2!15)) (ite c!121705 (Cons!27431 (h!28640 (removeStrictlySorted!133 l!644 key2!15)) (t!40892 (removeStrictlySorted!133 l!644 key2!15))) Nil!27432)))))

(declare-fun b!1242739 () Bool)

(declare-fun res!828721 () Bool)

(assert (=> b!1242739 (=> (not res!828721) (not e!704501))))

(declare-fun containsKey!615 (List!27435 (_ BitVec 64)) Bool)

(assert (=> b!1242739 (= res!828721 (containsKey!615 lt!562102 key1!25))))

(declare-fun bm!61358 () Bool)

(declare-fun $colon$colon!632 (List!27435 tuple2!20372) List!27435)

(assert (=> bm!61358 (= call!61360 ($colon$colon!632 e!704495 (ite c!121703 (h!28640 (removeStrictlySorted!133 l!644 key2!15)) (tuple2!20373 key1!25 v1!20))))))

(declare-fun c!121704 () Bool)

(assert (=> bm!61358 (= c!121704 c!121703)))

(declare-fun b!1242742 () Bool)

(declare-fun e!704499 () List!27435)

(declare-fun call!61362 () List!27435)

(assert (=> b!1242742 (= e!704499 call!61362)))

(declare-fun b!1242744 () Bool)

(assert (=> b!1242744 (= e!704493 e!704494)))

(assert (=> b!1242744 (= c!121706 (and ((_ is Cons!27431) (removeStrictlySorted!133 l!644 key2!15)) (= (_1!10197 (h!28640 (removeStrictlySorted!133 l!644 key2!15))) key1!25)))))

(declare-fun bm!61359 () Bool)

(assert (=> bm!61359 (= call!61362 call!61358)))

(declare-fun b!1242747 () Bool)

(assert (=> b!1242747 (= c!121705 (and ((_ is Cons!27431) (removeStrictlySorted!133 l!644 key2!15)) (bvsgt (_1!10197 (h!28640 (removeStrictlySorted!133 l!644 key2!15))) key1!25)))))

(assert (=> b!1242747 (= e!704494 e!704499)))

(declare-fun b!1242749 () Bool)

(assert (=> b!1242749 (= e!704499 call!61362)))

(assert (= (and d!136763 c!121703) b!1242731))

(assert (= (and d!136763 (not c!121703)) b!1242744))

(assert (= (and b!1242744 c!121706) b!1242734))

(assert (= (and b!1242744 (not c!121706)) b!1242747))

(assert (= (and b!1242747 c!121705) b!1242742))

(assert (= (and b!1242747 (not c!121705)) b!1242749))

(assert (= (or b!1242742 b!1242749) bm!61359))

(assert (= (or b!1242734 bm!61359) bm!61356))

(assert (= (or b!1242731 bm!61356) bm!61358))

(assert (= (and bm!61358 c!121704) b!1242733))

(assert (= (and bm!61358 (not c!121704)) b!1242737))

(assert (= (and d!136763 res!828722) b!1242739))

(assert (= (and b!1242739 res!828721) b!1242736))

(declare-fun m!1144931 () Bool)

(assert (=> d!136763 m!1144931))

(assert (=> d!136763 m!1144887))

(declare-fun m!1144939 () Bool)

(assert (=> d!136763 m!1144939))

(declare-fun m!1144945 () Bool)

(assert (=> b!1242736 m!1144945))

(declare-fun m!1144951 () Bool)

(assert (=> bm!61358 m!1144951))

(declare-fun m!1144953 () Bool)

(assert (=> b!1242733 m!1144953))

(declare-fun m!1144957 () Bool)

(assert (=> b!1242739 m!1144957))

(assert (=> b!1242624 d!136763))

(declare-fun b!1242804 () Bool)

(declare-fun e!704538 () List!27435)

(declare-fun e!704540 () List!27435)

(assert (=> b!1242804 (= e!704538 e!704540)))

(declare-fun c!121728 () Bool)

(assert (=> b!1242804 (= c!121728 (and ((_ is Cons!27431) l!644) (not (= (_1!10197 (h!28640 l!644)) key2!15))))))

(declare-fun b!1242806 () Bool)

(declare-fun e!704536 () Bool)

(declare-fun lt!562112 () List!27435)

(assert (=> b!1242806 (= e!704536 (not (containsKey!615 lt!562112 key2!15)))))

(declare-fun b!1242808 () Bool)

(assert (=> b!1242808 (= e!704540 ($colon$colon!632 (removeStrictlySorted!133 (t!40892 l!644) key2!15) (h!28640 l!644)))))

(declare-fun b!1242809 () Bool)

(assert (=> b!1242809 (= e!704540 Nil!27432)))

(declare-fun d!136773 () Bool)

(assert (=> d!136773 e!704536))

(declare-fun res!828738 () Bool)

(assert (=> d!136773 (=> (not res!828738) (not e!704536))))

(assert (=> d!136773 (= res!828738 (isStrictlySorted!762 lt!562112))))

(assert (=> d!136773 (= lt!562112 e!704538)))

(declare-fun c!121727 () Bool)

(assert (=> d!136773 (= c!121727 (and ((_ is Cons!27431) l!644) (= (_1!10197 (h!28640 l!644)) key2!15)))))

(assert (=> d!136773 (isStrictlySorted!762 l!644)))

(assert (=> d!136773 (= (removeStrictlySorted!133 l!644 key2!15) lt!562112)))

(declare-fun b!1242810 () Bool)

(assert (=> b!1242810 (= e!704538 (t!40892 l!644))))

(assert (= (and d!136773 c!121727) b!1242810))

(assert (= (and d!136773 (not c!121727)) b!1242804))

(assert (= (and b!1242804 c!121728) b!1242808))

(assert (= (and b!1242804 (not c!121728)) b!1242809))

(assert (= (and d!136773 res!828738) b!1242806))

(declare-fun m!1144983 () Bool)

(assert (=> b!1242806 m!1144983))

(declare-fun m!1144985 () Bool)

(assert (=> b!1242808 m!1144985))

(assert (=> b!1242808 m!1144985))

(declare-fun m!1144991 () Bool)

(assert (=> b!1242808 m!1144991))

(declare-fun m!1144993 () Bool)

(assert (=> d!136773 m!1144993))

(assert (=> d!136773 m!1144885))

(assert (=> b!1242624 d!136773))

(declare-fun b!1242812 () Bool)

(declare-fun e!704543 () List!27435)

(declare-fun e!704546 () List!27435)

(assert (=> b!1242812 (= e!704543 e!704546)))

(declare-fun c!121732 () Bool)

(assert (=> b!1242812 (= c!121732 (and ((_ is Cons!27431) (insertStrictlySorted!441 l!644 key1!25 v1!20)) (not (= (_1!10197 (h!28640 (insertStrictlySorted!441 l!644 key1!25 v1!20))) key2!15))))))

(declare-fun b!1242814 () Bool)

(declare-fun e!704541 () Bool)

(declare-fun lt!562114 () List!27435)

(assert (=> b!1242814 (= e!704541 (not (containsKey!615 lt!562114 key2!15)))))

(declare-fun b!1242816 () Bool)

(assert (=> b!1242816 (= e!704546 ($colon$colon!632 (removeStrictlySorted!133 (t!40892 (insertStrictlySorted!441 l!644 key1!25 v1!20)) key2!15) (h!28640 (insertStrictlySorted!441 l!644 key1!25 v1!20))))))

(declare-fun b!1242818 () Bool)

(assert (=> b!1242818 (= e!704546 Nil!27432)))

(declare-fun d!136780 () Bool)

(assert (=> d!136780 e!704541))

(declare-fun res!828740 () Bool)

(assert (=> d!136780 (=> (not res!828740) (not e!704541))))

(assert (=> d!136780 (= res!828740 (isStrictlySorted!762 lt!562114))))

(assert (=> d!136780 (= lt!562114 e!704543)))

(declare-fun c!121730 () Bool)

(assert (=> d!136780 (= c!121730 (and ((_ is Cons!27431) (insertStrictlySorted!441 l!644 key1!25 v1!20)) (= (_1!10197 (h!28640 (insertStrictlySorted!441 l!644 key1!25 v1!20))) key2!15)))))

(assert (=> d!136780 (isStrictlySorted!762 (insertStrictlySorted!441 l!644 key1!25 v1!20))))

(assert (=> d!136780 (= (removeStrictlySorted!133 (insertStrictlySorted!441 l!644 key1!25 v1!20) key2!15) lt!562114)))

(declare-fun b!1242820 () Bool)

(assert (=> b!1242820 (= e!704543 (t!40892 (insertStrictlySorted!441 l!644 key1!25 v1!20)))))

(assert (= (and d!136780 c!121730) b!1242820))

(assert (= (and d!136780 (not c!121730)) b!1242812))

(assert (= (and b!1242812 c!121732) b!1242816))

(assert (= (and b!1242812 (not c!121732)) b!1242818))

(assert (= (and d!136780 res!828740) b!1242814))

(declare-fun m!1144999 () Bool)

(assert (=> b!1242814 m!1144999))

(declare-fun m!1145001 () Bool)

(assert (=> b!1242816 m!1145001))

(assert (=> b!1242816 m!1145001))

(declare-fun m!1145009 () Bool)

(assert (=> b!1242816 m!1145009))

(declare-fun m!1145011 () Bool)

(assert (=> d!136780 m!1145011))

(assert (=> d!136780 m!1144891))

(declare-fun m!1145015 () Bool)

(assert (=> d!136780 m!1145015))

(assert (=> b!1242624 d!136780))

(declare-fun d!136785 () Bool)

(declare-fun e!704556 () Bool)

(assert (=> d!136785 e!704556))

(declare-fun res!828744 () Bool)

(assert (=> d!136785 (=> (not res!828744) (not e!704556))))

(declare-fun lt!562116 () List!27435)

(assert (=> d!136785 (= res!828744 (isStrictlySorted!762 lt!562116))))

(declare-fun e!704547 () List!27435)

(assert (=> d!136785 (= lt!562116 e!704547)))

(declare-fun c!121735 () Bool)

(assert (=> d!136785 (= c!121735 (and ((_ is Cons!27431) l!644) (bvslt (_1!10197 (h!28640 l!644)) key1!25)))))

(assert (=> d!136785 (isStrictlySorted!762 l!644)))

(assert (=> d!136785 (= (insertStrictlySorted!441 l!644 key1!25 v1!20) lt!562116)))

(declare-fun b!1242822 () Bool)

(declare-fun call!61369 () List!27435)

(assert (=> b!1242822 (= e!704547 call!61369)))

(declare-fun b!1242824 () Bool)

(declare-fun e!704550 () List!27435)

(assert (=> b!1242824 (= e!704550 (insertStrictlySorted!441 (t!40892 l!644) key1!25 v1!20))))

(declare-fun b!1242825 () Bool)

(declare-fun e!704548 () List!27435)

(declare-fun call!61368 () List!27435)

(assert (=> b!1242825 (= e!704548 call!61368)))

(declare-fun b!1242827 () Bool)

(assert (=> b!1242827 (= e!704556 (contains!7368 lt!562116 (tuple2!20373 key1!25 v1!20)))))

(declare-fun bm!61365 () Bool)

(assert (=> bm!61365 (= call!61368 call!61369)))

(declare-fun c!121738 () Bool)

(declare-fun c!121737 () Bool)

(declare-fun b!1242828 () Bool)

(assert (=> b!1242828 (= e!704550 (ite c!121738 (t!40892 l!644) (ite c!121737 (Cons!27431 (h!28640 l!644) (t!40892 l!644)) Nil!27432)))))

(declare-fun b!1242830 () Bool)

(declare-fun res!828743 () Bool)

(assert (=> b!1242830 (=> (not res!828743) (not e!704556))))

(assert (=> b!1242830 (= res!828743 (containsKey!615 lt!562116 key1!25))))

(declare-fun bm!61367 () Bool)

(assert (=> bm!61367 (= call!61369 ($colon$colon!632 e!704550 (ite c!121735 (h!28640 l!644) (tuple2!20373 key1!25 v1!20))))))

(declare-fun c!121736 () Bool)

(assert (=> bm!61367 (= c!121736 c!121735)))

(declare-fun b!1242833 () Bool)

(declare-fun e!704554 () List!27435)

(declare-fun call!61371 () List!27435)

(assert (=> b!1242833 (= e!704554 call!61371)))

(declare-fun b!1242835 () Bool)

(assert (=> b!1242835 (= e!704547 e!704548)))

(assert (=> b!1242835 (= c!121738 (and ((_ is Cons!27431) l!644) (= (_1!10197 (h!28640 l!644)) key1!25)))))

(declare-fun bm!61368 () Bool)

(assert (=> bm!61368 (= call!61371 call!61368)))

(declare-fun b!1242838 () Bool)

(assert (=> b!1242838 (= c!121737 (and ((_ is Cons!27431) l!644) (bvsgt (_1!10197 (h!28640 l!644)) key1!25)))))

(assert (=> b!1242838 (= e!704548 e!704554)))

(declare-fun b!1242840 () Bool)

(assert (=> b!1242840 (= e!704554 call!61371)))

(assert (= (and d!136785 c!121735) b!1242822))

(assert (= (and d!136785 (not c!121735)) b!1242835))

(assert (= (and b!1242835 c!121738) b!1242825))

(assert (= (and b!1242835 (not c!121738)) b!1242838))

(assert (= (and b!1242838 c!121737) b!1242833))

(assert (= (and b!1242838 (not c!121737)) b!1242840))

(assert (= (or b!1242833 b!1242840) bm!61368))

(assert (= (or b!1242825 bm!61368) bm!61365))

(assert (= (or b!1242822 bm!61365) bm!61367))

(assert (= (and bm!61367 c!121736) b!1242824))

(assert (= (and bm!61367 (not c!121736)) b!1242828))

(assert (= (and d!136785 res!828744) b!1242830))

(assert (= (and b!1242830 res!828743) b!1242827))

(declare-fun m!1145017 () Bool)

(assert (=> d!136785 m!1145017))

(assert (=> d!136785 m!1144885))

(declare-fun m!1145023 () Bool)

(assert (=> b!1242827 m!1145023))

(declare-fun m!1145029 () Bool)

(assert (=> bm!61367 m!1145029))

(declare-fun m!1145031 () Bool)

(assert (=> b!1242824 m!1145031))

(declare-fun m!1145035 () Bool)

(assert (=> b!1242830 m!1145035))

(assert (=> b!1242624 d!136785))

(declare-fun d!136789 () Bool)

(declare-fun res!828753 () Bool)

(declare-fun e!704565 () Bool)

(assert (=> d!136789 (=> res!828753 e!704565)))

(assert (=> d!136789 (= res!828753 (or ((_ is Nil!27432) l!644) ((_ is Nil!27432) (t!40892 l!644))))))

(assert (=> d!136789 (= (isStrictlySorted!762 l!644) e!704565)))

(declare-fun b!1242850 () Bool)

(declare-fun e!704567 () Bool)

(assert (=> b!1242850 (= e!704565 e!704567)))

(declare-fun res!828755 () Bool)

(assert (=> b!1242850 (=> (not res!828755) (not e!704567))))

(assert (=> b!1242850 (= res!828755 (bvslt (_1!10197 (h!28640 l!644)) (_1!10197 (h!28640 (t!40892 l!644)))))))

(declare-fun b!1242852 () Bool)

(assert (=> b!1242852 (= e!704567 (isStrictlySorted!762 (t!40892 l!644)))))

(assert (= (and d!136789 (not res!828753)) b!1242850))

(assert (= (and b!1242850 res!828755) b!1242852))

(declare-fun m!1145039 () Bool)

(assert (=> b!1242852 m!1145039))

(assert (=> b!1242622 d!136789))

(declare-fun b!1242862 () Bool)

(declare-fun e!704574 () Bool)

(declare-fun tp!92780 () Bool)

(assert (=> b!1242862 (= e!704574 (and tp_is_empty!31291 tp!92780))))

(assert (=> b!1242625 (= tp!92765 e!704574)))

(assert (= (and b!1242625 ((_ is Cons!27431) (t!40892 l!644))) b!1242862))

(check-sat (not b!1242814) (not d!136780) (not bm!61358) (not b!1242827) (not b!1242862) (not b!1242736) (not bm!61367) (not b!1242852) (not b!1242739) (not b!1242824) (not b!1242816) (not d!136773) tp_is_empty!31291 (not b!1242733) (not b!1242808) (not d!136763) (not d!136785) (not b!1242806) (not b!1242830))
(check-sat)
(get-model)

(declare-fun d!136791 () Bool)

(assert (=> d!136791 (= ($colon$colon!632 (removeStrictlySorted!133 (t!40892 l!644) key2!15) (h!28640 l!644)) (Cons!27431 (h!28640 l!644) (removeStrictlySorted!133 (t!40892 l!644) key2!15)))))

(assert (=> b!1242808 d!136791))

(declare-fun b!1242863 () Bool)

(declare-fun e!704576 () List!27435)

(declare-fun e!704577 () List!27435)

(assert (=> b!1242863 (= e!704576 e!704577)))

(declare-fun c!121743 () Bool)

(assert (=> b!1242863 (= c!121743 (and ((_ is Cons!27431) (t!40892 l!644)) (not (= (_1!10197 (h!28640 (t!40892 l!644))) key2!15))))))

(declare-fun b!1242864 () Bool)

(declare-fun e!704575 () Bool)

(declare-fun lt!562117 () List!27435)

(assert (=> b!1242864 (= e!704575 (not (containsKey!615 lt!562117 key2!15)))))

(declare-fun b!1242865 () Bool)

(assert (=> b!1242865 (= e!704577 ($colon$colon!632 (removeStrictlySorted!133 (t!40892 (t!40892 l!644)) key2!15) (h!28640 (t!40892 l!644))))))

(declare-fun b!1242866 () Bool)

(assert (=> b!1242866 (= e!704577 Nil!27432)))

(declare-fun d!136793 () Bool)

(assert (=> d!136793 e!704575))

(declare-fun res!828757 () Bool)

(assert (=> d!136793 (=> (not res!828757) (not e!704575))))

(assert (=> d!136793 (= res!828757 (isStrictlySorted!762 lt!562117))))

(assert (=> d!136793 (= lt!562117 e!704576)))

(declare-fun c!121742 () Bool)

(assert (=> d!136793 (= c!121742 (and ((_ is Cons!27431) (t!40892 l!644)) (= (_1!10197 (h!28640 (t!40892 l!644))) key2!15)))))

(assert (=> d!136793 (isStrictlySorted!762 (t!40892 l!644))))

(assert (=> d!136793 (= (removeStrictlySorted!133 (t!40892 l!644) key2!15) lt!562117)))

(declare-fun b!1242867 () Bool)

(assert (=> b!1242867 (= e!704576 (t!40892 (t!40892 l!644)))))

(assert (= (and d!136793 c!121742) b!1242867))

(assert (= (and d!136793 (not c!121742)) b!1242863))

(assert (= (and b!1242863 c!121743) b!1242865))

(assert (= (and b!1242863 (not c!121743)) b!1242866))

(assert (= (and d!136793 res!828757) b!1242864))

(declare-fun m!1145041 () Bool)

(assert (=> b!1242864 m!1145041))

(declare-fun m!1145043 () Bool)

(assert (=> b!1242865 m!1145043))

(assert (=> b!1242865 m!1145043))

(declare-fun m!1145045 () Bool)

(assert (=> b!1242865 m!1145045))

(declare-fun m!1145047 () Bool)

(assert (=> d!136793 m!1145047))

(assert (=> d!136793 m!1145039))

(assert (=> b!1242808 d!136793))

(declare-fun d!136795 () Bool)

(assert (=> d!136795 (= ($colon$colon!632 (removeStrictlySorted!133 (t!40892 (insertStrictlySorted!441 l!644 key1!25 v1!20)) key2!15) (h!28640 (insertStrictlySorted!441 l!644 key1!25 v1!20))) (Cons!27431 (h!28640 (insertStrictlySorted!441 l!644 key1!25 v1!20)) (removeStrictlySorted!133 (t!40892 (insertStrictlySorted!441 l!644 key1!25 v1!20)) key2!15)))))

(assert (=> b!1242816 d!136795))

(declare-fun b!1242868 () Bool)

(declare-fun e!704579 () List!27435)

(declare-fun e!704580 () List!27435)

(assert (=> b!1242868 (= e!704579 e!704580)))

(declare-fun c!121745 () Bool)

(assert (=> b!1242868 (= c!121745 (and ((_ is Cons!27431) (t!40892 (insertStrictlySorted!441 l!644 key1!25 v1!20))) (not (= (_1!10197 (h!28640 (t!40892 (insertStrictlySorted!441 l!644 key1!25 v1!20)))) key2!15))))))

(declare-fun b!1242869 () Bool)

(declare-fun e!704578 () Bool)

(declare-fun lt!562118 () List!27435)

(assert (=> b!1242869 (= e!704578 (not (containsKey!615 lt!562118 key2!15)))))

(declare-fun b!1242870 () Bool)

(assert (=> b!1242870 (= e!704580 ($colon$colon!632 (removeStrictlySorted!133 (t!40892 (t!40892 (insertStrictlySorted!441 l!644 key1!25 v1!20))) key2!15) (h!28640 (t!40892 (insertStrictlySorted!441 l!644 key1!25 v1!20)))))))

(declare-fun b!1242871 () Bool)

(assert (=> b!1242871 (= e!704580 Nil!27432)))

(declare-fun d!136797 () Bool)

(assert (=> d!136797 e!704578))

(declare-fun res!828758 () Bool)

(assert (=> d!136797 (=> (not res!828758) (not e!704578))))

(assert (=> d!136797 (= res!828758 (isStrictlySorted!762 lt!562118))))

(assert (=> d!136797 (= lt!562118 e!704579)))

(declare-fun c!121744 () Bool)

(assert (=> d!136797 (= c!121744 (and ((_ is Cons!27431) (t!40892 (insertStrictlySorted!441 l!644 key1!25 v1!20))) (= (_1!10197 (h!28640 (t!40892 (insertStrictlySorted!441 l!644 key1!25 v1!20)))) key2!15)))))

(assert (=> d!136797 (isStrictlySorted!762 (t!40892 (insertStrictlySorted!441 l!644 key1!25 v1!20)))))

(assert (=> d!136797 (= (removeStrictlySorted!133 (t!40892 (insertStrictlySorted!441 l!644 key1!25 v1!20)) key2!15) lt!562118)))

(declare-fun b!1242872 () Bool)

(assert (=> b!1242872 (= e!704579 (t!40892 (t!40892 (insertStrictlySorted!441 l!644 key1!25 v1!20))))))

(assert (= (and d!136797 c!121744) b!1242872))

(assert (= (and d!136797 (not c!121744)) b!1242868))

(assert (= (and b!1242868 c!121745) b!1242870))

(assert (= (and b!1242868 (not c!121745)) b!1242871))

(assert (= (and d!136797 res!828758) b!1242869))

(declare-fun m!1145049 () Bool)

(assert (=> b!1242869 m!1145049))

(declare-fun m!1145051 () Bool)

(assert (=> b!1242870 m!1145051))

(assert (=> b!1242870 m!1145051))

(declare-fun m!1145053 () Bool)

(assert (=> b!1242870 m!1145053))

(declare-fun m!1145055 () Bool)

(assert (=> d!136797 m!1145055))

(declare-fun m!1145057 () Bool)

(assert (=> d!136797 m!1145057))

(assert (=> b!1242816 d!136797))

(declare-fun d!136799 () Bool)

(declare-fun res!828759 () Bool)

(declare-fun e!704581 () Bool)

(assert (=> d!136799 (=> res!828759 e!704581)))

(assert (=> d!136799 (= res!828759 (or ((_ is Nil!27432) lt!562114) ((_ is Nil!27432) (t!40892 lt!562114))))))

(assert (=> d!136799 (= (isStrictlySorted!762 lt!562114) e!704581)))

(declare-fun b!1242873 () Bool)

(declare-fun e!704582 () Bool)

(assert (=> b!1242873 (= e!704581 e!704582)))

(declare-fun res!828760 () Bool)

(assert (=> b!1242873 (=> (not res!828760) (not e!704582))))

(assert (=> b!1242873 (= res!828760 (bvslt (_1!10197 (h!28640 lt!562114)) (_1!10197 (h!28640 (t!40892 lt!562114)))))))

(declare-fun b!1242874 () Bool)

(assert (=> b!1242874 (= e!704582 (isStrictlySorted!762 (t!40892 lt!562114)))))

(assert (= (and d!136799 (not res!828759)) b!1242873))

(assert (= (and b!1242873 res!828760) b!1242874))

(declare-fun m!1145059 () Bool)

(assert (=> b!1242874 m!1145059))

(assert (=> d!136780 d!136799))

(declare-fun d!136801 () Bool)

(declare-fun res!828761 () Bool)

(declare-fun e!704583 () Bool)

(assert (=> d!136801 (=> res!828761 e!704583)))

(assert (=> d!136801 (= res!828761 (or ((_ is Nil!27432) (insertStrictlySorted!441 l!644 key1!25 v1!20)) ((_ is Nil!27432) (t!40892 (insertStrictlySorted!441 l!644 key1!25 v1!20)))))))

(assert (=> d!136801 (= (isStrictlySorted!762 (insertStrictlySorted!441 l!644 key1!25 v1!20)) e!704583)))

(declare-fun b!1242875 () Bool)

(declare-fun e!704584 () Bool)

(assert (=> b!1242875 (= e!704583 e!704584)))

(declare-fun res!828762 () Bool)

(assert (=> b!1242875 (=> (not res!828762) (not e!704584))))

(assert (=> b!1242875 (= res!828762 (bvslt (_1!10197 (h!28640 (insertStrictlySorted!441 l!644 key1!25 v1!20))) (_1!10197 (h!28640 (t!40892 (insertStrictlySorted!441 l!644 key1!25 v1!20))))))))

(declare-fun b!1242876 () Bool)

(assert (=> b!1242876 (= e!704584 (isStrictlySorted!762 (t!40892 (insertStrictlySorted!441 l!644 key1!25 v1!20))))))

(assert (= (and d!136801 (not res!828761)) b!1242875))

(assert (= (and b!1242875 res!828762) b!1242876))

(assert (=> b!1242876 m!1145057))

(assert (=> d!136780 d!136801))

(declare-fun d!136803 () Bool)

(assert (=> d!136803 (= ($colon$colon!632 e!704550 (ite c!121735 (h!28640 l!644) (tuple2!20373 key1!25 v1!20))) (Cons!27431 (ite c!121735 (h!28640 l!644) (tuple2!20373 key1!25 v1!20)) e!704550))))

(assert (=> bm!61367 d!136803))

(declare-fun d!136805 () Bool)

(declare-fun res!828767 () Bool)

(declare-fun e!704589 () Bool)

(assert (=> d!136805 (=> res!828767 e!704589)))

(assert (=> d!136805 (= res!828767 (and ((_ is Cons!27431) lt!562112) (= (_1!10197 (h!28640 lt!562112)) key2!15)))))

(assert (=> d!136805 (= (containsKey!615 lt!562112 key2!15) e!704589)))

(declare-fun b!1242881 () Bool)

(declare-fun e!704590 () Bool)

(assert (=> b!1242881 (= e!704589 e!704590)))

(declare-fun res!828768 () Bool)

(assert (=> b!1242881 (=> (not res!828768) (not e!704590))))

(assert (=> b!1242881 (= res!828768 (and (or (not ((_ is Cons!27431) lt!562112)) (bvsle (_1!10197 (h!28640 lt!562112)) key2!15)) ((_ is Cons!27431) lt!562112) (bvslt (_1!10197 (h!28640 lt!562112)) key2!15)))))

(declare-fun b!1242882 () Bool)

(assert (=> b!1242882 (= e!704590 (containsKey!615 (t!40892 lt!562112) key2!15))))

(assert (= (and d!136805 (not res!828767)) b!1242881))

(assert (= (and b!1242881 res!828768) b!1242882))

(declare-fun m!1145061 () Bool)

(assert (=> b!1242882 m!1145061))

(assert (=> b!1242806 d!136805))

(declare-fun d!136807 () Bool)

(declare-fun e!704595 () Bool)

(assert (=> d!136807 e!704595))

(declare-fun res!828770 () Bool)

(assert (=> d!136807 (=> (not res!828770) (not e!704595))))

(declare-fun lt!562119 () List!27435)

(assert (=> d!136807 (= res!828770 (isStrictlySorted!762 lt!562119))))

(declare-fun e!704591 () List!27435)

(assert (=> d!136807 (= lt!562119 e!704591)))

(declare-fun c!121746 () Bool)

(assert (=> d!136807 (= c!121746 (and ((_ is Cons!27431) (t!40892 l!644)) (bvslt (_1!10197 (h!28640 (t!40892 l!644))) key1!25)))))

(assert (=> d!136807 (isStrictlySorted!762 (t!40892 l!644))))

(assert (=> d!136807 (= (insertStrictlySorted!441 (t!40892 l!644) key1!25 v1!20) lt!562119)))

(declare-fun b!1242883 () Bool)

(declare-fun call!61373 () List!27435)

(assert (=> b!1242883 (= e!704591 call!61373)))

(declare-fun b!1242884 () Bool)

(declare-fun e!704593 () List!27435)

(assert (=> b!1242884 (= e!704593 (insertStrictlySorted!441 (t!40892 (t!40892 l!644)) key1!25 v1!20))))

(declare-fun b!1242885 () Bool)

(declare-fun e!704592 () List!27435)

(declare-fun call!61372 () List!27435)

(assert (=> b!1242885 (= e!704592 call!61372)))

(declare-fun b!1242886 () Bool)

(assert (=> b!1242886 (= e!704595 (contains!7368 lt!562119 (tuple2!20373 key1!25 v1!20)))))

(declare-fun bm!61369 () Bool)

(assert (=> bm!61369 (= call!61372 call!61373)))

(declare-fun c!121748 () Bool)

(declare-fun c!121749 () Bool)

(declare-fun b!1242887 () Bool)

(assert (=> b!1242887 (= e!704593 (ite c!121749 (t!40892 (t!40892 l!644)) (ite c!121748 (Cons!27431 (h!28640 (t!40892 l!644)) (t!40892 (t!40892 l!644))) Nil!27432)))))

(declare-fun b!1242888 () Bool)

(declare-fun res!828769 () Bool)

(assert (=> b!1242888 (=> (not res!828769) (not e!704595))))

(assert (=> b!1242888 (= res!828769 (containsKey!615 lt!562119 key1!25))))

(declare-fun bm!61370 () Bool)

(assert (=> bm!61370 (= call!61373 ($colon$colon!632 e!704593 (ite c!121746 (h!28640 (t!40892 l!644)) (tuple2!20373 key1!25 v1!20))))))

(declare-fun c!121747 () Bool)

(assert (=> bm!61370 (= c!121747 c!121746)))

(declare-fun b!1242889 () Bool)

(declare-fun e!704594 () List!27435)

(declare-fun call!61374 () List!27435)

(assert (=> b!1242889 (= e!704594 call!61374)))

(declare-fun b!1242890 () Bool)

(assert (=> b!1242890 (= e!704591 e!704592)))

(assert (=> b!1242890 (= c!121749 (and ((_ is Cons!27431) (t!40892 l!644)) (= (_1!10197 (h!28640 (t!40892 l!644))) key1!25)))))

(declare-fun bm!61371 () Bool)

(assert (=> bm!61371 (= call!61374 call!61372)))

(declare-fun b!1242891 () Bool)

(assert (=> b!1242891 (= c!121748 (and ((_ is Cons!27431) (t!40892 l!644)) (bvsgt (_1!10197 (h!28640 (t!40892 l!644))) key1!25)))))

(assert (=> b!1242891 (= e!704592 e!704594)))

(declare-fun b!1242892 () Bool)

(assert (=> b!1242892 (= e!704594 call!61374)))

(assert (= (and d!136807 c!121746) b!1242883))

(assert (= (and d!136807 (not c!121746)) b!1242890))

(assert (= (and b!1242890 c!121749) b!1242885))

(assert (= (and b!1242890 (not c!121749)) b!1242891))

(assert (= (and b!1242891 c!121748) b!1242889))

(assert (= (and b!1242891 (not c!121748)) b!1242892))

(assert (= (or b!1242889 b!1242892) bm!61371))

(assert (= (or b!1242885 bm!61371) bm!61369))

(assert (= (or b!1242883 bm!61369) bm!61370))

(assert (= (and bm!61370 c!121747) b!1242884))

(assert (= (and bm!61370 (not c!121747)) b!1242887))

(assert (= (and d!136807 res!828770) b!1242888))

(assert (= (and b!1242888 res!828769) b!1242886))

(declare-fun m!1145063 () Bool)

(assert (=> d!136807 m!1145063))

(assert (=> d!136807 m!1145039))

(declare-fun m!1145065 () Bool)

(assert (=> b!1242886 m!1145065))

(declare-fun m!1145067 () Bool)

(assert (=> bm!61370 m!1145067))

(declare-fun m!1145069 () Bool)

(assert (=> b!1242884 m!1145069))

(declare-fun m!1145071 () Bool)

(assert (=> b!1242888 m!1145071))

(assert (=> b!1242824 d!136807))

(declare-fun lt!562122 () Bool)

(declare-fun d!136809 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!605 (List!27435) (InoxSet tuple2!20372))

(assert (=> d!136809 (= lt!562122 (select (content!605 lt!562102) (tuple2!20373 key1!25 v1!20)))))

(declare-fun e!704601 () Bool)

(assert (=> d!136809 (= lt!562122 e!704601)))

(declare-fun res!828776 () Bool)

(assert (=> d!136809 (=> (not res!828776) (not e!704601))))

(assert (=> d!136809 (= res!828776 ((_ is Cons!27431) lt!562102))))

(assert (=> d!136809 (= (contains!7368 lt!562102 (tuple2!20373 key1!25 v1!20)) lt!562122)))

(declare-fun b!1242897 () Bool)

(declare-fun e!704600 () Bool)

(assert (=> b!1242897 (= e!704601 e!704600)))

(declare-fun res!828775 () Bool)

(assert (=> b!1242897 (=> res!828775 e!704600)))

(assert (=> b!1242897 (= res!828775 (= (h!28640 lt!562102) (tuple2!20373 key1!25 v1!20)))))

(declare-fun b!1242898 () Bool)

(assert (=> b!1242898 (= e!704600 (contains!7368 (t!40892 lt!562102) (tuple2!20373 key1!25 v1!20)))))

(assert (= (and d!136809 res!828776) b!1242897))

(assert (= (and b!1242897 (not res!828775)) b!1242898))

(declare-fun m!1145073 () Bool)

(assert (=> d!136809 m!1145073))

(declare-fun m!1145075 () Bool)

(assert (=> d!136809 m!1145075))

(declare-fun m!1145077 () Bool)

(assert (=> b!1242898 m!1145077))

(assert (=> b!1242736 d!136809))

(declare-fun d!136811 () Bool)

(declare-fun res!828777 () Bool)

(declare-fun e!704602 () Bool)

(assert (=> d!136811 (=> res!828777 e!704602)))

(assert (=> d!136811 (= res!828777 (and ((_ is Cons!27431) lt!562114) (= (_1!10197 (h!28640 lt!562114)) key2!15)))))

(assert (=> d!136811 (= (containsKey!615 lt!562114 key2!15) e!704602)))

(declare-fun b!1242899 () Bool)

(declare-fun e!704603 () Bool)

(assert (=> b!1242899 (= e!704602 e!704603)))

(declare-fun res!828778 () Bool)

(assert (=> b!1242899 (=> (not res!828778) (not e!704603))))

(assert (=> b!1242899 (= res!828778 (and (or (not ((_ is Cons!27431) lt!562114)) (bvsle (_1!10197 (h!28640 lt!562114)) key2!15)) ((_ is Cons!27431) lt!562114) (bvslt (_1!10197 (h!28640 lt!562114)) key2!15)))))

(declare-fun b!1242900 () Bool)

(assert (=> b!1242900 (= e!704603 (containsKey!615 (t!40892 lt!562114) key2!15))))

(assert (= (and d!136811 (not res!828777)) b!1242899))

(assert (= (and b!1242899 res!828778) b!1242900))

(declare-fun m!1145079 () Bool)

(assert (=> b!1242900 m!1145079))

(assert (=> b!1242814 d!136811))

(declare-fun d!136813 () Bool)

(declare-fun res!828779 () Bool)

(declare-fun e!704604 () Bool)

(assert (=> d!136813 (=> res!828779 e!704604)))

(assert (=> d!136813 (= res!828779 (and ((_ is Cons!27431) lt!562116) (= (_1!10197 (h!28640 lt!562116)) key1!25)))))

(assert (=> d!136813 (= (containsKey!615 lt!562116 key1!25) e!704604)))

(declare-fun b!1242901 () Bool)

(declare-fun e!704605 () Bool)

(assert (=> b!1242901 (= e!704604 e!704605)))

(declare-fun res!828780 () Bool)

(assert (=> b!1242901 (=> (not res!828780) (not e!704605))))

(assert (=> b!1242901 (= res!828780 (and (or (not ((_ is Cons!27431) lt!562116)) (bvsle (_1!10197 (h!28640 lt!562116)) key1!25)) ((_ is Cons!27431) lt!562116) (bvslt (_1!10197 (h!28640 lt!562116)) key1!25)))))

(declare-fun b!1242902 () Bool)

(assert (=> b!1242902 (= e!704605 (containsKey!615 (t!40892 lt!562116) key1!25))))

(assert (= (and d!136813 (not res!828779)) b!1242901))

(assert (= (and b!1242901 res!828780) b!1242902))

(declare-fun m!1145081 () Bool)

(assert (=> b!1242902 m!1145081))

(assert (=> b!1242830 d!136813))

(declare-fun d!136815 () Bool)

(declare-fun res!828781 () Bool)

(declare-fun e!704606 () Bool)

(assert (=> d!136815 (=> res!828781 e!704606)))

(assert (=> d!136815 (= res!828781 (or ((_ is Nil!27432) lt!562116) ((_ is Nil!27432) (t!40892 lt!562116))))))

(assert (=> d!136815 (= (isStrictlySorted!762 lt!562116) e!704606)))

(declare-fun b!1242903 () Bool)

(declare-fun e!704607 () Bool)

(assert (=> b!1242903 (= e!704606 e!704607)))

(declare-fun res!828782 () Bool)

(assert (=> b!1242903 (=> (not res!828782) (not e!704607))))

(assert (=> b!1242903 (= res!828782 (bvslt (_1!10197 (h!28640 lt!562116)) (_1!10197 (h!28640 (t!40892 lt!562116)))))))

(declare-fun b!1242904 () Bool)

(assert (=> b!1242904 (= e!704607 (isStrictlySorted!762 (t!40892 lt!562116)))))

(assert (= (and d!136815 (not res!828781)) b!1242903))

(assert (= (and b!1242903 res!828782) b!1242904))

(declare-fun m!1145083 () Bool)

(assert (=> b!1242904 m!1145083))

(assert (=> d!136785 d!136815))

(assert (=> d!136785 d!136789))

(declare-fun d!136819 () Bool)

(assert (=> d!136819 (= ($colon$colon!632 e!704495 (ite c!121703 (h!28640 (removeStrictlySorted!133 l!644 key2!15)) (tuple2!20373 key1!25 v1!20))) (Cons!27431 (ite c!121703 (h!28640 (removeStrictlySorted!133 l!644 key2!15)) (tuple2!20373 key1!25 v1!20)) e!704495))))

(assert (=> bm!61358 d!136819))

(declare-fun d!136825 () Bool)

(declare-fun e!704618 () Bool)

(assert (=> d!136825 e!704618))

(declare-fun res!828790 () Bool)

(assert (=> d!136825 (=> (not res!828790) (not e!704618))))

(declare-fun lt!562123 () List!27435)

(assert (=> d!136825 (= res!828790 (isStrictlySorted!762 lt!562123))))

(declare-fun e!704614 () List!27435)

(assert (=> d!136825 (= lt!562123 e!704614)))

(declare-fun c!121750 () Bool)

(assert (=> d!136825 (= c!121750 (and ((_ is Cons!27431) (t!40892 (removeStrictlySorted!133 l!644 key2!15))) (bvslt (_1!10197 (h!28640 (t!40892 (removeStrictlySorted!133 l!644 key2!15)))) key1!25)))))

(assert (=> d!136825 (isStrictlySorted!762 (t!40892 (removeStrictlySorted!133 l!644 key2!15)))))

(assert (=> d!136825 (= (insertStrictlySorted!441 (t!40892 (removeStrictlySorted!133 l!644 key2!15)) key1!25 v1!20) lt!562123)))

(declare-fun b!1242911 () Bool)

(declare-fun call!61376 () List!27435)

(assert (=> b!1242911 (= e!704614 call!61376)))

(declare-fun e!704616 () List!27435)

(declare-fun b!1242912 () Bool)

(assert (=> b!1242912 (= e!704616 (insertStrictlySorted!441 (t!40892 (t!40892 (removeStrictlySorted!133 l!644 key2!15))) key1!25 v1!20))))

(declare-fun b!1242913 () Bool)

(declare-fun e!704615 () List!27435)

(declare-fun call!61375 () List!27435)

(assert (=> b!1242913 (= e!704615 call!61375)))

(declare-fun b!1242914 () Bool)

(assert (=> b!1242914 (= e!704618 (contains!7368 lt!562123 (tuple2!20373 key1!25 v1!20)))))

(declare-fun bm!61372 () Bool)

(assert (=> bm!61372 (= call!61375 call!61376)))

(declare-fun b!1242915 () Bool)

(declare-fun c!121753 () Bool)

(declare-fun c!121752 () Bool)

(assert (=> b!1242915 (= e!704616 (ite c!121753 (t!40892 (t!40892 (removeStrictlySorted!133 l!644 key2!15))) (ite c!121752 (Cons!27431 (h!28640 (t!40892 (removeStrictlySorted!133 l!644 key2!15))) (t!40892 (t!40892 (removeStrictlySorted!133 l!644 key2!15)))) Nil!27432)))))

(declare-fun b!1242916 () Bool)

(declare-fun res!828789 () Bool)

(assert (=> b!1242916 (=> (not res!828789) (not e!704618))))

(assert (=> b!1242916 (= res!828789 (containsKey!615 lt!562123 key1!25))))

(declare-fun bm!61373 () Bool)

(assert (=> bm!61373 (= call!61376 ($colon$colon!632 e!704616 (ite c!121750 (h!28640 (t!40892 (removeStrictlySorted!133 l!644 key2!15))) (tuple2!20373 key1!25 v1!20))))))

(declare-fun c!121751 () Bool)

(assert (=> bm!61373 (= c!121751 c!121750)))

(declare-fun b!1242917 () Bool)

(declare-fun e!704617 () List!27435)

(declare-fun call!61377 () List!27435)

(assert (=> b!1242917 (= e!704617 call!61377)))

(declare-fun b!1242918 () Bool)

(assert (=> b!1242918 (= e!704614 e!704615)))

(assert (=> b!1242918 (= c!121753 (and ((_ is Cons!27431) (t!40892 (removeStrictlySorted!133 l!644 key2!15))) (= (_1!10197 (h!28640 (t!40892 (removeStrictlySorted!133 l!644 key2!15)))) key1!25)))))

(declare-fun bm!61374 () Bool)

(assert (=> bm!61374 (= call!61377 call!61375)))

(declare-fun b!1242919 () Bool)

(assert (=> b!1242919 (= c!121752 (and ((_ is Cons!27431) (t!40892 (removeStrictlySorted!133 l!644 key2!15))) (bvsgt (_1!10197 (h!28640 (t!40892 (removeStrictlySorted!133 l!644 key2!15)))) key1!25)))))

(assert (=> b!1242919 (= e!704615 e!704617)))

(declare-fun b!1242920 () Bool)

(assert (=> b!1242920 (= e!704617 call!61377)))

(assert (= (and d!136825 c!121750) b!1242911))

(assert (= (and d!136825 (not c!121750)) b!1242918))

(assert (= (and b!1242918 c!121753) b!1242913))

(assert (= (and b!1242918 (not c!121753)) b!1242919))

(assert (= (and b!1242919 c!121752) b!1242917))

(assert (= (and b!1242919 (not c!121752)) b!1242920))

(assert (= (or b!1242917 b!1242920) bm!61374))

(assert (= (or b!1242913 bm!61374) bm!61372))

(assert (= (or b!1242911 bm!61372) bm!61373))

(assert (= (and bm!61373 c!121751) b!1242912))

(assert (= (and bm!61373 (not c!121751)) b!1242915))

(assert (= (and d!136825 res!828790) b!1242916))

(assert (= (and b!1242916 res!828789) b!1242914))

(declare-fun m!1145097 () Bool)

(assert (=> d!136825 m!1145097))

(declare-fun m!1145099 () Bool)

(assert (=> d!136825 m!1145099))

(declare-fun m!1145101 () Bool)

(assert (=> b!1242914 m!1145101))

(declare-fun m!1145103 () Bool)

(assert (=> bm!61373 m!1145103))

(declare-fun m!1145105 () Bool)

(assert (=> b!1242912 m!1145105))

(declare-fun m!1145107 () Bool)

(assert (=> b!1242916 m!1145107))

(assert (=> b!1242733 d!136825))

(declare-fun d!136837 () Bool)

(declare-fun res!828797 () Bool)

(declare-fun e!704625 () Bool)

(assert (=> d!136837 (=> res!828797 e!704625)))

(assert (=> d!136837 (= res!828797 (and ((_ is Cons!27431) lt!562102) (= (_1!10197 (h!28640 lt!562102)) key1!25)))))

(assert (=> d!136837 (= (containsKey!615 lt!562102 key1!25) e!704625)))

(declare-fun b!1242927 () Bool)

(declare-fun e!704626 () Bool)

(assert (=> b!1242927 (= e!704625 e!704626)))

(declare-fun res!828798 () Bool)

(assert (=> b!1242927 (=> (not res!828798) (not e!704626))))

(assert (=> b!1242927 (= res!828798 (and (or (not ((_ is Cons!27431) lt!562102)) (bvsle (_1!10197 (h!28640 lt!562102)) key1!25)) ((_ is Cons!27431) lt!562102) (bvslt (_1!10197 (h!28640 lt!562102)) key1!25)))))

(declare-fun b!1242928 () Bool)

(assert (=> b!1242928 (= e!704626 (containsKey!615 (t!40892 lt!562102) key1!25))))

(assert (= (and d!136837 (not res!828797)) b!1242927))

(assert (= (and b!1242927 res!828798) b!1242928))

(declare-fun m!1145109 () Bool)

(assert (=> b!1242928 m!1145109))

(assert (=> b!1242739 d!136837))

(declare-fun d!136839 () Bool)

(declare-fun res!828799 () Bool)

(declare-fun e!704627 () Bool)

(assert (=> d!136839 (=> res!828799 e!704627)))

(assert (=> d!136839 (= res!828799 (or ((_ is Nil!27432) (t!40892 l!644)) ((_ is Nil!27432) (t!40892 (t!40892 l!644)))))))

(assert (=> d!136839 (= (isStrictlySorted!762 (t!40892 l!644)) e!704627)))

(declare-fun b!1242929 () Bool)

(declare-fun e!704628 () Bool)

(assert (=> b!1242929 (= e!704627 e!704628)))

(declare-fun res!828800 () Bool)

(assert (=> b!1242929 (=> (not res!828800) (not e!704628))))

(assert (=> b!1242929 (= res!828800 (bvslt (_1!10197 (h!28640 (t!40892 l!644))) (_1!10197 (h!28640 (t!40892 (t!40892 l!644))))))))

(declare-fun b!1242930 () Bool)

(assert (=> b!1242930 (= e!704628 (isStrictlySorted!762 (t!40892 (t!40892 l!644))))))

(assert (= (and d!136839 (not res!828799)) b!1242929))

(assert (= (and b!1242929 res!828800) b!1242930))

(declare-fun m!1145111 () Bool)

(assert (=> b!1242930 m!1145111))

(assert (=> b!1242852 d!136839))

(declare-fun d!136841 () Bool)

(declare-fun res!828803 () Bool)

(declare-fun e!704631 () Bool)

(assert (=> d!136841 (=> res!828803 e!704631)))

(assert (=> d!136841 (= res!828803 (or ((_ is Nil!27432) lt!562112) ((_ is Nil!27432) (t!40892 lt!562112))))))

(assert (=> d!136841 (= (isStrictlySorted!762 lt!562112) e!704631)))

(declare-fun b!1242933 () Bool)

(declare-fun e!704632 () Bool)

(assert (=> b!1242933 (= e!704631 e!704632)))

(declare-fun res!828804 () Bool)

(assert (=> b!1242933 (=> (not res!828804) (not e!704632))))

(assert (=> b!1242933 (= res!828804 (bvslt (_1!10197 (h!28640 lt!562112)) (_1!10197 (h!28640 (t!40892 lt!562112)))))))

(declare-fun b!1242934 () Bool)

(assert (=> b!1242934 (= e!704632 (isStrictlySorted!762 (t!40892 lt!562112)))))

(assert (= (and d!136841 (not res!828803)) b!1242933))

(assert (= (and b!1242933 res!828804) b!1242934))

(declare-fun m!1145113 () Bool)

(assert (=> b!1242934 m!1145113))

(assert (=> d!136773 d!136841))

(assert (=> d!136773 d!136789))

(declare-fun d!136843 () Bool)

(declare-fun res!828807 () Bool)

(declare-fun e!704635 () Bool)

(assert (=> d!136843 (=> res!828807 e!704635)))

(assert (=> d!136843 (= res!828807 (or ((_ is Nil!27432) lt!562102) ((_ is Nil!27432) (t!40892 lt!562102))))))

(assert (=> d!136843 (= (isStrictlySorted!762 lt!562102) e!704635)))

(declare-fun b!1242937 () Bool)

(declare-fun e!704636 () Bool)

(assert (=> b!1242937 (= e!704635 e!704636)))

(declare-fun res!828808 () Bool)

(assert (=> b!1242937 (=> (not res!828808) (not e!704636))))

(assert (=> b!1242937 (= res!828808 (bvslt (_1!10197 (h!28640 lt!562102)) (_1!10197 (h!28640 (t!40892 lt!562102)))))))

(declare-fun b!1242938 () Bool)

(assert (=> b!1242938 (= e!704636 (isStrictlySorted!762 (t!40892 lt!562102)))))

(assert (= (and d!136843 (not res!828807)) b!1242937))

(assert (= (and b!1242937 res!828808) b!1242938))

(declare-fun m!1145115 () Bool)

(assert (=> b!1242938 m!1145115))

(assert (=> d!136763 d!136843))

(declare-fun d!136845 () Bool)

(declare-fun res!828813 () Bool)

(declare-fun e!704641 () Bool)

(assert (=> d!136845 (=> res!828813 e!704641)))

(assert (=> d!136845 (= res!828813 (or ((_ is Nil!27432) (removeStrictlySorted!133 l!644 key2!15)) ((_ is Nil!27432) (t!40892 (removeStrictlySorted!133 l!644 key2!15)))))))

(assert (=> d!136845 (= (isStrictlySorted!762 (removeStrictlySorted!133 l!644 key2!15)) e!704641)))

(declare-fun b!1242943 () Bool)

(declare-fun e!704642 () Bool)

(assert (=> b!1242943 (= e!704641 e!704642)))

(declare-fun res!828814 () Bool)

(assert (=> b!1242943 (=> (not res!828814) (not e!704642))))

(assert (=> b!1242943 (= res!828814 (bvslt (_1!10197 (h!28640 (removeStrictlySorted!133 l!644 key2!15))) (_1!10197 (h!28640 (t!40892 (removeStrictlySorted!133 l!644 key2!15))))))))

(declare-fun b!1242944 () Bool)

(assert (=> b!1242944 (= e!704642 (isStrictlySorted!762 (t!40892 (removeStrictlySorted!133 l!644 key2!15))))))

(assert (= (and d!136845 (not res!828813)) b!1242943))

(assert (= (and b!1242943 res!828814) b!1242944))

(assert (=> b!1242944 m!1145099))

(assert (=> d!136763 d!136845))

(declare-fun lt!562127 () Bool)

(declare-fun d!136847 () Bool)

(assert (=> d!136847 (= lt!562127 (select (content!605 lt!562116) (tuple2!20373 key1!25 v1!20)))))

(declare-fun e!704646 () Bool)

(assert (=> d!136847 (= lt!562127 e!704646)))

(declare-fun res!828818 () Bool)

(assert (=> d!136847 (=> (not res!828818) (not e!704646))))

(assert (=> d!136847 (= res!828818 ((_ is Cons!27431) lt!562116))))

(assert (=> d!136847 (= (contains!7368 lt!562116 (tuple2!20373 key1!25 v1!20)) lt!562127)))

(declare-fun b!1242947 () Bool)

(declare-fun e!704645 () Bool)

(assert (=> b!1242947 (= e!704646 e!704645)))

(declare-fun res!828817 () Bool)

(assert (=> b!1242947 (=> res!828817 e!704645)))

(assert (=> b!1242947 (= res!828817 (= (h!28640 lt!562116) (tuple2!20373 key1!25 v1!20)))))

(declare-fun b!1242948 () Bool)

(assert (=> b!1242948 (= e!704645 (contains!7368 (t!40892 lt!562116) (tuple2!20373 key1!25 v1!20)))))

(assert (= (and d!136847 res!828818) b!1242947))

(assert (= (and b!1242947 (not res!828817)) b!1242948))

(declare-fun m!1145123 () Bool)

(assert (=> d!136847 m!1145123))

(declare-fun m!1145125 () Bool)

(assert (=> d!136847 m!1145125))

(declare-fun m!1145127 () Bool)

(assert (=> b!1242948 m!1145127))

(assert (=> b!1242827 d!136847))

(declare-fun b!1242949 () Bool)

(declare-fun e!704647 () Bool)

(declare-fun tp!92781 () Bool)

(assert (=> b!1242949 (= e!704647 (and tp_is_empty!31291 tp!92781))))

(assert (=> b!1242862 (= tp!92780 e!704647)))

(assert (= (and b!1242862 ((_ is Cons!27431) (t!40892 (t!40892 l!644)))) b!1242949))

(check-sat (not bm!61373) (not b!1242904) (not b!1242870) (not b!1242888) (not b!1242948) (not b!1242874) (not b!1242864) (not b!1242900) (not d!136825) (not d!136807) (not b!1242912) (not b!1242914) (not b!1242934) (not b!1242930) (not b!1242865) (not b!1242902) (not b!1242916) (not b!1242928) (not b!1242886) (not d!136793) (not d!136797) (not b!1242944) (not b!1242876) (not b!1242938) tp_is_empty!31291 (not d!136847) (not b!1242949) (not b!1242884) (not b!1242882) (not b!1242898) (not bm!61370) (not d!136809) (not b!1242869))
(check-sat)
