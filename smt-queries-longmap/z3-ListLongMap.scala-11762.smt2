; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!138426 () Bool)

(assert start!138426)

(declare-fun b!1586454 () Bool)

(declare-fun e!885724 () Bool)

(declare-fun tp_is_empty!39433 () Bool)

(declare-fun tp!115049 () Bool)

(assert (=> b!1586454 (= e!885724 (and tp_is_empty!39433 tp!115049))))

(declare-fun res!1082850 () Bool)

(declare-fun e!885723 () Bool)

(assert (=> start!138426 (=> (not res!1082850) (not e!885723))))

(declare-datatypes ((B!2900 0))(
  ( (B!2901 (val!19812 Int)) )
))
(declare-datatypes ((tuple2!25852 0))(
  ( (tuple2!25853 (_1!12937 (_ BitVec 64)) (_2!12937 B!2900)) )
))
(declare-datatypes ((List!36964 0))(
  ( (Nil!36961) (Cons!36960 (h!38521 tuple2!25852) (t!51870 List!36964)) )
))
(declare-fun l!1251 () List!36964)

(declare-fun isStrictlySorted!1145 (List!36964) Bool)

(assert (=> start!138426 (= res!1082850 (isStrictlySorted!1145 l!1251))))

(assert (=> start!138426 e!885723))

(assert (=> start!138426 e!885724))

(assert (=> start!138426 true))

(assert (=> start!138426 tp_is_empty!39433))

(declare-fun b!1586452 () Bool)

(declare-fun res!1082849 () Bool)

(assert (=> b!1586452 (=> (not res!1082849) (not e!885723))))

(declare-fun newKey!123 () (_ BitVec 64))

(declare-fun otherKey!56 () (_ BitVec 64))

(get-info :version)

(assert (=> b!1586452 (= res!1082849 (and (not (= otherKey!56 newKey!123)) (not ((_ is Cons!36960) l!1251))))))

(declare-fun newValue!123 () B!2900)

(declare-fun b!1586453 () Bool)

(declare-fun insertStrictlySorted!624 (List!36964 (_ BitVec 64) B!2900) List!36964)

(assert (=> b!1586453 (= e!885723 (not (isStrictlySorted!1145 (insertStrictlySorted!624 l!1251 newKey!123 newValue!123))))))

(declare-fun b!1586451 () Bool)

(declare-fun res!1082851 () Bool)

(assert (=> b!1586451 (=> (not res!1082851) (not e!885723))))

(declare-fun containsKey!992 (List!36964 (_ BitVec 64)) Bool)

(assert (=> b!1586451 (= res!1082851 (not (containsKey!992 l!1251 otherKey!56)))))

(assert (= (and start!138426 res!1082850) b!1586451))

(assert (= (and b!1586451 res!1082851) b!1586452))

(assert (= (and b!1586452 res!1082849) b!1586453))

(assert (= (and start!138426 ((_ is Cons!36960) l!1251)) b!1586454))

(declare-fun m!1455867 () Bool)

(assert (=> start!138426 m!1455867))

(declare-fun m!1455869 () Bool)

(assert (=> b!1586453 m!1455869))

(assert (=> b!1586453 m!1455869))

(declare-fun m!1455871 () Bool)

(assert (=> b!1586453 m!1455871))

(declare-fun m!1455873 () Bool)

(assert (=> b!1586451 m!1455873))

(check-sat (not b!1586453) (not start!138426) tp_is_empty!39433 (not b!1586454) (not b!1586451))
(check-sat)
(get-model)

(declare-fun d!168061 () Bool)

(declare-fun res!1082878 () Bool)

(declare-fun e!885745 () Bool)

(assert (=> d!168061 (=> res!1082878 e!885745)))

(assert (=> d!168061 (= res!1082878 (or ((_ is Nil!36961) l!1251) ((_ is Nil!36961) (t!51870 l!1251))))))

(assert (=> d!168061 (= (isStrictlySorted!1145 l!1251) e!885745)))

(declare-fun b!1586487 () Bool)

(declare-fun e!885746 () Bool)

(assert (=> b!1586487 (= e!885745 e!885746)))

(declare-fun res!1082879 () Bool)

(assert (=> b!1586487 (=> (not res!1082879) (not e!885746))))

(assert (=> b!1586487 (= res!1082879 (bvslt (_1!12937 (h!38521 l!1251)) (_1!12937 (h!38521 (t!51870 l!1251)))))))

(declare-fun b!1586488 () Bool)

(assert (=> b!1586488 (= e!885746 (isStrictlySorted!1145 (t!51870 l!1251)))))

(assert (= (and d!168061 (not res!1082878)) b!1586487))

(assert (= (and b!1586487 res!1082879) b!1586488))

(declare-fun m!1455891 () Bool)

(assert (=> b!1586488 m!1455891))

(assert (=> start!138426 d!168061))

(declare-fun d!168065 () Bool)

(declare-fun res!1082898 () Bool)

(declare-fun e!885765 () Bool)

(assert (=> d!168065 (=> res!1082898 e!885765)))

(assert (=> d!168065 (= res!1082898 (and ((_ is Cons!36960) l!1251) (= (_1!12937 (h!38521 l!1251)) otherKey!56)))))

(assert (=> d!168065 (= (containsKey!992 l!1251 otherKey!56) e!885765)))

(declare-fun b!1586507 () Bool)

(declare-fun e!885766 () Bool)

(assert (=> b!1586507 (= e!885765 e!885766)))

(declare-fun res!1082899 () Bool)

(assert (=> b!1586507 (=> (not res!1082899) (not e!885766))))

(assert (=> b!1586507 (= res!1082899 (and (or (not ((_ is Cons!36960) l!1251)) (bvsle (_1!12937 (h!38521 l!1251)) otherKey!56)) ((_ is Cons!36960) l!1251) (bvslt (_1!12937 (h!38521 l!1251)) otherKey!56)))))

(declare-fun b!1586508 () Bool)

(assert (=> b!1586508 (= e!885766 (containsKey!992 (t!51870 l!1251) otherKey!56))))

(assert (= (and d!168065 (not res!1082898)) b!1586507))

(assert (= (and b!1586507 res!1082899) b!1586508))

(declare-fun m!1455899 () Bool)

(assert (=> b!1586508 m!1455899))

(assert (=> b!1586451 d!168065))

(declare-fun d!168073 () Bool)

(declare-fun res!1082900 () Bool)

(declare-fun e!885767 () Bool)

(assert (=> d!168073 (=> res!1082900 e!885767)))

(assert (=> d!168073 (= res!1082900 (or ((_ is Nil!36961) (insertStrictlySorted!624 l!1251 newKey!123 newValue!123)) ((_ is Nil!36961) (t!51870 (insertStrictlySorted!624 l!1251 newKey!123 newValue!123)))))))

(assert (=> d!168073 (= (isStrictlySorted!1145 (insertStrictlySorted!624 l!1251 newKey!123 newValue!123)) e!885767)))

(declare-fun b!1586509 () Bool)

(declare-fun e!885768 () Bool)

(assert (=> b!1586509 (= e!885767 e!885768)))

(declare-fun res!1082901 () Bool)

(assert (=> b!1586509 (=> (not res!1082901) (not e!885768))))

(assert (=> b!1586509 (= res!1082901 (bvslt (_1!12937 (h!38521 (insertStrictlySorted!624 l!1251 newKey!123 newValue!123))) (_1!12937 (h!38521 (t!51870 (insertStrictlySorted!624 l!1251 newKey!123 newValue!123))))))))

(declare-fun b!1586510 () Bool)

(assert (=> b!1586510 (= e!885768 (isStrictlySorted!1145 (t!51870 (insertStrictlySorted!624 l!1251 newKey!123 newValue!123))))))

(assert (= (and d!168073 (not res!1082900)) b!1586509))

(assert (= (and b!1586509 res!1082901) b!1586510))

(declare-fun m!1455901 () Bool)

(assert (=> b!1586510 m!1455901))

(assert (=> b!1586453 d!168073))

(declare-fun d!168075 () Bool)

(declare-fun e!885812 () Bool)

(assert (=> d!168075 e!885812))

(declare-fun res!1082921 () Bool)

(assert (=> d!168075 (=> (not res!1082921) (not e!885812))))

(declare-fun lt!678144 () List!36964)

(assert (=> d!168075 (= res!1082921 (isStrictlySorted!1145 lt!678144))))

(declare-fun e!885815 () List!36964)

(assert (=> d!168075 (= lt!678144 e!885815)))

(declare-fun c!147636 () Bool)

(assert (=> d!168075 (= c!147636 (and ((_ is Cons!36960) l!1251) (bvslt (_1!12937 (h!38521 l!1251)) newKey!123)))))

(assert (=> d!168075 (isStrictlySorted!1145 l!1251)))

(assert (=> d!168075 (= (insertStrictlySorted!624 l!1251 newKey!123 newValue!123) lt!678144)))

(declare-fun b!1586593 () Bool)

(declare-fun c!147637 () Bool)

(assert (=> b!1586593 (= c!147637 (and ((_ is Cons!36960) l!1251) (bvsgt (_1!12937 (h!38521 l!1251)) newKey!123)))))

(declare-fun e!885813 () List!36964)

(declare-fun e!885814 () List!36964)

(assert (=> b!1586593 (= e!885813 e!885814)))

(declare-fun bm!72687 () Bool)

(declare-fun call!72692 () List!36964)

(declare-fun call!72691 () List!36964)

(assert (=> bm!72687 (= call!72692 call!72691)))

(declare-fun e!885811 () List!36964)

(declare-fun bm!72688 () Bool)

(declare-fun $colon$colon!1014 (List!36964 tuple2!25852) List!36964)

(assert (=> bm!72688 (= call!72691 ($colon$colon!1014 e!885811 (ite c!147636 (h!38521 l!1251) (tuple2!25853 newKey!123 newValue!123))))))

(declare-fun c!147639 () Bool)

(assert (=> bm!72688 (= c!147639 c!147636)))

(declare-fun b!1586594 () Bool)

(assert (=> b!1586594 (= e!885813 call!72692)))

(declare-fun c!147638 () Bool)

(declare-fun b!1586595 () Bool)

(assert (=> b!1586595 (= e!885811 (ite c!147638 (t!51870 l!1251) (ite c!147637 (Cons!36960 (h!38521 l!1251) (t!51870 l!1251)) Nil!36961)))))

(declare-fun b!1586596 () Bool)

(declare-fun contains!10569 (List!36964 tuple2!25852) Bool)

(assert (=> b!1586596 (= e!885812 (contains!10569 lt!678144 (tuple2!25853 newKey!123 newValue!123)))))

(declare-fun b!1586597 () Bool)

(assert (=> b!1586597 (= e!885811 (insertStrictlySorted!624 (t!51870 l!1251) newKey!123 newValue!123))))

(declare-fun b!1586598 () Bool)

(declare-fun res!1082920 () Bool)

(assert (=> b!1586598 (=> (not res!1082920) (not e!885812))))

(assert (=> b!1586598 (= res!1082920 (containsKey!992 lt!678144 newKey!123))))

(declare-fun b!1586599 () Bool)

(assert (=> b!1586599 (= e!885815 call!72691)))

(declare-fun b!1586600 () Bool)

(declare-fun call!72690 () List!36964)

(assert (=> b!1586600 (= e!885814 call!72690)))

(declare-fun bm!72689 () Bool)

(assert (=> bm!72689 (= call!72690 call!72692)))

(declare-fun b!1586601 () Bool)

(assert (=> b!1586601 (= e!885814 call!72690)))

(declare-fun b!1586602 () Bool)

(assert (=> b!1586602 (= e!885815 e!885813)))

(assert (=> b!1586602 (= c!147638 (and ((_ is Cons!36960) l!1251) (= (_1!12937 (h!38521 l!1251)) newKey!123)))))

(assert (= (and d!168075 c!147636) b!1586599))

(assert (= (and d!168075 (not c!147636)) b!1586602))

(assert (= (and b!1586602 c!147638) b!1586594))

(assert (= (and b!1586602 (not c!147638)) b!1586593))

(assert (= (and b!1586593 c!147637) b!1586601))

(assert (= (and b!1586593 (not c!147637)) b!1586600))

(assert (= (or b!1586601 b!1586600) bm!72689))

(assert (= (or b!1586594 bm!72689) bm!72687))

(assert (= (or b!1586599 bm!72687) bm!72688))

(assert (= (and bm!72688 c!147639) b!1586597))

(assert (= (and bm!72688 (not c!147639)) b!1586595))

(assert (= (and d!168075 res!1082921) b!1586598))

(assert (= (and b!1586598 res!1082920) b!1586596))

(declare-fun m!1455925 () Bool)

(assert (=> b!1586596 m!1455925))

(declare-fun m!1455927 () Bool)

(assert (=> b!1586598 m!1455927))

(declare-fun m!1455929 () Bool)

(assert (=> bm!72688 m!1455929))

(declare-fun m!1455931 () Bool)

(assert (=> d!168075 m!1455931))

(assert (=> d!168075 m!1455867))

(declare-fun m!1455935 () Bool)

(assert (=> b!1586597 m!1455935))

(assert (=> b!1586453 d!168075))

(declare-fun b!1586617 () Bool)

(declare-fun e!885826 () Bool)

(declare-fun tp!115060 () Bool)

(assert (=> b!1586617 (= e!885826 (and tp_is_empty!39433 tp!115060))))

(assert (=> b!1586454 (= tp!115049 e!885826)))

(assert (= (and b!1586454 ((_ is Cons!36960) (t!51870 l!1251))) b!1586617))

(check-sat (not b!1586597) (not b!1586596) (not b!1586488) (not b!1586617) (not d!168075) (not b!1586510) (not bm!72688) tp_is_empty!39433 (not b!1586508) (not b!1586598))
(check-sat)
