; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!87958 () Bool)

(assert start!87958)

(declare-fun b!1015836 () Bool)

(assert (=> b!1015836 true))

(assert (=> b!1015836 true))

(declare-fun bs!29467 () Bool)

(declare-fun b!1015839 () Bool)

(assert (= bs!29467 (and b!1015839 b!1015836)))

(declare-datatypes ((B!1512 0))(
  ( (B!1513 (val!11840 Int)) )
))
(declare-datatypes ((tuple2!15226 0))(
  ( (tuple2!15227 (_1!7624 (_ BitVec 64)) (_2!7624 B!1512)) )
))
(declare-datatypes ((List!21503 0))(
  ( (Nil!21500) (Cons!21499 (h!22697 tuple2!15226) (t!30504 List!21503)) )
))
(declare-fun lt!449220 () List!21503)

(declare-fun lambda!971 () Int)

(declare-fun l!1114 () List!21503)

(declare-fun lambda!970 () Int)

(assert (=> bs!29467 (= (= lt!449220 l!1114) (= lambda!971 lambda!970))))

(assert (=> b!1015839 true))

(assert (=> b!1015839 true))

(declare-fun b!1015834 () Bool)

(declare-fun e!571437 () Bool)

(declare-fun e!571436 () Bool)

(assert (=> b!1015834 (= e!571437 (not e!571436))))

(declare-fun res!681383 () Bool)

(assert (=> b!1015834 (=> res!681383 e!571436)))

(declare-datatypes ((List!21504 0))(
  ( (Nil!21501) (Cons!21500 (h!22698 (_ BitVec 64)) (t!30505 List!21504)) )
))
(declare-fun keys!40 () List!21504)

(declare-fun forall!270 (List!21504 Int) Bool)

(assert (=> b!1015834 (= res!681383 (not (forall!270 (t!30505 keys!40) lambda!970)))))

(declare-datatypes ((Option!594 0))(
  ( (Some!593 (v!14444 B!1512)) (None!592) )
))
(declare-fun isDefined!397 (Option!594) Bool)

(declare-fun getValueByKey!543 (List!21503 (_ BitVec 64)) Option!594)

(assert (=> b!1015834 (isDefined!397 (getValueByKey!543 lt!449220 (h!22698 keys!40)))))

(declare-datatypes ((Unit!33243 0))(
  ( (Unit!33244) )
))
(declare-fun lt!449217 () Unit!33243)

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!382 (List!21503 (_ BitVec 64)) Unit!33243)

(assert (=> b!1015834 (= lt!449217 (lemmaContainsKeyImpliesGetValueByKeyDefined!382 lt!449220 (h!22698 keys!40)))))

(declare-fun newHead!31 () tuple2!15226)

(assert (=> b!1015834 (= lt!449220 (Cons!21499 newHead!31 l!1114))))

(declare-fun containsKey!489 (List!21503 (_ BitVec 64)) Bool)

(assert (=> b!1015834 (containsKey!489 l!1114 (h!22698 keys!40))))

(declare-fun lt!449218 () Unit!33243)

(declare-fun lemmaGetValueByKeyIsDefinedImpliesContainsKey!9 (List!21503 (_ BitVec 64)) Unit!33243)

(assert (=> b!1015834 (= lt!449218 (lemmaGetValueByKeyIsDefinedImpliesContainsKey!9 l!1114 (h!22698 keys!40)))))

(declare-fun b!1015835 () Bool)

(declare-fun res!681387 () Bool)

(assert (=> b!1015835 (=> (not res!681387) (not e!571437))))

(assert (=> b!1015835 (= res!681387 (is-Cons!21500 keys!40))))

(declare-fun res!681385 () Bool)

(assert (=> b!1015836 (=> (not res!681385) (not e!571437))))

(assert (=> b!1015836 (= res!681385 (forall!270 keys!40 lambda!970))))

(declare-fun b!1015837 () Bool)

(declare-fun res!681386 () Bool)

(assert (=> b!1015837 (=> (not res!681386) (not e!571437))))

(declare-fun isEmpty!867 (List!21503) Bool)

(assert (=> b!1015837 (= res!681386 (not (isEmpty!867 l!1114)))))

(declare-fun res!681382 () Bool)

(assert (=> start!87958 (=> (not res!681382) (not e!571437))))

(declare-fun isStrictlySorted!608 (List!21503) Bool)

(assert (=> start!87958 (= res!681382 (isStrictlySorted!608 l!1114))))

(assert (=> start!87958 e!571437))

(declare-fun e!571438 () Bool)

(assert (=> start!87958 e!571438))

(assert (=> start!87958 true))

(declare-fun tp_is_empty!23579 () Bool)

(assert (=> start!87958 tp_is_empty!23579))

(declare-fun b!1015838 () Bool)

(declare-fun res!681384 () Bool)

(assert (=> b!1015838 (=> (not res!681384) (not e!571437))))

(declare-fun head!957 (List!21503) tuple2!15226)

(assert (=> b!1015838 (= res!681384 (bvslt (_1!7624 newHead!31) (_1!7624 (head!957 l!1114))))))

(assert (=> b!1015839 (= e!571436 (isStrictlySorted!608 lt!449220))))

(assert (=> b!1015839 (forall!270 (t!30505 keys!40) lambda!971)))

(declare-fun lt!449219 () Unit!33243)

(declare-fun value!178 () B!1512)

(declare-fun lemmaForallGetValueByKeySameWithASmallerHead!49 (List!21503 List!21504 B!1512 tuple2!15226) Unit!33243)

(assert (=> b!1015839 (= lt!449219 (lemmaForallGetValueByKeySameWithASmallerHead!49 l!1114 (t!30505 keys!40) value!178 newHead!31))))

(declare-fun b!1015840 () Bool)

(declare-fun tp!70706 () Bool)

(assert (=> b!1015840 (= e!571438 (and tp_is_empty!23579 tp!70706))))

(assert (= (and start!87958 res!681382) b!1015837))

(assert (= (and b!1015837 res!681386) b!1015836))

(assert (= (and b!1015836 res!681385) b!1015838))

(assert (= (and b!1015838 res!681384) b!1015835))

(assert (= (and b!1015835 res!681387) b!1015834))

(assert (= (and b!1015834 (not res!681383)) b!1015839))

(assert (= (and start!87958 (is-Cons!21499 l!1114)) b!1015840))

(declare-fun m!937749 () Bool)

(assert (=> b!1015836 m!937749))

(declare-fun m!937751 () Bool)

(assert (=> b!1015838 m!937751))

(declare-fun m!937753 () Bool)

(assert (=> b!1015837 m!937753))

(declare-fun m!937755 () Bool)

(assert (=> b!1015839 m!937755))

(declare-fun m!937757 () Bool)

(assert (=> b!1015839 m!937757))

(declare-fun m!937759 () Bool)

(assert (=> b!1015839 m!937759))

(declare-fun m!937761 () Bool)

(assert (=> start!87958 m!937761))

(declare-fun m!937763 () Bool)

(assert (=> b!1015834 m!937763))

(declare-fun m!937765 () Bool)

(assert (=> b!1015834 m!937765))

(declare-fun m!937767 () Bool)

(assert (=> b!1015834 m!937767))

(assert (=> b!1015834 m!937767))

(declare-fun m!937769 () Bool)

(assert (=> b!1015834 m!937769))

(declare-fun m!937771 () Bool)

(assert (=> b!1015834 m!937771))

(declare-fun m!937773 () Bool)

(assert (=> b!1015834 m!937773))

(push 1)

(assert (not b!1015838))

(assert (not b!1015834))

(assert (not b!1015836))

(assert (not b!1015840))

(assert tp_is_empty!23579)

(assert (not b!1015837))

(assert (not start!87958))

(assert (not b!1015839))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!121029 () Bool)

(assert (=> d!121029 (= (head!957 l!1114) (h!22697 l!1114))))

(assert (=> b!1015838 d!121029))

(declare-fun d!121031 () Bool)

(declare-fun res!681419 () Bool)

(declare-fun e!571474 () Bool)

(assert (=> d!121031 (=> res!681419 e!571474)))

(assert (=> d!121031 (= res!681419 (or (is-Nil!21500 l!1114) (is-Nil!21500 (t!30504 l!1114))))))

(assert (=> d!121031 (= (isStrictlySorted!608 l!1114) e!571474)))

(declare-fun b!1015884 () Bool)

(declare-fun e!571475 () Bool)

(assert (=> b!1015884 (= e!571474 e!571475)))

(declare-fun res!681420 () Bool)

(assert (=> b!1015884 (=> (not res!681420) (not e!571475))))

(assert (=> b!1015884 (= res!681420 (bvslt (_1!7624 (h!22697 l!1114)) (_1!7624 (h!22697 (t!30504 l!1114)))))))

(declare-fun b!1015885 () Bool)

(assert (=> b!1015885 (= e!571475 (isStrictlySorted!608 (t!30504 l!1114)))))

(assert (= (and d!121031 (not res!681419)) b!1015884))

(assert (= (and b!1015884 res!681420) b!1015885))

(declare-fun m!937791 () Bool)

(assert (=> b!1015885 m!937791))

(assert (=> start!87958 d!121031))

(declare-fun d!121037 () Bool)

(assert (=> d!121037 (= (isEmpty!867 l!1114) (is-Nil!21500 l!1114))))

(assert (=> b!1015837 d!121037))

(declare-fun d!121039 () Bool)

(declare-fun res!681427 () Bool)

(declare-fun e!571490 () Bool)

(assert (=> d!121039 (=> res!681427 e!571490)))

(assert (=> d!121039 (= res!681427 (is-Nil!21501 keys!40))))

(assert (=> d!121039 (= (forall!270 keys!40 lambda!970) e!571490)))

(declare-fun b!1015908 () Bool)

(declare-fun e!571491 () Bool)

(assert (=> b!1015908 (= e!571490 e!571491)))

(declare-fun res!681428 () Bool)

(assert (=> b!1015908 (=> (not res!681428) (not e!571491))))

(declare-fun dynLambda!1906 (Int (_ BitVec 64)) Bool)

(assert (=> b!1015908 (= res!681428 (dynLambda!1906 lambda!970 (h!22698 keys!40)))))

(declare-fun b!1015909 () Bool)

(assert (=> b!1015909 (= e!571491 (forall!270 (t!30505 keys!40) lambda!970))))

(assert (= (and d!121039 (not res!681427)) b!1015908))

(assert (= (and b!1015908 res!681428) b!1015909))

(declare-fun b_lambda!15445 () Bool)

(assert (=> (not b_lambda!15445) (not b!1015908)))

(declare-fun m!937803 () Bool)

(assert (=> b!1015908 m!937803))

(assert (=> b!1015909 m!937765))

(assert (=> b!1015836 d!121039))

(declare-fun d!121049 () Bool)

(declare-fun res!681439 () Bool)

(declare-fun e!571502 () Bool)

(assert (=> d!121049 (=> res!681439 e!571502)))

(assert (=> d!121049 (= res!681439 (and (is-Cons!21499 l!1114) (= (_1!7624 (h!22697 l!1114)) (h!22698 keys!40))))))

(assert (=> d!121049 (= (containsKey!489 l!1114 (h!22698 keys!40)) e!571502)))

(declare-fun b!1015920 () Bool)

(declare-fun e!571503 () Bool)

(assert (=> b!1015920 (= e!571502 e!571503)))

(declare-fun res!681440 () Bool)

(assert (=> b!1015920 (=> (not res!681440) (not e!571503))))

(assert (=> b!1015920 (= res!681440 (and (or (not (is-Cons!21499 l!1114)) (bvsle (_1!7624 (h!22697 l!1114)) (h!22698 keys!40))) (is-Cons!21499 l!1114) (bvslt (_1!7624 (h!22697 l!1114)) (h!22698 keys!40))))))

(declare-fun b!1015921 () Bool)

(assert (=> b!1015921 (= e!571503 (containsKey!489 (t!30504 l!1114) (h!22698 keys!40)))))

(assert (= (and d!121049 (not res!681439)) b!1015920))

(assert (= (and b!1015920 res!681440) b!1015921))

(declare-fun m!937817 () Bool)

(assert (=> b!1015921 m!937817))

(assert (=> b!1015834 d!121049))

(declare-fun d!121055 () Bool)

(declare-fun res!681445 () Bool)

(declare-fun e!571508 () Bool)

(assert (=> d!121055 (=> res!681445 e!571508)))

(assert (=> d!121055 (= res!681445 (is-Nil!21501 (t!30505 keys!40)))))

(assert (=> d!121055 (= (forall!270 (t!30505 keys!40) lambda!970) e!571508)))

(declare-fun b!1015924 () Bool)

(declare-fun e!571509 () Bool)

(assert (=> b!1015924 (= e!571508 e!571509)))

(declare-fun res!681446 () Bool)

(assert (=> b!1015924 (=> (not res!681446) (not e!571509))))

(assert (=> b!1015924 (= res!681446 (dynLambda!1906 lambda!970 (h!22698 (t!30505 keys!40))))))

(declare-fun b!1015925 () Bool)

(assert (=> b!1015925 (= e!571509 (forall!270 (t!30505 (t!30505 keys!40)) lambda!970))))

(assert (= (and d!121055 (not res!681445)) b!1015924))

(assert (= (and b!1015924 res!681446) b!1015925))

(declare-fun b_lambda!15447 () Bool)

(assert (=> (not b_lambda!15447) (not b!1015924)))

(declare-fun m!937819 () Bool)

(assert (=> b!1015924 m!937819))

(declare-fun m!937821 () Bool)

(assert (=> b!1015925 m!937821))

(assert (=> b!1015834 d!121055))

(declare-fun d!121057 () Bool)

(declare-fun isEmpty!870 (Option!594) Bool)

(assert (=> d!121057 (= (isDefined!397 (getValueByKey!543 lt!449220 (h!22698 keys!40))) (not (isEmpty!870 (getValueByKey!543 lt!449220 (h!22698 keys!40)))))))

(declare-fun bs!29470 () Bool)

(assert (= bs!29470 d!121057))

(assert (=> bs!29470 m!937767))

(declare-fun m!937825 () Bool)

(assert (=> bs!29470 m!937825))

(assert (=> b!1015834 d!121057))

(declare-fun d!121061 () Bool)

(assert (=> d!121061 (containsKey!489 l!1114 (h!22698 keys!40))))

(declare-fun lt!449235 () Unit!33243)

(declare-fun choose!1644 (List!21503 (_ BitVec 64)) Unit!33243)

(assert (=> d!121061 (= lt!449235 (choose!1644 l!1114 (h!22698 keys!40)))))

(declare-fun e!571525 () Bool)

(assert (=> d!121061 e!571525))

(declare-fun res!681462 () Bool)

(assert (=> d!121061 (=> (not res!681462) (not e!571525))))

(assert (=> d!121061 (= res!681462 (isStrictlySorted!608 l!1114))))

(assert (=> d!121061 (= (lemmaGetValueByKeyIsDefinedImpliesContainsKey!9 l!1114 (h!22698 keys!40)) lt!449235)))

(declare-fun b!1015943 () Bool)

(assert (=> b!1015943 (= e!571525 (isDefined!397 (getValueByKey!543 l!1114 (h!22698 keys!40))))))

(assert (= (and d!121061 res!681462) b!1015943))

(assert (=> d!121061 m!937763))

(declare-fun m!937839 () Bool)

(assert (=> d!121061 m!937839))

(assert (=> d!121061 m!937761))

(declare-fun m!937841 () Bool)

(assert (=> b!1015943 m!937841))

(assert (=> b!1015943 m!937841))

(declare-fun m!937843 () Bool)

(assert (=> b!1015943 m!937843))

(assert (=> b!1015834 d!121061))

(declare-fun d!121075 () Bool)

(assert (=> d!121075 (isDefined!397 (getValueByKey!543 lt!449220 (h!22698 keys!40)))))

(declare-fun lt!449238 () Unit!33243)

(declare-fun choose!1646 (List!21503 (_ BitVec 64)) Unit!33243)

(assert (=> d!121075 (= lt!449238 (choose!1646 lt!449220 (h!22698 keys!40)))))

(declare-fun e!571538 () Bool)

(assert (=> d!121075 e!571538))

(declare-fun res!681479 () Bool)

(assert (=> d!121075 (=> (not res!681479) (not e!571538))))

(assert (=> d!121075 (= res!681479 (isStrictlySorted!608 lt!449220))))

(assert (=> d!121075 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!382 lt!449220 (h!22698 keys!40)) lt!449238)))

(declare-fun b!1015958 () Bool)

(assert (=> b!1015958 (= e!571538 (containsKey!489 lt!449220 (h!22698 keys!40)))))

(assert (= (and d!121075 res!681479) b!1015958))

(assert (=> d!121075 m!937767))

(assert (=> d!121075 m!937767))

(assert (=> d!121075 m!937769))

(declare-fun m!937853 () Bool)

(assert (=> d!121075 m!937853))

(assert (=> d!121075 m!937755))

(declare-fun m!937855 () Bool)

(assert (=> b!1015958 m!937855))

(assert (=> b!1015834 d!121075))

(declare-fun b!1015976 () Bool)

(declare-fun e!571546 () Option!594)

(assert (=> b!1015976 (= e!571546 None!592)))

(declare-fun b!1015974 () Bool)

(declare-fun e!571545 () Option!594)

(assert (=> b!1015974 (= e!571545 e!571546)))

(declare-fun c!102909 () Bool)

(assert (=> b!1015974 (= c!102909 (and (is-Cons!21499 lt!449220) (not (= (_1!7624 (h!22697 lt!449220)) (h!22698 keys!40)))))))

(declare-fun d!121083 () Bool)

(declare-fun c!102908 () Bool)

(assert (=> d!121083 (= c!102908 (and (is-Cons!21499 lt!449220) (= (_1!7624 (h!22697 lt!449220)) (h!22698 keys!40))))))

(assert (=> d!121083 (= (getValueByKey!543 lt!449220 (h!22698 keys!40)) e!571545)))

(declare-fun b!1015975 () Bool)

(assert (=> b!1015975 (= e!571546 (getValueByKey!543 (t!30504 lt!449220) (h!22698 keys!40)))))

(declare-fun b!1015973 () Bool)

(assert (=> b!1015973 (= e!571545 (Some!593 (_2!7624 (h!22697 lt!449220))))))

(assert (= (and d!121083 c!102908) b!1015973))

(assert (= (and d!121083 (not c!102908)) b!1015974))

(assert (= (and b!1015974 c!102909) b!1015975))

(assert (= (and b!1015974 (not c!102909)) b!1015976))

(declare-fun m!937857 () Bool)

(assert (=> b!1015975 m!937857))

(assert (=> b!1015834 d!121083))

(declare-fun d!121085 () Bool)

(declare-fun res!681489 () Bool)

(declare-fun e!571548 () Bool)

(assert (=> d!121085 (=> res!681489 e!571548)))

(assert (=> d!121085 (= res!681489 (or (is-Nil!21500 lt!449220) (is-Nil!21500 (t!30504 lt!449220))))))

(assert (=> d!121085 (= (isStrictlySorted!608 lt!449220) e!571548)))

(declare-fun b!1015982 () Bool)

(declare-fun e!571549 () Bool)

(assert (=> b!1015982 (= e!571548 e!571549)))

(declare-fun res!681490 () Bool)

(assert (=> b!1015982 (=> (not res!681490) (not e!571549))))

(assert (=> b!1015982 (= res!681490 (bvslt (_1!7624 (h!22697 lt!449220)) (_1!7624 (h!22697 (t!30504 lt!449220)))))))

(declare-fun b!1015983 () Bool)

(assert (=> b!1015983 (= e!571549 (isStrictlySorted!608 (t!30504 lt!449220)))))

(assert (= (and d!121085 (not res!681489)) b!1015982))

(assert (= (and b!1015982 res!681490) b!1015983))

(declare-fun m!937859 () Bool)

(assert (=> b!1015983 m!937859))

(assert (=> b!1015839 d!121085))

(declare-fun d!121087 () Bool)

(declare-fun res!681491 () Bool)

(declare-fun e!571550 () Bool)

(assert (=> d!121087 (=> res!681491 e!571550)))

(assert (=> d!121087 (= res!681491 (is-Nil!21501 (t!30505 keys!40)))))

(assert (=> d!121087 (= (forall!270 (t!30505 keys!40) lambda!971) e!571550)))

(declare-fun b!1015984 () Bool)

(declare-fun e!571551 () Bool)

(assert (=> b!1015984 (= e!571550 e!571551)))

(declare-fun res!681492 () Bool)

(assert (=> b!1015984 (=> (not res!681492) (not e!571551))))

(assert (=> b!1015984 (= res!681492 (dynLambda!1906 lambda!971 (h!22698 (t!30505 keys!40))))))

(declare-fun b!1015985 () Bool)

(assert (=> b!1015985 (= e!571551 (forall!270 (t!30505 (t!30505 keys!40)) lambda!971))))

(assert (= (and d!121087 (not res!681491)) b!1015984))

(assert (= (and b!1015984 res!681492) b!1015985))

(declare-fun b_lambda!15455 () Bool)

(assert (=> (not b_lambda!15455) (not b!1015984)))

(declare-fun m!937861 () Bool)

(assert (=> b!1015984 m!937861))

(declare-fun m!937863 () Bool)

(assert (=> b!1015985 m!937863))

(assert (=> b!1015839 d!121087))

(declare-fun bs!29487 () Bool)

(declare-fun b!1016010 () Bool)

(assert (= bs!29487 (and b!1016010 b!1015836)))

(declare-fun lambda!988 () Int)

