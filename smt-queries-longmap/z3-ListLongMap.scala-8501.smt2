; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103850 () Bool)

(assert start!103850)

(declare-fun b!1242497 () Bool)

(declare-fun res!828566 () Bool)

(declare-fun e!704371 () Bool)

(assert (=> b!1242497 (=> (not res!828566) (not e!704371))))

(declare-datatypes ((B!1832 0))(
  ( (B!1833 (val!15678 Int)) )
))
(declare-datatypes ((tuple2!20244 0))(
  ( (tuple2!20245 (_1!10133 (_ BitVec 64)) (_2!10133 B!1832)) )
))
(declare-datatypes ((List!27368 0))(
  ( (Nil!27365) (Cons!27364 (h!28582 tuple2!20244) (t!40823 List!27368)) )
))
(declare-fun l!644 () List!27368)

(get-info :version)

(assert (=> b!1242497 (= res!828566 ((_ is Cons!27364) l!644))))

(declare-fun b!1242498 () Bool)

(declare-fun e!704372 () Bool)

(declare-fun tp_is_empty!31231 () Bool)

(declare-fun tp!92609 () Bool)

(assert (=> b!1242498 (= e!704372 (and tp_is_empty!31231 tp!92609))))

(declare-fun b!1242499 () Bool)

(declare-fun res!828565 () Bool)

(assert (=> b!1242499 (=> (not res!828565) (not e!704371))))

(declare-fun isStrictlySorted!733 (List!27368) Bool)

(assert (=> b!1242499 (= res!828565 (isStrictlySorted!733 l!644))))

(declare-fun b!1242500 () Bool)

(declare-fun res!828567 () Bool)

(assert (=> b!1242500 (=> (not res!828567) (not e!704371))))

(assert (=> b!1242500 (= res!828567 (isStrictlySorted!733 (t!40823 l!644)))))

(declare-fun v1!20 () B!1832)

(declare-fun key1!25 () (_ BitVec 64))

(declare-fun b!1242501 () Bool)

(declare-fun insertStrictlySorted!432 (List!27368 (_ BitVec 64) B!1832) List!27368)

(assert (=> b!1242501 (= e!704371 (not (isStrictlySorted!733 (insertStrictlySorted!432 l!644 key1!25 v1!20))))))

(declare-fun key2!15 () (_ BitVec 64))

(declare-fun removeStrictlySorted!123 (List!27368 (_ BitVec 64)) List!27368)

(assert (=> b!1242501 (= (insertStrictlySorted!432 (removeStrictlySorted!123 (t!40823 l!644) key2!15) key1!25 v1!20) (removeStrictlySorted!123 (insertStrictlySorted!432 (t!40823 l!644) key1!25 v1!20) key2!15))))

(declare-datatypes ((Unit!41228 0))(
  ( (Unit!41229) )
))
(declare-fun lt!562586 () Unit!41228)

(declare-fun lemmaInsertAndRemoveStrictlySortedCommutative!13 (List!27368 (_ BitVec 64) B!1832 (_ BitVec 64)) Unit!41228)

(assert (=> b!1242501 (= lt!562586 (lemmaInsertAndRemoveStrictlySortedCommutative!13 (t!40823 l!644) key1!25 v1!20 key2!15))))

(declare-fun res!828564 () Bool)

(assert (=> start!103850 (=> (not res!828564) (not e!704371))))

(assert (=> start!103850 (= res!828564 (not (= key1!25 key2!15)))))

(assert (=> start!103850 e!704371))

(assert (=> start!103850 true))

(assert (=> start!103850 e!704372))

(assert (=> start!103850 tp_is_empty!31231))

(assert (= (and start!103850 res!828564) b!1242499))

(assert (= (and b!1242499 res!828565) b!1242497))

(assert (= (and b!1242497 res!828566) b!1242500))

(assert (= (and b!1242500 res!828567) b!1242501))

(assert (= (and start!103850 ((_ is Cons!27364) l!644)) b!1242498))

(declare-fun m!1145987 () Bool)

(assert (=> b!1242499 m!1145987))

(declare-fun m!1145989 () Bool)

(assert (=> b!1242500 m!1145989))

(declare-fun m!1145991 () Bool)

(assert (=> b!1242501 m!1145991))

(declare-fun m!1145993 () Bool)

(assert (=> b!1242501 m!1145993))

(assert (=> b!1242501 m!1145991))

(declare-fun m!1145995 () Bool)

(assert (=> b!1242501 m!1145995))

(declare-fun m!1145997 () Bool)

(assert (=> b!1242501 m!1145997))

(assert (=> b!1242501 m!1145995))

(declare-fun m!1145999 () Bool)

(assert (=> b!1242501 m!1145999))

(declare-fun m!1146001 () Bool)

(assert (=> b!1242501 m!1146001))

(assert (=> b!1242501 m!1145999))

(declare-fun m!1146003 () Bool)

(assert (=> b!1242501 m!1146003))

(check-sat (not b!1242499) (not b!1242498) tp_is_empty!31231 (not b!1242501) (not b!1242500))
(check-sat)
(get-model)

(declare-fun d!136899 () Bool)

(declare-fun e!704401 () Bool)

(assert (=> d!136899 e!704401))

(declare-fun res!828602 () Bool)

(assert (=> d!136899 (=> (not res!828602) (not e!704401))))

(declare-fun lt!562595 () List!27368)

(assert (=> d!136899 (= res!828602 (isStrictlySorted!733 lt!562595))))

(declare-fun e!704400 () List!27368)

(assert (=> d!136899 (= lt!562595 e!704400)))

(declare-fun c!121775 () Bool)

(assert (=> d!136899 (= c!121775 (and ((_ is Cons!27364) (insertStrictlySorted!432 (t!40823 l!644) key1!25 v1!20)) (= (_1!10133 (h!28582 (insertStrictlySorted!432 (t!40823 l!644) key1!25 v1!20))) key2!15)))))

(assert (=> d!136899 (isStrictlySorted!733 (insertStrictlySorted!432 (t!40823 l!644) key1!25 v1!20))))

(assert (=> d!136899 (= (removeStrictlySorted!123 (insertStrictlySorted!432 (t!40823 l!644) key1!25 v1!20) key2!15) lt!562595)))

(declare-fun b!1242550 () Bool)

(declare-fun e!704399 () List!27368)

(assert (=> b!1242550 (= e!704400 e!704399)))

(declare-fun c!121774 () Bool)

(assert (=> b!1242550 (= c!121774 (and ((_ is Cons!27364) (insertStrictlySorted!432 (t!40823 l!644) key1!25 v1!20)) (not (= (_1!10133 (h!28582 (insertStrictlySorted!432 (t!40823 l!644) key1!25 v1!20))) key2!15))))))

(declare-fun b!1242551 () Bool)

(declare-fun containsKey!605 (List!27368 (_ BitVec 64)) Bool)

(assert (=> b!1242551 (= e!704401 (not (containsKey!605 lt!562595 key2!15)))))

(declare-fun b!1242552 () Bool)

(declare-fun $colon$colon!618 (List!27368 tuple2!20244) List!27368)

(assert (=> b!1242552 (= e!704399 ($colon$colon!618 (removeStrictlySorted!123 (t!40823 (insertStrictlySorted!432 (t!40823 l!644) key1!25 v1!20)) key2!15) (h!28582 (insertStrictlySorted!432 (t!40823 l!644) key1!25 v1!20))))))

(declare-fun b!1242553 () Bool)

(assert (=> b!1242553 (= e!704399 Nil!27365)))

(declare-fun b!1242554 () Bool)

(assert (=> b!1242554 (= e!704400 (t!40823 (insertStrictlySorted!432 (t!40823 l!644) key1!25 v1!20)))))

(assert (= (and d!136899 c!121775) b!1242554))

(assert (= (and d!136899 (not c!121775)) b!1242550))

(assert (= (and b!1242550 c!121774) b!1242552))

(assert (= (and b!1242550 (not c!121774)) b!1242553))

(assert (= (and d!136899 res!828602) b!1242551))

(declare-fun m!1146043 () Bool)

(assert (=> d!136899 m!1146043))

(assert (=> d!136899 m!1145995))

(declare-fun m!1146045 () Bool)

(assert (=> d!136899 m!1146045))

(declare-fun m!1146047 () Bool)

(assert (=> b!1242551 m!1146047))

(declare-fun m!1146049 () Bool)

(assert (=> b!1242552 m!1146049))

(assert (=> b!1242552 m!1146049))

(declare-fun m!1146051 () Bool)

(assert (=> b!1242552 m!1146051))

(assert (=> b!1242501 d!136899))

(declare-fun b!1242624 () Bool)

(declare-fun e!704441 () List!27368)

(declare-fun e!704444 () List!27368)

(assert (=> b!1242624 (= e!704441 e!704444)))

(declare-fun c!121803 () Bool)

(assert (=> b!1242624 (= c!121803 (and ((_ is Cons!27364) (removeStrictlySorted!123 (t!40823 l!644) key2!15)) (= (_1!10133 (h!28582 (removeStrictlySorted!123 (t!40823 l!644) key2!15))) key1!25)))))

(declare-fun e!704445 () Bool)

(declare-fun lt!562605 () List!27368)

(declare-fun b!1242626 () Bool)

(declare-fun contains!7421 (List!27368 tuple2!20244) Bool)

(assert (=> b!1242626 (= e!704445 (contains!7421 lt!562605 (tuple2!20245 key1!25 v1!20)))))

(declare-fun b!1242627 () Bool)

(declare-fun res!828620 () Bool)

(assert (=> b!1242627 (=> (not res!828620) (not e!704445))))

(assert (=> b!1242627 (= res!828620 (containsKey!605 lt!562605 key1!25))))

(declare-fun c!121805 () Bool)

(declare-fun b!1242628 () Bool)

(assert (=> b!1242628 (= c!121805 (and ((_ is Cons!27364) (removeStrictlySorted!123 (t!40823 l!644) key2!15)) (bvsgt (_1!10133 (h!28582 (removeStrictlySorted!123 (t!40823 l!644) key2!15))) key1!25)))))

(declare-fun e!704442 () List!27368)

(assert (=> b!1242628 (= e!704444 e!704442)))

(declare-fun bm!61279 () Bool)

(declare-fun call!61282 () List!27368)

(declare-fun call!61283 () List!27368)

(assert (=> bm!61279 (= call!61282 call!61283)))

(declare-fun bm!61280 () Bool)

(declare-fun e!704443 () List!27368)

(declare-fun c!121804 () Bool)

(assert (=> bm!61280 (= call!61283 ($colon$colon!618 e!704443 (ite c!121804 (h!28582 (removeStrictlySorted!123 (t!40823 l!644) key2!15)) (tuple2!20245 key1!25 v1!20))))))

(declare-fun c!121802 () Bool)

(assert (=> bm!61280 (= c!121802 c!121804)))

(declare-fun b!1242629 () Bool)

(declare-fun call!61284 () List!27368)

(assert (=> b!1242629 (= e!704442 call!61284)))

(declare-fun bm!61281 () Bool)

(assert (=> bm!61281 (= call!61284 call!61282)))

(declare-fun d!136905 () Bool)

(assert (=> d!136905 e!704445))

(declare-fun res!828621 () Bool)

(assert (=> d!136905 (=> (not res!828621) (not e!704445))))

(assert (=> d!136905 (= res!828621 (isStrictlySorted!733 lt!562605))))

(assert (=> d!136905 (= lt!562605 e!704441)))

(assert (=> d!136905 (= c!121804 (and ((_ is Cons!27364) (removeStrictlySorted!123 (t!40823 l!644) key2!15)) (bvslt (_1!10133 (h!28582 (removeStrictlySorted!123 (t!40823 l!644) key2!15))) key1!25)))))

(assert (=> d!136905 (isStrictlySorted!733 (removeStrictlySorted!123 (t!40823 l!644) key2!15))))

(assert (=> d!136905 (= (insertStrictlySorted!432 (removeStrictlySorted!123 (t!40823 l!644) key2!15) key1!25 v1!20) lt!562605)))

(declare-fun b!1242625 () Bool)

(assert (=> b!1242625 (= e!704444 call!61282)))

(declare-fun b!1242630 () Bool)

(assert (=> b!1242630 (= e!704443 (insertStrictlySorted!432 (t!40823 (removeStrictlySorted!123 (t!40823 l!644) key2!15)) key1!25 v1!20))))

(declare-fun b!1242631 () Bool)

(assert (=> b!1242631 (= e!704443 (ite c!121803 (t!40823 (removeStrictlySorted!123 (t!40823 l!644) key2!15)) (ite c!121805 (Cons!27364 (h!28582 (removeStrictlySorted!123 (t!40823 l!644) key2!15)) (t!40823 (removeStrictlySorted!123 (t!40823 l!644) key2!15))) Nil!27365)))))

(declare-fun b!1242632 () Bool)

(assert (=> b!1242632 (= e!704442 call!61284)))

(declare-fun b!1242633 () Bool)

(assert (=> b!1242633 (= e!704441 call!61283)))

(assert (= (and d!136905 c!121804) b!1242633))

(assert (= (and d!136905 (not c!121804)) b!1242624))

(assert (= (and b!1242624 c!121803) b!1242625))

(assert (= (and b!1242624 (not c!121803)) b!1242628))

(assert (= (and b!1242628 c!121805) b!1242632))

(assert (= (and b!1242628 (not c!121805)) b!1242629))

(assert (= (or b!1242632 b!1242629) bm!61281))

(assert (= (or b!1242625 bm!61281) bm!61279))

(assert (= (or b!1242633 bm!61279) bm!61280))

(assert (= (and bm!61280 c!121802) b!1242630))

(assert (= (and bm!61280 (not c!121802)) b!1242631))

(assert (= (and d!136905 res!828621) b!1242627))

(assert (= (and b!1242627 res!828620) b!1242626))

(declare-fun m!1146065 () Bool)

(assert (=> b!1242630 m!1146065))

(declare-fun m!1146067 () Bool)

(assert (=> bm!61280 m!1146067))

(declare-fun m!1146069 () Bool)

(assert (=> b!1242627 m!1146069))

(declare-fun m!1146071 () Bool)

(assert (=> d!136905 m!1146071))

(assert (=> d!136905 m!1145999))

(declare-fun m!1146073 () Bool)

(assert (=> d!136905 m!1146073))

(declare-fun m!1146075 () Bool)

(assert (=> b!1242626 m!1146075))

(assert (=> b!1242501 d!136905))

(declare-fun d!136913 () Bool)

(declare-fun res!828630 () Bool)

(declare-fun e!704457 () Bool)

(assert (=> d!136913 (=> res!828630 e!704457)))

(assert (=> d!136913 (= res!828630 (or ((_ is Nil!27365) (insertStrictlySorted!432 l!644 key1!25 v1!20)) ((_ is Nil!27365) (t!40823 (insertStrictlySorted!432 l!644 key1!25 v1!20)))))))

(assert (=> d!136913 (= (isStrictlySorted!733 (insertStrictlySorted!432 l!644 key1!25 v1!20)) e!704457)))

(declare-fun b!1242650 () Bool)

(declare-fun e!704458 () Bool)

(assert (=> b!1242650 (= e!704457 e!704458)))

(declare-fun res!828631 () Bool)

(assert (=> b!1242650 (=> (not res!828631) (not e!704458))))

(assert (=> b!1242650 (= res!828631 (bvslt (_1!10133 (h!28582 (insertStrictlySorted!432 l!644 key1!25 v1!20))) (_1!10133 (h!28582 (t!40823 (insertStrictlySorted!432 l!644 key1!25 v1!20))))))))

(declare-fun b!1242651 () Bool)

(assert (=> b!1242651 (= e!704458 (isStrictlySorted!733 (t!40823 (insertStrictlySorted!432 l!644 key1!25 v1!20))))))

(assert (= (and d!136913 (not res!828630)) b!1242650))

(assert (= (and b!1242650 res!828631) b!1242651))

(declare-fun m!1146077 () Bool)

(assert (=> b!1242651 m!1146077))

(assert (=> b!1242501 d!136913))

(declare-fun b!1242657 () Bool)

(declare-fun e!704462 () List!27368)

(declare-fun e!704465 () List!27368)

(assert (=> b!1242657 (= e!704462 e!704465)))

(declare-fun c!121813 () Bool)

(assert (=> b!1242657 (= c!121813 (and ((_ is Cons!27364) l!644) (= (_1!10133 (h!28582 l!644)) key1!25)))))

(declare-fun b!1242659 () Bool)

(declare-fun lt!562608 () List!27368)

(declare-fun e!704466 () Bool)

(assert (=> b!1242659 (= e!704466 (contains!7421 lt!562608 (tuple2!20245 key1!25 v1!20)))))

(declare-fun b!1242660 () Bool)

(declare-fun res!828633 () Bool)

(assert (=> b!1242660 (=> (not res!828633) (not e!704466))))

(assert (=> b!1242660 (= res!828633 (containsKey!605 lt!562608 key1!25))))

(declare-fun b!1242661 () Bool)

(declare-fun c!121815 () Bool)

(assert (=> b!1242661 (= c!121815 (and ((_ is Cons!27364) l!644) (bvsgt (_1!10133 (h!28582 l!644)) key1!25)))))

(declare-fun e!704463 () List!27368)

(assert (=> b!1242661 (= e!704465 e!704463)))

(declare-fun bm!61285 () Bool)

(declare-fun call!61288 () List!27368)

(declare-fun call!61289 () List!27368)

(assert (=> bm!61285 (= call!61288 call!61289)))

(declare-fun c!121814 () Bool)

(declare-fun bm!61286 () Bool)

(declare-fun e!704464 () List!27368)

(assert (=> bm!61286 (= call!61289 ($colon$colon!618 e!704464 (ite c!121814 (h!28582 l!644) (tuple2!20245 key1!25 v1!20))))))

(declare-fun c!121812 () Bool)

(assert (=> bm!61286 (= c!121812 c!121814)))

(declare-fun b!1242662 () Bool)

(declare-fun call!61290 () List!27368)

(assert (=> b!1242662 (= e!704463 call!61290)))

(declare-fun bm!61287 () Bool)

(assert (=> bm!61287 (= call!61290 call!61288)))

(declare-fun d!136915 () Bool)

(assert (=> d!136915 e!704466))

(declare-fun res!828634 () Bool)

(assert (=> d!136915 (=> (not res!828634) (not e!704466))))

(assert (=> d!136915 (= res!828634 (isStrictlySorted!733 lt!562608))))

(assert (=> d!136915 (= lt!562608 e!704462)))

(assert (=> d!136915 (= c!121814 (and ((_ is Cons!27364) l!644) (bvslt (_1!10133 (h!28582 l!644)) key1!25)))))

(assert (=> d!136915 (isStrictlySorted!733 l!644)))

(assert (=> d!136915 (= (insertStrictlySorted!432 l!644 key1!25 v1!20) lt!562608)))

(declare-fun b!1242658 () Bool)

(assert (=> b!1242658 (= e!704465 call!61288)))

(declare-fun b!1242663 () Bool)

(assert (=> b!1242663 (= e!704464 (insertStrictlySorted!432 (t!40823 l!644) key1!25 v1!20))))

(declare-fun b!1242664 () Bool)

(assert (=> b!1242664 (= e!704464 (ite c!121813 (t!40823 l!644) (ite c!121815 (Cons!27364 (h!28582 l!644) (t!40823 l!644)) Nil!27365)))))

(declare-fun b!1242665 () Bool)

(assert (=> b!1242665 (= e!704463 call!61290)))

(declare-fun b!1242666 () Bool)

(assert (=> b!1242666 (= e!704462 call!61289)))

(assert (= (and d!136915 c!121814) b!1242666))

(assert (= (and d!136915 (not c!121814)) b!1242657))

(assert (= (and b!1242657 c!121813) b!1242658))

(assert (= (and b!1242657 (not c!121813)) b!1242661))

(assert (= (and b!1242661 c!121815) b!1242665))

(assert (= (and b!1242661 (not c!121815)) b!1242662))

(assert (= (or b!1242665 b!1242662) bm!61287))

(assert (= (or b!1242658 bm!61287) bm!61285))

(assert (= (or b!1242666 bm!61285) bm!61286))

(assert (= (and bm!61286 c!121812) b!1242663))

(assert (= (and bm!61286 (not c!121812)) b!1242664))

(assert (= (and d!136915 res!828634) b!1242660))

(assert (= (and b!1242660 res!828633) b!1242659))

(assert (=> b!1242663 m!1145995))

(declare-fun m!1146101 () Bool)

(assert (=> bm!61286 m!1146101))

(declare-fun m!1146103 () Bool)

(assert (=> b!1242660 m!1146103))

(declare-fun m!1146105 () Bool)

(assert (=> d!136915 m!1146105))

(assert (=> d!136915 m!1145987))

(declare-fun m!1146109 () Bool)

(assert (=> b!1242659 m!1146109))

(assert (=> b!1242501 d!136915))

(declare-fun d!136921 () Bool)

(assert (=> d!136921 (= (insertStrictlySorted!432 (removeStrictlySorted!123 (t!40823 l!644) key2!15) key1!25 v1!20) (removeStrictlySorted!123 (insertStrictlySorted!432 (t!40823 l!644) key1!25 v1!20) key2!15))))

(declare-fun lt!562614 () Unit!41228)

(declare-fun choose!1842 (List!27368 (_ BitVec 64) B!1832 (_ BitVec 64)) Unit!41228)

(assert (=> d!136921 (= lt!562614 (choose!1842 (t!40823 l!644) key1!25 v1!20 key2!15))))

(assert (=> d!136921 (not (= key1!25 key2!15))))

(assert (=> d!136921 (= (lemmaInsertAndRemoveStrictlySortedCommutative!13 (t!40823 l!644) key1!25 v1!20 key2!15) lt!562614)))

(declare-fun bs!34964 () Bool)

(assert (= bs!34964 d!136921))

(assert (=> bs!34964 m!1145999))

(declare-fun m!1146119 () Bool)

(assert (=> bs!34964 m!1146119))

(assert (=> bs!34964 m!1145999))

(assert (=> bs!34964 m!1146001))

(assert (=> bs!34964 m!1145995))

(assert (=> bs!34964 m!1145997))

(assert (=> bs!34964 m!1145995))

(assert (=> b!1242501 d!136921))

(declare-fun b!1242679 () Bool)

(declare-fun e!704474 () List!27368)

(declare-fun e!704477 () List!27368)

(assert (=> b!1242679 (= e!704474 e!704477)))

(declare-fun c!121821 () Bool)

(assert (=> b!1242679 (= c!121821 (and ((_ is Cons!27364) (t!40823 l!644)) (= (_1!10133 (h!28582 (t!40823 l!644))) key1!25)))))

(declare-fun lt!562615 () List!27368)

(declare-fun b!1242681 () Bool)

(declare-fun e!704478 () Bool)

(assert (=> b!1242681 (= e!704478 (contains!7421 lt!562615 (tuple2!20245 key1!25 v1!20)))))

(declare-fun b!1242682 () Bool)

(declare-fun res!828639 () Bool)

(assert (=> b!1242682 (=> (not res!828639) (not e!704478))))

(assert (=> b!1242682 (= res!828639 (containsKey!605 lt!562615 key1!25))))

(declare-fun b!1242683 () Bool)

(declare-fun c!121823 () Bool)

(assert (=> b!1242683 (= c!121823 (and ((_ is Cons!27364) (t!40823 l!644)) (bvsgt (_1!10133 (h!28582 (t!40823 l!644))) key1!25)))))

(declare-fun e!704475 () List!27368)

(assert (=> b!1242683 (= e!704477 e!704475)))

(declare-fun bm!61291 () Bool)

(declare-fun call!61294 () List!27368)

(declare-fun call!61295 () List!27368)

(assert (=> bm!61291 (= call!61294 call!61295)))

(declare-fun bm!61292 () Bool)

(declare-fun e!704476 () List!27368)

(declare-fun c!121822 () Bool)

(assert (=> bm!61292 (= call!61295 ($colon$colon!618 e!704476 (ite c!121822 (h!28582 (t!40823 l!644)) (tuple2!20245 key1!25 v1!20))))))

(declare-fun c!121820 () Bool)

(assert (=> bm!61292 (= c!121820 c!121822)))

(declare-fun b!1242684 () Bool)

(declare-fun call!61296 () List!27368)

(assert (=> b!1242684 (= e!704475 call!61296)))

(declare-fun bm!61293 () Bool)

(assert (=> bm!61293 (= call!61296 call!61294)))

(declare-fun d!136927 () Bool)

(assert (=> d!136927 e!704478))

(declare-fun res!828640 () Bool)

(assert (=> d!136927 (=> (not res!828640) (not e!704478))))

(assert (=> d!136927 (= res!828640 (isStrictlySorted!733 lt!562615))))

(assert (=> d!136927 (= lt!562615 e!704474)))

(assert (=> d!136927 (= c!121822 (and ((_ is Cons!27364) (t!40823 l!644)) (bvslt (_1!10133 (h!28582 (t!40823 l!644))) key1!25)))))

(assert (=> d!136927 (isStrictlySorted!733 (t!40823 l!644))))

(assert (=> d!136927 (= (insertStrictlySorted!432 (t!40823 l!644) key1!25 v1!20) lt!562615)))

(declare-fun b!1242680 () Bool)

(assert (=> b!1242680 (= e!704477 call!61294)))

(declare-fun b!1242685 () Bool)

(assert (=> b!1242685 (= e!704476 (insertStrictlySorted!432 (t!40823 (t!40823 l!644)) key1!25 v1!20))))

(declare-fun b!1242686 () Bool)

(assert (=> b!1242686 (= e!704476 (ite c!121821 (t!40823 (t!40823 l!644)) (ite c!121823 (Cons!27364 (h!28582 (t!40823 l!644)) (t!40823 (t!40823 l!644))) Nil!27365)))))

(declare-fun b!1242687 () Bool)

(assert (=> b!1242687 (= e!704475 call!61296)))

(declare-fun b!1242688 () Bool)

(assert (=> b!1242688 (= e!704474 call!61295)))

(assert (= (and d!136927 c!121822) b!1242688))

(assert (= (and d!136927 (not c!121822)) b!1242679))

(assert (= (and b!1242679 c!121821) b!1242680))

(assert (= (and b!1242679 (not c!121821)) b!1242683))

(assert (= (and b!1242683 c!121823) b!1242687))

(assert (= (and b!1242683 (not c!121823)) b!1242684))

(assert (= (or b!1242687 b!1242684) bm!61293))

(assert (= (or b!1242680 bm!61293) bm!61291))

(assert (= (or b!1242688 bm!61291) bm!61292))

(assert (= (and bm!61292 c!121820) b!1242685))

(assert (= (and bm!61292 (not c!121820)) b!1242686))

(assert (= (and d!136927 res!828640) b!1242682))

(assert (= (and b!1242682 res!828639) b!1242681))

(declare-fun m!1146123 () Bool)

(assert (=> b!1242685 m!1146123))

(declare-fun m!1146125 () Bool)

(assert (=> bm!61292 m!1146125))

(declare-fun m!1146127 () Bool)

(assert (=> b!1242682 m!1146127))

(declare-fun m!1146129 () Bool)

(assert (=> d!136927 m!1146129))

(assert (=> d!136927 m!1145989))

(declare-fun m!1146131 () Bool)

(assert (=> b!1242681 m!1146131))

(assert (=> b!1242501 d!136927))

(declare-fun d!136931 () Bool)

(declare-fun e!704486 () Bool)

(assert (=> d!136931 e!704486))

(declare-fun res!828643 () Bool)

(assert (=> d!136931 (=> (not res!828643) (not e!704486))))

(declare-fun lt!562618 () List!27368)

(assert (=> d!136931 (= res!828643 (isStrictlySorted!733 lt!562618))))

(declare-fun e!704485 () List!27368)

(assert (=> d!136931 (= lt!562618 e!704485)))

(declare-fun c!121829 () Bool)

(assert (=> d!136931 (= c!121829 (and ((_ is Cons!27364) (t!40823 l!644)) (= (_1!10133 (h!28582 (t!40823 l!644))) key2!15)))))

(assert (=> d!136931 (isStrictlySorted!733 (t!40823 l!644))))

(assert (=> d!136931 (= (removeStrictlySorted!123 (t!40823 l!644) key2!15) lt!562618)))

(declare-fun b!1242699 () Bool)

(declare-fun e!704484 () List!27368)

(assert (=> b!1242699 (= e!704485 e!704484)))

(declare-fun c!121828 () Bool)

(assert (=> b!1242699 (= c!121828 (and ((_ is Cons!27364) (t!40823 l!644)) (not (= (_1!10133 (h!28582 (t!40823 l!644))) key2!15))))))

(declare-fun b!1242700 () Bool)

(assert (=> b!1242700 (= e!704486 (not (containsKey!605 lt!562618 key2!15)))))

(declare-fun b!1242701 () Bool)

(assert (=> b!1242701 (= e!704484 ($colon$colon!618 (removeStrictlySorted!123 (t!40823 (t!40823 l!644)) key2!15) (h!28582 (t!40823 l!644))))))

(declare-fun b!1242702 () Bool)

(assert (=> b!1242702 (= e!704484 Nil!27365)))

(declare-fun b!1242703 () Bool)

(assert (=> b!1242703 (= e!704485 (t!40823 (t!40823 l!644)))))

(assert (= (and d!136931 c!121829) b!1242703))

(assert (= (and d!136931 (not c!121829)) b!1242699))

(assert (= (and b!1242699 c!121828) b!1242701))

(assert (= (and b!1242699 (not c!121828)) b!1242702))

(assert (= (and d!136931 res!828643) b!1242700))

(declare-fun m!1146135 () Bool)

(assert (=> d!136931 m!1146135))

(assert (=> d!136931 m!1145989))

(declare-fun m!1146139 () Bool)

(assert (=> b!1242700 m!1146139))

(declare-fun m!1146143 () Bool)

(assert (=> b!1242701 m!1146143))

(assert (=> b!1242701 m!1146143))

(declare-fun m!1146149 () Bool)

(assert (=> b!1242701 m!1146149))

(assert (=> b!1242501 d!136931))

(declare-fun d!136935 () Bool)

(declare-fun res!828644 () Bool)

(declare-fun e!704487 () Bool)

(assert (=> d!136935 (=> res!828644 e!704487)))

(assert (=> d!136935 (= res!828644 (or ((_ is Nil!27365) (t!40823 l!644)) ((_ is Nil!27365) (t!40823 (t!40823 l!644)))))))

(assert (=> d!136935 (= (isStrictlySorted!733 (t!40823 l!644)) e!704487)))

(declare-fun b!1242704 () Bool)

(declare-fun e!704488 () Bool)

(assert (=> b!1242704 (= e!704487 e!704488)))

(declare-fun res!828645 () Bool)

(assert (=> b!1242704 (=> (not res!828645) (not e!704488))))

(assert (=> b!1242704 (= res!828645 (bvslt (_1!10133 (h!28582 (t!40823 l!644))) (_1!10133 (h!28582 (t!40823 (t!40823 l!644))))))))

(declare-fun b!1242705 () Bool)

(assert (=> b!1242705 (= e!704488 (isStrictlySorted!733 (t!40823 (t!40823 l!644))))))

(assert (= (and d!136935 (not res!828644)) b!1242704))

(assert (= (and b!1242704 res!828645) b!1242705))

(declare-fun m!1146151 () Bool)

(assert (=> b!1242705 m!1146151))

(assert (=> b!1242500 d!136935))

(declare-fun d!136937 () Bool)

(declare-fun res!828647 () Bool)

(declare-fun e!704492 () Bool)

(assert (=> d!136937 (=> res!828647 e!704492)))

(assert (=> d!136937 (= res!828647 (or ((_ is Nil!27365) l!644) ((_ is Nil!27365) (t!40823 l!644))))))

(assert (=> d!136937 (= (isStrictlySorted!733 l!644) e!704492)))

(declare-fun b!1242711 () Bool)

(declare-fun e!704493 () Bool)

(assert (=> b!1242711 (= e!704492 e!704493)))

(declare-fun res!828648 () Bool)

(assert (=> b!1242711 (=> (not res!828648) (not e!704493))))

(assert (=> b!1242711 (= res!828648 (bvslt (_1!10133 (h!28582 l!644)) (_1!10133 (h!28582 (t!40823 l!644)))))))

(declare-fun b!1242712 () Bool)

(assert (=> b!1242712 (= e!704493 (isStrictlySorted!733 (t!40823 l!644)))))

(assert (= (and d!136937 (not res!828647)) b!1242711))

(assert (= (and b!1242711 res!828648) b!1242712))

(assert (=> b!1242712 m!1145989))

(assert (=> b!1242499 d!136937))

(declare-fun b!1242722 () Bool)

(declare-fun e!704499 () Bool)

(declare-fun tp!92621 () Bool)

(assert (=> b!1242722 (= e!704499 (and tp_is_empty!31231 tp!92621))))

(assert (=> b!1242498 (= tp!92609 e!704499)))

(assert (= (and b!1242498 ((_ is Cons!27364) (t!40823 l!644))) b!1242722))

(check-sat (not b!1242659) (not d!136921) (not b!1242722) tp_is_empty!31231 (not d!136899) (not b!1242701) (not b!1242685) (not b!1242681) (not bm!61292) (not d!136927) (not b!1242663) (not b!1242627) (not d!136931) (not b!1242626) (not b!1242712) (not d!136905) (not b!1242551) (not b!1242700) (not b!1242660) (not bm!61280) (not b!1242651) (not d!136915) (not b!1242630) (not b!1242682) (not b!1242552) (not b!1242705) (not bm!61286))
(check-sat)
