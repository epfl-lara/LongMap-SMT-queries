; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!138478 () Bool)

(assert start!138478)

(declare-fun b!1586771 () Bool)

(declare-fun e!885929 () Bool)

(declare-datatypes ((B!2916 0))(
  ( (B!2917 (val!19820 Int)) )
))
(declare-datatypes ((tuple2!25868 0))(
  ( (tuple2!25869 (_1!12945 (_ BitVec 64)) (_2!12945 B!2916)) )
))
(declare-datatypes ((List!36972 0))(
  ( (Nil!36969) (Cons!36968 (h!38529 tuple2!25868) (t!51878 List!36972)) )
))
(declare-fun l!1251 () List!36972)

(declare-fun otherKey!56 () (_ BitVec 64))

(declare-fun containsKey!1000 (List!36972 (_ BitVec 64)) Bool)

(assert (=> b!1586771 (= e!885929 (containsKey!1000 (t!51878 l!1251) otherKey!56))))

(declare-fun b!1586772 () Bool)

(declare-fun res!1083025 () Bool)

(declare-fun e!885931 () Bool)

(assert (=> b!1586772 (=> (not res!1083025) (not e!885931))))

(assert (=> b!1586772 (= res!1083025 (not (containsKey!1000 l!1251 otherKey!56)))))

(declare-fun b!1586773 () Bool)

(declare-fun res!1083027 () Bool)

(assert (=> b!1586773 (=> (not res!1083027) (not e!885931))))

(declare-fun newKey!123 () (_ BitVec 64))

(assert (=> b!1586773 (= res!1083027 (and (not (= otherKey!56 newKey!123)) (is-Cons!36968 l!1251)))))

(declare-fun res!1083026 () Bool)

(assert (=> start!138478 (=> (not res!1083026) (not e!885931))))

(declare-fun isStrictlySorted!1153 (List!36972) Bool)

(assert (=> start!138478 (= res!1083026 (isStrictlySorted!1153 l!1251))))

(assert (=> start!138478 e!885931))

(declare-fun e!885930 () Bool)

(assert (=> start!138478 e!885930))

(assert (=> start!138478 true))

(declare-fun b!1586774 () Bool)

(assert (=> b!1586774 (= e!885931 e!885929)))

(declare-fun res!1083028 () Bool)

(assert (=> b!1586774 (=> res!1083028 e!885929)))

(assert (=> b!1586774 (= res!1083028 (not (isStrictlySorted!1153 (t!51878 l!1251))))))

(declare-fun b!1586775 () Bool)

(declare-fun tp_is_empty!39449 () Bool)

(declare-fun tp!115091 () Bool)

(assert (=> b!1586775 (= e!885930 (and tp_is_empty!39449 tp!115091))))

(assert (= (and start!138478 res!1083026) b!1586772))

(assert (= (and b!1586772 res!1083025) b!1586773))

(assert (= (and b!1586773 res!1083027) b!1586774))

(assert (= (and b!1586774 (not res!1083028)) b!1586771))

(assert (= (and start!138478 (is-Cons!36968 l!1251)) b!1586775))

(declare-fun m!1455991 () Bool)

(assert (=> b!1586771 m!1455991))

(declare-fun m!1455993 () Bool)

(assert (=> b!1586772 m!1455993))

(declare-fun m!1455995 () Bool)

(assert (=> start!138478 m!1455995))

(declare-fun m!1455997 () Bool)

(assert (=> b!1586774 m!1455997))

(push 1)

(assert (not b!1586774))

(assert (not b!1586771))

(assert (not b!1586772))

(assert (not b!1586775))

(assert (not start!138478))

(assert tp_is_empty!39449)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!168109 () Bool)

(declare-fun res!1083045 () Bool)

(declare-fun e!885948 () Bool)

(assert (=> d!168109 (=> res!1083045 e!885948)))

(assert (=> d!168109 (= res!1083045 (or (is-Nil!36969 (t!51878 l!1251)) (is-Nil!36969 (t!51878 (t!51878 l!1251)))))))

(assert (=> d!168109 (= (isStrictlySorted!1153 (t!51878 l!1251)) e!885948)))

(declare-fun b!1586792 () Bool)

(declare-fun e!885949 () Bool)

(assert (=> b!1586792 (= e!885948 e!885949)))

(declare-fun res!1083046 () Bool)

(assert (=> b!1586792 (=> (not res!1083046) (not e!885949))))

(assert (=> b!1586792 (= res!1083046 (bvslt (_1!12945 (h!38529 (t!51878 l!1251))) (_1!12945 (h!38529 (t!51878 (t!51878 l!1251))))))))

(declare-fun b!1586793 () Bool)

(assert (=> b!1586793 (= e!885949 (isStrictlySorted!1153 (t!51878 (t!51878 l!1251))))))

(assert (= (and d!168109 (not res!1083045)) b!1586792))

(assert (= (and b!1586792 res!1083046) b!1586793))

(declare-fun m!1456003 () Bool)

(assert (=> b!1586793 m!1456003))

(assert (=> b!1586774 d!168109))

(declare-fun d!168115 () Bool)

(declare-fun res!1083071 () Bool)

(declare-fun e!885976 () Bool)

(assert (=> d!168115 (=> res!1083071 e!885976)))

(assert (=> d!168115 (= res!1083071 (and (is-Cons!36968 l!1251) (= (_1!12945 (h!38529 l!1251)) otherKey!56)))))

(assert (=> d!168115 (= (containsKey!1000 l!1251 otherKey!56) e!885976)))

(declare-fun b!1586822 () Bool)

(declare-fun e!885977 () Bool)

(assert (=> b!1586822 (= e!885976 e!885977)))

(declare-fun res!1083072 () Bool)

(assert (=> b!1586822 (=> (not res!1083072) (not e!885977))))

(assert (=> b!1586822 (= res!1083072 (and (or (not (is-Cons!36968 l!1251)) (bvsle (_1!12945 (h!38529 l!1251)) otherKey!56)) (is-Cons!36968 l!1251) (bvslt (_1!12945 (h!38529 l!1251)) otherKey!56)))))

(declare-fun b!1586823 () Bool)

(assert (=> b!1586823 (= e!885977 (containsKey!1000 (t!51878 l!1251) otherKey!56))))

(assert (= (and d!168115 (not res!1083071)) b!1586822))

(assert (= (and b!1586822 res!1083072) b!1586823))

(assert (=> b!1586823 m!1455991))

(assert (=> b!1586772 d!168115))

(declare-fun d!168125 () Bool)

(declare-fun res!1083073 () Bool)

(declare-fun e!885981 () Bool)

(assert (=> d!168125 (=> res!1083073 e!885981)))

(assert (=> d!168125 (= res!1083073 (or (is-Nil!36969 l!1251) (is-Nil!36969 (t!51878 l!1251))))))

(assert (=> d!168125 (= (isStrictlySorted!1153 l!1251) e!885981)))

(declare-fun b!1586829 () Bool)

(declare-fun e!885982 () Bool)

(assert (=> b!1586829 (= e!885981 e!885982)))

(declare-fun res!1083074 () Bool)

(assert (=> b!1586829 (=> (not res!1083074) (not e!885982))))

(assert (=> b!1586829 (= res!1083074 (bvslt (_1!12945 (h!38529 l!1251)) (_1!12945 (h!38529 (t!51878 l!1251)))))))

(declare-fun b!1586830 () Bool)

(assert (=> b!1586830 (= e!885982 (isStrictlySorted!1153 (t!51878 l!1251)))))

(assert (= (and d!168125 (not res!1083073)) b!1586829))

(assert (= (and b!1586829 res!1083074) b!1586830))

(assert (=> b!1586830 m!1455997))

(assert (=> start!138478 d!168125))

(declare-fun d!168127 () Bool)

(declare-fun res!1083075 () Bool)

(declare-fun e!885983 () Bool)

(assert (=> d!168127 (=> res!1083075 e!885983)))

(assert (=> d!168127 (= res!1083075 (and (is-Cons!36968 (t!51878 l!1251)) (= (_1!12945 (h!38529 (t!51878 l!1251))) otherKey!56)))))

(assert (=> d!168127 (= (containsKey!1000 (t!51878 l!1251) otherKey!56) e!885983)))

(declare-fun b!1586831 () Bool)

(declare-fun e!885984 () Bool)

(assert (=> b!1586831 (= e!885983 e!885984)))

(declare-fun res!1083076 () Bool)

(assert (=> b!1586831 (=> (not res!1083076) (not e!885984))))

(assert (=> b!1586831 (= res!1083076 (and (or (not (is-Cons!36968 (t!51878 l!1251))) (bvsle (_1!12945 (h!38529 (t!51878 l!1251))) otherKey!56)) (is-Cons!36968 (t!51878 l!1251)) (bvslt (_1!12945 (h!38529 (t!51878 l!1251))) otherKey!56)))))

(declare-fun b!1586832 () Bool)

(assert (=> b!1586832 (= e!885984 (containsKey!1000 (t!51878 (t!51878 l!1251)) otherKey!56))))

(assert (= (and d!168127 (not res!1083075)) b!1586831))

(assert (= (and b!1586831 res!1083076) b!1586832))

(declare-fun m!1456009 () Bool)

(assert (=> b!1586832 m!1456009))

(assert (=> b!1586771 d!168127))

(declare-fun b!1586838 () Bool)

(declare-fun e!885988 () Bool)

(declare-fun tp!115100 () Bool)

(assert (=> b!1586838 (= e!885988 (and tp_is_empty!39449 tp!115100))))

(assert (=> b!1586775 (= tp!115091 e!885988)))

(assert (= (and b!1586775 (is-Cons!36968 (t!51878 l!1251))) b!1586838))

(push 1)

(assert (not b!1586830))

(assert (not b!1586823))

(assert (not b!1586832))

(assert (not b!1586793))

(assert (not b!1586838))

(assert tp_is_empty!39449)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

