; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!88304 () Bool)

(assert start!88304)

(declare-fun b!1016960 () Bool)

(assert (=> b!1016960 true))

(assert (=> b!1016960 true))

(declare-fun bs!29524 () Bool)

(declare-fun b!1016955 () Bool)

(assert (= bs!29524 (and b!1016955 b!1016960)))

(declare-datatypes ((B!1554 0))(
  ( (B!1555 (val!11861 Int)) )
))
(declare-datatypes ((tuple2!15348 0))(
  ( (tuple2!15349 (_1!7685 (_ BitVec 64)) (_2!7685 B!1554)) )
))
(declare-datatypes ((List!21580 0))(
  ( (Nil!21577) (Cons!21576 (h!22774 tuple2!15348) (t!30572 List!21580)) )
))
(declare-fun lt!449221 () List!21580)

(declare-fun lambda!1085 () Int)

(declare-fun l!1114 () List!21580)

(declare-fun lambda!1084 () Int)

(assert (=> bs!29524 (= (= lt!449221 l!1114) (= lambda!1085 lambda!1084))))

(assert (=> b!1016955 true))

(assert (=> b!1016955 true))

(declare-fun e!572123 () Bool)

(declare-datatypes ((List!21581 0))(
  ( (Nil!21578) (Cons!21577 (h!22775 (_ BitVec 64)) (t!30573 List!21581)) )
))
(declare-fun keys!40 () List!21581)

(declare-fun forall!295 (List!21581 Int) Bool)

(assert (=> b!1016955 (= e!572123 (forall!295 keys!40 lambda!1085))))

(assert (=> b!1016955 (forall!295 (t!30573 keys!40) lambda!1085)))

(declare-fun value!178 () B!1554)

(declare-fun newHead!31 () tuple2!15348)

(declare-datatypes ((Unit!33163 0))(
  ( (Unit!33164) )
))
(declare-fun lt!449219 () Unit!33163)

(declare-fun lemmaForallGetValueByKeySameWithASmallerHead!56 (List!21580 List!21581 B!1554 tuple2!15348) Unit!33163)

(assert (=> b!1016955 (= lt!449219 (lemmaForallGetValueByKeySameWithASmallerHead!56 l!1114 (t!30573 keys!40) value!178 newHead!31))))

(declare-fun b!1016957 () Bool)

(declare-fun res!682122 () Bool)

(declare-fun e!572122 () Bool)

(assert (=> b!1016957 (=> (not res!682122) (not e!572122))))

(assert (=> b!1016957 (= res!682122 (is-Cons!21577 keys!40))))

(declare-fun b!1016958 () Bool)

(declare-fun res!682125 () Bool)

(assert (=> b!1016958 (=> (not res!682125) (not e!572122))))

(declare-fun isEmpty!905 (List!21580) Bool)

(assert (=> b!1016958 (= res!682125 (not (isEmpty!905 l!1114)))))

(declare-fun b!1016959 () Bool)

(declare-fun res!682127 () Bool)

(assert (=> b!1016959 (=> (not res!682127) (not e!572122))))

(declare-fun head!977 (List!21580) tuple2!15348)

(assert (=> b!1016959 (= res!682127 (bvslt (_1!7685 newHead!31) (_1!7685 (head!977 l!1114))))))

(declare-fun res!682124 () Bool)

(assert (=> b!1016960 (=> (not res!682124) (not e!572122))))

(assert (=> b!1016960 (= res!682124 (forall!295 keys!40 lambda!1084))))

(declare-fun b!1016961 () Bool)

(assert (=> b!1016961 (= e!572122 (not e!572123))))

(declare-fun res!682123 () Bool)

(assert (=> b!1016961 (=> res!682123 e!572123)))

(assert (=> b!1016961 (= res!682123 (not (forall!295 (t!30573 keys!40) lambda!1084)))))

(declare-datatypes ((Option!617 0))(
  ( (Some!616 (v!14464 B!1554)) (None!615) )
))
(declare-fun isDefined!415 (Option!617) Bool)

(declare-fun getValueByKey!566 (List!21580 (_ BitVec 64)) Option!617)

(assert (=> b!1016961 (isDefined!415 (getValueByKey!566 lt!449221 (h!22775 keys!40)))))

(declare-fun lt!449218 () Unit!33163)

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!390 (List!21580 (_ BitVec 64)) Unit!33163)

(assert (=> b!1016961 (= lt!449218 (lemmaContainsKeyImpliesGetValueByKeyDefined!390 lt!449221 (h!22775 keys!40)))))

(assert (=> b!1016961 (= lt!449221 (Cons!21576 newHead!31 l!1114))))

(declare-fun containsKey!501 (List!21580 (_ BitVec 64)) Bool)

(assert (=> b!1016961 (containsKey!501 l!1114 (h!22775 keys!40))))

(declare-fun lt!449220 () Unit!33163)

(declare-fun lemmaGetValueByKeyIsDefinedImpliesContainsKey!21 (List!21580 (_ BitVec 64)) Unit!33163)

(assert (=> b!1016961 (= lt!449220 (lemmaGetValueByKeyIsDefinedImpliesContainsKey!21 l!1114 (h!22775 keys!40)))))

(declare-fun b!1016956 () Bool)

(declare-fun e!572124 () Bool)

(declare-fun tp_is_empty!23621 () Bool)

(declare-fun tp!70835 () Bool)

(assert (=> b!1016956 (= e!572124 (and tp_is_empty!23621 tp!70835))))

(declare-fun res!682126 () Bool)

(assert (=> start!88304 (=> (not res!682126) (not e!572122))))

(declare-fun isStrictlySorted!625 (List!21580) Bool)

(assert (=> start!88304 (= res!682126 (isStrictlySorted!625 l!1114))))

(assert (=> start!88304 e!572122))

(assert (=> start!88304 e!572124))

(assert (=> start!88304 true))

(assert (=> start!88304 tp_is_empty!23621))

(assert (= (and start!88304 res!682126) b!1016958))

(assert (= (and b!1016958 res!682125) b!1016960))

(assert (= (and b!1016960 res!682124) b!1016959))

(assert (= (and b!1016959 res!682127) b!1016957))

(assert (= (and b!1016957 res!682122) b!1016961))

(assert (= (and b!1016961 (not res!682123)) b!1016955))

(assert (= (and start!88304 (is-Cons!21576 l!1114)) b!1016956))

(declare-fun m!937949 () Bool)

(assert (=> b!1016955 m!937949))

(declare-fun m!937951 () Bool)

(assert (=> b!1016955 m!937951))

(declare-fun m!937953 () Bool)

(assert (=> b!1016955 m!937953))

(declare-fun m!937955 () Bool)

(assert (=> b!1016960 m!937955))

(declare-fun m!937957 () Bool)

(assert (=> b!1016958 m!937957))

(declare-fun m!937959 () Bool)

(assert (=> start!88304 m!937959))

(declare-fun m!937961 () Bool)

(assert (=> b!1016961 m!937961))

(declare-fun m!937963 () Bool)

(assert (=> b!1016961 m!937963))

(declare-fun m!937965 () Bool)

(assert (=> b!1016961 m!937965))

(assert (=> b!1016961 m!937961))

(declare-fun m!937967 () Bool)

(assert (=> b!1016961 m!937967))

(declare-fun m!937969 () Bool)

(assert (=> b!1016961 m!937969))

(declare-fun m!937971 () Bool)

(assert (=> b!1016961 m!937971))

(declare-fun m!937973 () Bool)

(assert (=> b!1016959 m!937973))

(push 1)

(assert (not b!1016959))

(assert (not b!1016958))

(assert (not b!1016956))

(assert (not b!1016960))

(assert tp_is_empty!23621)

(assert (not start!88304))

(assert (not b!1016961))

(assert (not b!1016955))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!121335 () Bool)

(declare-fun res!682142 () Bool)

(declare-fun e!572139 () Bool)

(assert (=> d!121335 (=> res!682142 e!572139)))

(assert (=> d!121335 (= res!682142 (is-Nil!21578 keys!40))))

(assert (=> d!121335 (= (forall!295 keys!40 lambda!1085) e!572139)))

(declare-fun b!1016980 () Bool)

(declare-fun e!572140 () Bool)

(assert (=> b!1016980 (= e!572139 e!572140)))

(declare-fun res!682143 () Bool)

(assert (=> b!1016980 (=> (not res!682143) (not e!572140))))

(declare-fun dynLambda!1917 (Int (_ BitVec 64)) Bool)

(assert (=> b!1016980 (= res!682143 (dynLambda!1917 lambda!1085 (h!22775 keys!40)))))

(declare-fun b!1016981 () Bool)

(assert (=> b!1016981 (= e!572140 (forall!295 (t!30573 keys!40) lambda!1085))))

(assert (= (and d!121335 (not res!682142)) b!1016980))

(assert (= (and b!1016980 res!682143) b!1016981))

(declare-fun b_lambda!15563 () Bool)

(assert (=> (not b_lambda!15563) (not b!1016980)))

(declare-fun m!937983 () Bool)

(assert (=> b!1016980 m!937983))

(assert (=> b!1016981 m!937951))

(assert (=> b!1016955 d!121335))

(declare-fun d!121337 () Bool)

(declare-fun res!682150 () Bool)

(declare-fun e!572143 () Bool)

(assert (=> d!121337 (=> res!682150 e!572143)))

(assert (=> d!121337 (= res!682150 (is-Nil!21578 (t!30573 keys!40)))))

(assert (=> d!121337 (= (forall!295 (t!30573 keys!40) lambda!1085) e!572143)))

(declare-fun b!1016986 () Bool)

(declare-fun e!572144 () Bool)

(assert (=> b!1016986 (= e!572143 e!572144)))

(declare-fun res!682151 () Bool)

(assert (=> b!1016986 (=> (not res!682151) (not e!572144))))

(assert (=> b!1016986 (= res!682151 (dynLambda!1917 lambda!1085 (h!22775 (t!30573 keys!40))))))

(declare-fun b!1016987 () Bool)

(assert (=> b!1016987 (= e!572144 (forall!295 (t!30573 (t!30573 keys!40)) lambda!1085))))

(assert (= (and d!121337 (not res!682150)) b!1016986))

(assert (= (and b!1016986 res!682151) b!1016987))

(declare-fun b_lambda!15565 () Bool)

(assert (=> (not b_lambda!15565) (not b!1016986)))

(declare-fun m!937985 () Bool)

(assert (=> b!1016986 m!937985))

(declare-fun m!937987 () Bool)

(assert (=> b!1016987 m!937987))

(assert (=> b!1016955 d!121337))

(declare-fun bs!29530 () Bool)

(declare-fun b!1017007 () Bool)

(assert (= bs!29530 (and b!1017007 b!1016960)))

(declare-fun lambda!1096 () Int)

(assert (=> bs!29530 (= lambda!1096 lambda!1084)))

(declare-fun bs!29531 () Bool)

(assert (= bs!29531 (and b!1017007 b!1016955)))

(assert (=> bs!29531 (= (= l!1114 lt!449221) (= lambda!1096 lambda!1085))))

(assert (=> b!1017007 true))

(assert (=> b!1017007 true))

(declare-fun bs!29532 () Bool)

(declare-fun d!121339 () Bool)

(assert (= bs!29532 (and d!121339 b!1016960)))

(declare-fun lambda!1097 () Int)

(assert (=> bs!29532 (= (= (Cons!21576 newHead!31 l!1114) l!1114) (= lambda!1097 lambda!1084))))

(declare-fun bs!29533 () Bool)

(assert (= bs!29533 (and d!121339 b!1016955)))

(assert (=> bs!29533 (= (= (Cons!21576 newHead!31 l!1114) lt!449221) (= lambda!1097 lambda!1085))))

(declare-fun bs!29534 () Bool)

(assert (= bs!29534 (and d!121339 b!1017007)))

(assert (=> bs!29534 (= (= (Cons!21576 newHead!31 l!1114) l!1114) (= lambda!1097 lambda!1096))))

(assert (=> d!121339 true))

(assert (=> d!121339 true))

(assert (=> d!121339 true))

(assert (=> d!121339 (forall!295 (t!30573 keys!40) lambda!1097)))

(declare-fun lt!449230 () Unit!33163)

(declare-fun choose!1672 (List!21580 List!21581 B!1554 tuple2!15348) Unit!33163)

(assert (=> d!121339 (= lt!449230 (choose!1672 l!1114 (t!30573 keys!40) value!178 newHead!31))))

(declare-fun e!572155 () Bool)

(assert (=> d!121339 e!572155))

(declare-fun res!682168 () Bool)

(assert (=> d!121339 (=> (not res!682168) (not e!572155))))

(assert (=> d!121339 (= res!682168 (isStrictlySorted!625 l!1114))))

(assert (=> d!121339 (= (lemmaForallGetValueByKeySameWithASmallerHead!56 l!1114 (t!30573 keys!40) value!178 newHead!31) lt!449230)))

(declare-fun b!1017006 () Bool)

(declare-fun res!682169 () Bool)

(assert (=> b!1017006 (=> (not res!682169) (not e!572155))))

(assert (=> b!1017006 (= res!682169 (not (isEmpty!905 l!1114)))))

(declare-fun res!682170 () Bool)

(assert (=> b!1017007 (=> (not res!682170) (not e!572155))))

(assert (=> b!1017007 (= res!682170 (forall!295 (t!30573 keys!40) lambda!1096))))

(declare-fun b!1017008 () Bool)

(assert (=> b!1017008 (= e!572155 (bvslt (_1!7685 newHead!31) (_1!7685 (head!977 l!1114))))))

(assert (= (and d!121339 res!682168) b!1017006))

(assert (= (and b!1017006 res!682169) b!1017007))

(assert (= (and b!1017007 res!682170) b!1017008))

(declare-fun m!938007 () Bool)

(assert (=> d!121339 m!938007))

(declare-fun m!938009 () Bool)

(assert (=> d!121339 m!938009))

(assert (=> d!121339 m!937959))

(assert (=> b!1017006 m!937957))

(declare-fun m!938011 () Bool)

(assert (=> b!1017007 m!938011))

(assert (=> b!1017008 m!937973))

(assert (=> b!1016955 d!121339))

(declare-fun d!121357 () Bool)

(declare-fun res!682181 () Bool)

(declare-fun e!572166 () Bool)

(assert (=> d!121357 (=> res!682181 e!572166)))

(assert (=> d!121357 (= res!682181 (is-Nil!21578 keys!40))))

(assert (=> d!121357 (= (forall!295 keys!40 lambda!1084) e!572166)))

(declare-fun b!1017023 () Bool)

(declare-fun e!572167 () Bool)

(assert (=> b!1017023 (= e!572166 e!572167)))

(declare-fun res!682182 () Bool)

(assert (=> b!1017023 (=> (not res!682182) (not e!572167))))

(assert (=> b!1017023 (= res!682182 (dynLambda!1917 lambda!1084 (h!22775 keys!40)))))

(declare-fun b!1017024 () Bool)

(assert (=> b!1017024 (= e!572167 (forall!295 (t!30573 keys!40) lambda!1084))))

(assert (= (and d!121357 (not res!682181)) b!1017023))

(assert (= (and b!1017023 res!682182) b!1017024))

(declare-fun b_lambda!15569 () Bool)

(assert (=> (not b_lambda!15569) (not b!1017023)))

(declare-fun m!938017 () Bool)

(assert (=> b!1017023 m!938017))

(assert (=> b!1017024 m!937971))

(assert (=> b!1016960 d!121357))

(declare-fun d!121361 () Bool)

(assert (=> d!121361 (= (head!977 l!1114) (h!22774 l!1114))))

(assert (=> b!1016959 d!121361))

(declare-fun d!121365 () Bool)

(declare-fun res!682193 () Bool)

(declare-fun e!572182 () Bool)

(assert (=> d!121365 (=> res!682193 e!572182)))

(assert (=> d!121365 (= res!682193 (or (is-Nil!21577 l!1114) (is-Nil!21577 (t!30572 l!1114))))))

(assert (=> d!121365 (= (isStrictlySorted!625 l!1114) e!572182)))

(declare-fun b!1017043 () Bool)

(declare-fun e!572183 () Bool)

(assert (=> b!1017043 (= e!572182 e!572183)))

(declare-fun res!682194 () Bool)

(assert (=> b!1017043 (=> (not res!682194) (not e!572183))))

(assert (=> b!1017043 (= res!682194 (bvslt (_1!7685 (h!22774 l!1114)) (_1!7685 (h!22774 (t!30572 l!1114)))))))

(declare-fun b!1017044 () Bool)

(assert (=> b!1017044 (= e!572183 (isStrictlySorted!625 (t!30572 l!1114)))))

(assert (= (and d!121365 (not res!682193)) b!1017043))

(assert (= (and b!1017043 res!682194) b!1017044))

(declare-fun m!938025 () Bool)

(assert (=> b!1017044 m!938025))

(assert (=> start!88304 d!121365))

(declare-fun d!121369 () Bool)

(assert (=> d!121369 (= (isEmpty!905 l!1114) (is-Nil!21577 l!1114))))

(assert (=> b!1016958 d!121369))

(declare-fun d!121371 () Bool)

(declare-fun res!682204 () Bool)

(declare-fun e!572199 () Bool)

(assert (=> d!121371 (=> res!682204 e!572199)))

(assert (=> d!121371 (= res!682204 (and (is-Cons!21576 l!1114) (= (_1!7685 (h!22774 l!1114)) (h!22775 keys!40))))))

(assert (=> d!121371 (= (containsKey!501 l!1114 (h!22775 keys!40)) e!572199)))

(declare-fun b!1017066 () Bool)

(declare-fun e!572200 () Bool)

(assert (=> b!1017066 (= e!572199 e!572200)))

(declare-fun res!682205 () Bool)

(assert (=> b!1017066 (=> (not res!682205) (not e!572200))))

(assert (=> b!1017066 (= res!682205 (and (or (not (is-Cons!21576 l!1114)) (bvsle (_1!7685 (h!22774 l!1114)) (h!22775 keys!40))) (is-Cons!21576 l!1114) (bvslt (_1!7685 (h!22774 l!1114)) (h!22775 keys!40))))))

(declare-fun b!1017067 () Bool)

(assert (=> b!1017067 (= e!572200 (containsKey!501 (t!30572 l!1114) (h!22775 keys!40)))))

(assert (= (and d!121371 (not res!682204)) b!1017066))

(assert (= (and b!1017066 res!682205) b!1017067))

(declare-fun m!938035 () Bool)

(assert (=> b!1017067 m!938035))

(assert (=> b!1016961 d!121371))

(declare-fun d!121377 () Bool)

(declare-fun res!682207 () Bool)

(declare-fun e!572202 () Bool)

(assert (=> d!121377 (=> res!682207 e!572202)))

(assert (=> d!121377 (= res!682207 (is-Nil!21578 (t!30573 keys!40)))))

(assert (=> d!121377 (= (forall!295 (t!30573 keys!40) lambda!1084) e!572202)))

(declare-fun b!1017069 () Bool)

(declare-fun e!572203 () Bool)

(assert (=> b!1017069 (= e!572202 e!572203)))

(declare-fun res!682208 () Bool)

(assert (=> b!1017069 (=> (not res!682208) (not e!572203))))

(assert (=> b!1017069 (= res!682208 (dynLambda!1917 lambda!1084 (h!22775 (t!30573 keys!40))))))

(declare-fun b!1017070 () Bool)

(assert (=> b!1017070 (= e!572203 (forall!295 (t!30573 (t!30573 keys!40)) lambda!1084))))

(assert (= (and d!121377 (not res!682207)) b!1017069))

(assert (= (and b!1017069 res!682208) b!1017070))

(declare-fun b_lambda!15573 () Bool)

(assert (=> (not b_lambda!15573) (not b!1017069)))

(declare-fun m!938043 () Bool)

(assert (=> b!1017069 m!938043))

(declare-fun m!938045 () Bool)

(assert (=> b!1017070 m!938045))

(assert (=> b!1016961 d!121377))

(declare-fun d!121381 () Bool)

(declare-fun isEmpty!908 (Option!617) Bool)

(assert (=> d!121381 (= (isDefined!415 (getValueByKey!566 lt!449221 (h!22775 keys!40))) (not (isEmpty!908 (getValueByKey!566 lt!449221 (h!22775 keys!40)))))))

(declare-fun bs!29537 () Bool)

(assert (= bs!29537 d!121381))

(assert (=> bs!29537 m!937961))

(declare-fun m!938047 () Bool)

(assert (=> bs!29537 m!938047))

(assert (=> b!1016961 d!121381))

(declare-fun b!1017090 () Bool)

(declare-fun e!572217 () Option!617)

(assert (=> b!1017090 (= e!572217 (Some!616 (_2!7685 (h!22774 lt!449221))))))

(declare-fun b!1017092 () Bool)

(declare-fun e!572218 () Option!617)

(assert (=> b!1017092 (= e!572218 (getValueByKey!566 (t!30572 lt!449221) (h!22775 keys!40)))))

(declare-fun b!1017093 () Bool)

(assert (=> b!1017093 (= e!572218 None!615)))

(declare-fun d!121383 () Bool)

(declare-fun c!102971 () Bool)

(assert (=> d!121383 (= c!102971 (and (is-Cons!21576 lt!449221) (= (_1!7685 (h!22774 lt!449221)) (h!22775 keys!40))))))

(assert (=> d!121383 (= (getValueByKey!566 lt!449221 (h!22775 keys!40)) e!572217)))

(declare-fun b!1017091 () Bool)

(assert (=> b!1017091 (= e!572217 e!572218)))

(declare-fun c!102972 () Bool)

(assert (=> b!1017091 (= c!102972 (and (is-Cons!21576 lt!449221) (not (= (_1!7685 (h!22774 lt!449221)) (h!22775 keys!40)))))))

(assert (= (and d!121383 c!102971) b!1017090))

(assert (= (and d!121383 (not c!102971)) b!1017091))

(assert (= (and b!1017091 c!102972) b!1017092))

(assert (= (and b!1017091 (not c!102972)) b!1017093))

(declare-fun m!938063 () Bool)

(assert (=> b!1017092 m!938063))

(assert (=> b!1016961 d!121383))

(declare-fun d!121393 () Bool)

(assert (=> d!121393 (containsKey!501 l!1114 (h!22775 keys!40))))

(declare-fun lt!449242 () Unit!33163)

(declare-fun choose!1676 (List!21580 (_ BitVec 64)) Unit!33163)

(assert (=> d!121393 (= lt!449242 (choose!1676 l!1114 (h!22775 keys!40)))))

(declare-fun e!572232 () Bool)

(assert (=> d!121393 e!572232))

(declare-fun res!682230 () Bool)

(assert (=> d!121393 (=> (not res!682230) (not e!572232))))

(assert (=> d!121393 (= res!682230 (isStrictlySorted!625 l!1114))))

(assert (=> d!121393 (= (lemmaGetValueByKeyIsDefinedImpliesContainsKey!21 l!1114 (h!22775 keys!40)) lt!449242)))

(declare-fun b!1017113 () Bool)

(assert (=> b!1017113 (= e!572232 (isDefined!415 (getValueByKey!566 l!1114 (h!22775 keys!40))))))

(assert (= (and d!121393 res!682230) b!1017113))

(assert (=> d!121393 m!937963))

(declare-fun m!938071 () Bool)

(assert (=> d!121393 m!938071))

(assert (=> d!121393 m!937959))

(declare-fun m!938073 () Bool)

(assert (=> b!1017113 m!938073))

(assert (=> b!1017113 m!938073))

(declare-fun m!938075 () Bool)

(assert (=> b!1017113 m!938075))

(assert (=> b!1016961 d!121393))

(declare-fun d!121403 () Bool)

(assert (=> d!121403 (isDefined!415 (getValueByKey!566 lt!449221 (h!22775 keys!40)))))

(declare-fun lt!449248 () Unit!33163)

(declare-fun choose!1677 (List!21580 (_ BitVec 64)) Unit!33163)

(assert (=> d!121403 (= lt!449248 (choose!1677 lt!449221 (h!22775 keys!40)))))

(declare-fun e!572236 () Bool)

(assert (=> d!121403 e!572236))

(declare-fun res!682236 () Bool)

(assert (=> d!121403 (=> (not res!682236) (not e!572236))))

(assert (=> d!121403 (= res!682236 (isStrictlySorted!625 lt!449221))))

(assert (=> d!121403 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!390 lt!449221 (h!22775 keys!40)) lt!449248)))

(declare-fun b!1017119 () Bool)

(assert (=> b!1017119 (= e!572236 (containsKey!501 lt!449221 (h!22775 keys!40)))))

(assert (= (and d!121403 res!682236) b!1017119))

(assert (=> d!121403 m!937961))

(assert (=> d!121403 m!937961))

(assert (=> d!121403 m!937967))

(declare-fun m!938077 () Bool)

(assert (=> d!121403 m!938077))

(declare-fun m!938079 () Bool)

(assert (=> d!121403 m!938079))

(declare-fun m!938081 () Bool)

(assert (=> b!1017119 m!938081))

(assert (=> b!1016961 d!121403))

(declare-fun b!1017124 () Bool)

(declare-fun e!572239 () Bool)

(declare-fun tp!70841 () Bool)

(assert (=> b!1017124 (= e!572239 (and tp_is_empty!23621 tp!70841))))

(assert (=> b!1016956 (= tp!70835 e!572239)))

(assert (= (and b!1016956 (is-Cons!21576 (t!30572 l!1114))) b!1017124))

(declare-fun b_lambda!15587 () Bool)

(assert (= b_lambda!15563 (or b!1016955 b_lambda!15587)))

(declare-fun bs!29545 () Bool)

(declare-fun d!121405 () Bool)

(assert (= bs!29545 (and d!121405 b!1016955)))

(assert (=> bs!29545 (= (dynLambda!1917 lambda!1085 (h!22775 keys!40)) (= (getValueByKey!566 lt!449221 (h!22775 keys!40)) (Some!616 value!178)))))

(assert (=> bs!29545 m!937961))

(assert (=> b!1016980 d!121405))

(declare-fun b_lambda!15589 () Bool)

(assert (= b_lambda!15569 (or b!1016960 b_lambda!15589)))

(declare-fun bs!29547 () Bool)

(declare-fun d!121407 () Bool)

(assert (= bs!29547 (and d!121407 b!1016960)))

(assert (=> bs!29547 (= (dynLambda!1917 lambda!1084 (h!22775 keys!40)) (= (getValueByKey!566 l!1114 (h!22775 keys!40)) (Some!616 value!178)))))

(assert (=> bs!29547 m!938073))

(assert (=> b!1017023 d!121407))

(declare-fun b_lambda!15591 () Bool)

(assert (= b_lambda!15573 (or b!1016960 b_lambda!15591)))

(declare-fun bs!29549 () Bool)

(declare-fun d!121409 () Bool)

(assert (= bs!29549 (and d!121409 b!1016960)))

(assert (=> bs!29549 (= (dynLambda!1917 lambda!1084 (h!22775 (t!30573 keys!40))) (= (getValueByKey!566 l!1114 (h!22775 (t!30573 keys!40))) (Some!616 value!178)))))

(declare-fun m!938083 () Bool)

(assert (=> bs!29549 m!938083))

(assert (=> b!1017069 d!121409))

(declare-fun b_lambda!15593 () Bool)

(assert (= b_lambda!15565 (or b!1016955 b_lambda!15593)))

(declare-fun bs!29550 () Bool)

(declare-fun d!121411 () Bool)

(assert (= bs!29550 (and d!121411 b!1016955)))

(assert (=> bs!29550 (= (dynLambda!1917 lambda!1085 (h!22775 (t!30573 keys!40))) (= (getValueByKey!566 lt!449221 (h!22775 (t!30573 keys!40))) (Some!616 value!178)))))

(declare-fun m!938087 () Bool)

(assert (=> bs!29550 m!938087))

(assert (=> b!1016986 d!121411))

(push 1)

(assert (not b_lambda!15587))

(assert (not b_lambda!15593))

(assert tp_is_empty!23621)

(assert (not b_lambda!15591))

(assert (not bs!29549))

(assert (not bs!29545))

(assert (not b!1017070))

(assert (not d!121403))

(assert (not d!121339))

(assert (not b!1017008))

(assert (not b!1017007))

(assert (not b_lambda!15589))

(assert (not d!121393))

(assert (not b!1017044))

(assert (not b!1016981))

(assert (not b!1017067))

(assert (not b!1017119))

(assert (not b!1016987))

(assert (not b!1017006))

(assert (not bs!29550))

(assert (not b!1017024))

(assert (not b!1017092))

(assert (not b!1017124))

(assert (not d!121381))

(assert (not bs!29547))

(assert (not b!1017113))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

