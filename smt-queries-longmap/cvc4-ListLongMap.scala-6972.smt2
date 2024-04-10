; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!88178 () Bool)

(assert start!88178)

(declare-fun b!1016664 () Bool)

(assert (=> b!1016664 true))

(assert (=> b!1016664 true))

(declare-fun b!1016660 () Bool)

(declare-fun e!571928 () Bool)

(declare-fun tp_is_empty!23609 () Bool)

(declare-fun tp!70798 () Bool)

(assert (=> b!1016660 (= e!571928 (and tp_is_empty!23609 tp!70798))))

(declare-fun b!1016661 () Bool)

(declare-fun res!681925 () Bool)

(declare-fun e!571929 () Bool)

(assert (=> b!1016661 (=> (not res!681925) (not e!571929))))

(declare-datatypes ((List!21533 0))(
  ( (Nil!21530) (Cons!21529 (h!22727 (_ BitVec 64)) (t!30534 List!21533)) )
))
(declare-fun keys!40 () List!21533)

(assert (=> b!1016661 (= res!681925 (is-Cons!21529 keys!40))))

(declare-fun b!1016662 () Bool)

(declare-fun lambda!1040 () Int)

(declare-fun forall!285 (List!21533 Int) Bool)

(assert (=> b!1016662 (= e!571929 (not (forall!285 (t!30534 keys!40) lambda!1040)))))

(declare-datatypes ((B!1542 0))(
  ( (B!1543 (val!11855 Int)) )
))
(declare-datatypes ((tuple2!15256 0))(
  ( (tuple2!15257 (_1!7639 (_ BitVec 64)) (_2!7639 B!1542)) )
))
(declare-datatypes ((List!21534 0))(
  ( (Nil!21531) (Cons!21530 (h!22728 tuple2!15256) (t!30535 List!21534)) )
))
(declare-fun lt!449309 () List!21534)

(declare-datatypes ((Option!608 0))(
  ( (Some!607 (v!14458 B!1542)) (None!606) )
))
(declare-fun isDefined!406 (Option!608) Bool)

(declare-fun getValueByKey!557 (List!21534 (_ BitVec 64)) Option!608)

(assert (=> b!1016662 (isDefined!406 (getValueByKey!557 lt!449309 (h!22727 keys!40)))))

(declare-datatypes ((Unit!33255 0))(
  ( (Unit!33256) )
))
(declare-fun lt!449310 () Unit!33255)

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!385 (List!21534 (_ BitVec 64)) Unit!33255)

(assert (=> b!1016662 (= lt!449310 (lemmaContainsKeyImpliesGetValueByKeyDefined!385 lt!449309 (h!22727 keys!40)))))

(declare-fun newHead!31 () tuple2!15256)

(declare-fun l!1114 () List!21534)

(assert (=> b!1016662 (= lt!449309 (Cons!21530 newHead!31 l!1114))))

(declare-fun containsKey!495 (List!21534 (_ BitVec 64)) Bool)

(assert (=> b!1016662 (containsKey!495 l!1114 (h!22727 keys!40))))

(declare-fun lt!449308 () Unit!33255)

(declare-fun lemmaGetValueByKeyIsDefinedImpliesContainsKey!15 (List!21534 (_ BitVec 64)) Unit!33255)

(assert (=> b!1016662 (= lt!449308 (lemmaGetValueByKeyIsDefinedImpliesContainsKey!15 l!1114 (h!22727 keys!40)))))

(declare-fun res!681924 () Bool)

(assert (=> start!88178 (=> (not res!681924) (not e!571929))))

(declare-fun isStrictlySorted!623 (List!21534) Bool)

(assert (=> start!88178 (= res!681924 (isStrictlySorted!623 l!1114))))

(assert (=> start!88178 e!571929))

(assert (=> start!88178 e!571928))

(assert (=> start!88178 true))

(assert (=> start!88178 tp_is_empty!23609))

(declare-fun b!1016663 () Bool)

(declare-fun res!681926 () Bool)

(assert (=> b!1016663 (=> (not res!681926) (not e!571929))))

(declare-fun head!972 (List!21534) tuple2!15256)

(assert (=> b!1016663 (= res!681926 (bvslt (_1!7639 newHead!31) (_1!7639 (head!972 l!1114))))))

(declare-fun res!681923 () Bool)

(assert (=> b!1016664 (=> (not res!681923) (not e!571929))))

(assert (=> b!1016664 (= res!681923 (forall!285 keys!40 lambda!1040))))

(declare-fun b!1016665 () Bool)

(declare-fun res!681922 () Bool)

(assert (=> b!1016665 (=> (not res!681922) (not e!571929))))

(declare-fun isEmpty!888 (List!21534) Bool)

(assert (=> b!1016665 (= res!681922 (not (isEmpty!888 l!1114)))))

(assert (= (and start!88178 res!681924) b!1016665))

(assert (= (and b!1016665 res!681922) b!1016664))

(assert (= (and b!1016664 res!681923) b!1016663))

(assert (= (and b!1016663 res!681926) b!1016661))

(assert (= (and b!1016661 res!681925) b!1016662))

(assert (= (and start!88178 (is-Cons!21530 l!1114)) b!1016660))

(declare-fun m!938243 () Bool)

(assert (=> start!88178 m!938243))

(declare-fun m!938245 () Bool)

(assert (=> b!1016664 m!938245))

(declare-fun m!938247 () Bool)

(assert (=> b!1016663 m!938247))

(declare-fun m!938249 () Bool)

(assert (=> b!1016662 m!938249))

(declare-fun m!938251 () Bool)

(assert (=> b!1016662 m!938251))

(assert (=> b!1016662 m!938251))

(declare-fun m!938253 () Bool)

(assert (=> b!1016662 m!938253))

(declare-fun m!938255 () Bool)

(assert (=> b!1016662 m!938255))

(declare-fun m!938257 () Bool)

(assert (=> b!1016662 m!938257))

(declare-fun m!938259 () Bool)

(assert (=> b!1016662 m!938259))

(declare-fun m!938261 () Bool)

(assert (=> b!1016665 m!938261))

(push 1)

(assert (not b!1016663))

(assert (not b!1016662))

(assert (not b!1016665))

(assert (not b!1016660))

(assert (not b!1016664))

(assert (not start!88178))

(assert tp_is_empty!23609)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1016717 () Bool)

(declare-fun e!571966 () Option!608)

(declare-fun e!571967 () Option!608)

(assert (=> b!1016717 (= e!571966 e!571967)))

(declare-fun c!102952 () Bool)

(assert (=> b!1016717 (= c!102952 (and (is-Cons!21530 lt!449309) (not (= (_1!7639 (h!22728 lt!449309)) (h!22727 keys!40)))))))

(declare-fun d!121323 () Bool)

(declare-fun c!102951 () Bool)

(assert (=> d!121323 (= c!102951 (and (is-Cons!21530 lt!449309) (= (_1!7639 (h!22728 lt!449309)) (h!22727 keys!40))))))

(assert (=> d!121323 (= (getValueByKey!557 lt!449309 (h!22727 keys!40)) e!571966)))

(declare-fun b!1016718 () Bool)

(assert (=> b!1016718 (= e!571967 (getValueByKey!557 (t!30535 lt!449309) (h!22727 keys!40)))))

(declare-fun b!1016719 () Bool)

(assert (=> b!1016719 (= e!571967 None!606)))

(declare-fun b!1016716 () Bool)

(assert (=> b!1016716 (= e!571966 (Some!607 (_2!7639 (h!22728 lt!449309))))))

(assert (= (and d!121323 c!102951) b!1016716))

(assert (= (and d!121323 (not c!102951)) b!1016717))

(assert (= (and b!1016717 c!102952) b!1016718))

(assert (= (and b!1016717 (not c!102952)) b!1016719))

(declare-fun m!938281 () Bool)

(assert (=> b!1016718 m!938281))

(assert (=> b!1016662 d!121323))

(declare-fun d!121335 () Bool)

(declare-fun res!681965 () Bool)

(declare-fun e!571980 () Bool)

(assert (=> d!121335 (=> res!681965 e!571980)))

(assert (=> d!121335 (= res!681965 (and (is-Cons!21530 l!1114) (= (_1!7639 (h!22728 l!1114)) (h!22727 keys!40))))))

(assert (=> d!121335 (= (containsKey!495 l!1114 (h!22727 keys!40)) e!571980)))

(declare-fun b!1016732 () Bool)

(declare-fun e!571981 () Bool)

(assert (=> b!1016732 (= e!571980 e!571981)))

(declare-fun res!681966 () Bool)

(assert (=> b!1016732 (=> (not res!681966) (not e!571981))))

(assert (=> b!1016732 (= res!681966 (and (or (not (is-Cons!21530 l!1114)) (bvsle (_1!7639 (h!22728 l!1114)) (h!22727 keys!40))) (is-Cons!21530 l!1114) (bvslt (_1!7639 (h!22728 l!1114)) (h!22727 keys!40))))))

(declare-fun b!1016733 () Bool)

(assert (=> b!1016733 (= e!571981 (containsKey!495 (t!30535 l!1114) (h!22727 keys!40)))))

(assert (= (and d!121335 (not res!681965)) b!1016732))

(assert (= (and b!1016732 res!681966) b!1016733))

(declare-fun m!938295 () Bool)

(assert (=> b!1016733 m!938295))

(assert (=> b!1016662 d!121335))

(declare-fun d!121341 () Bool)

(declare-fun res!681974 () Bool)

(declare-fun e!571989 () Bool)

(assert (=> d!121341 (=> res!681974 e!571989)))

(assert (=> d!121341 (= res!681974 (is-Nil!21530 (t!30534 keys!40)))))

(assert (=> d!121341 (= (forall!285 (t!30534 keys!40) lambda!1040) e!571989)))

(declare-fun b!1016741 () Bool)

(declare-fun e!571990 () Bool)

(assert (=> b!1016741 (= e!571989 e!571990)))

(declare-fun res!681975 () Bool)

(assert (=> b!1016741 (=> (not res!681975) (not e!571990))))

(declare-fun dynLambda!1920 (Int (_ BitVec 64)) Bool)

(assert (=> b!1016741 (= res!681975 (dynLambda!1920 lambda!1040 (h!22727 (t!30534 keys!40))))))

(declare-fun b!1016742 () Bool)

(assert (=> b!1016742 (= e!571990 (forall!285 (t!30534 (t!30534 keys!40)) lambda!1040))))

(assert (= (and d!121341 (not res!681974)) b!1016741))

(assert (= (and b!1016741 res!681975) b!1016742))

(declare-fun b_lambda!15535 () Bool)

(assert (=> (not b_lambda!15535) (not b!1016741)))

(declare-fun m!938307 () Bool)

(assert (=> b!1016741 m!938307))

(declare-fun m!938311 () Bool)

(assert (=> b!1016742 m!938311))

(assert (=> b!1016662 d!121341))

(declare-fun d!121347 () Bool)

(assert (=> d!121347 (isDefined!406 (getValueByKey!557 lt!449309 (h!22727 keys!40)))))

(declare-fun lt!449325 () Unit!33255)

(declare-fun choose!1655 (List!21534 (_ BitVec 64)) Unit!33255)

(assert (=> d!121347 (= lt!449325 (choose!1655 lt!449309 (h!22727 keys!40)))))

(declare-fun e!572009 () Bool)

(assert (=> d!121347 e!572009))

(declare-fun res!681985 () Bool)

(assert (=> d!121347 (=> (not res!681985) (not e!572009))))

(assert (=> d!121347 (= res!681985 (isStrictlySorted!623 lt!449309))))

(assert (=> d!121347 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!385 lt!449309 (h!22727 keys!40)) lt!449325)))

(declare-fun b!1016769 () Bool)

(assert (=> b!1016769 (= e!572009 (containsKey!495 lt!449309 (h!22727 keys!40)))))

(assert (= (and d!121347 res!681985) b!1016769))

(assert (=> d!121347 m!938251))

(assert (=> d!121347 m!938251))

(assert (=> d!121347 m!938253))

(declare-fun m!938319 () Bool)

(assert (=> d!121347 m!938319))

(declare-fun m!938321 () Bool)

(assert (=> d!121347 m!938321))

(declare-fun m!938323 () Bool)

(assert (=> b!1016769 m!938323))

(assert (=> b!1016662 d!121347))

(declare-fun d!121353 () Bool)

(declare-fun isEmpty!891 (Option!608) Bool)

(assert (=> d!121353 (= (isDefined!406 (getValueByKey!557 lt!449309 (h!22727 keys!40))) (not (isEmpty!891 (getValueByKey!557 lt!449309 (h!22727 keys!40)))))))

(declare-fun bs!29531 () Bool)

(assert (= bs!29531 d!121353))

(assert (=> bs!29531 m!938251))

(declare-fun m!938327 () Bool)

(assert (=> bs!29531 m!938327))

(assert (=> b!1016662 d!121353))

(declare-fun d!121357 () Bool)

(assert (=> d!121357 (containsKey!495 l!1114 (h!22727 keys!40))))

(declare-fun lt!449328 () Unit!33255)

(declare-fun choose!1656 (List!21534 (_ BitVec 64)) Unit!33255)

(assert (=> d!121357 (= lt!449328 (choose!1656 l!1114 (h!22727 keys!40)))))

(declare-fun e!572023 () Bool)

