; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!88620 () Bool)

(assert start!88620)

(declare-fun res!682910 () Bool)

(declare-fun e!573026 () Bool)

(assert (=> start!88620 (=> (not res!682910) (not e!573026))))

(declare-datatypes ((B!1660 0))(
  ( (B!1661 (val!11914 Int)) )
))
(declare-datatypes ((tuple2!15374 0))(
  ( (tuple2!15375 (_1!7698 (_ BitVec 64)) (_2!7698 B!1660)) )
))
(declare-datatypes ((List!21602 0))(
  ( (Nil!21599) (Cons!21598 (h!22796 tuple2!15374) (t!30603 List!21602)) )
))
(declare-fun l!996 () List!21602)

(declare-fun isStrictlySorted!667 (List!21602) Bool)

(assert (=> start!88620 (= res!682910 (isStrictlySorted!667 l!996))))

(assert (=> start!88620 e!573026))

(declare-fun e!573027 () Bool)

(assert (=> start!88620 e!573027))

(assert (=> start!88620 true))

(declare-fun tp_is_empty!23727 () Bool)

(assert (=> start!88620 tp_is_empty!23727))

(declare-fun b!1018416 () Bool)

(declare-fun res!682909 () Bool)

(assert (=> b!1018416 (=> (not res!682909) (not e!573026))))

(declare-fun key!261 () (_ BitVec 64))

(declare-fun containsKey!527 (List!21602 (_ BitVec 64)) Bool)

(assert (=> b!1018416 (= res!682909 (containsKey!527 l!996 key!261))))

(declare-fun b!1018417 () Bool)

(declare-fun value!172 () B!1660)

(declare-fun lt!449556 () List!21602)

(get-info :version)

(assert (=> b!1018417 (= e!573026 (and ((_ is Cons!21598) l!996) (= (_1!7698 (h!22796 l!996)) key!261) (not (= lt!449556 (Cons!21598 (tuple2!15375 key!261 value!172) (t!30603 l!996))))))))

(declare-fun insertStrictlySorted!348 (List!21602 (_ BitVec 64) B!1660) List!21602)

(assert (=> b!1018417 (= lt!449556 (insertStrictlySorted!348 l!996 key!261 value!172))))

(declare-fun b!1018418 () Bool)

(declare-fun tp!71059 () Bool)

(assert (=> b!1018418 (= e!573027 (and tp_is_empty!23727 tp!71059))))

(assert (= (and start!88620 res!682910) b!1018416))

(assert (= (and b!1018416 res!682909) b!1018417))

(assert (= (and start!88620 ((_ is Cons!21598) l!996)) b!1018418))

(declare-fun m!939307 () Bool)

(assert (=> start!88620 m!939307))

(declare-fun m!939309 () Bool)

(assert (=> b!1018416 m!939309))

(declare-fun m!939311 () Bool)

(assert (=> b!1018417 m!939311))

(check-sat (not b!1018417) tp_is_empty!23727 (not b!1018418) (not start!88620) (not b!1018416))
(check-sat)
(get-model)

(declare-fun b!1018488 () Bool)

(declare-fun res!682931 () Bool)

(declare-fun e!573064 () Bool)

(assert (=> b!1018488 (=> (not res!682931) (not e!573064))))

(declare-fun lt!449566 () List!21602)

(assert (=> b!1018488 (= res!682931 (containsKey!527 lt!449566 key!261))))

(declare-fun b!1018489 () Bool)

(declare-fun e!573068 () List!21602)

(declare-fun call!42980 () List!21602)

(assert (=> b!1018489 (= e!573068 call!42980)))

(declare-fun d!121857 () Bool)

(assert (=> d!121857 e!573064))

(declare-fun res!682930 () Bool)

(assert (=> d!121857 (=> (not res!682930) (not e!573064))))

(assert (=> d!121857 (= res!682930 (isStrictlySorted!667 lt!449566))))

(assert (=> d!121857 (= lt!449566 e!573068)))

(declare-fun c!103167 () Bool)

(assert (=> d!121857 (= c!103167 (and ((_ is Cons!21598) l!996) (bvslt (_1!7698 (h!22796 l!996)) key!261)))))

(assert (=> d!121857 (isStrictlySorted!667 l!996)))

(assert (=> d!121857 (= (insertStrictlySorted!348 l!996 key!261 value!172) lt!449566)))

(declare-fun b!1018490 () Bool)

(declare-fun e!573071 () List!21602)

(assert (=> b!1018490 (= e!573068 e!573071)))

(declare-fun c!103169 () Bool)

(assert (=> b!1018490 (= c!103169 (and ((_ is Cons!21598) l!996) (= (_1!7698 (h!22796 l!996)) key!261)))))

(declare-fun b!1018491 () Bool)

(declare-fun e!573066 () List!21602)

(declare-fun call!42976 () List!21602)

(assert (=> b!1018491 (= e!573066 call!42976)))

(declare-fun b!1018493 () Bool)

(declare-fun call!42978 () List!21602)

(assert (=> b!1018493 (= e!573071 call!42978)))

(declare-fun b!1018495 () Bool)

(declare-fun e!573070 () List!21602)

(assert (=> b!1018495 (= e!573070 (insertStrictlySorted!348 (t!30603 l!996) key!261 value!172))))

(declare-fun b!1018497 () Bool)

(declare-fun c!103171 () Bool)

(assert (=> b!1018497 (= c!103171 (and ((_ is Cons!21598) l!996) (bvsgt (_1!7698 (h!22796 l!996)) key!261)))))

(assert (=> b!1018497 (= e!573071 e!573066)))

(declare-fun b!1018499 () Bool)

(declare-fun contains!5900 (List!21602 tuple2!15374) Bool)

(assert (=> b!1018499 (= e!573064 (contains!5900 lt!449566 (tuple2!15375 key!261 value!172)))))

(declare-fun bm!42973 () Bool)

(declare-fun $colon$colon!579 (List!21602 tuple2!15374) List!21602)

(assert (=> bm!42973 (= call!42980 ($colon$colon!579 e!573070 (ite c!103167 (h!22796 l!996) (tuple2!15375 key!261 value!172))))))

(declare-fun c!103166 () Bool)

(assert (=> bm!42973 (= c!103166 c!103167)))

(declare-fun bm!42974 () Bool)

(assert (=> bm!42974 (= call!42976 call!42978)))

(declare-fun bm!42975 () Bool)

(assert (=> bm!42975 (= call!42978 call!42980)))

(declare-fun b!1018503 () Bool)

(assert (=> b!1018503 (= e!573070 (ite c!103169 (t!30603 l!996) (ite c!103171 (Cons!21598 (h!22796 l!996) (t!30603 l!996)) Nil!21599)))))

(declare-fun b!1018504 () Bool)

(assert (=> b!1018504 (= e!573066 call!42976)))

(assert (= (and d!121857 c!103167) b!1018489))

(assert (= (and d!121857 (not c!103167)) b!1018490))

(assert (= (and b!1018490 c!103169) b!1018493))

(assert (= (and b!1018490 (not c!103169)) b!1018497))

(assert (= (and b!1018497 c!103171) b!1018504))

(assert (= (and b!1018497 (not c!103171)) b!1018491))

(assert (= (or b!1018504 b!1018491) bm!42974))

(assert (= (or b!1018493 bm!42974) bm!42975))

(assert (= (or b!1018489 bm!42975) bm!42973))

(assert (= (and bm!42973 c!103166) b!1018495))

(assert (= (and bm!42973 (not c!103166)) b!1018503))

(assert (= (and d!121857 res!682930) b!1018488))

(assert (= (and b!1018488 res!682931) b!1018499))

(declare-fun m!939321 () Bool)

(assert (=> bm!42973 m!939321))

(declare-fun m!939325 () Bool)

(assert (=> b!1018499 m!939325))

(declare-fun m!939327 () Bool)

(assert (=> d!121857 m!939327))

(assert (=> d!121857 m!939307))

(declare-fun m!939333 () Bool)

(assert (=> b!1018495 m!939333))

(declare-fun m!939337 () Bool)

(assert (=> b!1018488 m!939337))

(assert (=> b!1018417 d!121857))

(declare-fun d!121863 () Bool)

(declare-fun res!682947 () Bool)

(declare-fun e!573091 () Bool)

(assert (=> d!121863 (=> res!682947 e!573091)))

(assert (=> d!121863 (= res!682947 (and ((_ is Cons!21598) l!996) (= (_1!7698 (h!22796 l!996)) key!261)))))

(assert (=> d!121863 (= (containsKey!527 l!996 key!261) e!573091)))

(declare-fun b!1018530 () Bool)

(declare-fun e!573092 () Bool)

(assert (=> b!1018530 (= e!573091 e!573092)))

(declare-fun res!682948 () Bool)

(assert (=> b!1018530 (=> (not res!682948) (not e!573092))))

(assert (=> b!1018530 (= res!682948 (and (or (not ((_ is Cons!21598) l!996)) (bvsle (_1!7698 (h!22796 l!996)) key!261)) ((_ is Cons!21598) l!996) (bvslt (_1!7698 (h!22796 l!996)) key!261)))))

(declare-fun b!1018531 () Bool)

(assert (=> b!1018531 (= e!573092 (containsKey!527 (t!30603 l!996) key!261))))

(assert (= (and d!121863 (not res!682947)) b!1018530))

(assert (= (and b!1018530 res!682948) b!1018531))

(declare-fun m!939349 () Bool)

(assert (=> b!1018531 m!939349))

(assert (=> b!1018416 d!121863))

(declare-fun d!121869 () Bool)

(declare-fun res!682965 () Bool)

(declare-fun e!573109 () Bool)

(assert (=> d!121869 (=> res!682965 e!573109)))

(assert (=> d!121869 (= res!682965 (or ((_ is Nil!21599) l!996) ((_ is Nil!21599) (t!30603 l!996))))))

(assert (=> d!121869 (= (isStrictlySorted!667 l!996) e!573109)))

(declare-fun b!1018548 () Bool)

(declare-fun e!573110 () Bool)

(assert (=> b!1018548 (= e!573109 e!573110)))

(declare-fun res!682966 () Bool)

(assert (=> b!1018548 (=> (not res!682966) (not e!573110))))

(assert (=> b!1018548 (= res!682966 (bvslt (_1!7698 (h!22796 l!996)) (_1!7698 (h!22796 (t!30603 l!996)))))))

(declare-fun b!1018549 () Bool)

(assert (=> b!1018549 (= e!573110 (isStrictlySorted!667 (t!30603 l!996)))))

(assert (= (and d!121869 (not res!682965)) b!1018548))

(assert (= (and b!1018548 res!682966) b!1018549))

(declare-fun m!939355 () Bool)

(assert (=> b!1018549 m!939355))

(assert (=> start!88620 d!121869))

(declare-fun b!1018566 () Bool)

(declare-fun e!573121 () Bool)

(declare-fun tp!71069 () Bool)

(assert (=> b!1018566 (= e!573121 (and tp_is_empty!23727 tp!71069))))

(assert (=> b!1018418 (= tp!71059 e!573121)))

(assert (= (and b!1018418 ((_ is Cons!21598) (t!30603 l!996))) b!1018566))

(check-sat (not b!1018531) tp_is_empty!23727 (not b!1018488) (not b!1018566) (not b!1018549) (not b!1018495) (not bm!42973) (not b!1018499) (not d!121857))
(check-sat)
(get-model)

(declare-fun d!121875 () Bool)

(declare-fun res!682971 () Bool)

(declare-fun e!573124 () Bool)

(assert (=> d!121875 (=> res!682971 e!573124)))

(assert (=> d!121875 (= res!682971 (or ((_ is Nil!21599) lt!449566) ((_ is Nil!21599) (t!30603 lt!449566))))))

(assert (=> d!121875 (= (isStrictlySorted!667 lt!449566) e!573124)))

(declare-fun b!1018569 () Bool)

(declare-fun e!573125 () Bool)

(assert (=> b!1018569 (= e!573124 e!573125)))

(declare-fun res!682972 () Bool)

(assert (=> b!1018569 (=> (not res!682972) (not e!573125))))

(assert (=> b!1018569 (= res!682972 (bvslt (_1!7698 (h!22796 lt!449566)) (_1!7698 (h!22796 (t!30603 lt!449566)))))))

(declare-fun b!1018570 () Bool)

(assert (=> b!1018570 (= e!573125 (isStrictlySorted!667 (t!30603 lt!449566)))))

(assert (= (and d!121875 (not res!682971)) b!1018569))

(assert (= (and b!1018569 res!682972) b!1018570))

(declare-fun m!939361 () Bool)

(assert (=> b!1018570 m!939361))

(assert (=> d!121857 d!121875))

(assert (=> d!121857 d!121869))

(declare-fun lt!449571 () Bool)

(declare-fun d!121877 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!485 (List!21602) (InoxSet tuple2!15374))

(assert (=> d!121877 (= lt!449571 (select (content!485 lt!449566) (tuple2!15375 key!261 value!172)))))

(declare-fun e!573130 () Bool)

(assert (=> d!121877 (= lt!449571 e!573130)))

(declare-fun res!682977 () Bool)

(assert (=> d!121877 (=> (not res!682977) (not e!573130))))

(assert (=> d!121877 (= res!682977 ((_ is Cons!21598) lt!449566))))

(assert (=> d!121877 (= (contains!5900 lt!449566 (tuple2!15375 key!261 value!172)) lt!449571)))

(declare-fun b!1018575 () Bool)

(declare-fun e!573131 () Bool)

(assert (=> b!1018575 (= e!573130 e!573131)))

(declare-fun res!682978 () Bool)

(assert (=> b!1018575 (=> res!682978 e!573131)))

(assert (=> b!1018575 (= res!682978 (= (h!22796 lt!449566) (tuple2!15375 key!261 value!172)))))

(declare-fun b!1018576 () Bool)

(assert (=> b!1018576 (= e!573131 (contains!5900 (t!30603 lt!449566) (tuple2!15375 key!261 value!172)))))

(assert (= (and d!121877 res!682977) b!1018575))

(assert (= (and b!1018575 (not res!682978)) b!1018576))

(declare-fun m!939363 () Bool)

(assert (=> d!121877 m!939363))

(declare-fun m!939365 () Bool)

(assert (=> d!121877 m!939365))

(declare-fun m!939367 () Bool)

(assert (=> b!1018576 m!939367))

(assert (=> b!1018499 d!121877))

(declare-fun d!121879 () Bool)

(declare-fun res!682979 () Bool)

(declare-fun e!573132 () Bool)

(assert (=> d!121879 (=> res!682979 e!573132)))

(assert (=> d!121879 (= res!682979 (or ((_ is Nil!21599) (t!30603 l!996)) ((_ is Nil!21599) (t!30603 (t!30603 l!996)))))))

(assert (=> d!121879 (= (isStrictlySorted!667 (t!30603 l!996)) e!573132)))

(declare-fun b!1018577 () Bool)

(declare-fun e!573133 () Bool)

(assert (=> b!1018577 (= e!573132 e!573133)))

(declare-fun res!682980 () Bool)

(assert (=> b!1018577 (=> (not res!682980) (not e!573133))))

(assert (=> b!1018577 (= res!682980 (bvslt (_1!7698 (h!22796 (t!30603 l!996))) (_1!7698 (h!22796 (t!30603 (t!30603 l!996))))))))

(declare-fun b!1018578 () Bool)

(assert (=> b!1018578 (= e!573133 (isStrictlySorted!667 (t!30603 (t!30603 l!996))))))

(assert (= (and d!121879 (not res!682979)) b!1018577))

(assert (= (and b!1018577 res!682980) b!1018578))

(declare-fun m!939369 () Bool)

(assert (=> b!1018578 m!939369))

(assert (=> b!1018549 d!121879))

(declare-fun d!121881 () Bool)

(declare-fun res!682981 () Bool)

(declare-fun e!573134 () Bool)

(assert (=> d!121881 (=> res!682981 e!573134)))

(assert (=> d!121881 (= res!682981 (and ((_ is Cons!21598) (t!30603 l!996)) (= (_1!7698 (h!22796 (t!30603 l!996))) key!261)))))

(assert (=> d!121881 (= (containsKey!527 (t!30603 l!996) key!261) e!573134)))

(declare-fun b!1018579 () Bool)

(declare-fun e!573135 () Bool)

(assert (=> b!1018579 (= e!573134 e!573135)))

(declare-fun res!682982 () Bool)

(assert (=> b!1018579 (=> (not res!682982) (not e!573135))))

(assert (=> b!1018579 (= res!682982 (and (or (not ((_ is Cons!21598) (t!30603 l!996))) (bvsle (_1!7698 (h!22796 (t!30603 l!996))) key!261)) ((_ is Cons!21598) (t!30603 l!996)) (bvslt (_1!7698 (h!22796 (t!30603 l!996))) key!261)))))

(declare-fun b!1018580 () Bool)

(assert (=> b!1018580 (= e!573135 (containsKey!527 (t!30603 (t!30603 l!996)) key!261))))

(assert (= (and d!121881 (not res!682981)) b!1018579))

(assert (= (and b!1018579 res!682982) b!1018580))

(declare-fun m!939371 () Bool)

(assert (=> b!1018580 m!939371))

(assert (=> b!1018531 d!121881))

(declare-fun d!121883 () Bool)

(assert (=> d!121883 (= ($colon$colon!579 e!573070 (ite c!103167 (h!22796 l!996) (tuple2!15375 key!261 value!172))) (Cons!21598 (ite c!103167 (h!22796 l!996) (tuple2!15375 key!261 value!172)) e!573070))))

(assert (=> bm!42973 d!121883))

(declare-fun d!121885 () Bool)

(declare-fun res!682983 () Bool)

(declare-fun e!573136 () Bool)

(assert (=> d!121885 (=> res!682983 e!573136)))

(assert (=> d!121885 (= res!682983 (and ((_ is Cons!21598) lt!449566) (= (_1!7698 (h!22796 lt!449566)) key!261)))))

(assert (=> d!121885 (= (containsKey!527 lt!449566 key!261) e!573136)))

(declare-fun b!1018581 () Bool)

(declare-fun e!573137 () Bool)

(assert (=> b!1018581 (= e!573136 e!573137)))

(declare-fun res!682984 () Bool)

(assert (=> b!1018581 (=> (not res!682984) (not e!573137))))

(assert (=> b!1018581 (= res!682984 (and (or (not ((_ is Cons!21598) lt!449566)) (bvsle (_1!7698 (h!22796 lt!449566)) key!261)) ((_ is Cons!21598) lt!449566) (bvslt (_1!7698 (h!22796 lt!449566)) key!261)))))

(declare-fun b!1018582 () Bool)

(assert (=> b!1018582 (= e!573137 (containsKey!527 (t!30603 lt!449566) key!261))))

(assert (= (and d!121885 (not res!682983)) b!1018581))

(assert (= (and b!1018581 res!682984) b!1018582))

(declare-fun m!939373 () Bool)

(assert (=> b!1018582 m!939373))

(assert (=> b!1018488 d!121885))

(declare-fun b!1018583 () Bool)

(declare-fun res!682986 () Bool)

(declare-fun e!573138 () Bool)

(assert (=> b!1018583 (=> (not res!682986) (not e!573138))))

(declare-fun lt!449572 () List!21602)

(assert (=> b!1018583 (= res!682986 (containsKey!527 lt!449572 key!261))))

(declare-fun b!1018584 () Bool)

(declare-fun e!573140 () List!21602)

(declare-fun call!42987 () List!21602)

(assert (=> b!1018584 (= e!573140 call!42987)))

(declare-fun d!121887 () Bool)

(assert (=> d!121887 e!573138))

(declare-fun res!682985 () Bool)

(assert (=> d!121887 (=> (not res!682985) (not e!573138))))

(assert (=> d!121887 (= res!682985 (isStrictlySorted!667 lt!449572))))

(assert (=> d!121887 (= lt!449572 e!573140)))

(declare-fun c!103179 () Bool)

(assert (=> d!121887 (= c!103179 (and ((_ is Cons!21598) (t!30603 l!996)) (bvslt (_1!7698 (h!22796 (t!30603 l!996))) key!261)))))

(assert (=> d!121887 (isStrictlySorted!667 (t!30603 l!996))))

(assert (=> d!121887 (= (insertStrictlySorted!348 (t!30603 l!996) key!261 value!172) lt!449572)))

(declare-fun b!1018585 () Bool)

(declare-fun e!573142 () List!21602)

(assert (=> b!1018585 (= e!573140 e!573142)))

(declare-fun c!103180 () Bool)

(assert (=> b!1018585 (= c!103180 (and ((_ is Cons!21598) (t!30603 l!996)) (= (_1!7698 (h!22796 (t!30603 l!996))) key!261)))))

(declare-fun b!1018586 () Bool)

(declare-fun e!573139 () List!21602)

(declare-fun call!42985 () List!21602)

(assert (=> b!1018586 (= e!573139 call!42985)))

(declare-fun b!1018587 () Bool)

(declare-fun call!42986 () List!21602)

(assert (=> b!1018587 (= e!573142 call!42986)))

(declare-fun e!573141 () List!21602)

(declare-fun b!1018588 () Bool)

(assert (=> b!1018588 (= e!573141 (insertStrictlySorted!348 (t!30603 (t!30603 l!996)) key!261 value!172))))

(declare-fun b!1018589 () Bool)

(declare-fun c!103181 () Bool)

(assert (=> b!1018589 (= c!103181 (and ((_ is Cons!21598) (t!30603 l!996)) (bvsgt (_1!7698 (h!22796 (t!30603 l!996))) key!261)))))

(assert (=> b!1018589 (= e!573142 e!573139)))

(declare-fun b!1018590 () Bool)

(assert (=> b!1018590 (= e!573138 (contains!5900 lt!449572 (tuple2!15375 key!261 value!172)))))

(declare-fun bm!42982 () Bool)

(assert (=> bm!42982 (= call!42987 ($colon$colon!579 e!573141 (ite c!103179 (h!22796 (t!30603 l!996)) (tuple2!15375 key!261 value!172))))))

(declare-fun c!103178 () Bool)

(assert (=> bm!42982 (= c!103178 c!103179)))

(declare-fun bm!42983 () Bool)

(assert (=> bm!42983 (= call!42985 call!42986)))

(declare-fun bm!42984 () Bool)

(assert (=> bm!42984 (= call!42986 call!42987)))

(declare-fun b!1018591 () Bool)

(assert (=> b!1018591 (= e!573141 (ite c!103180 (t!30603 (t!30603 l!996)) (ite c!103181 (Cons!21598 (h!22796 (t!30603 l!996)) (t!30603 (t!30603 l!996))) Nil!21599)))))

(declare-fun b!1018592 () Bool)

(assert (=> b!1018592 (= e!573139 call!42985)))

(assert (= (and d!121887 c!103179) b!1018584))

(assert (= (and d!121887 (not c!103179)) b!1018585))

(assert (= (and b!1018585 c!103180) b!1018587))

(assert (= (and b!1018585 (not c!103180)) b!1018589))

(assert (= (and b!1018589 c!103181) b!1018592))

(assert (= (and b!1018589 (not c!103181)) b!1018586))

(assert (= (or b!1018592 b!1018586) bm!42983))

(assert (= (or b!1018587 bm!42983) bm!42984))

(assert (= (or b!1018584 bm!42984) bm!42982))

(assert (= (and bm!42982 c!103178) b!1018588))

(assert (= (and bm!42982 (not c!103178)) b!1018591))

(assert (= (and d!121887 res!682985) b!1018583))

(assert (= (and b!1018583 res!682986) b!1018590))

(declare-fun m!939375 () Bool)

(assert (=> bm!42982 m!939375))

(declare-fun m!939377 () Bool)

(assert (=> b!1018590 m!939377))

(declare-fun m!939379 () Bool)

(assert (=> d!121887 m!939379))

(assert (=> d!121887 m!939355))

(declare-fun m!939381 () Bool)

(assert (=> b!1018588 m!939381))

(declare-fun m!939383 () Bool)

(assert (=> b!1018583 m!939383))

(assert (=> b!1018495 d!121887))

(declare-fun b!1018593 () Bool)

(declare-fun e!573143 () Bool)

(declare-fun tp!71072 () Bool)

(assert (=> b!1018593 (= e!573143 (and tp_is_empty!23727 tp!71072))))

(assert (=> b!1018566 (= tp!71069 e!573143)))

(assert (= (and b!1018566 ((_ is Cons!21598) (t!30603 (t!30603 l!996)))) b!1018593))

(check-sat tp_is_empty!23727 (not b!1018590) (not b!1018582) (not b!1018583) (not bm!42982) (not d!121887) (not d!121877) (not b!1018580) (not b!1018593) (not b!1018576) (not b!1018578) (not b!1018588) (not b!1018570))
(check-sat)
