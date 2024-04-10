; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!88176 () Bool)

(assert start!88176)

(declare-fun b!1016638 () Bool)

(assert (=> b!1016638 true))

(assert (=> b!1016638 true))

(declare-fun res!681909 () Bool)

(declare-fun e!571923 () Bool)

(assert (=> b!1016638 (=> (not res!681909) (not e!571923))))

(declare-datatypes ((List!21531 0))(
  ( (Nil!21528) (Cons!21527 (h!22725 (_ BitVec 64)) (t!30532 List!21531)) )
))
(declare-fun keys!40 () List!21531)

(declare-fun lambda!1035 () Int)

(declare-fun forall!284 (List!21531 Int) Bool)

(assert (=> b!1016638 (= res!681909 (forall!284 keys!40 lambda!1035))))

(declare-fun b!1016639 () Bool)

(declare-fun res!681910 () Bool)

(assert (=> b!1016639 (=> (not res!681910) (not e!571923))))

(get-info :version)

(assert (=> b!1016639 (= res!681910 ((_ is Cons!21527) keys!40))))

(declare-fun b!1016640 () Bool)

(assert (=> b!1016640 (= e!571923 (not (forall!284 (t!30532 keys!40) lambda!1035)))))

(declare-datatypes ((B!1540 0))(
  ( (B!1541 (val!11854 Int)) )
))
(declare-datatypes ((tuple2!15254 0))(
  ( (tuple2!15255 (_1!7638 (_ BitVec 64)) (_2!7638 B!1540)) )
))
(declare-datatypes ((List!21532 0))(
  ( (Nil!21529) (Cons!21528 (h!22726 tuple2!15254) (t!30533 List!21532)) )
))
(declare-fun lt!449299 () List!21532)

(declare-datatypes ((Option!607 0))(
  ( (Some!606 (v!14457 B!1540)) (None!605) )
))
(declare-fun isDefined!405 (Option!607) Bool)

(declare-fun getValueByKey!556 (List!21532 (_ BitVec 64)) Option!607)

(assert (=> b!1016640 (isDefined!405 (getValueByKey!556 lt!449299 (h!22725 keys!40)))))

(declare-datatypes ((Unit!33253 0))(
  ( (Unit!33254) )
))
(declare-fun lt!449300 () Unit!33253)

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!384 (List!21532 (_ BitVec 64)) Unit!33253)

(assert (=> b!1016640 (= lt!449300 (lemmaContainsKeyImpliesGetValueByKeyDefined!384 lt!449299 (h!22725 keys!40)))))

(declare-fun newHead!31 () tuple2!15254)

(declare-fun l!1114 () List!21532)

(assert (=> b!1016640 (= lt!449299 (Cons!21528 newHead!31 l!1114))))

(declare-fun containsKey!494 (List!21532 (_ BitVec 64)) Bool)

(assert (=> b!1016640 (containsKey!494 l!1114 (h!22725 keys!40))))

(declare-fun lt!449301 () Unit!33253)

(declare-fun lemmaGetValueByKeyIsDefinedImpliesContainsKey!14 (List!21532 (_ BitVec 64)) Unit!33253)

(assert (=> b!1016640 (= lt!449301 (lemmaGetValueByKeyIsDefinedImpliesContainsKey!14 l!1114 (h!22725 keys!40)))))

(declare-fun b!1016641 () Bool)

(declare-fun e!571922 () Bool)

(declare-fun tp_is_empty!23607 () Bool)

(declare-fun tp!70795 () Bool)

(assert (=> b!1016641 (= e!571922 (and tp_is_empty!23607 tp!70795))))

(declare-fun res!681907 () Bool)

(assert (=> start!88176 (=> (not res!681907) (not e!571923))))

(declare-fun isStrictlySorted!622 (List!21532) Bool)

(assert (=> start!88176 (= res!681907 (isStrictlySorted!622 l!1114))))

(assert (=> start!88176 e!571923))

(assert (=> start!88176 e!571922))

(assert (=> start!88176 true))

(assert (=> start!88176 tp_is_empty!23607))

(declare-fun b!1016642 () Bool)

(declare-fun res!681911 () Bool)

(assert (=> b!1016642 (=> (not res!681911) (not e!571923))))

(declare-fun head!971 (List!21532) tuple2!15254)

(assert (=> b!1016642 (= res!681911 (bvslt (_1!7638 newHead!31) (_1!7638 (head!971 l!1114))))))

(declare-fun b!1016643 () Bool)

(declare-fun res!681908 () Bool)

(assert (=> b!1016643 (=> (not res!681908) (not e!571923))))

(declare-fun isEmpty!887 (List!21532) Bool)

(assert (=> b!1016643 (= res!681908 (not (isEmpty!887 l!1114)))))

(assert (= (and start!88176 res!681907) b!1016643))

(assert (= (and b!1016643 res!681908) b!1016638))

(assert (= (and b!1016638 res!681909) b!1016642))

(assert (= (and b!1016642 res!681911) b!1016639))

(assert (= (and b!1016639 res!681910) b!1016640))

(assert (= (and start!88176 ((_ is Cons!21528) l!1114)) b!1016641))

(declare-fun m!938223 () Bool)

(assert (=> b!1016638 m!938223))

(declare-fun m!938225 () Bool)

(assert (=> b!1016643 m!938225))

(declare-fun m!938227 () Bool)

(assert (=> start!88176 m!938227))

(declare-fun m!938229 () Bool)

(assert (=> b!1016640 m!938229))

(declare-fun m!938231 () Bool)

(assert (=> b!1016640 m!938231))

(declare-fun m!938233 () Bool)

(assert (=> b!1016640 m!938233))

(declare-fun m!938235 () Bool)

(assert (=> b!1016640 m!938235))

(declare-fun m!938237 () Bool)

(assert (=> b!1016640 m!938237))

(assert (=> b!1016640 m!938235))

(declare-fun m!938239 () Bool)

(assert (=> b!1016640 m!938239))

(declare-fun m!938241 () Bool)

(assert (=> b!1016642 m!938241))

(check-sat (not b!1016642) (not b!1016643) (not start!88176) (not b!1016640) (not b!1016641) tp_is_empty!23607 (not b!1016638))
(check-sat)
(get-model)

(declare-fun d!121307 () Bool)

(assert (=> d!121307 (= (head!971 l!1114) (h!22726 l!1114))))

(assert (=> b!1016642 d!121307))

(declare-fun d!121309 () Bool)

(assert (=> d!121309 (= (isEmpty!887 l!1114) ((_ is Nil!21529) l!1114))))

(assert (=> b!1016643 d!121309))

(declare-fun d!121311 () Bool)

(declare-fun res!681931 () Bool)

(declare-fun e!571934 () Bool)

(assert (=> d!121311 (=> res!681931 e!571934)))

(assert (=> d!121311 (= res!681931 ((_ is Nil!21528) keys!40))))

(assert (=> d!121311 (= (forall!284 keys!40 lambda!1035) e!571934)))

(declare-fun b!1016674 () Bool)

(declare-fun e!571935 () Bool)

(assert (=> b!1016674 (= e!571934 e!571935)))

(declare-fun res!681932 () Bool)

(assert (=> b!1016674 (=> (not res!681932) (not e!571935))))

(declare-fun dynLambda!1918 (Int (_ BitVec 64)) Bool)

(assert (=> b!1016674 (= res!681932 (dynLambda!1918 lambda!1035 (h!22725 keys!40)))))

(declare-fun b!1016675 () Bool)

(assert (=> b!1016675 (= e!571935 (forall!284 (t!30532 keys!40) lambda!1035))))

(assert (= (and d!121311 (not res!681931)) b!1016674))

(assert (= (and b!1016674 res!681932) b!1016675))

(declare-fun b_lambda!15531 () Bool)

(assert (=> (not b_lambda!15531) (not b!1016674)))

(declare-fun m!938263 () Bool)

(assert (=> b!1016674 m!938263))

(assert (=> b!1016675 m!938233))

(assert (=> b!1016638 d!121311))

(declare-fun d!121313 () Bool)

(declare-fun res!681937 () Bool)

(declare-fun e!571940 () Bool)

(assert (=> d!121313 (=> res!681937 e!571940)))

(assert (=> d!121313 (= res!681937 (or ((_ is Nil!21529) l!1114) ((_ is Nil!21529) (t!30533 l!1114))))))

(assert (=> d!121313 (= (isStrictlySorted!622 l!1114) e!571940)))

(declare-fun b!1016680 () Bool)

(declare-fun e!571941 () Bool)

(assert (=> b!1016680 (= e!571940 e!571941)))

(declare-fun res!681938 () Bool)

(assert (=> b!1016680 (=> (not res!681938) (not e!571941))))

(assert (=> b!1016680 (= res!681938 (bvslt (_1!7638 (h!22726 l!1114)) (_1!7638 (h!22726 (t!30533 l!1114)))))))

(declare-fun b!1016681 () Bool)

(assert (=> b!1016681 (= e!571941 (isStrictlySorted!622 (t!30533 l!1114)))))

(assert (= (and d!121313 (not res!681937)) b!1016680))

(assert (= (and b!1016680 res!681938) b!1016681))

(declare-fun m!938265 () Bool)

(assert (=> b!1016681 m!938265))

(assert (=> start!88176 d!121313))

(declare-fun d!121319 () Bool)

(declare-fun res!681949 () Bool)

(declare-fun e!571952 () Bool)

(assert (=> d!121319 (=> res!681949 e!571952)))

(assert (=> d!121319 (= res!681949 (and ((_ is Cons!21528) l!1114) (= (_1!7638 (h!22726 l!1114)) (h!22725 keys!40))))))

(assert (=> d!121319 (= (containsKey!494 l!1114 (h!22725 keys!40)) e!571952)))

(declare-fun b!1016692 () Bool)

(declare-fun e!571953 () Bool)

(assert (=> b!1016692 (= e!571952 e!571953)))

(declare-fun res!681950 () Bool)

(assert (=> b!1016692 (=> (not res!681950) (not e!571953))))

(assert (=> b!1016692 (= res!681950 (and (or (not ((_ is Cons!21528) l!1114)) (bvsle (_1!7638 (h!22726 l!1114)) (h!22725 keys!40))) ((_ is Cons!21528) l!1114) (bvslt (_1!7638 (h!22726 l!1114)) (h!22725 keys!40))))))

(declare-fun b!1016693 () Bool)

(assert (=> b!1016693 (= e!571953 (containsKey!494 (t!30533 l!1114) (h!22725 keys!40)))))

(assert (= (and d!121319 (not res!681949)) b!1016692))

(assert (= (and b!1016692 res!681950) b!1016693))

(declare-fun m!938269 () Bool)

(assert (=> b!1016693 m!938269))

(assert (=> b!1016640 d!121319))

(declare-fun d!121325 () Bool)

(declare-fun isEmpty!889 (Option!607) Bool)

(assert (=> d!121325 (= (isDefined!405 (getValueByKey!556 lt!449299 (h!22725 keys!40))) (not (isEmpty!889 (getValueByKey!556 lt!449299 (h!22725 keys!40)))))))

(declare-fun bs!29527 () Bool)

(assert (= bs!29527 d!121325))

(assert (=> bs!29527 m!938235))

(declare-fun m!938271 () Bool)

(assert (=> bs!29527 m!938271))

(assert (=> b!1016640 d!121325))

(declare-fun d!121327 () Bool)

(declare-fun res!681951 () Bool)

(declare-fun e!571958 () Bool)

(assert (=> d!121327 (=> res!681951 e!571958)))

(assert (=> d!121327 (= res!681951 ((_ is Nil!21528) (t!30532 keys!40)))))

(assert (=> d!121327 (= (forall!284 (t!30532 keys!40) lambda!1035) e!571958)))

(declare-fun b!1016702 () Bool)

(declare-fun e!571959 () Bool)

(assert (=> b!1016702 (= e!571958 e!571959)))

(declare-fun res!681952 () Bool)

(assert (=> b!1016702 (=> (not res!681952) (not e!571959))))

(assert (=> b!1016702 (= res!681952 (dynLambda!1918 lambda!1035 (h!22725 (t!30532 keys!40))))))

(declare-fun b!1016703 () Bool)

(assert (=> b!1016703 (= e!571959 (forall!284 (t!30532 (t!30532 keys!40)) lambda!1035))))

(assert (= (and d!121327 (not res!681951)) b!1016702))

(assert (= (and b!1016702 res!681952) b!1016703))

(declare-fun b_lambda!15533 () Bool)

(assert (=> (not b_lambda!15533) (not b!1016702)))

(declare-fun m!938273 () Bool)

(assert (=> b!1016702 m!938273))

(declare-fun m!938275 () Bool)

(assert (=> b!1016703 m!938275))

(assert (=> b!1016640 d!121327))

(declare-fun d!121329 () Bool)

(assert (=> d!121329 (isDefined!405 (getValueByKey!556 lt!449299 (h!22725 keys!40)))))

(declare-fun lt!449313 () Unit!33253)

(declare-fun choose!1652 (List!21532 (_ BitVec 64)) Unit!33253)

(assert (=> d!121329 (= lt!449313 (choose!1652 lt!449299 (h!22725 keys!40)))))

(declare-fun e!571970 () Bool)

(assert (=> d!121329 e!571970))

(declare-fun res!681955 () Bool)

(assert (=> d!121329 (=> (not res!681955) (not e!571970))))

(assert (=> d!121329 (= res!681955 (isStrictlySorted!622 lt!449299))))

(assert (=> d!121329 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!384 lt!449299 (h!22725 keys!40)) lt!449313)))

(declare-fun b!1016722 () Bool)

(assert (=> b!1016722 (= e!571970 (containsKey!494 lt!449299 (h!22725 keys!40)))))

(assert (= (and d!121329 res!681955) b!1016722))

(assert (=> d!121329 m!938235))

(assert (=> d!121329 m!938235))

(assert (=> d!121329 m!938239))

(declare-fun m!938283 () Bool)

(assert (=> d!121329 m!938283))

(declare-fun m!938285 () Bool)

(assert (=> d!121329 m!938285))

(declare-fun m!938287 () Bool)

(assert (=> b!1016722 m!938287))

(assert (=> b!1016640 d!121329))

(declare-fun d!121337 () Bool)

(assert (=> d!121337 (containsKey!494 l!1114 (h!22725 keys!40))))

(declare-fun lt!449319 () Unit!33253)

(declare-fun choose!1654 (List!21532 (_ BitVec 64)) Unit!33253)

(assert (=> d!121337 (= lt!449319 (choose!1654 l!1114 (h!22725 keys!40)))))

(declare-fun e!571982 () Bool)

(assert (=> d!121337 e!571982))

(declare-fun res!681967 () Bool)

(assert (=> d!121337 (=> (not res!681967) (not e!571982))))

(assert (=> d!121337 (= res!681967 (isStrictlySorted!622 l!1114))))

(assert (=> d!121337 (= (lemmaGetValueByKeyIsDefinedImpliesContainsKey!14 l!1114 (h!22725 keys!40)) lt!449319)))

(declare-fun b!1016734 () Bool)

(assert (=> b!1016734 (= e!571982 (isDefined!405 (getValueByKey!556 l!1114 (h!22725 keys!40))))))

(assert (= (and d!121337 res!681967) b!1016734))

(assert (=> d!121337 m!938231))

(declare-fun m!938297 () Bool)

(assert (=> d!121337 m!938297))

(assert (=> d!121337 m!938227))

(declare-fun m!938299 () Bool)

(assert (=> b!1016734 m!938299))

(assert (=> b!1016734 m!938299))

(declare-fun m!938301 () Bool)

(assert (=> b!1016734 m!938301))

(assert (=> b!1016640 d!121337))

(declare-fun b!1016756 () Bool)

(declare-fun e!572000 () Option!607)

(assert (=> b!1016756 (= e!572000 (Some!606 (_2!7638 (h!22726 lt!449299))))))

(declare-fun d!121343 () Bool)

(declare-fun c!102957 () Bool)

(assert (=> d!121343 (= c!102957 (and ((_ is Cons!21528) lt!449299) (= (_1!7638 (h!22726 lt!449299)) (h!22725 keys!40))))))

(assert (=> d!121343 (= (getValueByKey!556 lt!449299 (h!22725 keys!40)) e!572000)))

(declare-fun b!1016759 () Bool)

(declare-fun e!572001 () Option!607)

(assert (=> b!1016759 (= e!572001 None!605)))

(declare-fun b!1016757 () Bool)

(assert (=> b!1016757 (= e!572000 e!572001)))

(declare-fun c!102958 () Bool)

(assert (=> b!1016757 (= c!102958 (and ((_ is Cons!21528) lt!449299) (not (= (_1!7638 (h!22726 lt!449299)) (h!22725 keys!40)))))))

(declare-fun b!1016758 () Bool)

(assert (=> b!1016758 (= e!572001 (getValueByKey!556 (t!30533 lt!449299) (h!22725 keys!40)))))

(assert (= (and d!121343 c!102957) b!1016756))

(assert (= (and d!121343 (not c!102957)) b!1016757))

(assert (= (and b!1016757 c!102958) b!1016758))

(assert (= (and b!1016757 (not c!102958)) b!1016759))

(declare-fun m!938313 () Bool)

(assert (=> b!1016758 m!938313))

(assert (=> b!1016640 d!121343))

(declare-fun b!1016768 () Bool)

(declare-fun e!572008 () Bool)

(declare-fun tp!70801 () Bool)

(assert (=> b!1016768 (= e!572008 (and tp_is_empty!23607 tp!70801))))

(assert (=> b!1016641 (= tp!70795 e!572008)))

(assert (= (and b!1016641 ((_ is Cons!21528) (t!30533 l!1114))) b!1016768))

(declare-fun b_lambda!15539 () Bool)

(assert (= b_lambda!15531 (or b!1016638 b_lambda!15539)))

(declare-fun bs!29529 () Bool)

(declare-fun d!121351 () Bool)

(assert (= bs!29529 (and d!121351 b!1016638)))

(declare-fun value!178 () B!1540)

(assert (=> bs!29529 (= (dynLambda!1918 lambda!1035 (h!22725 keys!40)) (= (getValueByKey!556 l!1114 (h!22725 keys!40)) (Some!606 value!178)))))

(assert (=> bs!29529 m!938299))

(assert (=> b!1016674 d!121351))

(declare-fun b_lambda!15541 () Bool)

(assert (= b_lambda!15533 (or b!1016638 b_lambda!15541)))

(declare-fun bs!29530 () Bool)

(declare-fun d!121355 () Bool)

(assert (= bs!29530 (and d!121355 b!1016638)))

(assert (=> bs!29530 (= (dynLambda!1918 lambda!1035 (h!22725 (t!30532 keys!40))) (= (getValueByKey!556 l!1114 (h!22725 (t!30532 keys!40))) (Some!606 value!178)))))

(declare-fun m!938325 () Bool)

(assert (=> bs!29530 m!938325))

(assert (=> b!1016702 d!121355))

(check-sat (not b_lambda!15539) (not b!1016681) (not b!1016693) (not b!1016734) (not b!1016758) (not b!1016768) tp_is_empty!23607 (not b!1016703) (not b_lambda!15541) (not bs!29529) (not d!121325) (not b!1016722) (not bs!29530) (not b!1016675) (not d!121337) (not d!121329))
(check-sat)
