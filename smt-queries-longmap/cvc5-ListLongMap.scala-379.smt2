; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7168 () Bool)

(assert start!7168)

(declare-fun res!26898 () Bool)

(declare-fun e!29261 () Bool)

(assert (=> start!7168 (=> (not res!26898) (not e!29261))))

(declare-datatypes ((B!854 0))(
  ( (B!855 (val!1014 Int)) )
))
(declare-datatypes ((tuple2!1676 0))(
  ( (tuple2!1677 (_1!849 (_ BitVec 64)) (_2!849 B!854)) )
))
(declare-datatypes ((List!1232 0))(
  ( (Nil!1229) (Cons!1228 (h!1808 tuple2!1676) (t!4257 List!1232)) )
))
(declare-fun l!812 () List!1232)

(declare-fun isStrictlySorted!226 (List!1232) Bool)

(assert (=> start!7168 (= res!26898 (isStrictlySorted!226 l!812))))

(assert (=> start!7168 e!29261))

(declare-fun e!29260 () Bool)

(assert (=> start!7168 e!29260))

(assert (=> start!7168 true))

(declare-fun b!45961 () Bool)

(declare-fun res!26897 () Bool)

(assert (=> b!45961 (=> (not res!26897) (not e!29261))))

(assert (=> b!45961 (= res!26897 (not (is-Cons!1228 l!812)))))

(declare-fun b!45962 () Bool)

(declare-fun key1!43 () (_ BitVec 64))

(declare-fun removeStrictlySorted!36 (List!1232 (_ BitVec 64)) List!1232)

(assert (=> b!45962 (= e!29261 (not (isStrictlySorted!226 (removeStrictlySorted!36 l!812 key1!43))))))

(declare-fun b!45963 () Bool)

(declare-fun tp_is_empty!1951 () Bool)

(declare-fun tp!6038 () Bool)

(assert (=> b!45963 (= e!29260 (and tp_is_empty!1951 tp!6038))))

(assert (= (and start!7168 res!26898) b!45961))

(assert (= (and b!45961 res!26897) b!45962))

(assert (= (and start!7168 (is-Cons!1228 l!812)) b!45963))

(declare-fun m!40527 () Bool)

(assert (=> start!7168 m!40527))

(declare-fun m!40529 () Bool)

(assert (=> b!45962 m!40529))

(assert (=> b!45962 m!40529))

(declare-fun m!40531 () Bool)

(assert (=> b!45962 m!40531))

(push 1)

(assert (not b!45962))

(assert (not start!7168))

(assert (not b!45963))

(assert tp_is_empty!1951)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!8995 () Bool)

(declare-fun res!26924 () Bool)

(declare-fun e!29287 () Bool)

(assert (=> d!8995 (=> res!26924 e!29287)))

(assert (=> d!8995 (= res!26924 (or (is-Nil!1229 (removeStrictlySorted!36 l!812 key1!43)) (is-Nil!1229 (t!4257 (removeStrictlySorted!36 l!812 key1!43)))))))

(assert (=> d!8995 (= (isStrictlySorted!226 (removeStrictlySorted!36 l!812 key1!43)) e!29287)))

(declare-fun b!45995 () Bool)

(declare-fun e!29289 () Bool)

(assert (=> b!45995 (= e!29287 e!29289)))

(declare-fun res!26926 () Bool)

(assert (=> b!45995 (=> (not res!26926) (not e!29289))))

(assert (=> b!45995 (= res!26926 (bvslt (_1!849 (h!1808 (removeStrictlySorted!36 l!812 key1!43))) (_1!849 (h!1808 (t!4257 (removeStrictlySorted!36 l!812 key1!43))))))))

(declare-fun b!45997 () Bool)

(assert (=> b!45997 (= e!29289 (isStrictlySorted!226 (t!4257 (removeStrictlySorted!36 l!812 key1!43))))))

(assert (= (and d!8995 (not res!26924)) b!45995))

(assert (= (and b!45995 res!26926) b!45997))

(declare-fun m!40545 () Bool)

(assert (=> b!45997 m!40545))

(assert (=> b!45962 d!8995))

(declare-fun d!8999 () Bool)

(declare-fun e!29315 () Bool)

(assert (=> d!8999 e!29315))

(declare-fun res!26936 () Bool)

(assert (=> d!8999 (=> (not res!26936) (not e!29315))))

(declare-fun lt!20265 () List!1232)

(assert (=> d!8999 (= res!26936 (isStrictlySorted!226 lt!20265))))

(declare-fun e!29314 () List!1232)

(assert (=> d!8999 (= lt!20265 e!29314)))

(declare-fun c!6222 () Bool)

(assert (=> d!8999 (= c!6222 (and (is-Cons!1228 l!812) (= (_1!849 (h!1808 l!812)) key1!43)))))

(assert (=> d!8999 (isStrictlySorted!226 l!812)))

(assert (=> d!8999 (= (removeStrictlySorted!36 l!812 key1!43) lt!20265)))

(declare-fun b!46035 () Bool)

(declare-fun e!29313 () List!1232)

(assert (=> b!46035 (= e!29313 Nil!1229)))

(declare-fun b!46036 () Bool)

(assert (=> b!46036 (= e!29314 (t!4257 l!812))))

(declare-fun b!46037 () Bool)

(assert (=> b!46037 (= e!29314 e!29313)))

(declare-fun c!6223 () Bool)

(assert (=> b!46037 (= c!6223 (and (is-Cons!1228 l!812) (not (= (_1!849 (h!1808 l!812)) key1!43))))))

(declare-fun b!46038 () Bool)

(declare-fun $colon$colon!39 (List!1232 tuple2!1676) List!1232)

(assert (=> b!46038 (= e!29313 ($colon$colon!39 (removeStrictlySorted!36 (t!4257 l!812) key1!43) (h!1808 l!812)))))

(declare-fun b!46039 () Bool)

(declare-fun containsKey!86 (List!1232 (_ BitVec 64)) Bool)

(assert (=> b!46039 (= e!29315 (not (containsKey!86 lt!20265 key1!43)))))

(assert (= (and d!8999 c!6222) b!46036))

(assert (= (and d!8999 (not c!6222)) b!46037))

(assert (= (and b!46037 c!6223) b!46038))

(assert (= (and b!46037 (not c!6223)) b!46035))

(assert (= (and d!8999 res!26936) b!46039))

(declare-fun m!40553 () Bool)

(assert (=> d!8999 m!40553))

(assert (=> d!8999 m!40527))

(declare-fun m!40559 () Bool)

(assert (=> b!46038 m!40559))

(assert (=> b!46038 m!40559))

(declare-fun m!40563 () Bool)

(assert (=> b!46038 m!40563))

(declare-fun m!40565 () Bool)

(assert (=> b!46039 m!40565))

(assert (=> b!45962 d!8999))

(declare-fun d!9007 () Bool)

(declare-fun res!26939 () Bool)

(declare-fun e!29318 () Bool)

(assert (=> d!9007 (=> res!26939 e!29318)))

(assert (=> d!9007 (= res!26939 (or (is-Nil!1229 l!812) (is-Nil!1229 (t!4257 l!812))))))

(assert (=> d!9007 (= (isStrictlySorted!226 l!812) e!29318)))

(declare-fun b!46042 () Bool)

(declare-fun e!29319 () Bool)

(assert (=> b!46042 (= e!29318 e!29319)))

(declare-fun res!26940 () Bool)

(assert (=> b!46042 (=> (not res!26940) (not e!29319))))

(assert (=> b!46042 (= res!26940 (bvslt (_1!849 (h!1808 l!812)) (_1!849 (h!1808 (t!4257 l!812)))))))

(declare-fun b!46043 () Bool)

(assert (=> b!46043 (= e!29319 (isStrictlySorted!226 (t!4257 l!812)))))

(assert (= (and d!9007 (not res!26939)) b!46042))

(assert (= (and b!46042 res!26940) b!46043))

(declare-fun m!40569 () Bool)

(assert (=> b!46043 m!40569))

(assert (=> start!7168 d!9007))

(declare-fun b!46058 () Bool)

(declare-fun e!29328 () Bool)

(declare-fun tp!6050 () Bool)

(assert (=> b!46058 (= e!29328 (and tp_is_empty!1951 tp!6050))))

(assert (=> b!45963 (= tp!6038 e!29328)))

(assert (= (and b!45963 (is-Cons!1228 (t!4257 l!812))) b!46058))

(push 1)

