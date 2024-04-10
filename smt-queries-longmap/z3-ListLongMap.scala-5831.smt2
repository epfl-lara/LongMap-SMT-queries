; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75252 () Bool)

(assert start!75252)

(declare-fun res!601873 () Bool)

(declare-fun e!493544 () Bool)

(assert (=> start!75252 (=> (not res!601873) (not e!493544))))

(declare-datatypes ((B!1306 0))(
  ( (B!1307 (val!8959 Int)) )
))
(declare-datatypes ((tuple2!11912 0))(
  ( (tuple2!11913 (_1!5967 (_ BitVec 64)) (_2!5967 B!1306)) )
))
(declare-datatypes ((List!17675 0))(
  ( (Nil!17672) (Cons!17671 (h!18802 tuple2!11912) (t!24955 List!17675)) )
))
(declare-fun l!906 () List!17675)

(declare-fun isStrictlySorted!493 (List!17675) Bool)

(assert (=> start!75252 (= res!601873 (isStrictlySorted!493 l!906))))

(assert (=> start!75252 e!493544))

(declare-fun e!493545 () Bool)

(assert (=> start!75252 e!493545))

(assert (=> start!75252 true))

(declare-fun tp_is_empty!17817 () Bool)

(assert (=> start!75252 tp_is_empty!17817))

(declare-fun b!886601 () Bool)

(declare-fun res!601872 () Bool)

(assert (=> b!886601 (=> (not res!601872) (not e!493544))))

(declare-fun key1!49 () (_ BitVec 64))

(get-info :version)

(assert (=> b!886601 (= res!601872 (or (not ((_ is Cons!17671) l!906)) (bvsge (_1!5967 (h!18802 l!906)) key1!49)))))

(declare-fun b!886602 () Bool)

(declare-fun v1!38 () B!1306)

(declare-fun v2!16 () B!1306)

(declare-fun insertStrictlySorted!301 (List!17675 (_ BitVec 64) B!1306) List!17675)

(assert (=> b!886602 (= e!493544 (not (= (insertStrictlySorted!301 (insertStrictlySorted!301 l!906 key1!49 v1!38) key1!49 v2!16) (insertStrictlySorted!301 l!906 key1!49 v2!16))))))

(declare-fun b!886603 () Bool)

(declare-fun tp!54389 () Bool)

(assert (=> b!886603 (= e!493545 (and tp_is_empty!17817 tp!54389))))

(assert (= (and start!75252 res!601873) b!886601))

(assert (= (and b!886601 res!601872) b!886602))

(assert (= (and start!75252 ((_ is Cons!17671) l!906)) b!886603))

(declare-fun m!826491 () Bool)

(assert (=> start!75252 m!826491))

(declare-fun m!826493 () Bool)

(assert (=> b!886602 m!826493))

(assert (=> b!886602 m!826493))

(declare-fun m!826495 () Bool)

(assert (=> b!886602 m!826495))

(declare-fun m!826497 () Bool)

(assert (=> b!886602 m!826497))

(check-sat (not start!75252) (not b!886602) (not b!886603) tp_is_empty!17817)
(check-sat)
(get-model)

(declare-fun d!109745 () Bool)

(declare-fun res!601884 () Bool)

(declare-fun e!493556 () Bool)

(assert (=> d!109745 (=> res!601884 e!493556)))

(assert (=> d!109745 (= res!601884 (or ((_ is Nil!17672) l!906) ((_ is Nil!17672) (t!24955 l!906))))))

(assert (=> d!109745 (= (isStrictlySorted!493 l!906) e!493556)))

(declare-fun b!886617 () Bool)

(declare-fun e!493557 () Bool)

(assert (=> b!886617 (= e!493556 e!493557)))

(declare-fun res!601885 () Bool)

(assert (=> b!886617 (=> (not res!601885) (not e!493557))))

(assert (=> b!886617 (= res!601885 (bvslt (_1!5967 (h!18802 l!906)) (_1!5967 (h!18802 (t!24955 l!906)))))))

(declare-fun b!886618 () Bool)

(assert (=> b!886618 (= e!493557 (isStrictlySorted!493 (t!24955 l!906)))))

(assert (= (and d!109745 (not res!601884)) b!886617))

(assert (= (and b!886617 res!601885) b!886618))

(declare-fun m!826507 () Bool)

(assert (=> b!886618 m!826507))

(assert (=> start!75252 d!109745))

(declare-fun c!93554 () Bool)

(declare-fun b!886705 () Bool)

(declare-fun e!493607 () List!17675)

(declare-fun c!93553 () Bool)

(assert (=> b!886705 (= e!493607 (ite c!93554 (t!24955 (insertStrictlySorted!301 l!906 key1!49 v1!38)) (ite c!93553 (Cons!17671 (h!18802 (insertStrictlySorted!301 l!906 key1!49 v1!38)) (t!24955 (insertStrictlySorted!301 l!906 key1!49 v1!38))) Nil!17672)))))

(declare-fun b!886706 () Bool)

(declare-fun e!493604 () List!17675)

(declare-fun call!39282 () List!17675)

(assert (=> b!886706 (= e!493604 call!39282)))

(declare-fun b!886707 () Bool)

(assert (=> b!886707 (= c!93553 (and ((_ is Cons!17671) (insertStrictlySorted!301 l!906 key1!49 v1!38)) (bvsgt (_1!5967 (h!18802 (insertStrictlySorted!301 l!906 key1!49 v1!38))) key1!49)))))

(declare-fun e!493605 () List!17675)

(declare-fun e!493606 () List!17675)

(assert (=> b!886707 (= e!493605 e!493606)))

(declare-fun b!886708 () Bool)

(declare-fun call!39281 () List!17675)

(assert (=> b!886708 (= e!493605 call!39281)))

(declare-fun bm!39278 () Bool)

(declare-fun call!39283 () List!17675)

(assert (=> bm!39278 (= call!39283 call!39281)))

(declare-fun b!886710 () Bool)

(assert (=> b!886710 (= e!493606 call!39283)))

(declare-fun bm!39279 () Bool)

(declare-fun c!93551 () Bool)

(declare-fun $colon$colon!549 (List!17675 tuple2!11912) List!17675)

(assert (=> bm!39279 (= call!39282 ($colon$colon!549 e!493607 (ite c!93551 (h!18802 (insertStrictlySorted!301 l!906 key1!49 v1!38)) (tuple2!11913 key1!49 v2!16))))))

(declare-fun c!93552 () Bool)

(assert (=> bm!39279 (= c!93552 c!93551)))

(declare-fun e!493608 () Bool)

(declare-fun lt!401152 () List!17675)

(declare-fun b!886711 () Bool)

(declare-fun contains!4298 (List!17675 tuple2!11912) Bool)

(assert (=> b!886711 (= e!493608 (contains!4298 lt!401152 (tuple2!11913 key1!49 v2!16)))))

(declare-fun b!886712 () Bool)

(declare-fun res!601908 () Bool)

(assert (=> b!886712 (=> (not res!601908) (not e!493608))))

(declare-fun containsKey!415 (List!17675 (_ BitVec 64)) Bool)

(assert (=> b!886712 (= res!601908 (containsKey!415 lt!401152 key1!49))))

(declare-fun bm!39280 () Bool)

(assert (=> bm!39280 (= call!39281 call!39282)))

(declare-fun b!886709 () Bool)

(assert (=> b!886709 (= e!493607 (insertStrictlySorted!301 (t!24955 (insertStrictlySorted!301 l!906 key1!49 v1!38)) key1!49 v2!16))))

(declare-fun d!109751 () Bool)

(assert (=> d!109751 e!493608))

(declare-fun res!601909 () Bool)

(assert (=> d!109751 (=> (not res!601909) (not e!493608))))

(assert (=> d!109751 (= res!601909 (isStrictlySorted!493 lt!401152))))

(assert (=> d!109751 (= lt!401152 e!493604)))

(assert (=> d!109751 (= c!93551 (and ((_ is Cons!17671) (insertStrictlySorted!301 l!906 key1!49 v1!38)) (bvslt (_1!5967 (h!18802 (insertStrictlySorted!301 l!906 key1!49 v1!38))) key1!49)))))

(assert (=> d!109751 (isStrictlySorted!493 (insertStrictlySorted!301 l!906 key1!49 v1!38))))

(assert (=> d!109751 (= (insertStrictlySorted!301 (insertStrictlySorted!301 l!906 key1!49 v1!38) key1!49 v2!16) lt!401152)))

(declare-fun b!886713 () Bool)

(assert (=> b!886713 (= e!493604 e!493605)))

(assert (=> b!886713 (= c!93554 (and ((_ is Cons!17671) (insertStrictlySorted!301 l!906 key1!49 v1!38)) (= (_1!5967 (h!18802 (insertStrictlySorted!301 l!906 key1!49 v1!38))) key1!49)))))

(declare-fun b!886714 () Bool)

(assert (=> b!886714 (= e!493606 call!39283)))

(assert (= (and d!109751 c!93551) b!886706))

(assert (= (and d!109751 (not c!93551)) b!886713))

(assert (= (and b!886713 c!93554) b!886708))

(assert (= (and b!886713 (not c!93554)) b!886707))

(assert (= (and b!886707 c!93553) b!886714))

(assert (= (and b!886707 (not c!93553)) b!886710))

(assert (= (or b!886714 b!886710) bm!39278))

(assert (= (or b!886708 bm!39278) bm!39280))

(assert (= (or b!886706 bm!39280) bm!39279))

(assert (= (and bm!39279 c!93552) b!886709))

(assert (= (and bm!39279 (not c!93552)) b!886705))

(assert (= (and d!109751 res!601909) b!886712))

(assert (= (and b!886712 res!601908) b!886711))

(declare-fun m!826533 () Bool)

(assert (=> b!886711 m!826533))

(declare-fun m!826535 () Bool)

(assert (=> d!109751 m!826535))

(assert (=> d!109751 m!826493))

(declare-fun m!826537 () Bool)

(assert (=> d!109751 m!826537))

(declare-fun m!826539 () Bool)

(assert (=> b!886709 m!826539))

(declare-fun m!826541 () Bool)

(assert (=> b!886712 m!826541))

(declare-fun m!826543 () Bool)

(assert (=> bm!39279 m!826543))

(assert (=> b!886602 d!109751))

(declare-fun b!886735 () Bool)

(declare-fun c!93566 () Bool)

(declare-fun e!493622 () List!17675)

(declare-fun c!93565 () Bool)

(assert (=> b!886735 (= e!493622 (ite c!93566 (t!24955 l!906) (ite c!93565 (Cons!17671 (h!18802 l!906) (t!24955 l!906)) Nil!17672)))))

(declare-fun b!886736 () Bool)

(declare-fun e!493619 () List!17675)

(declare-fun call!39291 () List!17675)

(assert (=> b!886736 (= e!493619 call!39291)))

(declare-fun b!886737 () Bool)

(assert (=> b!886737 (= c!93565 (and ((_ is Cons!17671) l!906) (bvsgt (_1!5967 (h!18802 l!906)) key1!49)))))

(declare-fun e!493620 () List!17675)

(declare-fun e!493621 () List!17675)

(assert (=> b!886737 (= e!493620 e!493621)))

(declare-fun b!886738 () Bool)

(declare-fun call!39290 () List!17675)

(assert (=> b!886738 (= e!493620 call!39290)))

(declare-fun bm!39287 () Bool)

(declare-fun call!39292 () List!17675)

(assert (=> bm!39287 (= call!39292 call!39290)))

(declare-fun b!886740 () Bool)

(assert (=> b!886740 (= e!493621 call!39292)))

(declare-fun bm!39288 () Bool)

(declare-fun c!93563 () Bool)

(assert (=> bm!39288 (= call!39291 ($colon$colon!549 e!493622 (ite c!93563 (h!18802 l!906) (tuple2!11913 key1!49 v1!38))))))

(declare-fun c!93564 () Bool)

(assert (=> bm!39288 (= c!93564 c!93563)))

(declare-fun e!493623 () Bool)

(declare-fun b!886741 () Bool)

(declare-fun lt!401155 () List!17675)

(assert (=> b!886741 (= e!493623 (contains!4298 lt!401155 (tuple2!11913 key1!49 v1!38)))))

(declare-fun b!886742 () Bool)

(declare-fun res!601914 () Bool)

(assert (=> b!886742 (=> (not res!601914) (not e!493623))))

(assert (=> b!886742 (= res!601914 (containsKey!415 lt!401155 key1!49))))

(declare-fun bm!39289 () Bool)

(assert (=> bm!39289 (= call!39290 call!39291)))

(declare-fun b!886739 () Bool)

(assert (=> b!886739 (= e!493622 (insertStrictlySorted!301 (t!24955 l!906) key1!49 v1!38))))

(declare-fun d!109759 () Bool)

(assert (=> d!109759 e!493623))

(declare-fun res!601915 () Bool)

(assert (=> d!109759 (=> (not res!601915) (not e!493623))))

(assert (=> d!109759 (= res!601915 (isStrictlySorted!493 lt!401155))))

(assert (=> d!109759 (= lt!401155 e!493619)))

(assert (=> d!109759 (= c!93563 (and ((_ is Cons!17671) l!906) (bvslt (_1!5967 (h!18802 l!906)) key1!49)))))

(assert (=> d!109759 (isStrictlySorted!493 l!906)))

(assert (=> d!109759 (= (insertStrictlySorted!301 l!906 key1!49 v1!38) lt!401155)))

(declare-fun b!886743 () Bool)

(assert (=> b!886743 (= e!493619 e!493620)))

(assert (=> b!886743 (= c!93566 (and ((_ is Cons!17671) l!906) (= (_1!5967 (h!18802 l!906)) key1!49)))))

(declare-fun b!886744 () Bool)

(assert (=> b!886744 (= e!493621 call!39292)))

(assert (= (and d!109759 c!93563) b!886736))

(assert (= (and d!109759 (not c!93563)) b!886743))

(assert (= (and b!886743 c!93566) b!886738))

(assert (= (and b!886743 (not c!93566)) b!886737))

(assert (= (and b!886737 c!93565) b!886744))

(assert (= (and b!886737 (not c!93565)) b!886740))

(assert (= (or b!886744 b!886740) bm!39287))

(assert (= (or b!886738 bm!39287) bm!39289))

(assert (= (or b!886736 bm!39289) bm!39288))

(assert (= (and bm!39288 c!93564) b!886739))

(assert (= (and bm!39288 (not c!93564)) b!886735))

(assert (= (and d!109759 res!601915) b!886742))

(assert (= (and b!886742 res!601914) b!886741))

(declare-fun m!826557 () Bool)

(assert (=> b!886741 m!826557))

(declare-fun m!826561 () Bool)

(assert (=> d!109759 m!826561))

(assert (=> d!109759 m!826491))

(declare-fun m!826565 () Bool)

(assert (=> b!886739 m!826565))

(declare-fun m!826567 () Bool)

(assert (=> b!886742 m!826567))

(declare-fun m!826573 () Bool)

(assert (=> bm!39288 m!826573))

(assert (=> b!886602 d!109759))

(declare-fun c!93571 () Bool)

(declare-fun b!886745 () Bool)

(declare-fun c!93569 () Bool)

(declare-fun e!493628 () List!17675)

(assert (=> b!886745 (= e!493628 (ite c!93571 (t!24955 l!906) (ite c!93569 (Cons!17671 (h!18802 l!906) (t!24955 l!906)) Nil!17672)))))

(declare-fun b!886746 () Bool)

(declare-fun e!493624 () List!17675)

(declare-fun call!39294 () List!17675)

(assert (=> b!886746 (= e!493624 call!39294)))

(declare-fun b!886747 () Bool)

(assert (=> b!886747 (= c!93569 (and ((_ is Cons!17671) l!906) (bvsgt (_1!5967 (h!18802 l!906)) key1!49)))))

(declare-fun e!493625 () List!17675)

(declare-fun e!493626 () List!17675)

(assert (=> b!886747 (= e!493625 e!493626)))

(declare-fun b!886748 () Bool)

(declare-fun call!39293 () List!17675)

(assert (=> b!886748 (= e!493625 call!39293)))

(declare-fun bm!39290 () Bool)

(declare-fun call!39295 () List!17675)

(assert (=> bm!39290 (= call!39295 call!39293)))

(declare-fun b!886750 () Bool)

(assert (=> b!886750 (= e!493626 call!39295)))

(declare-fun c!93567 () Bool)

(declare-fun bm!39291 () Bool)

(assert (=> bm!39291 (= call!39294 ($colon$colon!549 e!493628 (ite c!93567 (h!18802 l!906) (tuple2!11913 key1!49 v2!16))))))

(declare-fun c!93568 () Bool)

(assert (=> bm!39291 (= c!93568 c!93567)))

(declare-fun lt!401156 () List!17675)

(declare-fun e!493629 () Bool)

(declare-fun b!886751 () Bool)

(assert (=> b!886751 (= e!493629 (contains!4298 lt!401156 (tuple2!11913 key1!49 v2!16)))))

(declare-fun b!886752 () Bool)

(declare-fun res!601916 () Bool)

(assert (=> b!886752 (=> (not res!601916) (not e!493629))))

(assert (=> b!886752 (= res!601916 (containsKey!415 lt!401156 key1!49))))

(declare-fun bm!39292 () Bool)

(assert (=> bm!39292 (= call!39293 call!39294)))

(declare-fun b!886749 () Bool)

(assert (=> b!886749 (= e!493628 (insertStrictlySorted!301 (t!24955 l!906) key1!49 v2!16))))

(declare-fun d!109763 () Bool)

(assert (=> d!109763 e!493629))

(declare-fun res!601918 () Bool)

(assert (=> d!109763 (=> (not res!601918) (not e!493629))))

(assert (=> d!109763 (= res!601918 (isStrictlySorted!493 lt!401156))))

(assert (=> d!109763 (= lt!401156 e!493624)))

(assert (=> d!109763 (= c!93567 (and ((_ is Cons!17671) l!906) (bvslt (_1!5967 (h!18802 l!906)) key1!49)))))

(assert (=> d!109763 (isStrictlySorted!493 l!906)))

(assert (=> d!109763 (= (insertStrictlySorted!301 l!906 key1!49 v2!16) lt!401156)))

(declare-fun b!886753 () Bool)

(assert (=> b!886753 (= e!493624 e!493625)))

(assert (=> b!886753 (= c!93571 (and ((_ is Cons!17671) l!906) (= (_1!5967 (h!18802 l!906)) key1!49)))))

(declare-fun b!886754 () Bool)

(assert (=> b!886754 (= e!493626 call!39295)))

(assert (= (and d!109763 c!93567) b!886746))

(assert (= (and d!109763 (not c!93567)) b!886753))

(assert (= (and b!886753 c!93571) b!886748))

(assert (= (and b!886753 (not c!93571)) b!886747))

(assert (= (and b!886747 c!93569) b!886754))

(assert (= (and b!886747 (not c!93569)) b!886750))

(assert (= (or b!886754 b!886750) bm!39290))

(assert (= (or b!886748 bm!39290) bm!39292))

(assert (= (or b!886746 bm!39292) bm!39291))

(assert (= (and bm!39291 c!93568) b!886749))

(assert (= (and bm!39291 (not c!93568)) b!886745))

(assert (= (and d!109763 res!601918) b!886752))

(assert (= (and b!886752 res!601916) b!886751))

(declare-fun m!826577 () Bool)

(assert (=> b!886751 m!826577))

(declare-fun m!826581 () Bool)

(assert (=> d!109763 m!826581))

(assert (=> d!109763 m!826491))

(declare-fun m!826585 () Bool)

(assert (=> b!886749 m!826585))

(declare-fun m!826589 () Bool)

(assert (=> b!886752 m!826589))

(declare-fun m!826593 () Bool)

(assert (=> bm!39291 m!826593))

(assert (=> b!886602 d!109763))

(declare-fun b!886783 () Bool)

(declare-fun e!493645 () Bool)

(declare-fun tp!54395 () Bool)

(assert (=> b!886783 (= e!493645 (and tp_is_empty!17817 tp!54395))))

(assert (=> b!886603 (= tp!54389 e!493645)))

(assert (= (and b!886603 ((_ is Cons!17671) (t!24955 l!906))) b!886783))

(check-sat (not d!109763) (not b!886783) (not b!886739) tp_is_empty!17817 (not bm!39291) (not b!886712) (not b!886709) (not b!886741) (not bm!39279) (not b!886618) (not b!886749) (not d!109759) (not b!886742) (not b!886711) (not bm!39288) (not d!109751) (not b!886751) (not b!886752))
(check-sat)
(get-model)

(declare-fun d!109769 () Bool)

(assert (=> d!109769 (= ($colon$colon!549 e!493628 (ite c!93567 (h!18802 l!906) (tuple2!11913 key1!49 v2!16))) (Cons!17671 (ite c!93567 (h!18802 l!906) (tuple2!11913 key1!49 v2!16)) e!493628))))

(assert (=> bm!39291 d!109769))

(declare-fun c!93581 () Bool)

(declare-fun b!886796 () Bool)

(declare-fun e!493657 () List!17675)

(declare-fun c!93582 () Bool)

(assert (=> b!886796 (= e!493657 (ite c!93582 (t!24955 (t!24955 (insertStrictlySorted!301 l!906 key1!49 v1!38))) (ite c!93581 (Cons!17671 (h!18802 (t!24955 (insertStrictlySorted!301 l!906 key1!49 v1!38))) (t!24955 (t!24955 (insertStrictlySorted!301 l!906 key1!49 v1!38)))) Nil!17672)))))

(declare-fun b!886797 () Bool)

(declare-fun e!493654 () List!17675)

(declare-fun call!39303 () List!17675)

(assert (=> b!886797 (= e!493654 call!39303)))

(declare-fun b!886798 () Bool)

(assert (=> b!886798 (= c!93581 (and ((_ is Cons!17671) (t!24955 (insertStrictlySorted!301 l!906 key1!49 v1!38))) (bvsgt (_1!5967 (h!18802 (t!24955 (insertStrictlySorted!301 l!906 key1!49 v1!38)))) key1!49)))))

(declare-fun e!493655 () List!17675)

(declare-fun e!493656 () List!17675)

(assert (=> b!886798 (= e!493655 e!493656)))

(declare-fun b!886799 () Bool)

(declare-fun call!39302 () List!17675)

(assert (=> b!886799 (= e!493655 call!39302)))

(declare-fun bm!39299 () Bool)

(declare-fun call!39304 () List!17675)

(assert (=> bm!39299 (= call!39304 call!39302)))

(declare-fun b!886801 () Bool)

(assert (=> b!886801 (= e!493656 call!39304)))

(declare-fun bm!39300 () Bool)

(declare-fun c!93579 () Bool)

(assert (=> bm!39300 (= call!39303 ($colon$colon!549 e!493657 (ite c!93579 (h!18802 (t!24955 (insertStrictlySorted!301 l!906 key1!49 v1!38))) (tuple2!11913 key1!49 v2!16))))))

(declare-fun c!93580 () Bool)

(assert (=> bm!39300 (= c!93580 c!93579)))

(declare-fun e!493658 () Bool)

(declare-fun lt!401159 () List!17675)

(declare-fun b!886802 () Bool)

(assert (=> b!886802 (= e!493658 (contains!4298 lt!401159 (tuple2!11913 key1!49 v2!16)))))

(declare-fun b!886803 () Bool)

(declare-fun res!601928 () Bool)

(assert (=> b!886803 (=> (not res!601928) (not e!493658))))

(assert (=> b!886803 (= res!601928 (containsKey!415 lt!401159 key1!49))))

(declare-fun bm!39301 () Bool)

(assert (=> bm!39301 (= call!39302 call!39303)))

(declare-fun b!886800 () Bool)

(assert (=> b!886800 (= e!493657 (insertStrictlySorted!301 (t!24955 (t!24955 (insertStrictlySorted!301 l!906 key1!49 v1!38))) key1!49 v2!16))))

(declare-fun d!109771 () Bool)

(assert (=> d!109771 e!493658))

(declare-fun res!601929 () Bool)

(assert (=> d!109771 (=> (not res!601929) (not e!493658))))

(assert (=> d!109771 (= res!601929 (isStrictlySorted!493 lt!401159))))

(assert (=> d!109771 (= lt!401159 e!493654)))

(assert (=> d!109771 (= c!93579 (and ((_ is Cons!17671) (t!24955 (insertStrictlySorted!301 l!906 key1!49 v1!38))) (bvslt (_1!5967 (h!18802 (t!24955 (insertStrictlySorted!301 l!906 key1!49 v1!38)))) key1!49)))))

(assert (=> d!109771 (isStrictlySorted!493 (t!24955 (insertStrictlySorted!301 l!906 key1!49 v1!38)))))

(assert (=> d!109771 (= (insertStrictlySorted!301 (t!24955 (insertStrictlySorted!301 l!906 key1!49 v1!38)) key1!49 v2!16) lt!401159)))

(declare-fun b!886804 () Bool)

(assert (=> b!886804 (= e!493654 e!493655)))

(assert (=> b!886804 (= c!93582 (and ((_ is Cons!17671) (t!24955 (insertStrictlySorted!301 l!906 key1!49 v1!38))) (= (_1!5967 (h!18802 (t!24955 (insertStrictlySorted!301 l!906 key1!49 v1!38)))) key1!49)))))

(declare-fun b!886805 () Bool)

(assert (=> b!886805 (= e!493656 call!39304)))

(assert (= (and d!109771 c!93579) b!886797))

(assert (= (and d!109771 (not c!93579)) b!886804))

(assert (= (and b!886804 c!93582) b!886799))

(assert (= (and b!886804 (not c!93582)) b!886798))

(assert (= (and b!886798 c!93581) b!886805))

(assert (= (and b!886798 (not c!93581)) b!886801))

(assert (= (or b!886805 b!886801) bm!39299))

(assert (= (or b!886799 bm!39299) bm!39301))

(assert (= (or b!886797 bm!39301) bm!39300))

(assert (= (and bm!39300 c!93580) b!886800))

(assert (= (and bm!39300 (not c!93580)) b!886796))

(assert (= (and d!109771 res!601929) b!886803))

(assert (= (and b!886803 res!601928) b!886802))

(declare-fun m!826609 () Bool)

(assert (=> b!886802 m!826609))

(declare-fun m!826611 () Bool)

(assert (=> d!109771 m!826611))

(declare-fun m!826613 () Bool)

(assert (=> d!109771 m!826613))

(declare-fun m!826615 () Bool)

(assert (=> b!886800 m!826615))

(declare-fun m!826617 () Bool)

(assert (=> b!886803 m!826617))

(declare-fun m!826619 () Bool)

(assert (=> bm!39300 m!826619))

(assert (=> b!886709 d!109771))

(declare-fun d!109773 () Bool)

(declare-fun res!601930 () Bool)

(declare-fun e!493659 () Bool)

(assert (=> d!109773 (=> res!601930 e!493659)))

(assert (=> d!109773 (= res!601930 (or ((_ is Nil!17672) (t!24955 l!906)) ((_ is Nil!17672) (t!24955 (t!24955 l!906)))))))

(assert (=> d!109773 (= (isStrictlySorted!493 (t!24955 l!906)) e!493659)))

(declare-fun b!886806 () Bool)

(declare-fun e!493660 () Bool)

(assert (=> b!886806 (= e!493659 e!493660)))

(declare-fun res!601931 () Bool)

(assert (=> b!886806 (=> (not res!601931) (not e!493660))))

(assert (=> b!886806 (= res!601931 (bvslt (_1!5967 (h!18802 (t!24955 l!906))) (_1!5967 (h!18802 (t!24955 (t!24955 l!906))))))))

(declare-fun b!886807 () Bool)

(assert (=> b!886807 (= e!493660 (isStrictlySorted!493 (t!24955 (t!24955 l!906))))))

(assert (= (and d!109773 (not res!601930)) b!886806))

(assert (= (and b!886806 res!601931) b!886807))

(declare-fun m!826621 () Bool)

(assert (=> b!886807 m!826621))

(assert (=> b!886618 d!109773))

(declare-fun d!109775 () Bool)

(declare-fun res!601936 () Bool)

(declare-fun e!493665 () Bool)

(assert (=> d!109775 (=> res!601936 e!493665)))

(assert (=> d!109775 (= res!601936 (and ((_ is Cons!17671) lt!401155) (= (_1!5967 (h!18802 lt!401155)) key1!49)))))

(assert (=> d!109775 (= (containsKey!415 lt!401155 key1!49) e!493665)))

(declare-fun b!886812 () Bool)

(declare-fun e!493666 () Bool)

(assert (=> b!886812 (= e!493665 e!493666)))

(declare-fun res!601937 () Bool)

(assert (=> b!886812 (=> (not res!601937) (not e!493666))))

(assert (=> b!886812 (= res!601937 (and (or (not ((_ is Cons!17671) lt!401155)) (bvsle (_1!5967 (h!18802 lt!401155)) key1!49)) ((_ is Cons!17671) lt!401155) (bvslt (_1!5967 (h!18802 lt!401155)) key1!49)))))

(declare-fun b!886813 () Bool)

(assert (=> b!886813 (= e!493666 (containsKey!415 (t!24955 lt!401155) key1!49))))

(assert (= (and d!109775 (not res!601936)) b!886812))

(assert (= (and b!886812 res!601937) b!886813))

(declare-fun m!826623 () Bool)

(assert (=> b!886813 m!826623))

(assert (=> b!886742 d!109775))

(declare-fun d!109777 () Bool)

(declare-fun lt!401162 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!398 (List!17675) (InoxSet tuple2!11912))

(assert (=> d!109777 (= lt!401162 (select (content!398 lt!401155) (tuple2!11913 key1!49 v1!38)))))

(declare-fun e!493672 () Bool)

(assert (=> d!109777 (= lt!401162 e!493672)))

(declare-fun res!601942 () Bool)

(assert (=> d!109777 (=> (not res!601942) (not e!493672))))

(assert (=> d!109777 (= res!601942 ((_ is Cons!17671) lt!401155))))

(assert (=> d!109777 (= (contains!4298 lt!401155 (tuple2!11913 key1!49 v1!38)) lt!401162)))

(declare-fun b!886818 () Bool)

(declare-fun e!493671 () Bool)

(assert (=> b!886818 (= e!493672 e!493671)))

(declare-fun res!601943 () Bool)

(assert (=> b!886818 (=> res!601943 e!493671)))

(assert (=> b!886818 (= res!601943 (= (h!18802 lt!401155) (tuple2!11913 key1!49 v1!38)))))

(declare-fun b!886819 () Bool)

(assert (=> b!886819 (= e!493671 (contains!4298 (t!24955 lt!401155) (tuple2!11913 key1!49 v1!38)))))

(assert (= (and d!109777 res!601942) b!886818))

(assert (= (and b!886818 (not res!601943)) b!886819))

(declare-fun m!826625 () Bool)

(assert (=> d!109777 m!826625))

(declare-fun m!826627 () Bool)

(assert (=> d!109777 m!826627))

(declare-fun m!826629 () Bool)

(assert (=> b!886819 m!826629))

(assert (=> b!886741 d!109777))

(declare-fun d!109779 () Bool)

(assert (=> d!109779 (= ($colon$colon!549 e!493622 (ite c!93563 (h!18802 l!906) (tuple2!11913 key1!49 v1!38))) (Cons!17671 (ite c!93563 (h!18802 l!906) (tuple2!11913 key1!49 v1!38)) e!493622))))

(assert (=> bm!39288 d!109779))

(declare-fun b!886820 () Bool)

(declare-fun e!493676 () List!17675)

(declare-fun c!93585 () Bool)

(declare-fun c!93586 () Bool)

(assert (=> b!886820 (= e!493676 (ite c!93586 (t!24955 (t!24955 l!906)) (ite c!93585 (Cons!17671 (h!18802 (t!24955 l!906)) (t!24955 (t!24955 l!906))) Nil!17672)))))

(declare-fun b!886821 () Bool)

(declare-fun e!493673 () List!17675)

(declare-fun call!39306 () List!17675)

(assert (=> b!886821 (= e!493673 call!39306)))

(declare-fun b!886822 () Bool)

(assert (=> b!886822 (= c!93585 (and ((_ is Cons!17671) (t!24955 l!906)) (bvsgt (_1!5967 (h!18802 (t!24955 l!906))) key1!49)))))

(declare-fun e!493674 () List!17675)

(declare-fun e!493675 () List!17675)

(assert (=> b!886822 (= e!493674 e!493675)))

(declare-fun b!886823 () Bool)

(declare-fun call!39305 () List!17675)

(assert (=> b!886823 (= e!493674 call!39305)))

(declare-fun bm!39302 () Bool)

(declare-fun call!39307 () List!17675)

(assert (=> bm!39302 (= call!39307 call!39305)))

(declare-fun b!886825 () Bool)

(assert (=> b!886825 (= e!493675 call!39307)))

(declare-fun c!93583 () Bool)

(declare-fun bm!39303 () Bool)

(assert (=> bm!39303 (= call!39306 ($colon$colon!549 e!493676 (ite c!93583 (h!18802 (t!24955 l!906)) (tuple2!11913 key1!49 v2!16))))))

(declare-fun c!93584 () Bool)

(assert (=> bm!39303 (= c!93584 c!93583)))

(declare-fun e!493677 () Bool)

(declare-fun b!886826 () Bool)

(declare-fun lt!401163 () List!17675)

(assert (=> b!886826 (= e!493677 (contains!4298 lt!401163 (tuple2!11913 key1!49 v2!16)))))

(declare-fun b!886827 () Bool)

(declare-fun res!601944 () Bool)

(assert (=> b!886827 (=> (not res!601944) (not e!493677))))

(assert (=> b!886827 (= res!601944 (containsKey!415 lt!401163 key1!49))))

(declare-fun bm!39304 () Bool)

(assert (=> bm!39304 (= call!39305 call!39306)))

(declare-fun b!886824 () Bool)

(assert (=> b!886824 (= e!493676 (insertStrictlySorted!301 (t!24955 (t!24955 l!906)) key1!49 v2!16))))

(declare-fun d!109781 () Bool)

(assert (=> d!109781 e!493677))

(declare-fun res!601945 () Bool)

(assert (=> d!109781 (=> (not res!601945) (not e!493677))))

(assert (=> d!109781 (= res!601945 (isStrictlySorted!493 lt!401163))))

(assert (=> d!109781 (= lt!401163 e!493673)))

(assert (=> d!109781 (= c!93583 (and ((_ is Cons!17671) (t!24955 l!906)) (bvslt (_1!5967 (h!18802 (t!24955 l!906))) key1!49)))))

(assert (=> d!109781 (isStrictlySorted!493 (t!24955 l!906))))

(assert (=> d!109781 (= (insertStrictlySorted!301 (t!24955 l!906) key1!49 v2!16) lt!401163)))

(declare-fun b!886828 () Bool)

(assert (=> b!886828 (= e!493673 e!493674)))

(assert (=> b!886828 (= c!93586 (and ((_ is Cons!17671) (t!24955 l!906)) (= (_1!5967 (h!18802 (t!24955 l!906))) key1!49)))))

(declare-fun b!886829 () Bool)

(assert (=> b!886829 (= e!493675 call!39307)))

(assert (= (and d!109781 c!93583) b!886821))

(assert (= (and d!109781 (not c!93583)) b!886828))

(assert (= (and b!886828 c!93586) b!886823))

(assert (= (and b!886828 (not c!93586)) b!886822))

(assert (= (and b!886822 c!93585) b!886829))

(assert (= (and b!886822 (not c!93585)) b!886825))

(assert (= (or b!886829 b!886825) bm!39302))

(assert (= (or b!886823 bm!39302) bm!39304))

(assert (= (or b!886821 bm!39304) bm!39303))

(assert (= (and bm!39303 c!93584) b!886824))

(assert (= (and bm!39303 (not c!93584)) b!886820))

(assert (= (and d!109781 res!601945) b!886827))

(assert (= (and b!886827 res!601944) b!886826))

(declare-fun m!826631 () Bool)

(assert (=> b!886826 m!826631))

(declare-fun m!826633 () Bool)

(assert (=> d!109781 m!826633))

(assert (=> d!109781 m!826507))

(declare-fun m!826635 () Bool)

(assert (=> b!886824 m!826635))

(declare-fun m!826637 () Bool)

(assert (=> b!886827 m!826637))

(declare-fun m!826639 () Bool)

(assert (=> bm!39303 m!826639))

(assert (=> b!886749 d!109781))

(declare-fun d!109783 () Bool)

(declare-fun res!601946 () Bool)

(declare-fun e!493678 () Bool)

(assert (=> d!109783 (=> res!601946 e!493678)))

(assert (=> d!109783 (= res!601946 (or ((_ is Nil!17672) lt!401156) ((_ is Nil!17672) (t!24955 lt!401156))))))

(assert (=> d!109783 (= (isStrictlySorted!493 lt!401156) e!493678)))

(declare-fun b!886830 () Bool)

(declare-fun e!493679 () Bool)

(assert (=> b!886830 (= e!493678 e!493679)))

(declare-fun res!601947 () Bool)

(assert (=> b!886830 (=> (not res!601947) (not e!493679))))

(assert (=> b!886830 (= res!601947 (bvslt (_1!5967 (h!18802 lt!401156)) (_1!5967 (h!18802 (t!24955 lt!401156)))))))

(declare-fun b!886831 () Bool)

(assert (=> b!886831 (= e!493679 (isStrictlySorted!493 (t!24955 lt!401156)))))

(assert (= (and d!109783 (not res!601946)) b!886830))

(assert (= (and b!886830 res!601947) b!886831))

(declare-fun m!826641 () Bool)

(assert (=> b!886831 m!826641))

(assert (=> d!109763 d!109783))

(assert (=> d!109763 d!109745))

(declare-fun d!109785 () Bool)

(declare-fun res!601948 () Bool)

(declare-fun e!493680 () Bool)

(assert (=> d!109785 (=> res!601948 e!493680)))

(assert (=> d!109785 (= res!601948 (or ((_ is Nil!17672) lt!401155) ((_ is Nil!17672) (t!24955 lt!401155))))))

(assert (=> d!109785 (= (isStrictlySorted!493 lt!401155) e!493680)))

(declare-fun b!886832 () Bool)

(declare-fun e!493681 () Bool)

(assert (=> b!886832 (= e!493680 e!493681)))

(declare-fun res!601949 () Bool)

(assert (=> b!886832 (=> (not res!601949) (not e!493681))))

(assert (=> b!886832 (= res!601949 (bvslt (_1!5967 (h!18802 lt!401155)) (_1!5967 (h!18802 (t!24955 lt!401155)))))))

(declare-fun b!886833 () Bool)

(assert (=> b!886833 (= e!493681 (isStrictlySorted!493 (t!24955 lt!401155)))))

(assert (= (and d!109785 (not res!601948)) b!886832))

(assert (= (and b!886832 res!601949) b!886833))

(declare-fun m!826643 () Bool)

(assert (=> b!886833 m!826643))

(assert (=> d!109759 d!109785))

(assert (=> d!109759 d!109745))

(declare-fun d!109787 () Bool)

(declare-fun res!601950 () Bool)

(declare-fun e!493682 () Bool)

(assert (=> d!109787 (=> res!601950 e!493682)))

(assert (=> d!109787 (= res!601950 (and ((_ is Cons!17671) lt!401152) (= (_1!5967 (h!18802 lt!401152)) key1!49)))))

(assert (=> d!109787 (= (containsKey!415 lt!401152 key1!49) e!493682)))

(declare-fun b!886834 () Bool)

(declare-fun e!493683 () Bool)

(assert (=> b!886834 (= e!493682 e!493683)))

(declare-fun res!601951 () Bool)

(assert (=> b!886834 (=> (not res!601951) (not e!493683))))

(assert (=> b!886834 (= res!601951 (and (or (not ((_ is Cons!17671) lt!401152)) (bvsle (_1!5967 (h!18802 lt!401152)) key1!49)) ((_ is Cons!17671) lt!401152) (bvslt (_1!5967 (h!18802 lt!401152)) key1!49)))))

(declare-fun b!886835 () Bool)

(assert (=> b!886835 (= e!493683 (containsKey!415 (t!24955 lt!401152) key1!49))))

(assert (= (and d!109787 (not res!601950)) b!886834))

(assert (= (and b!886834 res!601951) b!886835))

(declare-fun m!826645 () Bool)

(assert (=> b!886835 m!826645))

(assert (=> b!886712 d!109787))

(declare-fun d!109789 () Bool)

(declare-fun res!601952 () Bool)

(declare-fun e!493684 () Bool)

(assert (=> d!109789 (=> res!601952 e!493684)))

(assert (=> d!109789 (= res!601952 (or ((_ is Nil!17672) lt!401152) ((_ is Nil!17672) (t!24955 lt!401152))))))

(assert (=> d!109789 (= (isStrictlySorted!493 lt!401152) e!493684)))

(declare-fun b!886836 () Bool)

(declare-fun e!493685 () Bool)

(assert (=> b!886836 (= e!493684 e!493685)))

(declare-fun res!601953 () Bool)

(assert (=> b!886836 (=> (not res!601953) (not e!493685))))

(assert (=> b!886836 (= res!601953 (bvslt (_1!5967 (h!18802 lt!401152)) (_1!5967 (h!18802 (t!24955 lt!401152)))))))

(declare-fun b!886837 () Bool)

(assert (=> b!886837 (= e!493685 (isStrictlySorted!493 (t!24955 lt!401152)))))

(assert (= (and d!109789 (not res!601952)) b!886836))

(assert (= (and b!886836 res!601953) b!886837))

(declare-fun m!826647 () Bool)

(assert (=> b!886837 m!826647))

(assert (=> d!109751 d!109789))

(declare-fun d!109791 () Bool)

(declare-fun res!601954 () Bool)

(declare-fun e!493686 () Bool)

(assert (=> d!109791 (=> res!601954 e!493686)))

(assert (=> d!109791 (= res!601954 (or ((_ is Nil!17672) (insertStrictlySorted!301 l!906 key1!49 v1!38)) ((_ is Nil!17672) (t!24955 (insertStrictlySorted!301 l!906 key1!49 v1!38)))))))

(assert (=> d!109791 (= (isStrictlySorted!493 (insertStrictlySorted!301 l!906 key1!49 v1!38)) e!493686)))

(declare-fun b!886838 () Bool)

(declare-fun e!493687 () Bool)

(assert (=> b!886838 (= e!493686 e!493687)))

(declare-fun res!601955 () Bool)

(assert (=> b!886838 (=> (not res!601955) (not e!493687))))

(assert (=> b!886838 (= res!601955 (bvslt (_1!5967 (h!18802 (insertStrictlySorted!301 l!906 key1!49 v1!38))) (_1!5967 (h!18802 (t!24955 (insertStrictlySorted!301 l!906 key1!49 v1!38))))))))

(declare-fun b!886839 () Bool)

(assert (=> b!886839 (= e!493687 (isStrictlySorted!493 (t!24955 (insertStrictlySorted!301 l!906 key1!49 v1!38))))))

(assert (= (and d!109791 (not res!601954)) b!886838))

(assert (= (and b!886838 res!601955) b!886839))

(assert (=> b!886839 m!826613))

(assert (=> d!109751 d!109791))

(declare-fun d!109793 () Bool)

(declare-fun res!601956 () Bool)

(declare-fun e!493688 () Bool)

(assert (=> d!109793 (=> res!601956 e!493688)))

(assert (=> d!109793 (= res!601956 (and ((_ is Cons!17671) lt!401156) (= (_1!5967 (h!18802 lt!401156)) key1!49)))))

(assert (=> d!109793 (= (containsKey!415 lt!401156 key1!49) e!493688)))

(declare-fun b!886840 () Bool)

(declare-fun e!493689 () Bool)

(assert (=> b!886840 (= e!493688 e!493689)))

(declare-fun res!601957 () Bool)

(assert (=> b!886840 (=> (not res!601957) (not e!493689))))

(assert (=> b!886840 (= res!601957 (and (or (not ((_ is Cons!17671) lt!401156)) (bvsle (_1!5967 (h!18802 lt!401156)) key1!49)) ((_ is Cons!17671) lt!401156) (bvslt (_1!5967 (h!18802 lt!401156)) key1!49)))))

(declare-fun b!886841 () Bool)

(assert (=> b!886841 (= e!493689 (containsKey!415 (t!24955 lt!401156) key1!49))))

(assert (= (and d!109793 (not res!601956)) b!886840))

(assert (= (and b!886840 res!601957) b!886841))

(declare-fun m!826649 () Bool)

(assert (=> b!886841 m!826649))

(assert (=> b!886752 d!109793))

(declare-fun lt!401164 () Bool)

(declare-fun d!109795 () Bool)

(assert (=> d!109795 (= lt!401164 (select (content!398 lt!401152) (tuple2!11913 key1!49 v2!16)))))

(declare-fun e!493691 () Bool)

(assert (=> d!109795 (= lt!401164 e!493691)))

(declare-fun res!601958 () Bool)

(assert (=> d!109795 (=> (not res!601958) (not e!493691))))

(assert (=> d!109795 (= res!601958 ((_ is Cons!17671) lt!401152))))

(assert (=> d!109795 (= (contains!4298 lt!401152 (tuple2!11913 key1!49 v2!16)) lt!401164)))

(declare-fun b!886842 () Bool)

(declare-fun e!493690 () Bool)

(assert (=> b!886842 (= e!493691 e!493690)))

(declare-fun res!601959 () Bool)

(assert (=> b!886842 (=> res!601959 e!493690)))

(assert (=> b!886842 (= res!601959 (= (h!18802 lt!401152) (tuple2!11913 key1!49 v2!16)))))

(declare-fun b!886843 () Bool)

(assert (=> b!886843 (= e!493690 (contains!4298 (t!24955 lt!401152) (tuple2!11913 key1!49 v2!16)))))

(assert (= (and d!109795 res!601958) b!886842))

(assert (= (and b!886842 (not res!601959)) b!886843))

(declare-fun m!826651 () Bool)

(assert (=> d!109795 m!826651))

(declare-fun m!826653 () Bool)

(assert (=> d!109795 m!826653))

(declare-fun m!826655 () Bool)

(assert (=> b!886843 m!826655))

(assert (=> b!886711 d!109795))

(declare-fun e!493695 () List!17675)

(declare-fun c!93589 () Bool)

(declare-fun b!886844 () Bool)

(declare-fun c!93590 () Bool)

(assert (=> b!886844 (= e!493695 (ite c!93590 (t!24955 (t!24955 l!906)) (ite c!93589 (Cons!17671 (h!18802 (t!24955 l!906)) (t!24955 (t!24955 l!906))) Nil!17672)))))

(declare-fun b!886845 () Bool)

(declare-fun e!493692 () List!17675)

(declare-fun call!39309 () List!17675)

(assert (=> b!886845 (= e!493692 call!39309)))

(declare-fun b!886846 () Bool)

(assert (=> b!886846 (= c!93589 (and ((_ is Cons!17671) (t!24955 l!906)) (bvsgt (_1!5967 (h!18802 (t!24955 l!906))) key1!49)))))

(declare-fun e!493693 () List!17675)

(declare-fun e!493694 () List!17675)

(assert (=> b!886846 (= e!493693 e!493694)))

(declare-fun b!886847 () Bool)

(declare-fun call!39308 () List!17675)

(assert (=> b!886847 (= e!493693 call!39308)))

(declare-fun bm!39305 () Bool)

(declare-fun call!39310 () List!17675)

(assert (=> bm!39305 (= call!39310 call!39308)))

(declare-fun b!886849 () Bool)

(assert (=> b!886849 (= e!493694 call!39310)))

(declare-fun bm!39306 () Bool)

(declare-fun c!93587 () Bool)

(assert (=> bm!39306 (= call!39309 ($colon$colon!549 e!493695 (ite c!93587 (h!18802 (t!24955 l!906)) (tuple2!11913 key1!49 v1!38))))))

(declare-fun c!93588 () Bool)

(assert (=> bm!39306 (= c!93588 c!93587)))

(declare-fun lt!401165 () List!17675)

(declare-fun e!493696 () Bool)

(declare-fun b!886850 () Bool)

(assert (=> b!886850 (= e!493696 (contains!4298 lt!401165 (tuple2!11913 key1!49 v1!38)))))

(declare-fun b!886851 () Bool)

(declare-fun res!601960 () Bool)

(assert (=> b!886851 (=> (not res!601960) (not e!493696))))

(assert (=> b!886851 (= res!601960 (containsKey!415 lt!401165 key1!49))))

(declare-fun bm!39307 () Bool)

(assert (=> bm!39307 (= call!39308 call!39309)))

(declare-fun b!886848 () Bool)

(assert (=> b!886848 (= e!493695 (insertStrictlySorted!301 (t!24955 (t!24955 l!906)) key1!49 v1!38))))

(declare-fun d!109797 () Bool)

(assert (=> d!109797 e!493696))

(declare-fun res!601961 () Bool)

(assert (=> d!109797 (=> (not res!601961) (not e!493696))))

(assert (=> d!109797 (= res!601961 (isStrictlySorted!493 lt!401165))))

(assert (=> d!109797 (= lt!401165 e!493692)))

(assert (=> d!109797 (= c!93587 (and ((_ is Cons!17671) (t!24955 l!906)) (bvslt (_1!5967 (h!18802 (t!24955 l!906))) key1!49)))))

(assert (=> d!109797 (isStrictlySorted!493 (t!24955 l!906))))

(assert (=> d!109797 (= (insertStrictlySorted!301 (t!24955 l!906) key1!49 v1!38) lt!401165)))

(declare-fun b!886852 () Bool)

(assert (=> b!886852 (= e!493692 e!493693)))

(assert (=> b!886852 (= c!93590 (and ((_ is Cons!17671) (t!24955 l!906)) (= (_1!5967 (h!18802 (t!24955 l!906))) key1!49)))))

(declare-fun b!886853 () Bool)

(assert (=> b!886853 (= e!493694 call!39310)))

(assert (= (and d!109797 c!93587) b!886845))

(assert (= (and d!109797 (not c!93587)) b!886852))

(assert (= (and b!886852 c!93590) b!886847))

(assert (= (and b!886852 (not c!93590)) b!886846))

(assert (= (and b!886846 c!93589) b!886853))

(assert (= (and b!886846 (not c!93589)) b!886849))

(assert (= (or b!886853 b!886849) bm!39305))

(assert (= (or b!886847 bm!39305) bm!39307))

(assert (= (or b!886845 bm!39307) bm!39306))

(assert (= (and bm!39306 c!93588) b!886848))

(assert (= (and bm!39306 (not c!93588)) b!886844))

(assert (= (and d!109797 res!601961) b!886851))

(assert (= (and b!886851 res!601960) b!886850))

(declare-fun m!826657 () Bool)

(assert (=> b!886850 m!826657))

(declare-fun m!826659 () Bool)

(assert (=> d!109797 m!826659))

(assert (=> d!109797 m!826507))

(declare-fun m!826661 () Bool)

(assert (=> b!886848 m!826661))

(declare-fun m!826663 () Bool)

(assert (=> b!886851 m!826663))

(declare-fun m!826665 () Bool)

(assert (=> bm!39306 m!826665))

(assert (=> b!886739 d!109797))

(declare-fun d!109801 () Bool)

(assert (=> d!109801 (= ($colon$colon!549 e!493607 (ite c!93551 (h!18802 (insertStrictlySorted!301 l!906 key1!49 v1!38)) (tuple2!11913 key1!49 v2!16))) (Cons!17671 (ite c!93551 (h!18802 (insertStrictlySorted!301 l!906 key1!49 v1!38)) (tuple2!11913 key1!49 v2!16)) e!493607))))

(assert (=> bm!39279 d!109801))

(declare-fun lt!401166 () Bool)

(declare-fun d!109803 () Bool)

(assert (=> d!109803 (= lt!401166 (select (content!398 lt!401156) (tuple2!11913 key1!49 v2!16)))))

(declare-fun e!493698 () Bool)

(assert (=> d!109803 (= lt!401166 e!493698)))

(declare-fun res!601962 () Bool)

(assert (=> d!109803 (=> (not res!601962) (not e!493698))))

(assert (=> d!109803 (= res!601962 ((_ is Cons!17671) lt!401156))))

(assert (=> d!109803 (= (contains!4298 lt!401156 (tuple2!11913 key1!49 v2!16)) lt!401166)))

(declare-fun b!886854 () Bool)

(declare-fun e!493697 () Bool)

(assert (=> b!886854 (= e!493698 e!493697)))

(declare-fun res!601963 () Bool)

(assert (=> b!886854 (=> res!601963 e!493697)))

(assert (=> b!886854 (= res!601963 (= (h!18802 lt!401156) (tuple2!11913 key1!49 v2!16)))))

(declare-fun b!886855 () Bool)

(assert (=> b!886855 (= e!493697 (contains!4298 (t!24955 lt!401156) (tuple2!11913 key1!49 v2!16)))))

(assert (= (and d!109803 res!601962) b!886854))

(assert (= (and b!886854 (not res!601963)) b!886855))

(declare-fun m!826667 () Bool)

(assert (=> d!109803 m!826667))

(declare-fun m!826669 () Bool)

(assert (=> d!109803 m!826669))

(declare-fun m!826671 () Bool)

(assert (=> b!886855 m!826671))

(assert (=> b!886751 d!109803))

(declare-fun b!886856 () Bool)

(declare-fun e!493699 () Bool)

(declare-fun tp!54402 () Bool)

(assert (=> b!886856 (= e!493699 (and tp_is_empty!17817 tp!54402))))

(assert (=> b!886783 (= tp!54395 e!493699)))

(assert (= (and b!886783 ((_ is Cons!17671) (t!24955 (t!24955 l!906)))) b!886856))

(check-sat (not d!109771) (not b!886802) (not bm!39306) (not bm!39303) (not b!886833) (not b!886835) (not b!886851) (not bm!39300) (not d!109797) (not d!109777) (not b!886848) (not b!886837) (not b!886843) tp_is_empty!17817 (not b!886819) (not b!886803) (not b!886856) (not b!886826) (not d!109795) (not b!886841) (not b!886839) (not b!886855) (not d!109781) (not b!886800) (not b!886850) (not b!886831) (not b!886813) (not b!886827) (not b!886807) (not b!886824) (not d!109803))
(check-sat)
