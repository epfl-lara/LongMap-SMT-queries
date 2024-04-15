; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!138004 () Bool)

(assert start!138004)

(declare-fun b!1583951 () Bool)

(declare-fun e!884176 () Bool)

(declare-fun tp_is_empty!39449 () Bool)

(declare-fun tp!115091 () Bool)

(assert (=> b!1583951 (= e!884176 (and tp_is_empty!39449 tp!115091))))

(declare-fun b!1583952 () Bool)

(declare-fun res!1081979 () Bool)

(declare-fun e!884175 () Bool)

(assert (=> b!1583952 (=> (not res!1081979) (not e!884175))))

(declare-datatypes ((B!2916 0))(
  ( (B!2917 (val!19820 Int)) )
))
(declare-datatypes ((tuple2!25876 0))(
  ( (tuple2!25877 (_1!12949 (_ BitVec 64)) (_2!12949 B!2916)) )
))
(declare-datatypes ((List!36981 0))(
  ( (Nil!36978) (Cons!36977 (h!38521 tuple2!25876) (t!51887 List!36981)) )
))
(declare-fun l!1251 () List!36981)

(declare-fun otherKey!56 () (_ BitVec 64))

(declare-fun containsKey!997 (List!36981 (_ BitVec 64)) Bool)

(assert (=> b!1583952 (= res!1081979 (not (containsKey!997 l!1251 otherKey!56)))))

(declare-fun b!1583953 () Bool)

(declare-fun e!884174 () Bool)

(assert (=> b!1583953 (= e!884175 e!884174)))

(declare-fun res!1081977 () Bool)

(assert (=> b!1583953 (=> res!1081977 e!884174)))

(declare-fun isStrictlySorted!1163 (List!36981) Bool)

(assert (=> b!1583953 (= res!1081977 (not (isStrictlySorted!1163 (t!51887 l!1251))))))

(declare-fun res!1081976 () Bool)

(assert (=> start!138004 (=> (not res!1081976) (not e!884175))))

(assert (=> start!138004 (= res!1081976 (isStrictlySorted!1163 l!1251))))

(assert (=> start!138004 e!884175))

(assert (=> start!138004 e!884176))

(assert (=> start!138004 true))

(declare-fun b!1583954 () Bool)

(declare-fun res!1081978 () Bool)

(assert (=> b!1583954 (=> (not res!1081978) (not e!884175))))

(declare-fun newKey!123 () (_ BitVec 64))

(assert (=> b!1583954 (= res!1081978 (and (not (= otherKey!56 newKey!123)) (is-Cons!36977 l!1251)))))

(declare-fun b!1583955 () Bool)

(assert (=> b!1583955 (= e!884174 (containsKey!997 (t!51887 l!1251) otherKey!56))))

(assert (= (and start!138004 res!1081976) b!1583952))

(assert (= (and b!1583952 res!1081979) b!1583954))

(assert (= (and b!1583954 res!1081978) b!1583953))

(assert (= (and b!1583953 (not res!1081977)) b!1583955))

(assert (= (and start!138004 (is-Cons!36977 l!1251)) b!1583951))

(declare-fun m!1452785 () Bool)

(assert (=> b!1583952 m!1452785))

(declare-fun m!1452787 () Bool)

(assert (=> b!1583953 m!1452787))

(declare-fun m!1452789 () Bool)

(assert (=> start!138004 m!1452789))

(declare-fun m!1452791 () Bool)

(assert (=> b!1583955 m!1452791))

(push 1)

(assert (not b!1583951))

(assert (not b!1583952))

(assert (not start!138004))

(assert (not b!1583953))

(assert (not b!1583955))

(assert tp_is_empty!39449)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!167139 () Bool)

(declare-fun res!1081996 () Bool)

(declare-fun e!884193 () Bool)

(assert (=> d!167139 (=> res!1081996 e!884193)))

(assert (=> d!167139 (= res!1081996 (or (is-Nil!36978 l!1251) (is-Nil!36978 (t!51887 l!1251))))))

(assert (=> d!167139 (= (isStrictlySorted!1163 l!1251) e!884193)))

(declare-fun b!1583972 () Bool)

(declare-fun e!884194 () Bool)

(assert (=> b!1583972 (= e!884193 e!884194)))

(declare-fun res!1081997 () Bool)

(assert (=> b!1583972 (=> (not res!1081997) (not e!884194))))

(assert (=> b!1583972 (= res!1081997 (bvslt (_1!12949 (h!38521 l!1251)) (_1!12949 (h!38521 (t!51887 l!1251)))))))

(declare-fun b!1583973 () Bool)

(assert (=> b!1583973 (= e!884194 (isStrictlySorted!1163 (t!51887 l!1251)))))

(assert (= (and d!167139 (not res!1081996)) b!1583972))

(assert (= (and b!1583972 res!1081997) b!1583973))

(assert (=> b!1583973 m!1452787))

(assert (=> start!138004 d!167139))

(declare-fun d!167147 () Bool)

(declare-fun res!1082018 () Bool)

(declare-fun e!884215 () Bool)

(assert (=> d!167147 (=> res!1082018 e!884215)))

(assert (=> d!167147 (= res!1082018 (and (is-Cons!36977 (t!51887 l!1251)) (= (_1!12949 (h!38521 (t!51887 l!1251))) otherKey!56)))))

(assert (=> d!167147 (= (containsKey!997 (t!51887 l!1251) otherKey!56) e!884215)))

(declare-fun b!1583994 () Bool)

(declare-fun e!884216 () Bool)

(assert (=> b!1583994 (= e!884215 e!884216)))

(declare-fun res!1082019 () Bool)

(assert (=> b!1583994 (=> (not res!1082019) (not e!884216))))

(assert (=> b!1583994 (= res!1082019 (and (or (not (is-Cons!36977 (t!51887 l!1251))) (bvsle (_1!12949 (h!38521 (t!51887 l!1251))) otherKey!56)) (is-Cons!36977 (t!51887 l!1251)) (bvslt (_1!12949 (h!38521 (t!51887 l!1251))) otherKey!56)))))

(declare-fun b!1583995 () Bool)

(assert (=> b!1583995 (= e!884216 (containsKey!997 (t!51887 (t!51887 l!1251)) otherKey!56))))

(assert (= (and d!167147 (not res!1082018)) b!1583994))

(assert (= (and b!1583994 res!1082019) b!1583995))

(declare-fun m!1452799 () Bool)

(assert (=> b!1583995 m!1452799))

(assert (=> b!1583955 d!167147))

(declare-fun d!167155 () Bool)

(declare-fun res!1082020 () Bool)

(declare-fun e!884219 () Bool)

(assert (=> d!167155 (=> res!1082020 e!884219)))

(assert (=> d!167155 (= res!1082020 (or (is-Nil!36978 (t!51887 l!1251)) (is-Nil!36978 (t!51887 (t!51887 l!1251)))))))

(assert (=> d!167155 (= (isStrictlySorted!1163 (t!51887 l!1251)) e!884219)))

(declare-fun b!1584000 () Bool)

(declare-fun e!884220 () Bool)

(assert (=> b!1584000 (= e!884219 e!884220)))

(declare-fun res!1082021 () Bool)

(assert (=> b!1584000 (=> (not res!1082021) (not e!884220))))

(assert (=> b!1584000 (= res!1082021 (bvslt (_1!12949 (h!38521 (t!51887 l!1251))) (_1!12949 (h!38521 (t!51887 (t!51887 l!1251))))))))

(declare-fun b!1584001 () Bool)

(assert (=> b!1584001 (= e!884220 (isStrictlySorted!1163 (t!51887 (t!51887 l!1251))))))

(assert (= (and d!167155 (not res!1082020)) b!1584000))

(assert (= (and b!1584000 res!1082021) b!1584001))

(declare-fun m!1452801 () Bool)

(assert (=> b!1584001 m!1452801))

(assert (=> b!1583953 d!167155))

(declare-fun d!167157 () Bool)

(declare-fun res!1082024 () Bool)

(declare-fun e!884224 () Bool)

(assert (=> d!167157 (=> res!1082024 e!884224)))

(assert (=> d!167157 (= res!1082024 (and (is-Cons!36977 l!1251) (= (_1!12949 (h!38521 l!1251)) otherKey!56)))))

(assert (=> d!167157 (= (containsKey!997 l!1251 otherKey!56) e!884224)))

(declare-fun b!1584005 () Bool)

(declare-fun e!884225 () Bool)

(assert (=> b!1584005 (= e!884224 e!884225)))

(declare-fun res!1082025 () Bool)

(assert (=> b!1584005 (=> (not res!1082025) (not e!884225))))

(assert (=> b!1584005 (= res!1082025 (and (or (not (is-Cons!36977 l!1251)) (bvsle (_1!12949 (h!38521 l!1251)) otherKey!56)) (is-Cons!36977 l!1251) (bvslt (_1!12949 (h!38521 l!1251)) otherKey!56)))))

(declare-fun b!1584006 () Bool)

(assert (=> b!1584006 (= e!884225 (containsKey!997 (t!51887 l!1251) otherKey!56))))

(assert (= (and d!167157 (not res!1082024)) b!1584005))

(assert (= (and b!1584005 res!1082025) b!1584006))

(assert (=> b!1584006 m!1452791))

(assert (=> b!1583952 d!167157))

(declare-fun b!1584017 () Bool)

(declare-fun e!884232 () Bool)

(declare-fun tp!115099 () Bool)

(assert (=> b!1584017 (= e!884232 (and tp_is_empty!39449 tp!115099))))

(assert (=> b!1583951 (= tp!115091 e!884232)))

(assert (= (and b!1583951 (is-Cons!36977 (t!51887 l!1251))) b!1584017))

(push 1)

(assert (not b!1583973))

(assert tp_is_empty!39449)

(assert (not b!1584017))

(assert (not b!1584001))

(assert (not b!1584006))

(assert (not b!1583995))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

