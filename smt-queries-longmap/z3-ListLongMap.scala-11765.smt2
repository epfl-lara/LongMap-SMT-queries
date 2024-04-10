; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!138122 () Bool)

(assert start!138122)

(declare-fun b!1584833 () Bool)

(declare-fun res!1082468 () Bool)

(declare-fun e!884749 () Bool)

(assert (=> b!1584833 (=> (not res!1082468) (not e!884749))))

(declare-datatypes ((B!2932 0))(
  ( (B!2933 (val!19828 Int)) )
))
(declare-datatypes ((tuple2!25824 0))(
  ( (tuple2!25825 (_1!12923 (_ BitVec 64)) (_2!12923 B!2932)) )
))
(declare-datatypes ((List!36948 0))(
  ( (Nil!36945) (Cons!36944 (h!38487 tuple2!25824) (t!51864 List!36948)) )
))
(declare-fun l!1251 () List!36948)

(declare-fun otherKey!56 () (_ BitVec 64))

(declare-fun containsKey!1007 (List!36948 (_ BitVec 64)) Bool)

(assert (=> b!1584833 (= res!1082468 (not (containsKey!1007 l!1251 otherKey!56)))))

(declare-fun newKey!123 () (_ BitVec 64))

(declare-fun b!1584835 () Bool)

(declare-fun newValue!123 () B!2932)

(declare-fun insertStrictlySorted!630 (List!36948 (_ BitVec 64) B!2932) List!36948)

(assert (=> b!1584835 (= e!884749 (containsKey!1007 (insertStrictlySorted!630 l!1251 newKey!123 newValue!123) otherKey!56))))

(declare-fun b!1584834 () Bool)

(declare-fun res!1082467 () Bool)

(assert (=> b!1584834 (=> (not res!1082467) (not e!884749))))

(get-info :version)

(assert (=> b!1584834 (= res!1082467 (and (not (= otherKey!56 newKey!123)) (not ((_ is Cons!36944) l!1251))))))

(declare-fun b!1584836 () Bool)

(declare-fun e!884748 () Bool)

(declare-fun tp_is_empty!39465 () Bool)

(declare-fun tp!115144 () Bool)

(assert (=> b!1584836 (= e!884748 (and tp_is_empty!39465 tp!115144))))

(declare-fun res!1082466 () Bool)

(assert (=> start!138122 (=> (not res!1082466) (not e!884749))))

(declare-fun isStrictlySorted!1173 (List!36948) Bool)

(assert (=> start!138122 (= res!1082466 (isStrictlySorted!1173 l!1251))))

(assert (=> start!138122 e!884749))

(assert (=> start!138122 e!884748))

(assert (=> start!138122 true))

(assert (=> start!138122 tp_is_empty!39465))

(assert (= (and start!138122 res!1082466) b!1584833))

(assert (= (and b!1584833 res!1082468) b!1584834))

(assert (= (and b!1584834 res!1082467) b!1584835))

(assert (= (and start!138122 ((_ is Cons!36944) l!1251)) b!1584836))

(declare-fun m!1453963 () Bool)

(assert (=> b!1584833 m!1453963))

(declare-fun m!1453965 () Bool)

(assert (=> b!1584835 m!1453965))

(assert (=> b!1584835 m!1453965))

(declare-fun m!1453967 () Bool)

(assert (=> b!1584835 m!1453967))

(declare-fun m!1453969 () Bool)

(assert (=> start!138122 m!1453969))

(check-sat (not b!1584835) (not b!1584836) (not start!138122) (not b!1584833) tp_is_empty!39465)
(check-sat)
(get-model)

(declare-fun d!167559 () Bool)

(declare-fun res!1082494 () Bool)

(declare-fun e!884772 () Bool)

(assert (=> d!167559 (=> res!1082494 e!884772)))

(assert (=> d!167559 (= res!1082494 (and ((_ is Cons!36944) (insertStrictlySorted!630 l!1251 newKey!123 newValue!123)) (= (_1!12923 (h!38487 (insertStrictlySorted!630 l!1251 newKey!123 newValue!123))) otherKey!56)))))

(assert (=> d!167559 (= (containsKey!1007 (insertStrictlySorted!630 l!1251 newKey!123 newValue!123) otherKey!56) e!884772)))

(declare-fun b!1584865 () Bool)

(declare-fun e!884773 () Bool)

(assert (=> b!1584865 (= e!884772 e!884773)))

(declare-fun res!1082495 () Bool)

(assert (=> b!1584865 (=> (not res!1082495) (not e!884773))))

(assert (=> b!1584865 (= res!1082495 (and (or (not ((_ is Cons!36944) (insertStrictlySorted!630 l!1251 newKey!123 newValue!123))) (bvsle (_1!12923 (h!38487 (insertStrictlySorted!630 l!1251 newKey!123 newValue!123))) otherKey!56)) ((_ is Cons!36944) (insertStrictlySorted!630 l!1251 newKey!123 newValue!123)) (bvslt (_1!12923 (h!38487 (insertStrictlySorted!630 l!1251 newKey!123 newValue!123))) otherKey!56)))))

(declare-fun b!1584866 () Bool)

(assert (=> b!1584866 (= e!884773 (containsKey!1007 (t!51864 (insertStrictlySorted!630 l!1251 newKey!123 newValue!123)) otherKey!56))))

(assert (= (and d!167559 (not res!1082494)) b!1584865))

(assert (= (and b!1584865 res!1082495) b!1584866))

(declare-fun m!1453983 () Bool)

(assert (=> b!1584866 m!1453983))

(assert (=> b!1584835 d!167559))

(declare-fun b!1584941 () Bool)

(declare-fun e!884819 () List!36948)

(declare-fun call!72605 () List!36948)

(assert (=> b!1584941 (= e!884819 call!72605)))

(declare-fun bm!72600 () Bool)

(declare-fun call!72603 () List!36948)

(assert (=> bm!72600 (= call!72603 call!72605)))

(declare-fun b!1584942 () Bool)

(declare-fun e!884820 () List!36948)

(declare-fun call!72604 () List!36948)

(assert (=> b!1584942 (= e!884820 call!72604)))

(declare-fun bm!72601 () Bool)

(assert (=> bm!72601 (= call!72604 call!72603)))

(declare-fun d!167565 () Bool)

(declare-fun e!884822 () Bool)

(assert (=> d!167565 e!884822))

(declare-fun res!1082523 () Bool)

(assert (=> d!167565 (=> (not res!1082523) (not e!884822))))

(declare-fun lt!677303 () List!36948)

(assert (=> d!167565 (= res!1082523 (isStrictlySorted!1173 lt!677303))))

(assert (=> d!167565 (= lt!677303 e!884819)))

(declare-fun c!146938 () Bool)

(assert (=> d!167565 (= c!146938 (and ((_ is Cons!36944) l!1251) (bvslt (_1!12923 (h!38487 l!1251)) newKey!123)))))

(assert (=> d!167565 (isStrictlySorted!1173 l!1251)))

(assert (=> d!167565 (= (insertStrictlySorted!630 l!1251 newKey!123 newValue!123) lt!677303)))

(declare-fun bm!72602 () Bool)

(declare-fun e!884821 () List!36948)

(declare-fun $colon$colon!1025 (List!36948 tuple2!25824) List!36948)

(assert (=> bm!72602 (= call!72605 ($colon$colon!1025 e!884821 (ite c!146938 (h!38487 l!1251) (tuple2!25825 newKey!123 newValue!123))))))

(declare-fun c!146937 () Bool)

(assert (=> bm!72602 (= c!146937 c!146938)))

(declare-fun b!1584943 () Bool)

(declare-fun c!146936 () Bool)

(assert (=> b!1584943 (= c!146936 (and ((_ is Cons!36944) l!1251) (bvsgt (_1!12923 (h!38487 l!1251)) newKey!123)))))

(declare-fun e!884818 () List!36948)

(assert (=> b!1584943 (= e!884818 e!884820)))

(declare-fun b!1584944 () Bool)

(declare-fun contains!10529 (List!36948 tuple2!25824) Bool)

(assert (=> b!1584944 (= e!884822 (contains!10529 lt!677303 (tuple2!25825 newKey!123 newValue!123)))))

(declare-fun b!1584945 () Bool)

(declare-fun res!1082522 () Bool)

(assert (=> b!1584945 (=> (not res!1082522) (not e!884822))))

(assert (=> b!1584945 (= res!1082522 (containsKey!1007 lt!677303 newKey!123))))

(declare-fun b!1584946 () Bool)

(assert (=> b!1584946 (= e!884821 (insertStrictlySorted!630 (t!51864 l!1251) newKey!123 newValue!123))))

(declare-fun b!1584947 () Bool)

(assert (=> b!1584947 (= e!884819 e!884818)))

(declare-fun c!146939 () Bool)

(assert (=> b!1584947 (= c!146939 (and ((_ is Cons!36944) l!1251) (= (_1!12923 (h!38487 l!1251)) newKey!123)))))

(declare-fun b!1584948 () Bool)

(assert (=> b!1584948 (= e!884820 call!72604)))

(declare-fun b!1584949 () Bool)

(assert (=> b!1584949 (= e!884821 (ite c!146939 (t!51864 l!1251) (ite c!146936 (Cons!36944 (h!38487 l!1251) (t!51864 l!1251)) Nil!36945)))))

(declare-fun b!1584950 () Bool)

(assert (=> b!1584950 (= e!884818 call!72603)))

(assert (= (and d!167565 c!146938) b!1584941))

(assert (= (and d!167565 (not c!146938)) b!1584947))

(assert (= (and b!1584947 c!146939) b!1584950))

(assert (= (and b!1584947 (not c!146939)) b!1584943))

(assert (= (and b!1584943 c!146936) b!1584942))

(assert (= (and b!1584943 (not c!146936)) b!1584948))

(assert (= (or b!1584942 b!1584948) bm!72601))

(assert (= (or b!1584950 bm!72601) bm!72600))

(assert (= (or b!1584941 bm!72600) bm!72602))

(assert (= (and bm!72602 c!146937) b!1584946))

(assert (= (and bm!72602 (not c!146937)) b!1584949))

(assert (= (and d!167565 res!1082523) b!1584945))

(assert (= (and b!1584945 res!1082522) b!1584944))

(declare-fun m!1453991 () Bool)

(assert (=> d!167565 m!1453991))

(assert (=> d!167565 m!1453969))

(declare-fun m!1453993 () Bool)

(assert (=> b!1584944 m!1453993))

(declare-fun m!1453995 () Bool)

(assert (=> b!1584946 m!1453995))

(declare-fun m!1453997 () Bool)

(assert (=> b!1584945 m!1453997))

(declare-fun m!1453999 () Bool)

(assert (=> bm!72602 m!1453999))

(assert (=> b!1584835 d!167565))

(declare-fun d!167573 () Bool)

(declare-fun res!1082524 () Bool)

(declare-fun e!884823 () Bool)

(assert (=> d!167573 (=> res!1082524 e!884823)))

(assert (=> d!167573 (= res!1082524 (and ((_ is Cons!36944) l!1251) (= (_1!12923 (h!38487 l!1251)) otherKey!56)))))

(assert (=> d!167573 (= (containsKey!1007 l!1251 otherKey!56) e!884823)))

(declare-fun b!1584951 () Bool)

(declare-fun e!884824 () Bool)

(assert (=> b!1584951 (= e!884823 e!884824)))

(declare-fun res!1082525 () Bool)

(assert (=> b!1584951 (=> (not res!1082525) (not e!884824))))

(assert (=> b!1584951 (= res!1082525 (and (or (not ((_ is Cons!36944) l!1251)) (bvsle (_1!12923 (h!38487 l!1251)) otherKey!56)) ((_ is Cons!36944) l!1251) (bvslt (_1!12923 (h!38487 l!1251)) otherKey!56)))))

(declare-fun b!1584952 () Bool)

(assert (=> b!1584952 (= e!884824 (containsKey!1007 (t!51864 l!1251) otherKey!56))))

(assert (= (and d!167573 (not res!1082524)) b!1584951))

(assert (= (and b!1584951 res!1082525) b!1584952))

(declare-fun m!1454001 () Bool)

(assert (=> b!1584952 m!1454001))

(assert (=> b!1584833 d!167573))

(declare-fun d!167575 () Bool)

(declare-fun res!1082536 () Bool)

(declare-fun e!884845 () Bool)

(assert (=> d!167575 (=> res!1082536 e!884845)))

(assert (=> d!167575 (= res!1082536 (or ((_ is Nil!36945) l!1251) ((_ is Nil!36945) (t!51864 l!1251))))))

(assert (=> d!167575 (= (isStrictlySorted!1173 l!1251) e!884845)))

(declare-fun b!1584987 () Bool)

(declare-fun e!884846 () Bool)

(assert (=> b!1584987 (= e!884845 e!884846)))

(declare-fun res!1082537 () Bool)

(assert (=> b!1584987 (=> (not res!1082537) (not e!884846))))

(assert (=> b!1584987 (= res!1082537 (bvslt (_1!12923 (h!38487 l!1251)) (_1!12923 (h!38487 (t!51864 l!1251)))))))

(declare-fun b!1584988 () Bool)

(assert (=> b!1584988 (= e!884846 (isStrictlySorted!1173 (t!51864 l!1251)))))

(assert (= (and d!167575 (not res!1082536)) b!1584987))

(assert (= (and b!1584987 res!1082537) b!1584988))

(declare-fun m!1454025 () Bool)

(assert (=> b!1584988 m!1454025))

(assert (=> start!138122 d!167575))

(declare-fun b!1584995 () Bool)

(declare-fun e!884851 () Bool)

(declare-fun tp!115156 () Bool)

(assert (=> b!1584995 (= e!884851 (and tp_is_empty!39465 tp!115156))))

(assert (=> b!1584836 (= tp!115144 e!884851)))

(assert (= (and b!1584836 ((_ is Cons!36944) (t!51864 l!1251))) b!1584995))

(check-sat (not b!1584866) (not bm!72602) (not b!1584945) (not b!1584946) (not b!1584944) (not d!167565) tp_is_empty!39465 (not b!1584995) (not b!1584952) (not b!1584988))
(check-sat)
(get-model)

(declare-fun b!1585023 () Bool)

(declare-fun e!884875 () List!36948)

(declare-fun call!72617 () List!36948)

(assert (=> b!1585023 (= e!884875 call!72617)))

(declare-fun bm!72612 () Bool)

(declare-fun call!72615 () List!36948)

(assert (=> bm!72612 (= call!72615 call!72617)))

(declare-fun b!1585024 () Bool)

(declare-fun e!884876 () List!36948)

(declare-fun call!72616 () List!36948)

(assert (=> b!1585024 (= e!884876 call!72616)))

(declare-fun bm!72613 () Bool)

(assert (=> bm!72613 (= call!72616 call!72615)))

(declare-fun d!167595 () Bool)

(declare-fun e!884878 () Bool)

(assert (=> d!167595 e!884878))

(declare-fun res!1082557 () Bool)

(assert (=> d!167595 (=> (not res!1082557) (not e!884878))))

(declare-fun lt!677310 () List!36948)

(assert (=> d!167595 (= res!1082557 (isStrictlySorted!1173 lt!677310))))

(assert (=> d!167595 (= lt!677310 e!884875)))

(declare-fun c!146954 () Bool)

(assert (=> d!167595 (= c!146954 (and ((_ is Cons!36944) (t!51864 l!1251)) (bvslt (_1!12923 (h!38487 (t!51864 l!1251))) newKey!123)))))

(assert (=> d!167595 (isStrictlySorted!1173 (t!51864 l!1251))))

(assert (=> d!167595 (= (insertStrictlySorted!630 (t!51864 l!1251) newKey!123 newValue!123) lt!677310)))

(declare-fun e!884877 () List!36948)

(declare-fun bm!72614 () Bool)

(assert (=> bm!72614 (= call!72617 ($colon$colon!1025 e!884877 (ite c!146954 (h!38487 (t!51864 l!1251)) (tuple2!25825 newKey!123 newValue!123))))))

(declare-fun c!146953 () Bool)

(assert (=> bm!72614 (= c!146953 c!146954)))

(declare-fun b!1585025 () Bool)

(declare-fun c!146952 () Bool)

(assert (=> b!1585025 (= c!146952 (and ((_ is Cons!36944) (t!51864 l!1251)) (bvsgt (_1!12923 (h!38487 (t!51864 l!1251))) newKey!123)))))

(declare-fun e!884874 () List!36948)

(assert (=> b!1585025 (= e!884874 e!884876)))

(declare-fun b!1585026 () Bool)

(assert (=> b!1585026 (= e!884878 (contains!10529 lt!677310 (tuple2!25825 newKey!123 newValue!123)))))

(declare-fun b!1585027 () Bool)

(declare-fun res!1082556 () Bool)

(assert (=> b!1585027 (=> (not res!1082556) (not e!884878))))

(assert (=> b!1585027 (= res!1082556 (containsKey!1007 lt!677310 newKey!123))))

(declare-fun b!1585028 () Bool)

(assert (=> b!1585028 (= e!884877 (insertStrictlySorted!630 (t!51864 (t!51864 l!1251)) newKey!123 newValue!123))))

(declare-fun b!1585029 () Bool)

(assert (=> b!1585029 (= e!884875 e!884874)))

(declare-fun c!146955 () Bool)

(assert (=> b!1585029 (= c!146955 (and ((_ is Cons!36944) (t!51864 l!1251)) (= (_1!12923 (h!38487 (t!51864 l!1251))) newKey!123)))))

(declare-fun b!1585030 () Bool)

(assert (=> b!1585030 (= e!884876 call!72616)))

(declare-fun b!1585031 () Bool)

(assert (=> b!1585031 (= e!884877 (ite c!146955 (t!51864 (t!51864 l!1251)) (ite c!146952 (Cons!36944 (h!38487 (t!51864 l!1251)) (t!51864 (t!51864 l!1251))) Nil!36945)))))

(declare-fun b!1585032 () Bool)

(assert (=> b!1585032 (= e!884874 call!72615)))

(assert (= (and d!167595 c!146954) b!1585023))

(assert (= (and d!167595 (not c!146954)) b!1585029))

(assert (= (and b!1585029 c!146955) b!1585032))

(assert (= (and b!1585029 (not c!146955)) b!1585025))

(assert (= (and b!1585025 c!146952) b!1585024))

(assert (= (and b!1585025 (not c!146952)) b!1585030))

(assert (= (or b!1585024 b!1585030) bm!72613))

(assert (= (or b!1585032 bm!72613) bm!72612))

