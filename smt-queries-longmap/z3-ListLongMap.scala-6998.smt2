; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!88814 () Bool)

(assert start!88814)

(declare-fun res!683497 () Bool)

(declare-fun e!573808 () Bool)

(assert (=> start!88814 (=> (not res!683497) (not e!573808))))

(declare-datatypes ((B!1694 0))(
  ( (B!1695 (val!11931 Int)) )
))
(declare-datatypes ((tuple2!15488 0))(
  ( (tuple2!15489 (_1!7755 (_ BitVec 64)) (_2!7755 B!1694)) )
))
(declare-datatypes ((List!21654 0))(
  ( (Nil!21651) (Cons!21650 (h!22848 tuple2!15488) (t!30652 List!21654)) )
))
(declare-fun l!996 () List!21654)

(declare-fun isStrictlySorted!680 (List!21654) Bool)

(assert (=> start!88814 (= res!683497 (isStrictlySorted!680 l!996))))

(assert (=> start!88814 e!573808))

(declare-fun e!573809 () Bool)

(assert (=> start!88814 e!573809))

(assert (=> start!88814 true))

(declare-fun tp_is_empty!23761 () Bool)

(assert (=> start!88814 tp_is_empty!23761))

(declare-fun b!1019581 () Bool)

(declare-fun res!683495 () Bool)

(assert (=> b!1019581 (=> (not res!683495) (not e!573808))))

(declare-fun key!261 () (_ BitVec 64))

(declare-fun containsKey!544 (List!21654 (_ BitVec 64)) Bool)

(assert (=> b!1019581 (= res!683495 (containsKey!544 l!996 key!261))))

(declare-fun b!1019582 () Bool)

(declare-fun e!573807 () Bool)

(assert (=> b!1019582 (= e!573808 e!573807)))

(declare-fun res!683496 () Bool)

(assert (=> b!1019582 (=> (not res!683496) (not e!573807))))

(declare-fun value!172 () B!1694)

(declare-fun lt!449530 () List!21654)

(get-info :version)

(assert (=> b!1019582 (= res!683496 (and (bvsge (_1!7755 (h!22848 l!996)) key!261) ((_ is Cons!21650) l!996) (= (_1!7755 (h!22848 l!996)) key!261) (= lt!449530 (Cons!21650 (tuple2!15489 key!261 value!172) (t!30652 l!996)))))))

(declare-fun insertStrictlySorted!363 (List!21654 (_ BitVec 64) B!1694) List!21654)

(assert (=> b!1019582 (= lt!449530 (insertStrictlySorted!363 l!996 key!261 value!172))))

(declare-fun b!1019583 () Bool)

(declare-fun length!47 (List!21654) Int)

(assert (=> b!1019583 (= e!573807 (not (= (length!47 lt!449530) (length!47 l!996))))))

(declare-fun b!1019584 () Bool)

(declare-fun tp!71170 () Bool)

(assert (=> b!1019584 (= e!573809 (and tp_is_empty!23761 tp!71170))))

(assert (= (and start!88814 res!683497) b!1019581))

(assert (= (and b!1019581 res!683495) b!1019582))

(assert (= (and b!1019582 res!683496) b!1019583))

(assert (= (and start!88814 ((_ is Cons!21650) l!996)) b!1019584))

(declare-fun m!939361 () Bool)

(assert (=> start!88814 m!939361))

(declare-fun m!939363 () Bool)

(assert (=> b!1019581 m!939363))

(declare-fun m!939365 () Bool)

(assert (=> b!1019582 m!939365))

(declare-fun m!939367 () Bool)

(assert (=> b!1019583 m!939367))

(declare-fun m!939369 () Bool)

(assert (=> b!1019583 m!939369))

(check-sat (not b!1019582) (not b!1019583) (not start!88814) (not b!1019581) (not b!1019584) tp_is_empty!23761)
(check-sat)
(get-model)

(declare-fun d!122055 () Bool)

(declare-fun res!683520 () Bool)

(declare-fun e!573832 () Bool)

(assert (=> d!122055 (=> res!683520 e!573832)))

(assert (=> d!122055 (= res!683520 (and ((_ is Cons!21650) l!996) (= (_1!7755 (h!22848 l!996)) key!261)))))

(assert (=> d!122055 (= (containsKey!544 l!996 key!261) e!573832)))

(declare-fun b!1019613 () Bool)

(declare-fun e!573833 () Bool)

(assert (=> b!1019613 (= e!573832 e!573833)))

(declare-fun res!683521 () Bool)

(assert (=> b!1019613 (=> (not res!683521) (not e!573833))))

(assert (=> b!1019613 (= res!683521 (and (or (not ((_ is Cons!21650) l!996)) (bvsle (_1!7755 (h!22848 l!996)) key!261)) ((_ is Cons!21650) l!996) (bvslt (_1!7755 (h!22848 l!996)) key!261)))))

(declare-fun b!1019614 () Bool)

(assert (=> b!1019614 (= e!573833 (containsKey!544 (t!30652 l!996) key!261))))

(assert (= (and d!122055 (not res!683520)) b!1019613))

(assert (= (and b!1019613 res!683521) b!1019614))

(declare-fun m!939391 () Bool)

(assert (=> b!1019614 m!939391))

(assert (=> b!1019581 d!122055))

(declare-fun b!1019661 () Bool)

(declare-fun e!573861 () List!21654)

(declare-fun call!43110 () List!21654)

(assert (=> b!1019661 (= e!573861 call!43110)))

(declare-fun e!573863 () Bool)

(declare-fun lt!449541 () List!21654)

(declare-fun b!1019662 () Bool)

(declare-fun contains!5886 (List!21654 tuple2!15488) Bool)

(assert (=> b!1019662 (= e!573863 (contains!5886 lt!449541 (tuple2!15489 key!261 value!172)))))

(declare-fun b!1019663 () Bool)

(declare-fun e!573862 () List!21654)

(declare-fun call!43111 () List!21654)

(assert (=> b!1019663 (= e!573862 call!43111)))

(declare-fun c!103379 () Bool)

(declare-fun c!103378 () Bool)

(declare-fun b!1019664 () Bool)

(declare-fun e!573860 () List!21654)

(assert (=> b!1019664 (= e!573860 (ite c!103378 (t!30652 l!996) (ite c!103379 (Cons!21650 (h!22848 l!996) (t!30652 l!996)) Nil!21651)))))

(declare-fun b!1019665 () Bool)

(assert (=> b!1019665 (= e!573860 (insertStrictlySorted!363 (t!30652 l!996) key!261 value!172))))

(declare-fun b!1019666 () Bool)

(declare-fun e!573864 () List!21654)

(declare-fun call!43109 () List!21654)

(assert (=> b!1019666 (= e!573864 call!43109)))

(declare-fun c!103377 () Bool)

(declare-fun bm!43107 () Bool)

(declare-fun $colon$colon!594 (List!21654 tuple2!15488) List!21654)

(assert (=> bm!43107 (= call!43109 ($colon$colon!594 e!573860 (ite c!103377 (h!22848 l!996) (tuple2!15489 key!261 value!172))))))

(declare-fun c!103380 () Bool)

(assert (=> bm!43107 (= c!103380 c!103377)))

(declare-fun b!1019667 () Bool)

(assert (=> b!1019667 (= e!573864 e!573861)))

(assert (=> b!1019667 (= c!103378 (and ((_ is Cons!21650) l!996) (= (_1!7755 (h!22848 l!996)) key!261)))))

(declare-fun d!122057 () Bool)

(assert (=> d!122057 e!573863))

(declare-fun res!683537 () Bool)

(assert (=> d!122057 (=> (not res!683537) (not e!573863))))

(assert (=> d!122057 (= res!683537 (isStrictlySorted!680 lt!449541))))

(assert (=> d!122057 (= lt!449541 e!573864)))

(assert (=> d!122057 (= c!103377 (and ((_ is Cons!21650) l!996) (bvslt (_1!7755 (h!22848 l!996)) key!261)))))

(assert (=> d!122057 (isStrictlySorted!680 l!996)))

(assert (=> d!122057 (= (insertStrictlySorted!363 l!996 key!261 value!172) lt!449541)))

(declare-fun bm!43106 () Bool)

(assert (=> bm!43106 (= call!43110 call!43109)))

(declare-fun bm!43108 () Bool)

(assert (=> bm!43108 (= call!43111 call!43110)))

(declare-fun b!1019668 () Bool)

(declare-fun res!683536 () Bool)

(assert (=> b!1019668 (=> (not res!683536) (not e!573863))))

(assert (=> b!1019668 (= res!683536 (containsKey!544 lt!449541 key!261))))

(declare-fun b!1019669 () Bool)

(assert (=> b!1019669 (= c!103379 (and ((_ is Cons!21650) l!996) (bvsgt (_1!7755 (h!22848 l!996)) key!261)))))

(assert (=> b!1019669 (= e!573861 e!573862)))

(declare-fun b!1019670 () Bool)

(assert (=> b!1019670 (= e!573862 call!43111)))

(assert (= (and d!122057 c!103377) b!1019666))

(assert (= (and d!122057 (not c!103377)) b!1019667))

(assert (= (and b!1019667 c!103378) b!1019661))

(assert (= (and b!1019667 (not c!103378)) b!1019669))

(assert (= (and b!1019669 c!103379) b!1019670))

(assert (= (and b!1019669 (not c!103379)) b!1019663))

(assert (= (or b!1019670 b!1019663) bm!43108))

(assert (= (or b!1019661 bm!43108) bm!43106))

(assert (= (or b!1019666 bm!43106) bm!43107))

(assert (= (and bm!43107 c!103380) b!1019665))

(assert (= (and bm!43107 (not c!103380)) b!1019664))

(assert (= (and d!122057 res!683537) b!1019668))

(assert (= (and b!1019668 res!683536) b!1019662))

(declare-fun m!939395 () Bool)

(assert (=> bm!43107 m!939395))

(declare-fun m!939397 () Bool)

(assert (=> d!122057 m!939397))

(assert (=> d!122057 m!939361))

(declare-fun m!939399 () Bool)

(assert (=> b!1019662 m!939399))

(declare-fun m!939401 () Bool)

(assert (=> b!1019665 m!939401))

(declare-fun m!939403 () Bool)

(assert (=> b!1019668 m!939403))

(assert (=> b!1019582 d!122057))

(declare-fun d!122065 () Bool)

(declare-fun res!683544 () Bool)

(declare-fun e!573874 () Bool)

(assert (=> d!122065 (=> res!683544 e!573874)))

(assert (=> d!122065 (= res!683544 (or ((_ is Nil!21651) l!996) ((_ is Nil!21651) (t!30652 l!996))))))

(assert (=> d!122065 (= (isStrictlySorted!680 l!996) e!573874)))

(declare-fun b!1019685 () Bool)

(declare-fun e!573875 () Bool)

(assert (=> b!1019685 (= e!573874 e!573875)))

(declare-fun res!683545 () Bool)

(assert (=> b!1019685 (=> (not res!683545) (not e!573875))))

(assert (=> b!1019685 (= res!683545 (bvslt (_1!7755 (h!22848 l!996)) (_1!7755 (h!22848 (t!30652 l!996)))))))

(declare-fun b!1019686 () Bool)

(assert (=> b!1019686 (= e!573875 (isStrictlySorted!680 (t!30652 l!996)))))

(assert (= (and d!122065 (not res!683544)) b!1019685))

(assert (= (and b!1019685 res!683545) b!1019686))

(declare-fun m!939415 () Bool)

(assert (=> b!1019686 m!939415))

(assert (=> start!88814 d!122065))

(declare-fun d!122069 () Bool)

(declare-fun size!31131 (List!21654) Int)

(assert (=> d!122069 (= (length!47 lt!449530) (size!31131 lt!449530))))

(declare-fun bs!29678 () Bool)

(assert (= bs!29678 d!122069))

(declare-fun m!939417 () Bool)

(assert (=> bs!29678 m!939417))

(assert (=> b!1019583 d!122069))

(declare-fun d!122071 () Bool)

(assert (=> d!122071 (= (length!47 l!996) (size!31131 l!996))))

(declare-fun bs!29679 () Bool)

(assert (= bs!29679 d!122071))

(declare-fun m!939419 () Bool)

(assert (=> bs!29679 m!939419))

(assert (=> b!1019583 d!122071))

(declare-fun b!1019703 () Bool)

(declare-fun e!573886 () Bool)

(declare-fun tp!71179 () Bool)

(assert (=> b!1019703 (= e!573886 (and tp_is_empty!23761 tp!71179))))

(assert (=> b!1019584 (= tp!71170 e!573886)))

(assert (= (and b!1019584 ((_ is Cons!21650) (t!30652 l!996))) b!1019703))

(check-sat (not b!1019614) (not b!1019668) (not b!1019686) (not d!122057) (not d!122071) (not b!1019665) (not b!1019662) tp_is_empty!23761 (not d!122069) (not bm!43107) (not b!1019703))
(check-sat)
(get-model)

(declare-fun d!122085 () Bool)

(declare-fun res!683570 () Bool)

(declare-fun e!573918 () Bool)

(assert (=> d!122085 (=> res!683570 e!573918)))

(assert (=> d!122085 (= res!683570 (or ((_ is Nil!21651) (t!30652 l!996)) ((_ is Nil!21651) (t!30652 (t!30652 l!996)))))))

(assert (=> d!122085 (= (isStrictlySorted!680 (t!30652 l!996)) e!573918)))

(declare-fun b!1019750 () Bool)

(declare-fun e!573919 () Bool)

(assert (=> b!1019750 (= e!573918 e!573919)))

(declare-fun res!683571 () Bool)

(assert (=> b!1019750 (=> (not res!683571) (not e!573919))))

(assert (=> b!1019750 (= res!683571 (bvslt (_1!7755 (h!22848 (t!30652 l!996))) (_1!7755 (h!22848 (t!30652 (t!30652 l!996))))))))

(declare-fun b!1019751 () Bool)

(assert (=> b!1019751 (= e!573919 (isStrictlySorted!680 (t!30652 (t!30652 l!996))))))

(assert (= (and d!122085 (not res!683570)) b!1019750))

(assert (= (and b!1019750 res!683571) b!1019751))

(declare-fun m!939445 () Bool)

(assert (=> b!1019751 m!939445))

(assert (=> b!1019686 d!122085))

(declare-fun lt!449548 () Bool)

(declare-fun d!122087 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!491 (List!21654) (InoxSet tuple2!15488))

(assert (=> d!122087 (= lt!449548 (select (content!491 lt!449541) (tuple2!15489 key!261 value!172)))))

(declare-fun e!573925 () Bool)

(assert (=> d!122087 (= lt!449548 e!573925)))

(declare-fun res!683577 () Bool)

(assert (=> d!122087 (=> (not res!683577) (not e!573925))))

(assert (=> d!122087 (= res!683577 ((_ is Cons!21650) lt!449541))))

(assert (=> d!122087 (= (contains!5886 lt!449541 (tuple2!15489 key!261 value!172)) lt!449548)))

(declare-fun b!1019756 () Bool)

(declare-fun e!573924 () Bool)

(assert (=> b!1019756 (= e!573925 e!573924)))

(declare-fun res!683576 () Bool)

(assert (=> b!1019756 (=> res!683576 e!573924)))

(assert (=> b!1019756 (= res!683576 (= (h!22848 lt!449541) (tuple2!15489 key!261 value!172)))))

(declare-fun b!1019757 () Bool)

(assert (=> b!1019757 (= e!573924 (contains!5886 (t!30652 lt!449541) (tuple2!15489 key!261 value!172)))))

(assert (= (and d!122087 res!683577) b!1019756))

(assert (= (and b!1019756 (not res!683576)) b!1019757))

(declare-fun m!939447 () Bool)

(assert (=> d!122087 m!939447))

(declare-fun m!939449 () Bool)

(assert (=> d!122087 m!939449))

(declare-fun m!939451 () Bool)

(assert (=> b!1019757 m!939451))

(assert (=> b!1019662 d!122087))

(declare-fun d!122089 () Bool)

(assert (=> d!122089 (= ($colon$colon!594 e!573860 (ite c!103377 (h!22848 l!996) (tuple2!15489 key!261 value!172))) (Cons!21650 (ite c!103377 (h!22848 l!996) (tuple2!15489 key!261 value!172)) e!573860))))

(assert (=> bm!43107 d!122089))

(declare-fun d!122091 () Bool)

(declare-fun res!683578 () Bool)

(declare-fun e!573926 () Bool)

(assert (=> d!122091 (=> res!683578 e!573926)))

(assert (=> d!122091 (= res!683578 (or ((_ is Nil!21651) lt!449541) ((_ is Nil!21651) (t!30652 lt!449541))))))

(assert (=> d!122091 (= (isStrictlySorted!680 lt!449541) e!573926)))

(declare-fun b!1019758 () Bool)

(declare-fun e!573927 () Bool)

(assert (=> b!1019758 (= e!573926 e!573927)))

(declare-fun res!683579 () Bool)

(assert (=> b!1019758 (=> (not res!683579) (not e!573927))))

(assert (=> b!1019758 (= res!683579 (bvslt (_1!7755 (h!22848 lt!449541)) (_1!7755 (h!22848 (t!30652 lt!449541)))))))

(declare-fun b!1019759 () Bool)

(assert (=> b!1019759 (= e!573927 (isStrictlySorted!680 (t!30652 lt!449541)))))

(assert (= (and d!122091 (not res!683578)) b!1019758))

(assert (= (and b!1019758 res!683579) b!1019759))

(declare-fun m!939453 () Bool)

(assert (=> b!1019759 m!939453))

(assert (=> d!122057 d!122091))

(assert (=> d!122057 d!122065))

(declare-fun d!122093 () Bool)

(declare-fun lt!449551 () Int)

(assert (=> d!122093 (>= lt!449551 0)))

(declare-fun e!573930 () Int)

(assert (=> d!122093 (= lt!449551 e!573930)))

(declare-fun c!103399 () Bool)

(assert (=> d!122093 (= c!103399 ((_ is Nil!21651) l!996))))

(assert (=> d!122093 (= (size!31131 l!996) lt!449551)))

(declare-fun b!1019764 () Bool)

(assert (=> b!1019764 (= e!573930 0)))

(declare-fun b!1019765 () Bool)

(assert (=> b!1019765 (= e!573930 (+ 1 (size!31131 (t!30652 l!996))))))

(assert (= (and d!122093 c!103399) b!1019764))

(assert (= (and d!122093 (not c!103399)) b!1019765))

(declare-fun m!939455 () Bool)

(assert (=> b!1019765 m!939455))

(assert (=> d!122071 d!122093))

(declare-fun b!1019766 () Bool)

(declare-fun e!573932 () List!21654)

(declare-fun call!43125 () List!21654)

(assert (=> b!1019766 (= e!573932 call!43125)))

(declare-fun lt!449552 () List!21654)

(declare-fun e!573934 () Bool)

(declare-fun b!1019767 () Bool)

(assert (=> b!1019767 (= e!573934 (contains!5886 lt!449552 (tuple2!15489 key!261 value!172)))))

(declare-fun b!1019768 () Bool)

(declare-fun e!573933 () List!21654)

(declare-fun call!43126 () List!21654)

(assert (=> b!1019768 (= e!573933 call!43126)))

(declare-fun e!573931 () List!21654)

(declare-fun c!103402 () Bool)

(declare-fun b!1019769 () Bool)

(declare-fun c!103401 () Bool)

(assert (=> b!1019769 (= e!573931 (ite c!103401 (t!30652 (t!30652 l!996)) (ite c!103402 (Cons!21650 (h!22848 (t!30652 l!996)) (t!30652 (t!30652 l!996))) Nil!21651)))))

(declare-fun b!1019770 () Bool)

(assert (=> b!1019770 (= e!573931 (insertStrictlySorted!363 (t!30652 (t!30652 l!996)) key!261 value!172))))

(declare-fun b!1019771 () Bool)

(declare-fun e!573935 () List!21654)

(declare-fun call!43124 () List!21654)

(assert (=> b!1019771 (= e!573935 call!43124)))

(declare-fun bm!43122 () Bool)

(declare-fun c!103400 () Bool)

(assert (=> bm!43122 (= call!43124 ($colon$colon!594 e!573931 (ite c!103400 (h!22848 (t!30652 l!996)) (tuple2!15489 key!261 value!172))))))

(declare-fun c!103403 () Bool)

(assert (=> bm!43122 (= c!103403 c!103400)))

(declare-fun b!1019772 () Bool)

(assert (=> b!1019772 (= e!573935 e!573932)))

(assert (=> b!1019772 (= c!103401 (and ((_ is Cons!21650) (t!30652 l!996)) (= (_1!7755 (h!22848 (t!30652 l!996))) key!261)))))

(declare-fun d!122095 () Bool)

(assert (=> d!122095 e!573934))

(declare-fun res!683581 () Bool)

(assert (=> d!122095 (=> (not res!683581) (not e!573934))))

(assert (=> d!122095 (= res!683581 (isStrictlySorted!680 lt!449552))))

(assert (=> d!122095 (= lt!449552 e!573935)))

(assert (=> d!122095 (= c!103400 (and ((_ is Cons!21650) (t!30652 l!996)) (bvslt (_1!7755 (h!22848 (t!30652 l!996))) key!261)))))

(assert (=> d!122095 (isStrictlySorted!680 (t!30652 l!996))))

(assert (=> d!122095 (= (insertStrictlySorted!363 (t!30652 l!996) key!261 value!172) lt!449552)))

(declare-fun bm!43121 () Bool)

(assert (=> bm!43121 (= call!43125 call!43124)))

(declare-fun bm!43123 () Bool)

(assert (=> bm!43123 (= call!43126 call!43125)))

(declare-fun b!1019773 () Bool)

(declare-fun res!683580 () Bool)

(assert (=> b!1019773 (=> (not res!683580) (not e!573934))))

(assert (=> b!1019773 (= res!683580 (containsKey!544 lt!449552 key!261))))

(declare-fun b!1019774 () Bool)

(assert (=> b!1019774 (= c!103402 (and ((_ is Cons!21650) (t!30652 l!996)) (bvsgt (_1!7755 (h!22848 (t!30652 l!996))) key!261)))))

(assert (=> b!1019774 (= e!573932 e!573933)))

(declare-fun b!1019775 () Bool)

(assert (=> b!1019775 (= e!573933 call!43126)))

(assert (= (and d!122095 c!103400) b!1019771))

(assert (= (and d!122095 (not c!103400)) b!1019772))

(assert (= (and b!1019772 c!103401) b!1019766))

(assert (= (and b!1019772 (not c!103401)) b!1019774))

(assert (= (and b!1019774 c!103402) b!1019775))

(assert (= (and b!1019774 (not c!103402)) b!1019768))

(assert (= (or b!1019775 b!1019768) bm!43123))

(assert (= (or b!1019766 bm!43123) bm!43121))

(assert (= (or b!1019771 bm!43121) bm!43122))

(assert (= (and bm!43122 c!103403) b!1019770))

(assert (= (and bm!43122 (not c!103403)) b!1019769))

(assert (= (and d!122095 res!683581) b!1019773))

(assert (= (and b!1019773 res!683580) b!1019767))

(declare-fun m!939457 () Bool)

(assert (=> bm!43122 m!939457))

(declare-fun m!939459 () Bool)

(assert (=> d!122095 m!939459))

(assert (=> d!122095 m!939415))

(declare-fun m!939461 () Bool)

(assert (=> b!1019767 m!939461))

(declare-fun m!939463 () Bool)

(assert (=> b!1019770 m!939463))

(declare-fun m!939465 () Bool)

(assert (=> b!1019773 m!939465))

(assert (=> b!1019665 d!122095))

(declare-fun d!122097 () Bool)

(declare-fun res!683582 () Bool)

(declare-fun e!573936 () Bool)

(assert (=> d!122097 (=> res!683582 e!573936)))

(assert (=> d!122097 (= res!683582 (and ((_ is Cons!21650) (t!30652 l!996)) (= (_1!7755 (h!22848 (t!30652 l!996))) key!261)))))

(assert (=> d!122097 (= (containsKey!544 (t!30652 l!996) key!261) e!573936)))

(declare-fun b!1019776 () Bool)

(declare-fun e!573937 () Bool)

(assert (=> b!1019776 (= e!573936 e!573937)))

(declare-fun res!683583 () Bool)

(assert (=> b!1019776 (=> (not res!683583) (not e!573937))))

(assert (=> b!1019776 (= res!683583 (and (or (not ((_ is Cons!21650) (t!30652 l!996))) (bvsle (_1!7755 (h!22848 (t!30652 l!996))) key!261)) ((_ is Cons!21650) (t!30652 l!996)) (bvslt (_1!7755 (h!22848 (t!30652 l!996))) key!261)))))

(declare-fun b!1019777 () Bool)

(assert (=> b!1019777 (= e!573937 (containsKey!544 (t!30652 (t!30652 l!996)) key!261))))

(assert (= (and d!122097 (not res!683582)) b!1019776))

(assert (= (and b!1019776 res!683583) b!1019777))

(declare-fun m!939467 () Bool)

(assert (=> b!1019777 m!939467))

(assert (=> b!1019614 d!122097))

(declare-fun d!122099 () Bool)

(declare-fun lt!449553 () Int)

(assert (=> d!122099 (>= lt!449553 0)))

(declare-fun e!573938 () Int)

(assert (=> d!122099 (= lt!449553 e!573938)))

(declare-fun c!103404 () Bool)

(assert (=> d!122099 (= c!103404 ((_ is Nil!21651) lt!449530))))

(assert (=> d!122099 (= (size!31131 lt!449530) lt!449553)))

(declare-fun b!1019778 () Bool)

(assert (=> b!1019778 (= e!573938 0)))

(declare-fun b!1019779 () Bool)

(assert (=> b!1019779 (= e!573938 (+ 1 (size!31131 (t!30652 lt!449530))))))

(assert (= (and d!122099 c!103404) b!1019778))

(assert (= (and d!122099 (not c!103404)) b!1019779))

(declare-fun m!939469 () Bool)

(assert (=> b!1019779 m!939469))

(assert (=> d!122069 d!122099))

(declare-fun d!122101 () Bool)

(declare-fun res!683584 () Bool)

(declare-fun e!573939 () Bool)

(assert (=> d!122101 (=> res!683584 e!573939)))

(assert (=> d!122101 (= res!683584 (and ((_ is Cons!21650) lt!449541) (= (_1!7755 (h!22848 lt!449541)) key!261)))))

(assert (=> d!122101 (= (containsKey!544 lt!449541 key!261) e!573939)))

(declare-fun b!1019780 () Bool)

(declare-fun e!573940 () Bool)

(assert (=> b!1019780 (= e!573939 e!573940)))

(declare-fun res!683585 () Bool)

(assert (=> b!1019780 (=> (not res!683585) (not e!573940))))

(assert (=> b!1019780 (= res!683585 (and (or (not ((_ is Cons!21650) lt!449541)) (bvsle (_1!7755 (h!22848 lt!449541)) key!261)) ((_ is Cons!21650) lt!449541) (bvslt (_1!7755 (h!22848 lt!449541)) key!261)))))

(declare-fun b!1019781 () Bool)

(assert (=> b!1019781 (= e!573940 (containsKey!544 (t!30652 lt!449541) key!261))))

(assert (= (and d!122101 (not res!683584)) b!1019780))

(assert (= (and b!1019780 res!683585) b!1019781))

(declare-fun m!939471 () Bool)

(assert (=> b!1019781 m!939471))

(assert (=> b!1019668 d!122101))

(declare-fun b!1019782 () Bool)

(declare-fun e!573941 () Bool)

(declare-fun tp!71186 () Bool)

(assert (=> b!1019782 (= e!573941 (and tp_is_empty!23761 tp!71186))))

(assert (=> b!1019703 (= tp!71179 e!573941)))

(assert (= (and b!1019703 ((_ is Cons!21650) (t!30652 (t!30652 l!996)))) b!1019782))

(check-sat (not b!1019770) (not bm!43122) (not b!1019782) (not b!1019777) (not d!122087) (not d!122095) (not b!1019757) (not b!1019773) tp_is_empty!23761 (not b!1019759) (not b!1019765) (not b!1019751) (not b!1019779) (not b!1019767) (not b!1019781))
(check-sat)
