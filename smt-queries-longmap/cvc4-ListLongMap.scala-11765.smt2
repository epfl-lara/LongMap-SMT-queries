; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!138124 () Bool)

(assert start!138124)

(declare-fun b!1584846 () Bool)

(declare-fun res!1082475 () Bool)

(declare-fun e!884754 () Bool)

(assert (=> b!1584846 (=> (not res!1082475) (not e!884754))))

(declare-fun newKey!123 () (_ BitVec 64))

(declare-fun otherKey!56 () (_ BitVec 64))

(declare-datatypes ((B!2934 0))(
  ( (B!2935 (val!19829 Int)) )
))
(declare-datatypes ((tuple2!25826 0))(
  ( (tuple2!25827 (_1!12924 (_ BitVec 64)) (_2!12924 B!2934)) )
))
(declare-datatypes ((List!36949 0))(
  ( (Nil!36946) (Cons!36945 (h!38488 tuple2!25826) (t!51865 List!36949)) )
))
(declare-fun l!1251 () List!36949)

(assert (=> b!1584846 (= res!1082475 (and (not (= otherKey!56 newKey!123)) (not (is-Cons!36945 l!1251))))))

(declare-fun b!1584848 () Bool)

(declare-fun e!884755 () Bool)

(declare-fun tp_is_empty!39467 () Bool)

(declare-fun tp!115147 () Bool)

(assert (=> b!1584848 (= e!884755 (and tp_is_empty!39467 tp!115147))))

(declare-fun b!1584847 () Bool)

(declare-fun newValue!123 () B!2934)

(declare-fun containsKey!1008 (List!36949 (_ BitVec 64)) Bool)

(declare-fun insertStrictlySorted!631 (List!36949 (_ BitVec 64) B!2934) List!36949)

(assert (=> b!1584847 (= e!884754 (containsKey!1008 (insertStrictlySorted!631 l!1251 newKey!123 newValue!123) otherKey!56))))

(declare-fun res!1082476 () Bool)

(assert (=> start!138124 (=> (not res!1082476) (not e!884754))))

(declare-fun isStrictlySorted!1174 (List!36949) Bool)

(assert (=> start!138124 (= res!1082476 (isStrictlySorted!1174 l!1251))))

(assert (=> start!138124 e!884754))

(assert (=> start!138124 e!884755))

(assert (=> start!138124 true))

(assert (=> start!138124 tp_is_empty!39467))

(declare-fun b!1584845 () Bool)

(declare-fun res!1082477 () Bool)

(assert (=> b!1584845 (=> (not res!1082477) (not e!884754))))

(assert (=> b!1584845 (= res!1082477 (not (containsKey!1008 l!1251 otherKey!56)))))

(assert (= (and start!138124 res!1082476) b!1584845))

(assert (= (and b!1584845 res!1082477) b!1584846))

(assert (= (and b!1584846 res!1082475) b!1584847))

(assert (= (and start!138124 (is-Cons!36945 l!1251)) b!1584848))

(declare-fun m!1453971 () Bool)

(assert (=> b!1584847 m!1453971))

(assert (=> b!1584847 m!1453971))

(declare-fun m!1453973 () Bool)

(assert (=> b!1584847 m!1453973))

(declare-fun m!1453975 () Bool)

(assert (=> start!138124 m!1453975))

(declare-fun m!1453977 () Bool)

(assert (=> b!1584845 m!1453977))

(push 1)

(assert (not b!1584848))

(assert (not b!1584847))

(assert (not start!138124))

(assert tp_is_empty!39467)

(assert (not b!1584845))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!167556 () Bool)

(declare-fun res!1082490 () Bool)

(declare-fun e!884768 () Bool)

(assert (=> d!167556 (=> res!1082490 e!884768)))

(assert (=> d!167556 (= res!1082490 (or (is-Nil!36946 l!1251) (is-Nil!36946 (t!51865 l!1251))))))

(assert (=> d!167556 (= (isStrictlySorted!1174 l!1251) e!884768)))

(declare-fun b!1584861 () Bool)

(declare-fun e!884769 () Bool)

(assert (=> b!1584861 (= e!884768 e!884769)))

(declare-fun res!1082491 () Bool)

(assert (=> b!1584861 (=> (not res!1082491) (not e!884769))))

(assert (=> b!1584861 (= res!1082491 (bvslt (_1!12924 (h!38488 l!1251)) (_1!12924 (h!38488 (t!51865 l!1251)))))))

(declare-fun b!1584862 () Bool)

(assert (=> b!1584862 (= e!884769 (isStrictlySorted!1174 (t!51865 l!1251)))))

(assert (= (and d!167556 (not res!1082490)) b!1584861))

(assert (= (and b!1584861 res!1082491) b!1584862))

(declare-fun m!1453979 () Bool)

(assert (=> b!1584862 m!1453979))

(assert (=> start!138124 d!167556))

(declare-fun d!167561 () Bool)

(declare-fun res!1082506 () Bool)

(declare-fun e!884784 () Bool)

(assert (=> d!167561 (=> res!1082506 e!884784)))

(assert (=> d!167561 (= res!1082506 (and (is-Cons!36945 (insertStrictlySorted!631 l!1251 newKey!123 newValue!123)) (= (_1!12924 (h!38488 (insertStrictlySorted!631 l!1251 newKey!123 newValue!123))) otherKey!56)))))

(assert (=> d!167561 (= (containsKey!1008 (insertStrictlySorted!631 l!1251 newKey!123 newValue!123) otherKey!56) e!884784)))

(declare-fun b!1584877 () Bool)

(declare-fun e!884785 () Bool)

(assert (=> b!1584877 (= e!884784 e!884785)))

(declare-fun res!1082507 () Bool)

(assert (=> b!1584877 (=> (not res!1082507) (not e!884785))))

(assert (=> b!1584877 (= res!1082507 (and (or (not (is-Cons!36945 (insertStrictlySorted!631 l!1251 newKey!123 newValue!123))) (bvsle (_1!12924 (h!38488 (insertStrictlySorted!631 l!1251 newKey!123 newValue!123))) otherKey!56)) (is-Cons!36945 (insertStrictlySorted!631 l!1251 newKey!123 newValue!123)) (bvslt (_1!12924 (h!38488 (insertStrictlySorted!631 l!1251 newKey!123 newValue!123))) otherKey!56)))))

(declare-fun b!1584878 () Bool)

(assert (=> b!1584878 (= e!884785 (containsKey!1008 (t!51865 (insertStrictlySorted!631 l!1251 newKey!123 newValue!123)) otherKey!56))))

(assert (= (and d!167561 (not res!1082506)) b!1584877))

(assert (= (and b!1584877 res!1082507) b!1584878))

(declare-fun m!1453987 () Bool)

(assert (=> b!1584878 m!1453987))

(assert (=> b!1584847 d!167561))

(declare-fun bm!72603 () Bool)

(declare-fun call!72606 () List!36949)

(declare-fun call!72607 () List!36949)

(assert (=> bm!72603 (= call!72606 call!72607)))

(declare-fun b!1584953 () Bool)

(declare-fun c!146940 () Bool)

(assert (=> b!1584953 (= c!146940 (and (is-Cons!36945 l!1251) (bvsgt (_1!12924 (h!38488 l!1251)) newKey!123)))))

(declare-fun e!884826 () List!36949)

(declare-fun e!884827 () List!36949)

(assert (=> b!1584953 (= e!884826 e!884827)))

(declare-fun b!1584954 () Bool)

(declare-fun e!884829 () List!36949)

(assert (=> b!1584954 (= e!884829 e!884826)))

(declare-fun c!146942 () Bool)

(assert (=> b!1584954 (= c!146942 (and (is-Cons!36945 l!1251) (= (_1!12924 (h!38488 l!1251)) newKey!123)))))

(declare-fun d!167569 () Bool)

(declare-fun e!884825 () Bool)

(assert (=> d!167569 e!884825))

(declare-fun res!1082526 () Bool)

(assert (=> d!167569 (=> (not res!1082526) (not e!884825))))

(declare-fun lt!677304 () List!36949)

(assert (=> d!167569 (= res!1082526 (isStrictlySorted!1174 lt!677304))))

(assert (=> d!167569 (= lt!677304 e!884829)))

(declare-fun c!146941 () Bool)

(assert (=> d!167569 (= c!146941 (and (is-Cons!36945 l!1251) (bvslt (_1!12924 (h!38488 l!1251)) newKey!123)))))

(assert (=> d!167569 (isStrictlySorted!1174 l!1251)))

(assert (=> d!167569 (= (insertStrictlySorted!631 l!1251 newKey!123 newValue!123) lt!677304)))

(declare-fun b!1584955 () Bool)

(assert (=> b!1584955 (= e!884826 call!72607)))

(declare-fun e!884828 () List!36949)

(declare-fun b!1584956 () Bool)

(assert (=> b!1584956 (= e!884828 (insertStrictlySorted!631 (t!51865 l!1251) newKey!123 newValue!123))))

(declare-fun b!1584957 () Bool)

(declare-fun call!72608 () List!36949)

(assert (=> b!1584957 (= e!884829 call!72608)))

(declare-fun b!1584958 () Bool)

(assert (=> b!1584958 (= e!884828 (ite c!146942 (t!51865 l!1251) (ite c!146940 (Cons!36945 (h!38488 l!1251) (t!51865 l!1251)) Nil!36946)))))

(declare-fun b!1584959 () Bool)

(assert (=> b!1584959 (= e!884827 call!72606)))

(declare-fun bm!72604 () Bool)

(assert (=> bm!72604 (= call!72607 call!72608)))

(declare-fun b!1584960 () Bool)

(assert (=> b!1584960 (= e!884827 call!72606)))

(declare-fun b!1584961 () Bool)

(declare-fun res!1082527 () Bool)

(assert (=> b!1584961 (=> (not res!1082527) (not e!884825))))

(assert (=> b!1584961 (= res!1082527 (containsKey!1008 lt!677304 newKey!123))))

(declare-fun bm!72605 () Bool)

(declare-fun $colon$colon!1027 (List!36949 tuple2!25826) List!36949)

(assert (=> bm!72605 (= call!72608 ($colon$colon!1027 e!884828 (ite c!146941 (h!38488 l!1251) (tuple2!25827 newKey!123 newValue!123))))))

(declare-fun c!146943 () Bool)

(assert (=> bm!72605 (= c!146943 c!146941)))

(declare-fun b!1584962 () Bool)

(declare-fun contains!10531 (List!36949 tuple2!25826) Bool)

(assert (=> b!1584962 (= e!884825 (contains!10531 lt!677304 (tuple2!25827 newKey!123 newValue!123)))))

(assert (= (and d!167569 c!146941) b!1584957))

(assert (= (and d!167569 (not c!146941)) b!1584954))

(assert (= (and b!1584954 c!146942) b!1584955))

(assert (= (and b!1584954 (not c!146942)) b!1584953))

(assert (= (and b!1584953 c!146940) b!1584960))

(assert (= (and b!1584953 (not c!146940)) b!1584959))

(assert (= (or b!1584960 b!1584959) bm!72603))

(assert (= (or b!1584955 bm!72603) bm!72604))

(assert (= (or b!1584957 bm!72604) bm!72605))

(assert (= (and bm!72605 c!146943) b!1584956))

(assert (= (and bm!72605 (not c!146943)) b!1584958))

(assert (= (and d!167569 res!1082526) b!1584961))

(assert (= (and b!1584961 res!1082527) b!1584962))

(declare-fun m!1454003 () Bool)

(assert (=> bm!72605 m!1454003))

(declare-fun m!1454005 () Bool)

(assert (=> b!1584956 m!1454005))

(declare-fun m!1454007 () Bool)

(assert (=> b!1584961 m!1454007))

(declare-fun m!1454009 () Bool)

(assert (=> d!167569 m!1454009))

(assert (=> d!167569 m!1453975))

(declare-fun m!1454011 () Bool)

(assert (=> b!1584962 m!1454011))

(assert (=> b!1584847 d!167569))

(declare-fun d!167577 () Bool)

(declare-fun res!1082534 () Bool)

(declare-fun e!884839 () Bool)

(assert (=> d!167577 (=> res!1082534 e!884839)))

(assert (=> d!167577 (= res!1082534 (and (is-Cons!36945 l!1251) (= (_1!12924 (h!38488 l!1251)) otherKey!56)))))

(assert (=> d!167577 (= (containsKey!1008 l!1251 otherKey!56) e!884839)))

(declare-fun b!1584977 () Bool)

(declare-fun e!884840 () Bool)

(assert (=> b!1584977 (= e!884839 e!884840)))

(declare-fun res!1082535 () Bool)

(assert (=> b!1584977 (=> (not res!1082535) (not e!884840))))

(assert (=> b!1584977 (= res!1082535 (and (or (not (is-Cons!36945 l!1251)) (bvsle (_1!12924 (h!38488 l!1251)) otherKey!56)) (is-Cons!36945 l!1251) (bvslt (_1!12924 (h!38488 l!1251)) otherKey!56)))))

(declare-fun b!1584978 () Bool)

(assert (=> b!1584978 (= e!884840 (containsKey!1008 (t!51865 l!1251) otherKey!56))))

(assert (= (and d!167577 (not res!1082534)) b!1584977))

(assert (= (and b!1584977 res!1082535) b!1584978))

(declare-fun m!1454023 () Bool)

(assert (=> b!1584978 m!1454023))

(assert (=> b!1584845 d!167577))

(declare-fun b!1584994 () Bool)

(declare-fun e!884850 () Bool)

(declare-fun tp!115153 () Bool)

(assert (=> b!1584994 (= e!884850 (and tp_is_empty!39467 tp!115153))))

(assert (=> b!1584848 (= tp!115147 e!884850)))

(assert (= (and b!1584848 (is-Cons!36945 (t!51865 l!1251))) b!1584994))

(push 1)

(assert (not b!1584962))

(assert (not b!1584862))

(assert tp_is_empty!39467)

(assert (not b!1584956))

(assert (not b!1584878))

(assert (not b!1584994))

(assert (not d!167569))

(assert (not b!1584961))

(assert (not b!1584978))

(assert (not bm!72605))

(check-sat)

(pop 1)

(push 1)

(check-sat)

