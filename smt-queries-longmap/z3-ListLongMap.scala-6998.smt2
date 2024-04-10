; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!88818 () Bool)

(assert start!88818)

(declare-fun res!683571 () Bool)

(declare-fun e!573905 () Bool)

(assert (=> start!88818 (=> (not res!683571) (not e!573905))))

(declare-datatypes ((B!1696 0))(
  ( (B!1697 (val!11932 Int)) )
))
(declare-datatypes ((tuple2!15410 0))(
  ( (tuple2!15411 (_1!7716 (_ BitVec 64)) (_2!7716 B!1696)) )
))
(declare-datatypes ((List!21620 0))(
  ( (Nil!21617) (Cons!21616 (h!22814 tuple2!15410) (t!30627 List!21620)) )
))
(declare-fun l!996 () List!21620)

(declare-fun isStrictlySorted!685 (List!21620) Bool)

(assert (=> start!88818 (= res!683571 (isStrictlySorted!685 l!996))))

(assert (=> start!88818 e!573905))

(declare-fun e!573906 () Bool)

(assert (=> start!88818 e!573906))

(assert (=> start!88818 true))

(declare-fun tp_is_empty!23763 () Bool)

(assert (=> start!88818 tp_is_empty!23763))

(declare-fun b!1019741 () Bool)

(declare-fun tp!71173 () Bool)

(assert (=> b!1019741 (= e!573906 (and tp_is_empty!23763 tp!71173))))

(declare-fun b!1019739 () Bool)

(declare-fun e!573904 () Bool)

(assert (=> b!1019739 (= e!573905 e!573904)))

(declare-fun res!683572 () Bool)

(assert (=> b!1019739 (=> (not res!683572) (not e!573904))))

(declare-fun lt!449733 () List!21620)

(declare-fun key!261 () (_ BitVec 64))

(declare-fun value!172 () B!1696)

(get-info :version)

(assert (=> b!1019739 (= res!683572 (and (bvsge (_1!7716 (h!22814 l!996)) key!261) ((_ is Cons!21616) l!996) (= (_1!7716 (h!22814 l!996)) key!261) (= lt!449733 (Cons!21616 (tuple2!15411 key!261 value!172) (t!30627 l!996)))))))

(declare-fun insertStrictlySorted!363 (List!21620 (_ BitVec 64) B!1696) List!21620)

(assert (=> b!1019739 (= lt!449733 (insertStrictlySorted!363 l!996 key!261 value!172))))

(declare-fun b!1019738 () Bool)

(declare-fun res!683573 () Bool)

(assert (=> b!1019738 (=> (not res!683573) (not e!573905))))

(declare-fun containsKey!545 (List!21620 (_ BitVec 64)) Bool)

(assert (=> b!1019738 (= res!683573 (containsKey!545 l!996 key!261))))

(declare-fun b!1019740 () Bool)

(declare-fun length!48 (List!21620) Int)

(assert (=> b!1019740 (= e!573904 (not (= (length!48 lt!449733) (length!48 l!996))))))

(assert (= (and start!88818 res!683571) b!1019738))

(assert (= (and b!1019738 res!683573) b!1019739))

(assert (= (and b!1019739 res!683572) b!1019740))

(assert (= (and start!88818 ((_ is Cons!21616) l!996)) b!1019741))

(declare-fun m!939989 () Bool)

(assert (=> start!88818 m!939989))

(declare-fun m!939991 () Bool)

(assert (=> b!1019739 m!939991))

(declare-fun m!939993 () Bool)

(assert (=> b!1019738 m!939993))

(declare-fun m!939995 () Bool)

(assert (=> b!1019740 m!939995))

(declare-fun m!939997 () Bool)

(assert (=> b!1019740 m!939997))

(check-sat (not b!1019739) (not b!1019741) (not b!1019738) tp_is_empty!23763 (not start!88818) (not b!1019740))
(check-sat)
(get-model)

(declare-fun b!1019784 () Bool)

(declare-fun e!573940 () List!21620)

(declare-fun e!573936 () List!21620)

(assert (=> b!1019784 (= e!573940 e!573936)))

(declare-fun c!103407 () Bool)

(assert (=> b!1019784 (= c!103407 (and ((_ is Cons!21616) l!996) (= (_1!7716 (h!22814 l!996)) key!261)))))

(declare-fun c!103408 () Bool)

(declare-fun e!573937 () List!21620)

(declare-fun call!43128 () List!21620)

(declare-fun bm!43123 () Bool)

(declare-fun $colon$colon!592 (List!21620 tuple2!15410) List!21620)

(assert (=> bm!43123 (= call!43128 ($colon$colon!592 e!573937 (ite c!103408 (h!22814 l!996) (tuple2!15411 key!261 value!172))))))

(declare-fun c!103405 () Bool)

(assert (=> bm!43123 (= c!103405 c!103408)))

(declare-fun b!1019785 () Bool)

(declare-fun e!573938 () List!21620)

(declare-fun call!43127 () List!21620)

(assert (=> b!1019785 (= e!573938 call!43127)))

(declare-fun b!1019786 () Bool)

(declare-fun c!103406 () Bool)

(assert (=> b!1019786 (= c!103406 (and ((_ is Cons!21616) l!996) (bvsgt (_1!7716 (h!22814 l!996)) key!261)))))

(assert (=> b!1019786 (= e!573936 e!573938)))

(declare-fun b!1019788 () Bool)

(assert (=> b!1019788 (= e!573937 (insertStrictlySorted!363 (t!30627 l!996) key!261 value!172))))

(declare-fun b!1019789 () Bool)

(assert (=> b!1019789 (= e!573940 call!43128)))

(declare-fun b!1019790 () Bool)

(assert (=> b!1019790 (= e!573938 call!43127)))

(declare-fun d!122205 () Bool)

(declare-fun e!573939 () Bool)

(assert (=> d!122205 e!573939))

(declare-fun res!683597 () Bool)

(assert (=> d!122205 (=> (not res!683597) (not e!573939))))

(declare-fun lt!449739 () List!21620)

(assert (=> d!122205 (= res!683597 (isStrictlySorted!685 lt!449739))))

(assert (=> d!122205 (= lt!449739 e!573940)))

(assert (=> d!122205 (= c!103408 (and ((_ is Cons!21616) l!996) (bvslt (_1!7716 (h!22814 l!996)) key!261)))))

(assert (=> d!122205 (isStrictlySorted!685 l!996)))

(assert (=> d!122205 (= (insertStrictlySorted!363 l!996 key!261 value!172) lt!449739)))

(declare-fun b!1019787 () Bool)

(assert (=> b!1019787 (= e!573937 (ite c!103407 (t!30627 l!996) (ite c!103406 (Cons!21616 (h!22814 l!996) (t!30627 l!996)) Nil!21617)))))

(declare-fun b!1019791 () Bool)

(declare-fun call!43126 () List!21620)

(assert (=> b!1019791 (= e!573936 call!43126)))

(declare-fun bm!43124 () Bool)

(assert (=> bm!43124 (= call!43127 call!43126)))

(declare-fun b!1019792 () Bool)

(declare-fun res!683598 () Bool)

(assert (=> b!1019792 (=> (not res!683598) (not e!573939))))

(assert (=> b!1019792 (= res!683598 (containsKey!545 lt!449739 key!261))))

(declare-fun b!1019793 () Bool)

(declare-fun contains!5911 (List!21620 tuple2!15410) Bool)

(assert (=> b!1019793 (= e!573939 (contains!5911 lt!449739 (tuple2!15411 key!261 value!172)))))

(declare-fun bm!43125 () Bool)

(assert (=> bm!43125 (= call!43126 call!43128)))

(assert (= (and d!122205 c!103408) b!1019789))

(assert (= (and d!122205 (not c!103408)) b!1019784))

(assert (= (and b!1019784 c!103407) b!1019791))

(assert (= (and b!1019784 (not c!103407)) b!1019786))

(assert (= (and b!1019786 c!103406) b!1019785))

(assert (= (and b!1019786 (not c!103406)) b!1019790))

(assert (= (or b!1019785 b!1019790) bm!43124))

(assert (= (or b!1019791 bm!43124) bm!43125))

(assert (= (or b!1019789 bm!43125) bm!43123))

(assert (= (and bm!43123 c!103405) b!1019788))

(assert (= (and bm!43123 (not c!103405)) b!1019787))

(assert (= (and d!122205 res!683597) b!1019792))

(assert (= (and b!1019792 res!683598) b!1019793))

(declare-fun m!940011 () Bool)

(assert (=> b!1019793 m!940011))

(declare-fun m!940013 () Bool)

(assert (=> d!122205 m!940013))

(assert (=> d!122205 m!939989))

(declare-fun m!940015 () Bool)

(assert (=> b!1019788 m!940015))

(declare-fun m!940017 () Bool)

(assert (=> b!1019792 m!940017))

(declare-fun m!940019 () Bool)

(assert (=> bm!43123 m!940019))

(assert (=> b!1019739 d!122205))

(declare-fun d!122213 () Bool)

(declare-fun size!31160 (List!21620) Int)

(assert (=> d!122213 (= (length!48 lt!449733) (size!31160 lt!449733))))

(declare-fun bs!29707 () Bool)

(assert (= bs!29707 d!122213))

(declare-fun m!940023 () Bool)

(assert (=> bs!29707 m!940023))

(assert (=> b!1019740 d!122213))

(declare-fun d!122217 () Bool)

(assert (=> d!122217 (= (length!48 l!996) (size!31160 l!996))))

(declare-fun bs!29708 () Bool)

(assert (= bs!29708 d!122217))

(declare-fun m!940025 () Bool)

(assert (=> bs!29708 m!940025))

(assert (=> b!1019740 d!122217))

(declare-fun d!122219 () Bool)

(declare-fun res!683605 () Bool)

(declare-fun e!573953 () Bool)

(assert (=> d!122219 (=> res!683605 e!573953)))

(assert (=> d!122219 (= res!683605 (or ((_ is Nil!21617) l!996) ((_ is Nil!21617) (t!30627 l!996))))))

(assert (=> d!122219 (= (isStrictlySorted!685 l!996) e!573953)))

(declare-fun b!1019812 () Bool)

(declare-fun e!573954 () Bool)

(assert (=> b!1019812 (= e!573953 e!573954)))

(declare-fun res!683606 () Bool)

(assert (=> b!1019812 (=> (not res!683606) (not e!573954))))

(assert (=> b!1019812 (= res!683606 (bvslt (_1!7716 (h!22814 l!996)) (_1!7716 (h!22814 (t!30627 l!996)))))))

(declare-fun b!1019813 () Bool)

(assert (=> b!1019813 (= e!573954 (isStrictlySorted!685 (t!30627 l!996)))))

(assert (= (and d!122219 (not res!683605)) b!1019812))

(assert (= (and b!1019812 res!683606) b!1019813))

(declare-fun m!940027 () Bool)

(assert (=> b!1019813 m!940027))

(assert (=> start!88818 d!122219))

(declare-fun d!122221 () Bool)

(declare-fun res!683615 () Bool)

(declare-fun e!573963 () Bool)

(assert (=> d!122221 (=> res!683615 e!573963)))

(assert (=> d!122221 (= res!683615 (and ((_ is Cons!21616) l!996) (= (_1!7716 (h!22814 l!996)) key!261)))))

(assert (=> d!122221 (= (containsKey!545 l!996 key!261) e!573963)))

(declare-fun b!1019826 () Bool)

(declare-fun e!573964 () Bool)

(assert (=> b!1019826 (= e!573963 e!573964)))

(declare-fun res!683616 () Bool)

(assert (=> b!1019826 (=> (not res!683616) (not e!573964))))

(assert (=> b!1019826 (= res!683616 (and (or (not ((_ is Cons!21616) l!996)) (bvsle (_1!7716 (h!22814 l!996)) key!261)) ((_ is Cons!21616) l!996) (bvslt (_1!7716 (h!22814 l!996)) key!261)))))

(declare-fun b!1019827 () Bool)

(assert (=> b!1019827 (= e!573964 (containsKey!545 (t!30627 l!996) key!261))))

(assert (= (and d!122221 (not res!683615)) b!1019826))

(assert (= (and b!1019826 res!683616) b!1019827))

(declare-fun m!940029 () Bool)

(assert (=> b!1019827 m!940029))

(assert (=> b!1019738 d!122221))

(declare-fun b!1019836 () Bool)

(declare-fun e!573969 () Bool)

(declare-fun tp!71179 () Bool)

(assert (=> b!1019836 (= e!573969 (and tp_is_empty!23763 tp!71179))))

(assert (=> b!1019741 (= tp!71173 e!573969)))

(assert (= (and b!1019741 ((_ is Cons!21616) (t!30627 l!996))) b!1019836))

(check-sat (not d!122217) (not d!122205) (not b!1019788) (not b!1019793) (not b!1019836) (not b!1019827) (not d!122213) (not b!1019813) (not bm!43123) tp_is_empty!23763 (not b!1019792))
(check-sat)
(get-model)

(declare-fun d!122235 () Bool)

(declare-fun res!683637 () Bool)

(declare-fun e!574006 () Bool)

(assert (=> d!122235 (=> res!683637 e!574006)))

(assert (=> d!122235 (= res!683637 (or ((_ is Nil!21617) lt!449739) ((_ is Nil!21617) (t!30627 lt!449739))))))

(assert (=> d!122235 (= (isStrictlySorted!685 lt!449739) e!574006)))

(declare-fun b!1019895 () Bool)

(declare-fun e!574007 () Bool)

(assert (=> b!1019895 (= e!574006 e!574007)))

(declare-fun res!683638 () Bool)

(assert (=> b!1019895 (=> (not res!683638) (not e!574007))))

(assert (=> b!1019895 (= res!683638 (bvslt (_1!7716 (h!22814 lt!449739)) (_1!7716 (h!22814 (t!30627 lt!449739)))))))

(declare-fun b!1019896 () Bool)

(assert (=> b!1019896 (= e!574007 (isStrictlySorted!685 (t!30627 lt!449739)))))

(assert (= (and d!122235 (not res!683637)) b!1019895))

(assert (= (and b!1019895 res!683638) b!1019896))

(declare-fun m!940063 () Bool)

(assert (=> b!1019896 m!940063))

(assert (=> d!122205 d!122235))

(assert (=> d!122205 d!122219))

(declare-fun d!122237 () Bool)

(declare-fun lt!449748 () Int)

(assert (=> d!122237 (>= lt!449748 0)))

(declare-fun e!574010 () Int)

(assert (=> d!122237 (= lt!449748 e!574010)))

(declare-fun c!103435 () Bool)

(assert (=> d!122237 (= c!103435 ((_ is Nil!21617) lt!449733))))

(assert (=> d!122237 (= (size!31160 lt!449733) lt!449748)))

(declare-fun b!1019901 () Bool)

(assert (=> b!1019901 (= e!574010 0)))

(declare-fun b!1019902 () Bool)

(assert (=> b!1019902 (= e!574010 (+ 1 (size!31160 (t!30627 lt!449733))))))

(assert (= (and d!122237 c!103435) b!1019901))

(assert (= (and d!122237 (not c!103435)) b!1019902))

(declare-fun m!940065 () Bool)

(assert (=> b!1019902 m!940065))

(assert (=> d!122213 d!122237))

(declare-fun d!122239 () Bool)

(assert (=> d!122239 (= ($colon$colon!592 e!573937 (ite c!103408 (h!22814 l!996) (tuple2!15411 key!261 value!172))) (Cons!21616 (ite c!103408 (h!22814 l!996) (tuple2!15411 key!261 value!172)) e!573937))))

(assert (=> bm!43123 d!122239))

(declare-fun d!122241 () Bool)

(declare-fun res!683639 () Bool)

(declare-fun e!574011 () Bool)

(assert (=> d!122241 (=> res!683639 e!574011)))

(assert (=> d!122241 (= res!683639 (and ((_ is Cons!21616) (t!30627 l!996)) (= (_1!7716 (h!22814 (t!30627 l!996))) key!261)))))

(assert (=> d!122241 (= (containsKey!545 (t!30627 l!996) key!261) e!574011)))

(declare-fun b!1019903 () Bool)

(declare-fun e!574012 () Bool)

(assert (=> b!1019903 (= e!574011 e!574012)))

(declare-fun res!683640 () Bool)

(assert (=> b!1019903 (=> (not res!683640) (not e!574012))))

(assert (=> b!1019903 (= res!683640 (and (or (not ((_ is Cons!21616) (t!30627 l!996))) (bvsle (_1!7716 (h!22814 (t!30627 l!996))) key!261)) ((_ is Cons!21616) (t!30627 l!996)) (bvslt (_1!7716 (h!22814 (t!30627 l!996))) key!261)))))

(declare-fun b!1019904 () Bool)

(assert (=> b!1019904 (= e!574012 (containsKey!545 (t!30627 (t!30627 l!996)) key!261))))

(assert (= (and d!122241 (not res!683639)) b!1019903))

(assert (= (and b!1019903 res!683640) b!1019904))

(declare-fun m!940067 () Bool)

(assert (=> b!1019904 m!940067))

(assert (=> b!1019827 d!122241))

(declare-fun d!122243 () Bool)

(declare-fun res!683641 () Bool)

(declare-fun e!574013 () Bool)

(assert (=> d!122243 (=> res!683641 e!574013)))

(assert (=> d!122243 (= res!683641 (or ((_ is Nil!21617) (t!30627 l!996)) ((_ is Nil!21617) (t!30627 (t!30627 l!996)))))))

(assert (=> d!122243 (= (isStrictlySorted!685 (t!30627 l!996)) e!574013)))

(declare-fun b!1019905 () Bool)

(declare-fun e!574014 () Bool)

(assert (=> b!1019905 (= e!574013 e!574014)))

(declare-fun res!683642 () Bool)

(assert (=> b!1019905 (=> (not res!683642) (not e!574014))))

(assert (=> b!1019905 (= res!683642 (bvslt (_1!7716 (h!22814 (t!30627 l!996))) (_1!7716 (h!22814 (t!30627 (t!30627 l!996))))))))

(declare-fun b!1019906 () Bool)

(assert (=> b!1019906 (= e!574014 (isStrictlySorted!685 (t!30627 (t!30627 l!996))))))

(assert (= (and d!122243 (not res!683641)) b!1019905))

(assert (= (and b!1019905 res!683642) b!1019906))

(declare-fun m!940069 () Bool)

(assert (=> b!1019906 m!940069))

(assert (=> b!1019813 d!122243))

(declare-fun lt!449751 () Bool)

(declare-fun d!122245 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!490 (List!21620) (InoxSet tuple2!15410))

(assert (=> d!122245 (= lt!449751 (select (content!490 lt!449739) (tuple2!15411 key!261 value!172)))))

(declare-fun e!574020 () Bool)

(assert (=> d!122245 (= lt!449751 e!574020)))

(declare-fun res!683648 () Bool)

(assert (=> d!122245 (=> (not res!683648) (not e!574020))))

(assert (=> d!122245 (= res!683648 ((_ is Cons!21616) lt!449739))))

(assert (=> d!122245 (= (contains!5911 lt!449739 (tuple2!15411 key!261 value!172)) lt!449751)))

(declare-fun b!1019911 () Bool)

(declare-fun e!574019 () Bool)

(assert (=> b!1019911 (= e!574020 e!574019)))

(declare-fun res!683647 () Bool)

(assert (=> b!1019911 (=> res!683647 e!574019)))

(assert (=> b!1019911 (= res!683647 (= (h!22814 lt!449739) (tuple2!15411 key!261 value!172)))))

(declare-fun b!1019912 () Bool)

(assert (=> b!1019912 (= e!574019 (contains!5911 (t!30627 lt!449739) (tuple2!15411 key!261 value!172)))))

(assert (= (and d!122245 res!683648) b!1019911))

(assert (= (and b!1019911 (not res!683647)) b!1019912))

(declare-fun m!940071 () Bool)

(assert (=> d!122245 m!940071))

(declare-fun m!940073 () Bool)

(assert (=> d!122245 m!940073))

(declare-fun m!940075 () Bool)

(assert (=> b!1019912 m!940075))

(assert (=> b!1019793 d!122245))

(declare-fun b!1019913 () Bool)

(declare-fun e!574025 () List!21620)

(declare-fun e!574021 () List!21620)

(assert (=> b!1019913 (= e!574025 e!574021)))

(declare-fun c!103438 () Bool)

(assert (=> b!1019913 (= c!103438 (and ((_ is Cons!21616) (t!30627 l!996)) (= (_1!7716 (h!22814 (t!30627 l!996))) key!261)))))

(declare-fun call!43149 () List!21620)

(declare-fun e!574022 () List!21620)

(declare-fun bm!43144 () Bool)

(declare-fun c!103439 () Bool)

(assert (=> bm!43144 (= call!43149 ($colon$colon!592 e!574022 (ite c!103439 (h!22814 (t!30627 l!996)) (tuple2!15411 key!261 value!172))))))

(declare-fun c!103436 () Bool)

(assert (=> bm!43144 (= c!103436 c!103439)))

(declare-fun b!1019914 () Bool)

(declare-fun e!574023 () List!21620)

(declare-fun call!43148 () List!21620)

(assert (=> b!1019914 (= e!574023 call!43148)))

(declare-fun b!1019915 () Bool)

(declare-fun c!103437 () Bool)

(assert (=> b!1019915 (= c!103437 (and ((_ is Cons!21616) (t!30627 l!996)) (bvsgt (_1!7716 (h!22814 (t!30627 l!996))) key!261)))))

(assert (=> b!1019915 (= e!574021 e!574023)))

(declare-fun b!1019917 () Bool)

(assert (=> b!1019917 (= e!574022 (insertStrictlySorted!363 (t!30627 (t!30627 l!996)) key!261 value!172))))

(declare-fun b!1019918 () Bool)

(assert (=> b!1019918 (= e!574025 call!43149)))

(declare-fun b!1019919 () Bool)

(assert (=> b!1019919 (= e!574023 call!43148)))

(declare-fun d!122247 () Bool)

(declare-fun e!574024 () Bool)

(assert (=> d!122247 e!574024))

(declare-fun res!683649 () Bool)

(assert (=> d!122247 (=> (not res!683649) (not e!574024))))

(declare-fun lt!449752 () List!21620)

(assert (=> d!122247 (= res!683649 (isStrictlySorted!685 lt!449752))))

(assert (=> d!122247 (= lt!449752 e!574025)))

(assert (=> d!122247 (= c!103439 (and ((_ is Cons!21616) (t!30627 l!996)) (bvslt (_1!7716 (h!22814 (t!30627 l!996))) key!261)))))

(assert (=> d!122247 (isStrictlySorted!685 (t!30627 l!996))))

(assert (=> d!122247 (= (insertStrictlySorted!363 (t!30627 l!996) key!261 value!172) lt!449752)))

(declare-fun b!1019916 () Bool)

(assert (=> b!1019916 (= e!574022 (ite c!103438 (t!30627 (t!30627 l!996)) (ite c!103437 (Cons!21616 (h!22814 (t!30627 l!996)) (t!30627 (t!30627 l!996))) Nil!21617)))))

(declare-fun b!1019920 () Bool)

(declare-fun call!43147 () List!21620)

(assert (=> b!1019920 (= e!574021 call!43147)))

(declare-fun bm!43145 () Bool)

(assert (=> bm!43145 (= call!43148 call!43147)))

(declare-fun b!1019921 () Bool)

(declare-fun res!683650 () Bool)

(assert (=> b!1019921 (=> (not res!683650) (not e!574024))))

(assert (=> b!1019921 (= res!683650 (containsKey!545 lt!449752 key!261))))

(declare-fun b!1019922 () Bool)

(assert (=> b!1019922 (= e!574024 (contains!5911 lt!449752 (tuple2!15411 key!261 value!172)))))

(declare-fun bm!43146 () Bool)

(assert (=> bm!43146 (= call!43147 call!43149)))

(assert (= (and d!122247 c!103439) b!1019918))

(assert (= (and d!122247 (not c!103439)) b!1019913))

(assert (= (and b!1019913 c!103438) b!1019920))

(assert (= (and b!1019913 (not c!103438)) b!1019915))

(assert (= (and b!1019915 c!103437) b!1019914))

(assert (= (and b!1019915 (not c!103437)) b!1019919))

(assert (= (or b!1019914 b!1019919) bm!43145))

(assert (= (or b!1019920 bm!43145) bm!43146))

(assert (= (or b!1019918 bm!43146) bm!43144))

(assert (= (and bm!43144 c!103436) b!1019917))

(assert (= (and bm!43144 (not c!103436)) b!1019916))

(assert (= (and d!122247 res!683649) b!1019921))

(assert (= (and b!1019921 res!683650) b!1019922))

(declare-fun m!940077 () Bool)

(assert (=> b!1019922 m!940077))

(declare-fun m!940079 () Bool)

(assert (=> d!122247 m!940079))

(assert (=> d!122247 m!940027))

(declare-fun m!940081 () Bool)

(assert (=> b!1019917 m!940081))

(declare-fun m!940083 () Bool)

(assert (=> b!1019921 m!940083))

(declare-fun m!940085 () Bool)

(assert (=> bm!43144 m!940085))

(assert (=> b!1019788 d!122247))

(declare-fun d!122249 () Bool)

(declare-fun lt!449753 () Int)

(assert (=> d!122249 (>= lt!449753 0)))

(declare-fun e!574026 () Int)

(assert (=> d!122249 (= lt!449753 e!574026)))

(declare-fun c!103440 () Bool)

(assert (=> d!122249 (= c!103440 ((_ is Nil!21617) l!996))))

(assert (=> d!122249 (= (size!31160 l!996) lt!449753)))

(declare-fun b!1019923 () Bool)

(assert (=> b!1019923 (= e!574026 0)))

(declare-fun b!1019924 () Bool)

(assert (=> b!1019924 (= e!574026 (+ 1 (size!31160 (t!30627 l!996))))))

(assert (= (and d!122249 c!103440) b!1019923))

(assert (= (and d!122249 (not c!103440)) b!1019924))

(declare-fun m!940087 () Bool)

(assert (=> b!1019924 m!940087))

(assert (=> d!122217 d!122249))

(declare-fun d!122251 () Bool)

(declare-fun res!683651 () Bool)

(declare-fun e!574027 () Bool)

(assert (=> d!122251 (=> res!683651 e!574027)))

(assert (=> d!122251 (= res!683651 (and ((_ is Cons!21616) lt!449739) (= (_1!7716 (h!22814 lt!449739)) key!261)))))

(assert (=> d!122251 (= (containsKey!545 lt!449739 key!261) e!574027)))

(declare-fun b!1019925 () Bool)

(declare-fun e!574028 () Bool)

(assert (=> b!1019925 (= e!574027 e!574028)))

(declare-fun res!683652 () Bool)

(assert (=> b!1019925 (=> (not res!683652) (not e!574028))))

(assert (=> b!1019925 (= res!683652 (and (or (not ((_ is Cons!21616) lt!449739)) (bvsle (_1!7716 (h!22814 lt!449739)) key!261)) ((_ is Cons!21616) lt!449739) (bvslt (_1!7716 (h!22814 lt!449739)) key!261)))))

(declare-fun b!1019926 () Bool)

(assert (=> b!1019926 (= e!574028 (containsKey!545 (t!30627 lt!449739) key!261))))

(assert (= (and d!122251 (not res!683651)) b!1019925))

(assert (= (and b!1019925 res!683652) b!1019926))

(declare-fun m!940089 () Bool)

(assert (=> b!1019926 m!940089))

(assert (=> b!1019792 d!122251))

(declare-fun b!1019927 () Bool)

(declare-fun e!574029 () Bool)

(declare-fun tp!71186 () Bool)

(assert (=> b!1019927 (= e!574029 (and tp_is_empty!23763 tp!71186))))

(assert (=> b!1019836 (= tp!71179 e!574029)))

(assert (= (and b!1019836 ((_ is Cons!21616) (t!30627 (t!30627 l!996)))) b!1019927))

(check-sat (not bm!43144) (not b!1019924) (not b!1019922) tp_is_empty!23763 (not b!1019927) (not b!1019917) (not b!1019912) (not b!1019902) (not d!122245) (not b!1019926) (not b!1019904) (not d!122247) (not b!1019921) (not b!1019896) (not b!1019906))
(check-sat)
