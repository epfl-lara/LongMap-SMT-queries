; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103802 () Bool)

(assert start!103802)

(declare-fun res!828737 () Bool)

(declare-fun e!704496 () Bool)

(assert (=> start!103802 (=> (not res!828737) (not e!704496))))

(declare-fun key1!25 () (_ BitVec 64))

(declare-fun key2!15 () (_ BitVec 64))

(assert (=> start!103802 (= res!828737 (not (= key1!25 key2!15)))))

(assert (=> start!103802 e!704496))

(assert (=> start!103802 true))

(declare-fun e!704495 () Bool)

(assert (=> start!103802 e!704495))

(declare-fun tp_is_empty!31293 () Bool)

(assert (=> start!103802 tp_is_empty!31293))

(declare-fun b!1242725 () Bool)

(declare-fun tp!92768 () Bool)

(assert (=> b!1242725 (= e!704495 (and tp_is_empty!31293 tp!92768))))

(declare-fun b!1242722 () Bool)

(declare-fun res!828738 () Bool)

(assert (=> b!1242722 (=> (not res!828738) (not e!704496))))

(declare-datatypes ((B!1894 0))(
  ( (B!1895 (val!15709 Int)) )
))
(declare-datatypes ((tuple2!20290 0))(
  ( (tuple2!20291 (_1!10156 (_ BitVec 64)) (_2!10156 B!1894)) )
))
(declare-datatypes ((List!27374 0))(
  ( (Nil!27371) (Cons!27370 (h!28579 tuple2!20290) (t!40840 List!27374)) )
))
(declare-fun l!644 () List!27374)

(declare-fun isStrictlySorted!767 (List!27374) Bool)

(assert (=> b!1242722 (= res!828738 (isStrictlySorted!767 l!644))))

(declare-fun v1!20 () B!1894)

(declare-fun b!1242724 () Bool)

(declare-fun insertStrictlySorted!441 (List!27374 (_ BitVec 64) B!1894) List!27374)

(declare-fun removeStrictlySorted!134 (List!27374 (_ BitVec 64)) List!27374)

(assert (=> b!1242724 (= e!704496 (not (= (insertStrictlySorted!441 (removeStrictlySorted!134 l!644 key2!15) key1!25 v1!20) (removeStrictlySorted!134 (insertStrictlySorted!441 l!644 key1!25 v1!20) key2!15))))))

(declare-fun b!1242723 () Bool)

(declare-fun res!828739 () Bool)

(assert (=> b!1242723 (=> (not res!828739) (not e!704496))))

(get-info :version)

(assert (=> b!1242723 (= res!828739 (not ((_ is Cons!27370) l!644)))))

(assert (= (and start!103802 res!828737) b!1242722))

(assert (= (and b!1242722 res!828738) b!1242723))

(assert (= (and b!1242723 res!828739) b!1242724))

(assert (= (and start!103802 ((_ is Cons!27370) l!644)) b!1242725))

(declare-fun m!1145429 () Bool)

(assert (=> b!1242722 m!1145429))

(declare-fun m!1145431 () Bool)

(assert (=> b!1242724 m!1145431))

(assert (=> b!1242724 m!1145431))

(declare-fun m!1145433 () Bool)

(assert (=> b!1242724 m!1145433))

(declare-fun m!1145435 () Bool)

(assert (=> b!1242724 m!1145435))

(assert (=> b!1242724 m!1145435))

(declare-fun m!1145437 () Bool)

(assert (=> b!1242724 m!1145437))

(check-sat (not b!1242724) (not b!1242722) (not b!1242725) tp_is_empty!31293)
(check-sat)
(get-model)

(declare-fun b!1242846 () Bool)

(declare-fun e!704561 () List!27374)

(declare-fun call!61380 () List!27374)

(assert (=> b!1242846 (= e!704561 call!61380)))

(declare-fun b!1242848 () Bool)

(declare-fun c!121730 () Bool)

(declare-fun e!704563 () List!27374)

(declare-fun c!121732 () Bool)

(assert (=> b!1242848 (= e!704563 (ite c!121732 (t!40840 (removeStrictlySorted!134 l!644 key2!15)) (ite c!121730 (Cons!27370 (h!28579 (removeStrictlySorted!134 l!644 key2!15)) (t!40840 (removeStrictlySorted!134 l!644 key2!15))) Nil!27371)))))

(declare-fun b!1242850 () Bool)

(assert (=> b!1242850 (= c!121730 (and ((_ is Cons!27370) (removeStrictlySorted!134 l!644 key2!15)) (bvsgt (_1!10156 (h!28579 (removeStrictlySorted!134 l!644 key2!15))) key1!25)))))

(declare-fun e!704558 () List!27374)

(assert (=> b!1242850 (= e!704558 e!704561)))

(declare-fun bm!61376 () Bool)

(declare-fun call!61381 () List!27374)

(declare-fun call!61379 () List!27374)

(assert (=> bm!61376 (= call!61381 call!61379)))

(declare-fun b!1242851 () Bool)

(assert (=> b!1242851 (= e!704563 (insertStrictlySorted!441 (t!40840 (removeStrictlySorted!134 l!644 key2!15)) key1!25 v1!20))))

(declare-fun d!136901 () Bool)

(declare-fun e!704559 () Bool)

(assert (=> d!136901 e!704559))

(declare-fun res!828771 () Bool)

(assert (=> d!136901 (=> (not res!828771) (not e!704559))))

(declare-fun lt!562286 () List!27374)

(assert (=> d!136901 (= res!828771 (isStrictlySorted!767 lt!562286))))

(declare-fun e!704560 () List!27374)

(assert (=> d!136901 (= lt!562286 e!704560)))

(declare-fun c!121734 () Bool)

(assert (=> d!136901 (= c!121734 (and ((_ is Cons!27370) (removeStrictlySorted!134 l!644 key2!15)) (bvslt (_1!10156 (h!28579 (removeStrictlySorted!134 l!644 key2!15))) key1!25)))))

(assert (=> d!136901 (isStrictlySorted!767 (removeStrictlySorted!134 l!644 key2!15))))

(assert (=> d!136901 (= (insertStrictlySorted!441 (removeStrictlySorted!134 l!644 key2!15) key1!25 v1!20) lt!562286)))

(declare-fun b!1242852 () Bool)

(assert (=> b!1242852 (= e!704558 call!61381)))

(declare-fun b!1242853 () Bool)

(assert (=> b!1242853 (= e!704560 e!704558)))

(assert (=> b!1242853 (= c!121732 (and ((_ is Cons!27370) (removeStrictlySorted!134 l!644 key2!15)) (= (_1!10156 (h!28579 (removeStrictlySorted!134 l!644 key2!15))) key1!25)))))

(declare-fun b!1242854 () Bool)

(declare-fun contains!7398 (List!27374 tuple2!20290) Bool)

(assert (=> b!1242854 (= e!704559 (contains!7398 lt!562286 (tuple2!20291 key1!25 v1!20)))))

(declare-fun bm!61377 () Bool)

(declare-fun $colon$colon!631 (List!27374 tuple2!20290) List!27374)

(assert (=> bm!61377 (= call!61379 ($colon$colon!631 e!704563 (ite c!121734 (h!28579 (removeStrictlySorted!134 l!644 key2!15)) (tuple2!20291 key1!25 v1!20))))))

(declare-fun c!121735 () Bool)

(assert (=> bm!61377 (= c!121735 c!121734)))

(declare-fun bm!61378 () Bool)

(assert (=> bm!61378 (= call!61380 call!61381)))

(declare-fun b!1242855 () Bool)

(declare-fun res!828770 () Bool)

(assert (=> b!1242855 (=> (not res!828770) (not e!704559))))

(declare-fun containsKey!617 (List!27374 (_ BitVec 64)) Bool)

(assert (=> b!1242855 (= res!828770 (containsKey!617 lt!562286 key1!25))))

(declare-fun b!1242856 () Bool)

(assert (=> b!1242856 (= e!704560 call!61379)))

(declare-fun b!1242857 () Bool)

(assert (=> b!1242857 (= e!704561 call!61380)))

(assert (= (and d!136901 c!121734) b!1242856))

(assert (= (and d!136901 (not c!121734)) b!1242853))

(assert (= (and b!1242853 c!121732) b!1242852))

(assert (= (and b!1242853 (not c!121732)) b!1242850))

(assert (= (and b!1242850 c!121730) b!1242846))

(assert (= (and b!1242850 (not c!121730)) b!1242857))

(assert (= (or b!1242846 b!1242857) bm!61378))

(assert (= (or b!1242852 bm!61378) bm!61376))

(assert (= (or b!1242856 bm!61376) bm!61377))

(assert (= (and bm!61377 c!121735) b!1242851))

(assert (= (and bm!61377 (not c!121735)) b!1242848))

(assert (= (and d!136901 res!828771) b!1242855))

(assert (= (and b!1242855 res!828770) b!1242854))

(declare-fun m!1145499 () Bool)

(assert (=> b!1242854 m!1145499))

(declare-fun m!1145501 () Bool)

(assert (=> d!136901 m!1145501))

(assert (=> d!136901 m!1145431))

(declare-fun m!1145503 () Bool)

(assert (=> d!136901 m!1145503))

(declare-fun m!1145505 () Bool)

(assert (=> b!1242855 m!1145505))

(declare-fun m!1145507 () Bool)

(assert (=> b!1242851 m!1145507))

(declare-fun m!1145509 () Bool)

(assert (=> bm!61377 m!1145509))

(assert (=> b!1242724 d!136901))

(declare-fun b!1242920 () Bool)

(declare-fun e!704608 () List!27374)

(assert (=> b!1242920 (= e!704608 (t!40840 l!644))))

(declare-fun b!1242921 () Bool)

(declare-fun e!704606 () List!27374)

(assert (=> b!1242921 (= e!704606 Nil!27371)))

(declare-fun b!1242922 () Bool)

(assert (=> b!1242922 (= e!704606 ($colon$colon!631 (removeStrictlySorted!134 (t!40840 l!644) key2!15) (h!28579 l!644)))))

(declare-fun b!1242923 () Bool)

(assert (=> b!1242923 (= e!704608 e!704606)))

(declare-fun c!121753 () Bool)

(assert (=> b!1242923 (= c!121753 (and ((_ is Cons!27370) l!644) (not (= (_1!10156 (h!28579 l!644)) key2!15))))))

(declare-fun b!1242924 () Bool)

(declare-fun e!704607 () Bool)

(declare-fun lt!562293 () List!27374)

(assert (=> b!1242924 (= e!704607 (not (containsKey!617 lt!562293 key2!15)))))

(declare-fun d!136913 () Bool)

(assert (=> d!136913 e!704607))

(declare-fun res!828793 () Bool)

(assert (=> d!136913 (=> (not res!828793) (not e!704607))))

(assert (=> d!136913 (= res!828793 (isStrictlySorted!767 lt!562293))))

(assert (=> d!136913 (= lt!562293 e!704608)))

(declare-fun c!121752 () Bool)

(assert (=> d!136913 (= c!121752 (and ((_ is Cons!27370) l!644) (= (_1!10156 (h!28579 l!644)) key2!15)))))

(assert (=> d!136913 (isStrictlySorted!767 l!644)))

(assert (=> d!136913 (= (removeStrictlySorted!134 l!644 key2!15) lt!562293)))

(assert (= (and d!136913 c!121752) b!1242920))

(assert (= (and d!136913 (not c!121752)) b!1242923))

(assert (= (and b!1242923 c!121753) b!1242922))

(assert (= (and b!1242923 (not c!121753)) b!1242921))

(assert (= (and d!136913 res!828793) b!1242924))

(declare-fun m!1145545 () Bool)

(assert (=> b!1242922 m!1145545))

(assert (=> b!1242922 m!1145545))

(declare-fun m!1145547 () Bool)

(assert (=> b!1242922 m!1145547))

(declare-fun m!1145549 () Bool)

(assert (=> b!1242924 m!1145549))

(declare-fun m!1145551 () Bool)

(assert (=> d!136913 m!1145551))

(assert (=> d!136913 m!1145429))

(assert (=> b!1242724 d!136913))

(declare-fun b!1242925 () Bool)

(declare-fun e!704611 () List!27374)

(assert (=> b!1242925 (= e!704611 (t!40840 (insertStrictlySorted!441 l!644 key1!25 v1!20)))))

(declare-fun b!1242926 () Bool)

(declare-fun e!704609 () List!27374)

(assert (=> b!1242926 (= e!704609 Nil!27371)))

(declare-fun b!1242927 () Bool)

(assert (=> b!1242927 (= e!704609 ($colon$colon!631 (removeStrictlySorted!134 (t!40840 (insertStrictlySorted!441 l!644 key1!25 v1!20)) key2!15) (h!28579 (insertStrictlySorted!441 l!644 key1!25 v1!20))))))

(declare-fun b!1242928 () Bool)

(assert (=> b!1242928 (= e!704611 e!704609)))

(declare-fun c!121755 () Bool)

(assert (=> b!1242928 (= c!121755 (and ((_ is Cons!27370) (insertStrictlySorted!441 l!644 key1!25 v1!20)) (not (= (_1!10156 (h!28579 (insertStrictlySorted!441 l!644 key1!25 v1!20))) key2!15))))))

(declare-fun b!1242929 () Bool)

(declare-fun e!704610 () Bool)

(declare-fun lt!562294 () List!27374)

(assert (=> b!1242929 (= e!704610 (not (containsKey!617 lt!562294 key2!15)))))

(declare-fun d!136921 () Bool)

(assert (=> d!136921 e!704610))

(declare-fun res!828794 () Bool)

(assert (=> d!136921 (=> (not res!828794) (not e!704610))))

(assert (=> d!136921 (= res!828794 (isStrictlySorted!767 lt!562294))))

(assert (=> d!136921 (= lt!562294 e!704611)))

(declare-fun c!121754 () Bool)

(assert (=> d!136921 (= c!121754 (and ((_ is Cons!27370) (insertStrictlySorted!441 l!644 key1!25 v1!20)) (= (_1!10156 (h!28579 (insertStrictlySorted!441 l!644 key1!25 v1!20))) key2!15)))))

(assert (=> d!136921 (isStrictlySorted!767 (insertStrictlySorted!441 l!644 key1!25 v1!20))))

(assert (=> d!136921 (= (removeStrictlySorted!134 (insertStrictlySorted!441 l!644 key1!25 v1!20) key2!15) lt!562294)))

(assert (= (and d!136921 c!121754) b!1242925))

(assert (= (and d!136921 (not c!121754)) b!1242928))

(assert (= (and b!1242928 c!121755) b!1242927))

(assert (= (and b!1242928 (not c!121755)) b!1242926))

(assert (= (and d!136921 res!828794) b!1242929))

(declare-fun m!1145553 () Bool)

(assert (=> b!1242927 m!1145553))

(assert (=> b!1242927 m!1145553))

(declare-fun m!1145555 () Bool)

(assert (=> b!1242927 m!1145555))

(declare-fun m!1145557 () Bool)

(assert (=> b!1242929 m!1145557))

(declare-fun m!1145559 () Bool)

(assert (=> d!136921 m!1145559))

(assert (=> d!136921 m!1145435))

(declare-fun m!1145561 () Bool)

(assert (=> d!136921 m!1145561))

(assert (=> b!1242724 d!136921))

(declare-fun b!1242930 () Bool)

(declare-fun e!704615 () List!27374)

(declare-fun call!61389 () List!27374)

(assert (=> b!1242930 (= e!704615 call!61389)))

(declare-fun b!1242931 () Bool)

(declare-fun c!121757 () Bool)

(declare-fun c!121756 () Bool)

(declare-fun e!704616 () List!27374)

(assert (=> b!1242931 (= e!704616 (ite c!121757 (t!40840 l!644) (ite c!121756 (Cons!27370 (h!28579 l!644) (t!40840 l!644)) Nil!27371)))))

(declare-fun b!1242932 () Bool)

(assert (=> b!1242932 (= c!121756 (and ((_ is Cons!27370) l!644) (bvsgt (_1!10156 (h!28579 l!644)) key1!25)))))

(declare-fun e!704612 () List!27374)

(assert (=> b!1242932 (= e!704612 e!704615)))

(declare-fun bm!61385 () Bool)

(declare-fun call!61390 () List!27374)

(declare-fun call!61388 () List!27374)

(assert (=> bm!61385 (= call!61390 call!61388)))

(declare-fun b!1242933 () Bool)

(assert (=> b!1242933 (= e!704616 (insertStrictlySorted!441 (t!40840 l!644) key1!25 v1!20))))

(declare-fun d!136923 () Bool)

(declare-fun e!704613 () Bool)

(assert (=> d!136923 e!704613))

(declare-fun res!828796 () Bool)

(assert (=> d!136923 (=> (not res!828796) (not e!704613))))

(declare-fun lt!562295 () List!27374)

(assert (=> d!136923 (= res!828796 (isStrictlySorted!767 lt!562295))))

(declare-fun e!704614 () List!27374)

(assert (=> d!136923 (= lt!562295 e!704614)))

(declare-fun c!121758 () Bool)

(assert (=> d!136923 (= c!121758 (and ((_ is Cons!27370) l!644) (bvslt (_1!10156 (h!28579 l!644)) key1!25)))))

(assert (=> d!136923 (isStrictlySorted!767 l!644)))

(assert (=> d!136923 (= (insertStrictlySorted!441 l!644 key1!25 v1!20) lt!562295)))

(declare-fun b!1242934 () Bool)

(assert (=> b!1242934 (= e!704612 call!61390)))

(declare-fun b!1242935 () Bool)

(assert (=> b!1242935 (= e!704614 e!704612)))

(assert (=> b!1242935 (= c!121757 (and ((_ is Cons!27370) l!644) (= (_1!10156 (h!28579 l!644)) key1!25)))))

(declare-fun b!1242936 () Bool)

(assert (=> b!1242936 (= e!704613 (contains!7398 lt!562295 (tuple2!20291 key1!25 v1!20)))))

(declare-fun bm!61386 () Bool)

(assert (=> bm!61386 (= call!61388 ($colon$colon!631 e!704616 (ite c!121758 (h!28579 l!644) (tuple2!20291 key1!25 v1!20))))))

(declare-fun c!121759 () Bool)

(assert (=> bm!61386 (= c!121759 c!121758)))

(declare-fun bm!61387 () Bool)

(assert (=> bm!61387 (= call!61389 call!61390)))

(declare-fun b!1242937 () Bool)

(declare-fun res!828795 () Bool)

(assert (=> b!1242937 (=> (not res!828795) (not e!704613))))

(assert (=> b!1242937 (= res!828795 (containsKey!617 lt!562295 key1!25))))

(declare-fun b!1242938 () Bool)

(assert (=> b!1242938 (= e!704614 call!61388)))

(declare-fun b!1242939 () Bool)

(assert (=> b!1242939 (= e!704615 call!61389)))

(assert (= (and d!136923 c!121758) b!1242938))

(assert (= (and d!136923 (not c!121758)) b!1242935))

(assert (= (and b!1242935 c!121757) b!1242934))

(assert (= (and b!1242935 (not c!121757)) b!1242932))

(assert (= (and b!1242932 c!121756) b!1242930))

(assert (= (and b!1242932 (not c!121756)) b!1242939))

(assert (= (or b!1242930 b!1242939) bm!61387))

(assert (= (or b!1242934 bm!61387) bm!61385))

(assert (= (or b!1242938 bm!61385) bm!61386))

(assert (= (and bm!61386 c!121759) b!1242933))

(assert (= (and bm!61386 (not c!121759)) b!1242931))

(assert (= (and d!136923 res!828796) b!1242937))

(assert (= (and b!1242937 res!828795) b!1242936))

(declare-fun m!1145563 () Bool)

(assert (=> b!1242936 m!1145563))

(declare-fun m!1145565 () Bool)

(assert (=> d!136923 m!1145565))

(assert (=> d!136923 m!1145429))

(declare-fun m!1145567 () Bool)

(assert (=> b!1242937 m!1145567))

(declare-fun m!1145569 () Bool)

(assert (=> b!1242933 m!1145569))

(declare-fun m!1145571 () Bool)

(assert (=> bm!61386 m!1145571))

(assert (=> b!1242724 d!136923))

(declare-fun d!136925 () Bool)

(declare-fun res!828801 () Bool)

(declare-fun e!704621 () Bool)

(assert (=> d!136925 (=> res!828801 e!704621)))

(assert (=> d!136925 (= res!828801 (or ((_ is Nil!27371) l!644) ((_ is Nil!27371) (t!40840 l!644))))))

(assert (=> d!136925 (= (isStrictlySorted!767 l!644) e!704621)))

(declare-fun b!1242944 () Bool)

(declare-fun e!704622 () Bool)

(assert (=> b!1242944 (= e!704621 e!704622)))

(declare-fun res!828802 () Bool)

(assert (=> b!1242944 (=> (not res!828802) (not e!704622))))

(assert (=> b!1242944 (= res!828802 (bvslt (_1!10156 (h!28579 l!644)) (_1!10156 (h!28579 (t!40840 l!644)))))))

(declare-fun b!1242945 () Bool)

(assert (=> b!1242945 (= e!704622 (isStrictlySorted!767 (t!40840 l!644)))))

(assert (= (and d!136925 (not res!828801)) b!1242944))

(assert (= (and b!1242944 res!828802) b!1242945))

(declare-fun m!1145573 () Bool)

(assert (=> b!1242945 m!1145573))

(assert (=> b!1242722 d!136925))

(declare-fun b!1242950 () Bool)

(declare-fun e!704625 () Bool)

(declare-fun tp!92780 () Bool)

(assert (=> b!1242950 (= e!704625 (and tp_is_empty!31293 tp!92780))))

(assert (=> b!1242725 (= tp!92768 e!704625)))

(assert (= (and b!1242725 ((_ is Cons!27370) (t!40840 l!644))) b!1242950))

(check-sat (not d!136913) (not d!136923) (not bm!61377) (not b!1242936) (not d!136901) (not b!1242929) (not b!1242924) (not b!1242933) (not bm!61386) (not b!1242851) (not b!1242937) tp_is_empty!31293 (not b!1242950) (not b!1242854) (not b!1242922) (not d!136921) (not b!1242855) (not b!1242927) (not b!1242945))
(check-sat)
(get-model)

(declare-fun d!136927 () Bool)

(assert (=> d!136927 (= ($colon$colon!631 (removeStrictlySorted!134 (t!40840 l!644) key2!15) (h!28579 l!644)) (Cons!27370 (h!28579 l!644) (removeStrictlySorted!134 (t!40840 l!644) key2!15)))))

(assert (=> b!1242922 d!136927))

(declare-fun b!1242951 () Bool)

(declare-fun e!704628 () List!27374)

(assert (=> b!1242951 (= e!704628 (t!40840 (t!40840 l!644)))))

(declare-fun b!1242952 () Bool)

(declare-fun e!704626 () List!27374)

(assert (=> b!1242952 (= e!704626 Nil!27371)))

(declare-fun b!1242953 () Bool)

(assert (=> b!1242953 (= e!704626 ($colon$colon!631 (removeStrictlySorted!134 (t!40840 (t!40840 l!644)) key2!15) (h!28579 (t!40840 l!644))))))

(declare-fun b!1242954 () Bool)

(assert (=> b!1242954 (= e!704628 e!704626)))

(declare-fun c!121761 () Bool)

(assert (=> b!1242954 (= c!121761 (and ((_ is Cons!27370) (t!40840 l!644)) (not (= (_1!10156 (h!28579 (t!40840 l!644))) key2!15))))))

(declare-fun b!1242955 () Bool)

(declare-fun e!704627 () Bool)

(declare-fun lt!562296 () List!27374)

(assert (=> b!1242955 (= e!704627 (not (containsKey!617 lt!562296 key2!15)))))

(declare-fun d!136929 () Bool)

(assert (=> d!136929 e!704627))

(declare-fun res!828803 () Bool)

(assert (=> d!136929 (=> (not res!828803) (not e!704627))))

(assert (=> d!136929 (= res!828803 (isStrictlySorted!767 lt!562296))))

(assert (=> d!136929 (= lt!562296 e!704628)))

(declare-fun c!121760 () Bool)

(assert (=> d!136929 (= c!121760 (and ((_ is Cons!27370) (t!40840 l!644)) (= (_1!10156 (h!28579 (t!40840 l!644))) key2!15)))))

(assert (=> d!136929 (isStrictlySorted!767 (t!40840 l!644))))

(assert (=> d!136929 (= (removeStrictlySorted!134 (t!40840 l!644) key2!15) lt!562296)))

(assert (= (and d!136929 c!121760) b!1242951))

(assert (= (and d!136929 (not c!121760)) b!1242954))

(assert (= (and b!1242954 c!121761) b!1242953))

(assert (= (and b!1242954 (not c!121761)) b!1242952))

(assert (= (and d!136929 res!828803) b!1242955))

(declare-fun m!1145575 () Bool)

(assert (=> b!1242953 m!1145575))

(assert (=> b!1242953 m!1145575))

(declare-fun m!1145577 () Bool)

(assert (=> b!1242953 m!1145577))

(declare-fun m!1145579 () Bool)

(assert (=> b!1242955 m!1145579))

(declare-fun m!1145581 () Bool)

(assert (=> d!136929 m!1145581))

(assert (=> d!136929 m!1145573))

(assert (=> b!1242922 d!136929))

(declare-fun d!136931 () Bool)

(declare-fun res!828808 () Bool)

(declare-fun e!704633 () Bool)

(assert (=> d!136931 (=> res!828808 e!704633)))

(assert (=> d!136931 (= res!828808 (and ((_ is Cons!27370) lt!562295) (= (_1!10156 (h!28579 lt!562295)) key1!25)))))

(assert (=> d!136931 (= (containsKey!617 lt!562295 key1!25) e!704633)))

(declare-fun b!1242960 () Bool)

(declare-fun e!704634 () Bool)

(assert (=> b!1242960 (= e!704633 e!704634)))

(declare-fun res!828809 () Bool)

(assert (=> b!1242960 (=> (not res!828809) (not e!704634))))

(assert (=> b!1242960 (= res!828809 (and (or (not ((_ is Cons!27370) lt!562295)) (bvsle (_1!10156 (h!28579 lt!562295)) key1!25)) ((_ is Cons!27370) lt!562295) (bvslt (_1!10156 (h!28579 lt!562295)) key1!25)))))

(declare-fun b!1242961 () Bool)

(assert (=> b!1242961 (= e!704634 (containsKey!617 (t!40840 lt!562295) key1!25))))

(assert (= (and d!136931 (not res!828808)) b!1242960))

(assert (= (and b!1242960 res!828809) b!1242961))

(declare-fun m!1145583 () Bool)

(assert (=> b!1242961 m!1145583))

(assert (=> b!1242937 d!136931))

(declare-fun d!136947 () Bool)

(assert (=> d!136947 (= ($colon$colon!631 e!704616 (ite c!121758 (h!28579 l!644) (tuple2!20291 key1!25 v1!20))) (Cons!27370 (ite c!121758 (h!28579 l!644) (tuple2!20291 key1!25 v1!20)) e!704616))))

(assert (=> bm!61386 d!136947))

(declare-fun d!136949 () Bool)

(declare-fun res!828825 () Bool)

(declare-fun e!704655 () Bool)

(assert (=> d!136949 (=> res!828825 e!704655)))

(assert (=> d!136949 (= res!828825 (and ((_ is Cons!27370) lt!562286) (= (_1!10156 (h!28579 lt!562286)) key1!25)))))

(assert (=> d!136949 (= (containsKey!617 lt!562286 key1!25) e!704655)))

(declare-fun b!1242989 () Bool)

(declare-fun e!704656 () Bool)

(assert (=> b!1242989 (= e!704655 e!704656)))

(declare-fun res!828826 () Bool)

(assert (=> b!1242989 (=> (not res!828826) (not e!704656))))

(assert (=> b!1242989 (= res!828826 (and (or (not ((_ is Cons!27370) lt!562286)) (bvsle (_1!10156 (h!28579 lt!562286)) key1!25)) ((_ is Cons!27370) lt!562286) (bvslt (_1!10156 (h!28579 lt!562286)) key1!25)))))

(declare-fun b!1242990 () Bool)

(assert (=> b!1242990 (= e!704656 (containsKey!617 (t!40840 lt!562286) key1!25))))

(assert (= (and d!136949 (not res!828825)) b!1242989))

(assert (= (and b!1242989 res!828826) b!1242990))

(declare-fun m!1145615 () Bool)

(assert (=> b!1242990 m!1145615))

(assert (=> b!1242855 d!136949))

(declare-fun d!136953 () Bool)

(declare-fun res!828827 () Bool)

(declare-fun e!704657 () Bool)

(assert (=> d!136953 (=> res!828827 e!704657)))

(assert (=> d!136953 (= res!828827 (or ((_ is Nil!27371) lt!562286) ((_ is Nil!27371) (t!40840 lt!562286))))))

(assert (=> d!136953 (= (isStrictlySorted!767 lt!562286) e!704657)))

(declare-fun b!1242991 () Bool)

(declare-fun e!704658 () Bool)

(assert (=> b!1242991 (= e!704657 e!704658)))

(declare-fun res!828828 () Bool)

(assert (=> b!1242991 (=> (not res!828828) (not e!704658))))

(assert (=> b!1242991 (= res!828828 (bvslt (_1!10156 (h!28579 lt!562286)) (_1!10156 (h!28579 (t!40840 lt!562286)))))))

(declare-fun b!1242992 () Bool)

(assert (=> b!1242992 (= e!704658 (isStrictlySorted!767 (t!40840 lt!562286)))))

(assert (= (and d!136953 (not res!828827)) b!1242991))

(assert (= (and b!1242991 res!828828) b!1242992))

(declare-fun m!1145617 () Bool)

(assert (=> b!1242992 m!1145617))

(assert (=> d!136901 d!136953))

(declare-fun d!136957 () Bool)

(declare-fun res!828831 () Bool)

(declare-fun e!704661 () Bool)

(assert (=> d!136957 (=> res!828831 e!704661)))

(assert (=> d!136957 (= res!828831 (or ((_ is Nil!27371) (removeStrictlySorted!134 l!644 key2!15)) ((_ is Nil!27371) (t!40840 (removeStrictlySorted!134 l!644 key2!15)))))))

(assert (=> d!136957 (= (isStrictlySorted!767 (removeStrictlySorted!134 l!644 key2!15)) e!704661)))

(declare-fun b!1242995 () Bool)

(declare-fun e!704662 () Bool)

(assert (=> b!1242995 (= e!704661 e!704662)))

(declare-fun res!828832 () Bool)

(assert (=> b!1242995 (=> (not res!828832) (not e!704662))))

(assert (=> b!1242995 (= res!828832 (bvslt (_1!10156 (h!28579 (removeStrictlySorted!134 l!644 key2!15))) (_1!10156 (h!28579 (t!40840 (removeStrictlySorted!134 l!644 key2!15))))))))

(declare-fun b!1242996 () Bool)

(assert (=> b!1242996 (= e!704662 (isStrictlySorted!767 (t!40840 (removeStrictlySorted!134 l!644 key2!15))))))

(assert (= (and d!136957 (not res!828831)) b!1242995))

(assert (= (and b!1242995 res!828832) b!1242996))

(declare-fun m!1145621 () Bool)

(assert (=> b!1242996 m!1145621))

(assert (=> d!136901 d!136957))

(declare-fun d!136961 () Bool)

(declare-fun lt!562305 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!606 (List!27374) (InoxSet tuple2!20290))

(assert (=> d!136961 (= lt!562305 (select (content!606 lt!562295) (tuple2!20291 key1!25 v1!20)))))

(declare-fun e!704680 () Bool)

(assert (=> d!136961 (= lt!562305 e!704680)))

(declare-fun res!828847 () Bool)

(assert (=> d!136961 (=> (not res!828847) (not e!704680))))

(assert (=> d!136961 (= res!828847 ((_ is Cons!27370) lt!562295))))

(assert (=> d!136961 (= (contains!7398 lt!562295 (tuple2!20291 key1!25 v1!20)) lt!562305)))

(declare-fun b!1243019 () Bool)

(declare-fun e!704681 () Bool)

(assert (=> b!1243019 (= e!704680 e!704681)))

(declare-fun res!828848 () Bool)

(assert (=> b!1243019 (=> res!828848 e!704681)))

(assert (=> b!1243019 (= res!828848 (= (h!28579 lt!562295) (tuple2!20291 key1!25 v1!20)))))

(declare-fun b!1243020 () Bool)

(assert (=> b!1243020 (= e!704681 (contains!7398 (t!40840 lt!562295) (tuple2!20291 key1!25 v1!20)))))

(assert (= (and d!136961 res!828847) b!1243019))

(assert (= (and b!1243019 (not res!828848)) b!1243020))

(declare-fun m!1145637 () Bool)

(assert (=> d!136961 m!1145637))

(declare-fun m!1145639 () Bool)

(assert (=> d!136961 m!1145639))

(declare-fun m!1145641 () Bool)

(assert (=> b!1243020 m!1145641))

(assert (=> b!1242936 d!136961))

(declare-fun d!136971 () Bool)

(declare-fun res!828851 () Bool)

(declare-fun e!704684 () Bool)

(assert (=> d!136971 (=> res!828851 e!704684)))

(assert (=> d!136971 (= res!828851 (or ((_ is Nil!27371) lt!562295) ((_ is Nil!27371) (t!40840 lt!562295))))))

(assert (=> d!136971 (= (isStrictlySorted!767 lt!562295) e!704684)))

(declare-fun b!1243023 () Bool)

(declare-fun e!704685 () Bool)

(assert (=> b!1243023 (= e!704684 e!704685)))

(declare-fun res!828852 () Bool)

(assert (=> b!1243023 (=> (not res!828852) (not e!704685))))

(assert (=> b!1243023 (= res!828852 (bvslt (_1!10156 (h!28579 lt!562295)) (_1!10156 (h!28579 (t!40840 lt!562295)))))))

(declare-fun b!1243024 () Bool)

(assert (=> b!1243024 (= e!704685 (isStrictlySorted!767 (t!40840 lt!562295)))))

(assert (= (and d!136971 (not res!828851)) b!1243023))

(assert (= (and b!1243023 res!828852) b!1243024))

(declare-fun m!1145645 () Bool)

(assert (=> b!1243024 m!1145645))

(assert (=> d!136923 d!136971))

(assert (=> d!136923 d!136925))

(declare-fun d!136979 () Bool)

(assert (=> d!136979 (= ($colon$colon!631 e!704563 (ite c!121734 (h!28579 (removeStrictlySorted!134 l!644 key2!15)) (tuple2!20291 key1!25 v1!20))) (Cons!27370 (ite c!121734 (h!28579 (removeStrictlySorted!134 l!644 key2!15)) (tuple2!20291 key1!25 v1!20)) e!704563))))

(assert (=> bm!61377 d!136979))

(declare-fun b!1243035 () Bool)

(declare-fun e!704695 () List!27374)

(declare-fun call!61398 () List!27374)

(assert (=> b!1243035 (= e!704695 call!61398)))

(declare-fun c!121777 () Bool)

(declare-fun e!704696 () List!27374)

(declare-fun b!1243036 () Bool)

(declare-fun c!121776 () Bool)

(assert (=> b!1243036 (= e!704696 (ite c!121777 (t!40840 (t!40840 l!644)) (ite c!121776 (Cons!27370 (h!28579 (t!40840 l!644)) (t!40840 (t!40840 l!644))) Nil!27371)))))

(declare-fun b!1243037 () Bool)

(assert (=> b!1243037 (= c!121776 (and ((_ is Cons!27370) (t!40840 l!644)) (bvsgt (_1!10156 (h!28579 (t!40840 l!644))) key1!25)))))

(declare-fun e!704692 () List!27374)

(assert (=> b!1243037 (= e!704692 e!704695)))

(declare-fun bm!61394 () Bool)

(declare-fun call!61399 () List!27374)

(declare-fun call!61397 () List!27374)

(assert (=> bm!61394 (= call!61399 call!61397)))

(declare-fun b!1243038 () Bool)

(assert (=> b!1243038 (= e!704696 (insertStrictlySorted!441 (t!40840 (t!40840 l!644)) key1!25 v1!20))))

(declare-fun d!136981 () Bool)

(declare-fun e!704693 () Bool)

(assert (=> d!136981 e!704693))

(declare-fun res!828856 () Bool)

(assert (=> d!136981 (=> (not res!828856) (not e!704693))))

(declare-fun lt!562308 () List!27374)

(assert (=> d!136981 (= res!828856 (isStrictlySorted!767 lt!562308))))

(declare-fun e!704694 () List!27374)

(assert (=> d!136981 (= lt!562308 e!704694)))

(declare-fun c!121778 () Bool)

(assert (=> d!136981 (= c!121778 (and ((_ is Cons!27370) (t!40840 l!644)) (bvslt (_1!10156 (h!28579 (t!40840 l!644))) key1!25)))))

(assert (=> d!136981 (isStrictlySorted!767 (t!40840 l!644))))

(assert (=> d!136981 (= (insertStrictlySorted!441 (t!40840 l!644) key1!25 v1!20) lt!562308)))

(declare-fun b!1243039 () Bool)

(assert (=> b!1243039 (= e!704692 call!61399)))

(declare-fun b!1243040 () Bool)

(assert (=> b!1243040 (= e!704694 e!704692)))

(assert (=> b!1243040 (= c!121777 (and ((_ is Cons!27370) (t!40840 l!644)) (= (_1!10156 (h!28579 (t!40840 l!644))) key1!25)))))

(declare-fun b!1243041 () Bool)

(assert (=> b!1243041 (= e!704693 (contains!7398 lt!562308 (tuple2!20291 key1!25 v1!20)))))

(declare-fun bm!61395 () Bool)

(assert (=> bm!61395 (= call!61397 ($colon$colon!631 e!704696 (ite c!121778 (h!28579 (t!40840 l!644)) (tuple2!20291 key1!25 v1!20))))))

(declare-fun c!121779 () Bool)

(assert (=> bm!61395 (= c!121779 c!121778)))

(declare-fun bm!61396 () Bool)

(assert (=> bm!61396 (= call!61398 call!61399)))

(declare-fun b!1243042 () Bool)

(declare-fun res!828855 () Bool)

(assert (=> b!1243042 (=> (not res!828855) (not e!704693))))

(assert (=> b!1243042 (= res!828855 (containsKey!617 lt!562308 key1!25))))

(declare-fun b!1243043 () Bool)

(assert (=> b!1243043 (= e!704694 call!61397)))

(declare-fun b!1243044 () Bool)

(assert (=> b!1243044 (= e!704695 call!61398)))

(assert (= (and d!136981 c!121778) b!1243043))

(assert (= (and d!136981 (not c!121778)) b!1243040))

(assert (= (and b!1243040 c!121777) b!1243039))

(assert (= (and b!1243040 (not c!121777)) b!1243037))

(assert (= (and b!1243037 c!121776) b!1243035))

(assert (= (and b!1243037 (not c!121776)) b!1243044))

(assert (= (or b!1243035 b!1243044) bm!61396))

(assert (= (or b!1243039 bm!61396) bm!61394))

(assert (= (or b!1243043 bm!61394) bm!61395))

(assert (= (and bm!61395 c!121779) b!1243038))

(assert (= (and bm!61395 (not c!121779)) b!1243036))

(assert (= (and d!136981 res!828856) b!1243042))

(assert (= (and b!1243042 res!828855) b!1243041))

(declare-fun m!1145669 () Bool)

(assert (=> b!1243041 m!1145669))

(declare-fun m!1145671 () Bool)

(assert (=> d!136981 m!1145671))

(assert (=> d!136981 m!1145573))

(declare-fun m!1145673 () Bool)

(assert (=> b!1243042 m!1145673))

(declare-fun m!1145677 () Bool)

(assert (=> b!1243038 m!1145677))

(declare-fun m!1145679 () Bool)

(assert (=> bm!61395 m!1145679))

(assert (=> b!1242933 d!136981))

(declare-fun lt!562309 () Bool)

(declare-fun d!136993 () Bool)

(assert (=> d!136993 (= lt!562309 (select (content!606 lt!562286) (tuple2!20291 key1!25 v1!20)))))

(declare-fun e!704705 () Bool)

(assert (=> d!136993 (= lt!562309 e!704705)))

(declare-fun res!828865 () Bool)

(assert (=> d!136993 (=> (not res!828865) (not e!704705))))

(assert (=> d!136993 (= res!828865 ((_ is Cons!27370) lt!562286))))

(assert (=> d!136993 (= (contains!7398 lt!562286 (tuple2!20291 key1!25 v1!20)) lt!562309)))

(declare-fun b!1243053 () Bool)

(declare-fun e!704706 () Bool)

(assert (=> b!1243053 (= e!704705 e!704706)))

(declare-fun res!828866 () Bool)

(assert (=> b!1243053 (=> res!828866 e!704706)))

(assert (=> b!1243053 (= res!828866 (= (h!28579 lt!562286) (tuple2!20291 key1!25 v1!20)))))

(declare-fun b!1243054 () Bool)

(assert (=> b!1243054 (= e!704706 (contains!7398 (t!40840 lt!562286) (tuple2!20291 key1!25 v1!20)))))

(assert (= (and d!136993 res!828865) b!1243053))

(assert (= (and b!1243053 (not res!828866)) b!1243054))

(declare-fun m!1145683 () Bool)

(assert (=> d!136993 m!1145683))

(declare-fun m!1145685 () Bool)

(assert (=> d!136993 m!1145685))

(declare-fun m!1145687 () Bool)

(assert (=> b!1243054 m!1145687))

(assert (=> b!1242854 d!136993))

(declare-fun d!136997 () Bool)

(declare-fun res!828869 () Bool)

(declare-fun e!704709 () Bool)

(assert (=> d!136997 (=> res!828869 e!704709)))

(assert (=> d!136997 (= res!828869 (or ((_ is Nil!27371) (t!40840 l!644)) ((_ is Nil!27371) (t!40840 (t!40840 l!644)))))))

(assert (=> d!136997 (= (isStrictlySorted!767 (t!40840 l!644)) e!704709)))

(declare-fun b!1243057 () Bool)

(declare-fun e!704710 () Bool)

(assert (=> b!1243057 (= e!704709 e!704710)))

(declare-fun res!828870 () Bool)

(assert (=> b!1243057 (=> (not res!828870) (not e!704710))))

(assert (=> b!1243057 (= res!828870 (bvslt (_1!10156 (h!28579 (t!40840 l!644))) (_1!10156 (h!28579 (t!40840 (t!40840 l!644))))))))

(declare-fun b!1243058 () Bool)

(assert (=> b!1243058 (= e!704710 (isStrictlySorted!767 (t!40840 (t!40840 l!644))))))

(assert (= (and d!136997 (not res!828869)) b!1243057))

(assert (= (and b!1243057 res!828870) b!1243058))

(declare-fun m!1145695 () Bool)

(assert (=> b!1243058 m!1145695))

(assert (=> b!1242945 d!136997))

(declare-fun d!137001 () Bool)

(declare-fun res!828873 () Bool)

(declare-fun e!704714 () Bool)

(assert (=> d!137001 (=> res!828873 e!704714)))

(assert (=> d!137001 (= res!828873 (and ((_ is Cons!27370) lt!562293) (= (_1!10156 (h!28579 lt!562293)) key2!15)))))

(assert (=> d!137001 (= (containsKey!617 lt!562293 key2!15) e!704714)))

(declare-fun b!1243062 () Bool)

(declare-fun e!704715 () Bool)

(assert (=> b!1243062 (= e!704714 e!704715)))

(declare-fun res!828874 () Bool)

(assert (=> b!1243062 (=> (not res!828874) (not e!704715))))

(assert (=> b!1243062 (= res!828874 (and (or (not ((_ is Cons!27370) lt!562293)) (bvsle (_1!10156 (h!28579 lt!562293)) key2!15)) ((_ is Cons!27370) lt!562293) (bvslt (_1!10156 (h!28579 lt!562293)) key2!15)))))

(declare-fun b!1243063 () Bool)

(assert (=> b!1243063 (= e!704715 (containsKey!617 (t!40840 lt!562293) key2!15))))

(assert (= (and d!137001 (not res!828873)) b!1243062))

(assert (= (and b!1243062 res!828874) b!1243063))

(declare-fun m!1145697 () Bool)

(assert (=> b!1243063 m!1145697))

(assert (=> b!1242924 d!137001))

(declare-fun d!137003 () Bool)

(declare-fun res!828877 () Bool)

(declare-fun e!704718 () Bool)

(assert (=> d!137003 (=> res!828877 e!704718)))

(assert (=> d!137003 (= res!828877 (and ((_ is Cons!27370) lt!562294) (= (_1!10156 (h!28579 lt!562294)) key2!15)))))

(assert (=> d!137003 (= (containsKey!617 lt!562294 key2!15) e!704718)))

(declare-fun b!1243066 () Bool)

(declare-fun e!704719 () Bool)

(assert (=> b!1243066 (= e!704718 e!704719)))

(declare-fun res!828878 () Bool)

(assert (=> b!1243066 (=> (not res!828878) (not e!704719))))

(assert (=> b!1243066 (= res!828878 (and (or (not ((_ is Cons!27370) lt!562294)) (bvsle (_1!10156 (h!28579 lt!562294)) key2!15)) ((_ is Cons!27370) lt!562294) (bvslt (_1!10156 (h!28579 lt!562294)) key2!15)))))

(declare-fun b!1243067 () Bool)

(assert (=> b!1243067 (= e!704719 (containsKey!617 (t!40840 lt!562294) key2!15))))

(assert (= (and d!137003 (not res!828877)) b!1243066))

(assert (= (and b!1243066 res!828878) b!1243067))

(declare-fun m!1145699 () Bool)

(assert (=> b!1243067 m!1145699))

(assert (=> b!1242929 d!137003))

(declare-fun b!1243068 () Bool)

(declare-fun e!704723 () List!27374)

(declare-fun call!61401 () List!27374)

(assert (=> b!1243068 (= e!704723 call!61401)))

(declare-fun b!1243069 () Bool)

(declare-fun c!121781 () Bool)

(declare-fun c!121780 () Bool)

(declare-fun e!704724 () List!27374)

(assert (=> b!1243069 (= e!704724 (ite c!121781 (t!40840 (t!40840 (removeStrictlySorted!134 l!644 key2!15))) (ite c!121780 (Cons!27370 (h!28579 (t!40840 (removeStrictlySorted!134 l!644 key2!15))) (t!40840 (t!40840 (removeStrictlySorted!134 l!644 key2!15)))) Nil!27371)))))

(declare-fun b!1243070 () Bool)

(assert (=> b!1243070 (= c!121780 (and ((_ is Cons!27370) (t!40840 (removeStrictlySorted!134 l!644 key2!15))) (bvsgt (_1!10156 (h!28579 (t!40840 (removeStrictlySorted!134 l!644 key2!15)))) key1!25)))))

(declare-fun e!704720 () List!27374)

(assert (=> b!1243070 (= e!704720 e!704723)))

(declare-fun bm!61397 () Bool)

(declare-fun call!61402 () List!27374)

(declare-fun call!61400 () List!27374)

(assert (=> bm!61397 (= call!61402 call!61400)))

(declare-fun b!1243071 () Bool)

(assert (=> b!1243071 (= e!704724 (insertStrictlySorted!441 (t!40840 (t!40840 (removeStrictlySorted!134 l!644 key2!15))) key1!25 v1!20))))

(declare-fun d!137005 () Bool)

(declare-fun e!704721 () Bool)

(assert (=> d!137005 e!704721))

(declare-fun res!828880 () Bool)

(assert (=> d!137005 (=> (not res!828880) (not e!704721))))

(declare-fun lt!562313 () List!27374)

(assert (=> d!137005 (= res!828880 (isStrictlySorted!767 lt!562313))))

(declare-fun e!704722 () List!27374)

(assert (=> d!137005 (= lt!562313 e!704722)))

(declare-fun c!121782 () Bool)

(assert (=> d!137005 (= c!121782 (and ((_ is Cons!27370) (t!40840 (removeStrictlySorted!134 l!644 key2!15))) (bvslt (_1!10156 (h!28579 (t!40840 (removeStrictlySorted!134 l!644 key2!15)))) key1!25)))))

(assert (=> d!137005 (isStrictlySorted!767 (t!40840 (removeStrictlySorted!134 l!644 key2!15)))))

(assert (=> d!137005 (= (insertStrictlySorted!441 (t!40840 (removeStrictlySorted!134 l!644 key2!15)) key1!25 v1!20) lt!562313)))

(declare-fun b!1243072 () Bool)

(assert (=> b!1243072 (= e!704720 call!61402)))

(declare-fun b!1243073 () Bool)

(assert (=> b!1243073 (= e!704722 e!704720)))

(assert (=> b!1243073 (= c!121781 (and ((_ is Cons!27370) (t!40840 (removeStrictlySorted!134 l!644 key2!15))) (= (_1!10156 (h!28579 (t!40840 (removeStrictlySorted!134 l!644 key2!15)))) key1!25)))))

(declare-fun b!1243074 () Bool)

(assert (=> b!1243074 (= e!704721 (contains!7398 lt!562313 (tuple2!20291 key1!25 v1!20)))))

(declare-fun bm!61398 () Bool)

(assert (=> bm!61398 (= call!61400 ($colon$colon!631 e!704724 (ite c!121782 (h!28579 (t!40840 (removeStrictlySorted!134 l!644 key2!15))) (tuple2!20291 key1!25 v1!20))))))

(declare-fun c!121783 () Bool)

(assert (=> bm!61398 (= c!121783 c!121782)))

(declare-fun bm!61399 () Bool)

(assert (=> bm!61399 (= call!61401 call!61402)))

(declare-fun b!1243075 () Bool)

(declare-fun res!828879 () Bool)

(assert (=> b!1243075 (=> (not res!828879) (not e!704721))))

(assert (=> b!1243075 (= res!828879 (containsKey!617 lt!562313 key1!25))))

(declare-fun b!1243076 () Bool)

(assert (=> b!1243076 (= e!704722 call!61400)))

(declare-fun b!1243077 () Bool)

(assert (=> b!1243077 (= e!704723 call!61401)))

(assert (= (and d!137005 c!121782) b!1243076))

(assert (= (and d!137005 (not c!121782)) b!1243073))

(assert (= (and b!1243073 c!121781) b!1243072))

(assert (= (and b!1243073 (not c!121781)) b!1243070))

(assert (= (and b!1243070 c!121780) b!1243068))

(assert (= (and b!1243070 (not c!121780)) b!1243077))

(assert (= (or b!1243068 b!1243077) bm!61399))

(assert (= (or b!1243072 bm!61399) bm!61397))

(assert (= (or b!1243076 bm!61397) bm!61398))

(assert (= (and bm!61398 c!121783) b!1243071))

(assert (= (and bm!61398 (not c!121783)) b!1243069))

(assert (= (and d!137005 res!828880) b!1243075))

(assert (= (and b!1243075 res!828879) b!1243074))

(declare-fun m!1145709 () Bool)

(assert (=> b!1243074 m!1145709))

(declare-fun m!1145711 () Bool)

(assert (=> d!137005 m!1145711))

(assert (=> d!137005 m!1145621))

(declare-fun m!1145713 () Bool)

(assert (=> b!1243075 m!1145713))

(declare-fun m!1145715 () Bool)

(assert (=> b!1243071 m!1145715))

(declare-fun m!1145717 () Bool)

(assert (=> bm!61398 m!1145717))

(assert (=> b!1242851 d!137005))

(declare-fun d!137011 () Bool)

(declare-fun res!828887 () Bool)

(declare-fun e!704731 () Bool)

(assert (=> d!137011 (=> res!828887 e!704731)))

(assert (=> d!137011 (= res!828887 (or ((_ is Nil!27371) lt!562293) ((_ is Nil!27371) (t!40840 lt!562293))))))

(assert (=> d!137011 (= (isStrictlySorted!767 lt!562293) e!704731)))

(declare-fun b!1243084 () Bool)

(declare-fun e!704732 () Bool)

(assert (=> b!1243084 (= e!704731 e!704732)))

(declare-fun res!828888 () Bool)

(assert (=> b!1243084 (=> (not res!828888) (not e!704732))))

(assert (=> b!1243084 (= res!828888 (bvslt (_1!10156 (h!28579 lt!562293)) (_1!10156 (h!28579 (t!40840 lt!562293)))))))

(declare-fun b!1243085 () Bool)

(assert (=> b!1243085 (= e!704732 (isStrictlySorted!767 (t!40840 lt!562293)))))

(assert (= (and d!137011 (not res!828887)) b!1243084))

(assert (= (and b!1243084 res!828888) b!1243085))

(declare-fun m!1145721 () Bool)

(assert (=> b!1243085 m!1145721))

(assert (=> d!136913 d!137011))

(assert (=> d!136913 d!136925))

(declare-fun d!137017 () Bool)

(assert (=> d!137017 (= ($colon$colon!631 (removeStrictlySorted!134 (t!40840 (insertStrictlySorted!441 l!644 key1!25 v1!20)) key2!15) (h!28579 (insertStrictlySorted!441 l!644 key1!25 v1!20))) (Cons!27370 (h!28579 (insertStrictlySorted!441 l!644 key1!25 v1!20)) (removeStrictlySorted!134 (t!40840 (insertStrictlySorted!441 l!644 key1!25 v1!20)) key2!15)))))

(assert (=> b!1242927 d!137017))

(declare-fun b!1243096 () Bool)

(declare-fun e!704740 () List!27374)

(assert (=> b!1243096 (= e!704740 (t!40840 (t!40840 (insertStrictlySorted!441 l!644 key1!25 v1!20))))))

(declare-fun b!1243097 () Bool)

(declare-fun e!704738 () List!27374)

(assert (=> b!1243097 (= e!704738 Nil!27371)))

(declare-fun b!1243098 () Bool)

(assert (=> b!1243098 (= e!704738 ($colon$colon!631 (removeStrictlySorted!134 (t!40840 (t!40840 (insertStrictlySorted!441 l!644 key1!25 v1!20))) key2!15) (h!28579 (t!40840 (insertStrictlySorted!441 l!644 key1!25 v1!20)))))))

(declare-fun b!1243099 () Bool)

(assert (=> b!1243099 (= e!704740 e!704738)))

(declare-fun c!121789 () Bool)

(assert (=> b!1243099 (= c!121789 (and ((_ is Cons!27370) (t!40840 (insertStrictlySorted!441 l!644 key1!25 v1!20))) (not (= (_1!10156 (h!28579 (t!40840 (insertStrictlySorted!441 l!644 key1!25 v1!20)))) key2!15))))))

(declare-fun b!1243100 () Bool)

(declare-fun e!704739 () Bool)

(declare-fun lt!562316 () List!27374)

(assert (=> b!1243100 (= e!704739 (not (containsKey!617 lt!562316 key2!15)))))

(declare-fun d!137019 () Bool)

(assert (=> d!137019 e!704739))

(declare-fun res!828891 () Bool)

(assert (=> d!137019 (=> (not res!828891) (not e!704739))))

(assert (=> d!137019 (= res!828891 (isStrictlySorted!767 lt!562316))))

(assert (=> d!137019 (= lt!562316 e!704740)))

(declare-fun c!121788 () Bool)

(assert (=> d!137019 (= c!121788 (and ((_ is Cons!27370) (t!40840 (insertStrictlySorted!441 l!644 key1!25 v1!20))) (= (_1!10156 (h!28579 (t!40840 (insertStrictlySorted!441 l!644 key1!25 v1!20)))) key2!15)))))

(assert (=> d!137019 (isStrictlySorted!767 (t!40840 (insertStrictlySorted!441 l!644 key1!25 v1!20)))))

(assert (=> d!137019 (= (removeStrictlySorted!134 (t!40840 (insertStrictlySorted!441 l!644 key1!25 v1!20)) key2!15) lt!562316)))

(assert (= (and d!137019 c!121788) b!1243096))

(assert (= (and d!137019 (not c!121788)) b!1243099))

(assert (= (and b!1243099 c!121789) b!1243098))

(assert (= (and b!1243099 (not c!121789)) b!1243097))

(assert (= (and d!137019 res!828891) b!1243100))

(declare-fun m!1145725 () Bool)

(assert (=> b!1243098 m!1145725))

(assert (=> b!1243098 m!1145725))

(declare-fun m!1145729 () Bool)

(assert (=> b!1243098 m!1145729))

(declare-fun m!1145733 () Bool)

(assert (=> b!1243100 m!1145733))

(declare-fun m!1145737 () Bool)

(assert (=> d!137019 m!1145737))

(declare-fun m!1145743 () Bool)

(assert (=> d!137019 m!1145743))

(assert (=> b!1242927 d!137019))

(declare-fun d!137023 () Bool)

(declare-fun res!828892 () Bool)

(declare-fun e!704741 () Bool)

(assert (=> d!137023 (=> res!828892 e!704741)))

(assert (=> d!137023 (= res!828892 (or ((_ is Nil!27371) lt!562294) ((_ is Nil!27371) (t!40840 lt!562294))))))

(assert (=> d!137023 (= (isStrictlySorted!767 lt!562294) e!704741)))

(declare-fun b!1243101 () Bool)

(declare-fun e!704742 () Bool)

(assert (=> b!1243101 (= e!704741 e!704742)))

(declare-fun res!828893 () Bool)

(assert (=> b!1243101 (=> (not res!828893) (not e!704742))))

(assert (=> b!1243101 (= res!828893 (bvslt (_1!10156 (h!28579 lt!562294)) (_1!10156 (h!28579 (t!40840 lt!562294)))))))

(declare-fun b!1243102 () Bool)

(assert (=> b!1243102 (= e!704742 (isStrictlySorted!767 (t!40840 lt!562294)))))

(assert (= (and d!137023 (not res!828892)) b!1243101))

(assert (= (and b!1243101 res!828893) b!1243102))

(declare-fun m!1145745 () Bool)

(assert (=> b!1243102 m!1145745))

(assert (=> d!136921 d!137023))

(declare-fun d!137025 () Bool)

(declare-fun res!828894 () Bool)

(declare-fun e!704743 () Bool)

(assert (=> d!137025 (=> res!828894 e!704743)))

(assert (=> d!137025 (= res!828894 (or ((_ is Nil!27371) (insertStrictlySorted!441 l!644 key1!25 v1!20)) ((_ is Nil!27371) (t!40840 (insertStrictlySorted!441 l!644 key1!25 v1!20)))))))

(assert (=> d!137025 (= (isStrictlySorted!767 (insertStrictlySorted!441 l!644 key1!25 v1!20)) e!704743)))

(declare-fun b!1243103 () Bool)

(declare-fun e!704744 () Bool)

(assert (=> b!1243103 (= e!704743 e!704744)))

(declare-fun res!828895 () Bool)

(assert (=> b!1243103 (=> (not res!828895) (not e!704744))))

(assert (=> b!1243103 (= res!828895 (bvslt (_1!10156 (h!28579 (insertStrictlySorted!441 l!644 key1!25 v1!20))) (_1!10156 (h!28579 (t!40840 (insertStrictlySorted!441 l!644 key1!25 v1!20))))))))

(declare-fun b!1243104 () Bool)

(assert (=> b!1243104 (= e!704744 (isStrictlySorted!767 (t!40840 (insertStrictlySorted!441 l!644 key1!25 v1!20))))))

(assert (= (and d!137025 (not res!828894)) b!1243103))

(assert (= (and b!1243103 res!828895) b!1243104))

(assert (=> b!1243104 m!1145743))

(assert (=> d!136921 d!137025))

(declare-fun b!1243105 () Bool)

(declare-fun e!704745 () Bool)

(declare-fun tp!92782 () Bool)

(assert (=> b!1243105 (= e!704745 (and tp_is_empty!31293 tp!92782))))

(assert (=> b!1242950 (= tp!92780 e!704745)))

(assert (= (and b!1242950 ((_ is Cons!27370) (t!40840 (t!40840 l!644)))) b!1243105))

(check-sat (not b!1242953) tp_is_empty!31293 (not b!1242996) (not b!1242961) (not bm!61398) (not d!137019) (not b!1242955) (not b!1243063) (not b!1242990) (not d!137005) (not b!1243075) (not b!1243054) (not b!1243102) (not b!1243024) (not d!136993) (not d!136929) (not b!1243038) (not b!1243104) (not b!1243098) (not b!1243020) (not b!1243074) (not b!1242992) (not b!1243042) (not b!1243041) (not b!1243085) (not b!1243071) (not d!136981) (not b!1243100) (not d!136961) (not b!1243067) (not b!1243058) (not b!1243105) (not bm!61395))
(check-sat)
