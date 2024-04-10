; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!88300 () Bool)

(assert start!88300)

(declare-fun b!1017047 () Bool)

(assert (=> b!1017047 true))

(assert (=> b!1017047 true))

(declare-fun bs!29551 () Bool)

(declare-fun b!1017044 () Bool)

(assert (= bs!29551 (and b!1017044 b!1017047)))

(declare-datatypes ((B!1550 0))(
  ( (B!1551 (val!11859 Int)) )
))
(declare-datatypes ((tuple2!15264 0))(
  ( (tuple2!15265 (_1!7643 (_ BitVec 64)) (_2!7643 B!1550)) )
))
(declare-datatypes ((List!21541 0))(
  ( (Nil!21538) (Cons!21537 (h!22735 tuple2!15264) (t!30542 List!21541)) )
))
(declare-fun lt!449396 () List!21541)

(declare-fun lambda!1065 () Int)

(declare-fun lambda!1064 () Int)

(declare-fun l!1114 () List!21541)

(assert (=> bs!29551 (= (= lt!449396 l!1114) (= lambda!1065 lambda!1064))))

(assert (=> b!1017044 true))

(assert (=> b!1017044 true))

(declare-fun b!1017041 () Bool)

(declare-fun res!682153 () Bool)

(declare-fun e!572186 () Bool)

(assert (=> b!1017041 (=> (not res!682153) (not e!572186))))

(declare-fun isEmpty!898 (List!21541) Bool)

(assert (=> b!1017041 (= res!682153 (not (isEmpty!898 l!1114)))))

(declare-fun b!1017042 () Bool)

(declare-fun res!682154 () Bool)

(assert (=> b!1017042 (=> (not res!682154) (not e!572186))))

(declare-datatypes ((List!21542 0))(
  ( (Nil!21539) (Cons!21538 (h!22736 (_ BitVec 64)) (t!30543 List!21542)) )
))
(declare-fun keys!40 () List!21542)

(assert (=> b!1017042 (= res!682154 (is-Cons!21538 keys!40))))

(declare-fun e!572185 () Bool)

(declare-fun forall!289 (List!21542 Int) Bool)

(assert (=> b!1017044 (= e!572185 (forall!289 keys!40 lambda!1065))))

(assert (=> b!1017044 (forall!289 (t!30543 keys!40) lambda!1065)))

(declare-fun value!178 () B!1550)

(declare-datatypes ((Unit!33263 0))(
  ( (Unit!33264) )
))
(declare-fun lt!449395 () Unit!33263)

(declare-fun newHead!31 () tuple2!15264)

(declare-fun lemmaForallGetValueByKeySameWithASmallerHead!50 (List!21541 List!21542 B!1550 tuple2!15264) Unit!33263)

(assert (=> b!1017044 (= lt!449395 (lemmaForallGetValueByKeySameWithASmallerHead!50 l!1114 (t!30543 keys!40) value!178 newHead!31))))

(declare-fun b!1017045 () Bool)

(declare-fun res!682149 () Bool)

(assert (=> b!1017045 (=> (not res!682149) (not e!572186))))

(declare-fun head!976 (List!21541) tuple2!15264)

(assert (=> b!1017045 (= res!682149 (bvslt (_1!7643 newHead!31) (_1!7643 (head!976 l!1114))))))

(declare-fun b!1017043 () Bool)

(assert (=> b!1017043 (= e!572186 (not e!572185))))

(declare-fun res!682151 () Bool)

(assert (=> b!1017043 (=> res!682151 e!572185)))

(assert (=> b!1017043 (= res!682151 (not (forall!289 (t!30543 keys!40) lambda!1064)))))

(declare-datatypes ((Option!612 0))(
  ( (Some!611 (v!14462 B!1550)) (None!610) )
))
(declare-fun isDefined!410 (Option!612) Bool)

(declare-fun getValueByKey!561 (List!21541 (_ BitVec 64)) Option!612)

(assert (=> b!1017043 (isDefined!410 (getValueByKey!561 lt!449396 (h!22736 keys!40)))))

(declare-fun lt!449397 () Unit!33263)

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!389 (List!21541 (_ BitVec 64)) Unit!33263)

(assert (=> b!1017043 (= lt!449397 (lemmaContainsKeyImpliesGetValueByKeyDefined!389 lt!449396 (h!22736 keys!40)))))

(assert (=> b!1017043 (= lt!449396 (Cons!21537 newHead!31 l!1114))))

(declare-fun containsKey!499 (List!21541 (_ BitVec 64)) Bool)

(assert (=> b!1017043 (containsKey!499 l!1114 (h!22736 keys!40))))

(declare-fun lt!449394 () Unit!33263)

(declare-fun lemmaGetValueByKeyIsDefinedImpliesContainsKey!19 (List!21541 (_ BitVec 64)) Unit!33263)

(assert (=> b!1017043 (= lt!449394 (lemmaGetValueByKeyIsDefinedImpliesContainsKey!19 l!1114 (h!22736 keys!40)))))

(declare-fun res!682152 () Bool)

(assert (=> start!88300 (=> (not res!682152) (not e!572186))))

(declare-fun isStrictlySorted!627 (List!21541) Bool)

(assert (=> start!88300 (= res!682152 (isStrictlySorted!627 l!1114))))

(assert (=> start!88300 e!572186))

(declare-fun e!572187 () Bool)

(assert (=> start!88300 e!572187))

(assert (=> start!88300 true))

(declare-fun tp_is_empty!23617 () Bool)

(assert (=> start!88300 tp_is_empty!23617))

(declare-fun b!1017046 () Bool)

(declare-fun tp!70828 () Bool)

(assert (=> b!1017046 (= e!572187 (and tp_is_empty!23617 tp!70828))))

(declare-fun res!682150 () Bool)

(assert (=> b!1017047 (=> (not res!682150) (not e!572186))))

(assert (=> b!1017047 (= res!682150 (forall!289 keys!40 lambda!1064))))

(assert (= (and start!88300 res!682152) b!1017041))

(assert (= (and b!1017041 res!682153) b!1017047))

(assert (= (and b!1017047 res!682150) b!1017045))

(assert (= (and b!1017045 res!682149) b!1017042))

(assert (= (and b!1017042 res!682154) b!1017043))

(assert (= (and b!1017043 (not res!682151)) b!1017044))

(assert (= (and start!88300 (is-Cons!21537 l!1114)) b!1017046))

(declare-fun m!938509 () Bool)

(assert (=> b!1017045 m!938509))

(declare-fun m!938511 () Bool)

(assert (=> start!88300 m!938511))

(declare-fun m!938513 () Bool)

(assert (=> b!1017041 m!938513))

(declare-fun m!938515 () Bool)

(assert (=> b!1017044 m!938515))

(declare-fun m!938517 () Bool)

(assert (=> b!1017044 m!938517))

(declare-fun m!938519 () Bool)

(assert (=> b!1017044 m!938519))

(declare-fun m!938521 () Bool)

(assert (=> b!1017043 m!938521))

(declare-fun m!938523 () Bool)

(assert (=> b!1017043 m!938523))

(declare-fun m!938525 () Bool)

(assert (=> b!1017043 m!938525))

(declare-fun m!938527 () Bool)

(assert (=> b!1017043 m!938527))

(assert (=> b!1017043 m!938521))

(declare-fun m!938529 () Bool)

(assert (=> b!1017043 m!938529))

(declare-fun m!938531 () Bool)

(assert (=> b!1017043 m!938531))

(declare-fun m!938533 () Bool)

(assert (=> b!1017047 m!938533))

(push 1)

(assert (not b!1017041))

(assert (not b!1017043))

(assert (not b!1017047))

(assert (not b!1017044))

(assert (not start!88300))

(assert (not b!1017045))

(assert tp_is_empty!23617)

(assert (not b!1017046))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!121475 () Bool)

(assert (=> d!121475 (= (isEmpty!898 l!1114) (is-Nil!21538 l!1114))))

(assert (=> b!1017041 d!121475))

(declare-fun d!121477 () Bool)

(declare-fun res!682209 () Bool)

(declare-fun e!572220 () Bool)

(assert (=> d!121477 (=> res!682209 e!572220)))

(assert (=> d!121477 (= res!682209 (or (is-Nil!21538 l!1114) (is-Nil!21538 (t!30542 l!1114))))))

(assert (=> d!121477 (= (isStrictlySorted!627 l!1114) e!572220)))

(declare-fun b!1017120 () Bool)

(declare-fun e!572221 () Bool)

(assert (=> b!1017120 (= e!572220 e!572221)))

(declare-fun res!682210 () Bool)

(assert (=> b!1017120 (=> (not res!682210) (not e!572221))))

(assert (=> b!1017120 (= res!682210 (bvslt (_1!7643 (h!22735 l!1114)) (_1!7643 (h!22735 (t!30542 l!1114)))))))

(declare-fun b!1017121 () Bool)

(assert (=> b!1017121 (= e!572221 (isStrictlySorted!627 (t!30542 l!1114)))))

(assert (= (and d!121477 (not res!682209)) b!1017120))

(assert (= (and b!1017120 res!682210) b!1017121))

(declare-fun m!938593 () Bool)

(assert (=> b!1017121 m!938593))

(assert (=> start!88300 d!121477))

(declare-fun d!121479 () Bool)

(assert (=> d!121479 (= (head!976 l!1114) (h!22735 l!1114))))

(assert (=> b!1017045 d!121479))

(declare-fun d!121481 () Bool)

(declare-fun res!682218 () Bool)

(declare-fun e!572227 () Bool)

(assert (=> d!121481 (=> res!682218 e!572227)))

(assert (=> d!121481 (= res!682218 (is-Nil!21539 keys!40))))

(assert (=> d!121481 (= (forall!289 keys!40 lambda!1065) e!572227)))

(declare-fun b!1017129 () Bool)

(declare-fun e!572228 () Bool)

(assert (=> b!1017129 (= e!572227 e!572228)))

(declare-fun res!682219 () Bool)

(assert (=> b!1017129 (=> (not res!682219) (not e!572228))))

(declare-fun dynLambda!1925 (Int (_ BitVec 64)) Bool)

(assert (=> b!1017129 (= res!682219 (dynLambda!1925 lambda!1065 (h!22736 keys!40)))))

(declare-fun b!1017130 () Bool)

(assert (=> b!1017130 (= e!572228 (forall!289 (t!30543 keys!40) lambda!1065))))

(assert (= (and d!121481 (not res!682218)) b!1017129))

(assert (= (and b!1017129 res!682219) b!1017130))

(declare-fun b_lambda!15583 () Bool)

(assert (=> (not b_lambda!15583) (not b!1017129)))

(declare-fun m!938595 () Bool)

(assert (=> b!1017129 m!938595))

(assert (=> b!1017130 m!938517))

(assert (=> b!1017044 d!121481))

(declare-fun d!121487 () Bool)

(declare-fun res!682224 () Bool)

(declare-fun e!572233 () Bool)

(assert (=> d!121487 (=> res!682224 e!572233)))

(assert (=> d!121487 (= res!682224 (is-Nil!21539 (t!30543 keys!40)))))

(assert (=> d!121487 (= (forall!289 (t!30543 keys!40) lambda!1065) e!572233)))

(declare-fun b!1017135 () Bool)

(declare-fun e!572234 () Bool)

(assert (=> b!1017135 (= e!572233 e!572234)))

(declare-fun res!682225 () Bool)

(assert (=> b!1017135 (=> (not res!682225) (not e!572234))))

(assert (=> b!1017135 (= res!682225 (dynLambda!1925 lambda!1065 (h!22736 (t!30543 keys!40))))))

(declare-fun b!1017136 () Bool)

(assert (=> b!1017136 (= e!572234 (forall!289 (t!30543 (t!30543 keys!40)) lambda!1065))))

(assert (= (and d!121487 (not res!682224)) b!1017135))

(assert (= (and b!1017135 res!682225) b!1017136))

(declare-fun b_lambda!15585 () Bool)

(assert (=> (not b_lambda!15585) (not b!1017135)))

(declare-fun m!938597 () Bool)

(assert (=> b!1017135 m!938597))

(declare-fun m!938599 () Bool)

(assert (=> b!1017136 m!938599))

(assert (=> b!1017044 d!121487))

(declare-fun bs!29559 () Bool)

(declare-fun b!1017165 () Bool)

(assert (= bs!29559 (and b!1017165 b!1017047)))

(declare-fun lambda!1100 () Int)

(assert (=> bs!29559 (= lambda!1100 lambda!1064)))

(declare-fun bs!29561 () Bool)

(assert (= bs!29561 (and b!1017165 b!1017044)))

(assert (=> bs!29561 (= (= l!1114 lt!449396) (= lambda!1100 lambda!1065))))

(assert (=> b!1017165 true))

(assert (=> b!1017165 true))

(declare-fun bs!29562 () Bool)

(declare-fun d!121489 () Bool)

(assert (= bs!29562 (and d!121489 b!1017047)))

(declare-fun lambda!1101 () Int)

(assert (=> bs!29562 (= (= (Cons!21537 newHead!31 l!1114) l!1114) (= lambda!1101 lambda!1064))))

(declare-fun bs!29563 () Bool)

(assert (= bs!29563 (and d!121489 b!1017044)))

(assert (=> bs!29563 (= (= (Cons!21537 newHead!31 l!1114) lt!449396) (= lambda!1101 lambda!1065))))

(declare-fun bs!29564 () Bool)

(assert (= bs!29564 (and d!121489 b!1017165)))

(assert (=> bs!29564 (= (= (Cons!21537 newHead!31 l!1114) l!1114) (= lambda!1101 lambda!1100))))

(assert (=> d!121489 true))

(assert (=> d!121489 true))

(assert (=> d!121489 true))

(assert (=> d!121489 (forall!289 (t!30543 keys!40) lambda!1101)))

(declare-fun lt!449432 () Unit!33263)

(declare-fun choose!1665 (List!21541 List!21542 B!1550 tuple2!15264) Unit!33263)

(assert (=> d!121489 (= lt!449432 (choose!1665 l!1114 (t!30543 keys!40) value!178 newHead!31))))

(declare-fun e!572252 () Bool)

(assert (=> d!121489 e!572252))

(declare-fun res!682253 () Bool)

(assert (=> d!121489 (=> (not res!682253) (not e!572252))))

(assert (=> d!121489 (= res!682253 (isStrictlySorted!627 l!1114))))

(assert (=> d!121489 (= (lemmaForallGetValueByKeySameWithASmallerHead!50 l!1114 (t!30543 keys!40) value!178 newHead!31) lt!449432)))

(declare-fun b!1017164 () Bool)

(declare-fun res!682251 () Bool)

(assert (=> b!1017164 (=> (not res!682251) (not e!572252))))

(assert (=> b!1017164 (= res!682251 (not (isEmpty!898 l!1114)))))

(declare-fun res!682252 () Bool)

(assert (=> b!1017165 (=> (not res!682252) (not e!572252))))

(assert (=> b!1017165 (= res!682252 (forall!289 (t!30543 keys!40) lambda!1100))))

(declare-fun b!1017166 () Bool)

(assert (=> b!1017166 (= e!572252 (bvslt (_1!7643 newHead!31) (_1!7643 (head!976 l!1114))))))

(assert (= (and d!121489 res!682253) b!1017164))

(assert (= (and b!1017164 res!682251) b!1017165))

(assert (= (and b!1017165 res!682252) b!1017166))

(declare-fun m!938623 () Bool)

(assert (=> d!121489 m!938623))

(declare-fun m!938625 () Bool)

(assert (=> d!121489 m!938625))

(assert (=> d!121489 m!938511))

(assert (=> b!1017164 m!938513))

(declare-fun m!938627 () Bool)

(assert (=> b!1017165 m!938627))

(assert (=> b!1017166 m!938509))

(assert (=> b!1017044 d!121489))

(declare-fun d!121505 () Bool)

(declare-fun res!682263 () Bool)

(declare-fun e!572266 () Bool)

(assert (=> d!121505 (=> res!682263 e!572266)))

(assert (=> d!121505 (= res!682263 (and (is-Cons!21537 l!1114) (= (_1!7643 (h!22735 l!1114)) (h!22736 keys!40))))))

(assert (=> d!121505 (= (containsKey!499 l!1114 (h!22736 keys!40)) e!572266)))

(declare-fun b!1017192 () Bool)

(declare-fun e!572267 () Bool)

(assert (=> b!1017192 (= e!572266 e!572267)))

(declare-fun res!682264 () Bool)

(assert (=> b!1017192 (=> (not res!682264) (not e!572267))))

(assert (=> b!1017192 (= res!682264 (and (or (not (is-Cons!21537 l!1114)) (bvsle (_1!7643 (h!22735 l!1114)) (h!22736 keys!40))) (is-Cons!21537 l!1114) (bvslt (_1!7643 (h!22735 l!1114)) (h!22736 keys!40))))))

(declare-fun b!1017193 () Bool)

(assert (=> b!1017193 (= e!572267 (containsKey!499 (t!30542 l!1114) (h!22736 keys!40)))))

(assert (= (and d!121505 (not res!682263)) b!1017192))

(assert (= (and b!1017192 res!682264) b!1017193))

(declare-fun m!938637 () Bool)

(assert (=> b!1017193 m!938637))

(assert (=> b!1017043 d!121505))

(declare-fun d!121511 () Bool)

(declare-fun isEmpty!902 (Option!612) Bool)

(assert (=> d!121511 (= (isDefined!410 (getValueByKey!561 lt!449396 (h!22736 keys!40))) (not (isEmpty!902 (getValueByKey!561 lt!449396 (h!22736 keys!40)))))))

(declare-fun bs!29570 () Bool)

(assert (= bs!29570 d!121511))

(assert (=> bs!29570 m!938521))

(declare-fun m!938639 () Bool)

(assert (=> bs!29570 m!938639))

(assert (=> b!1017043 d!121511))

(declare-fun d!121513 () Bool)

(declare-fun res!682271 () Bool)

(declare-fun e!572274 () Bool)

(assert (=> d!121513 (=> res!682271 e!572274)))

(assert (=> d!121513 (= res!682271 (is-Nil!21539 (t!30543 keys!40)))))

(assert (=> d!121513 (= (forall!289 (t!30543 keys!40) lambda!1064) e!572274)))

(declare-fun b!1017200 () Bool)

(declare-fun e!572275 () Bool)

(assert (=> b!1017200 (= e!572274 e!572275)))

(declare-fun res!682272 () Bool)

(assert (=> b!1017200 (=> (not res!682272) (not e!572275))))

(assert (=> b!1017200 (= res!682272 (dynLambda!1925 lambda!1064 (h!22736 (t!30543 keys!40))))))

(declare-fun b!1017201 () Bool)

(assert (=> b!1017201 (= e!572275 (forall!289 (t!30543 (t!30543 keys!40)) lambda!1064))))

(assert (= (and d!121513 (not res!682271)) b!1017200))

(assert (= (and b!1017200 res!682272) b!1017201))

(declare-fun b_lambda!15591 () Bool)

(assert (=> (not b_lambda!15591) (not b!1017200)))

(declare-fun m!938643 () Bool)

(assert (=> b!1017200 m!938643))

(declare-fun m!938645 () Bool)

(assert (=> b!1017201 m!938645))

(assert (=> b!1017043 d!121513))

(declare-fun d!121517 () Bool)

(declare-fun c!102999 () Bool)

(assert (=> d!121517 (= c!102999 (and (is-Cons!21537 lt!449396) (= (_1!7643 (h!22735 lt!449396)) (h!22736 keys!40))))))

(declare-fun e!572295 () Option!612)

(assert (=> d!121517 (= (getValueByKey!561 lt!449396 (h!22736 keys!40)) e!572295)))

(declare-fun b!1017228 () Bool)

(declare-fun e!572296 () Option!612)

(assert (=> b!1017228 (= e!572296 None!610)))

(declare-fun b!1017226 () Bool)

(assert (=> b!1017226 (= e!572295 e!572296)))

(declare-fun c!103000 () Bool)

(assert (=> b!1017226 (= c!103000 (and (is-Cons!21537 lt!449396) (not (= (_1!7643 (h!22735 lt!449396)) (h!22736 keys!40)))))))

(declare-fun b!1017225 () Bool)

(assert (=> b!1017225 (= e!572295 (Some!611 (_2!7643 (h!22735 lt!449396))))))

(declare-fun b!1017227 () Bool)

(assert (=> b!1017227 (= e!572296 (getValueByKey!561 (t!30542 lt!449396) (h!22736 keys!40)))))

(assert (= (and d!121517 c!102999) b!1017225))

(assert (= (and d!121517 (not c!102999)) b!1017226))

(assert (= (and b!1017226 c!103000) b!1017227))

(assert (= (and b!1017226 (not c!103000)) b!1017228))

(declare-fun m!938661 () Bool)

(assert (=> b!1017227 m!938661))

(assert (=> b!1017043 d!121517))

(declare-fun d!121529 () Bool)

(assert (=> d!121529 (containsKey!499 l!1114 (h!22736 keys!40))))

(declare-fun lt!449439 () Unit!33263)

(declare-fun choose!1668 (List!21541 (_ BitVec 64)) Unit!33263)

(assert (=> d!121529 (= lt!449439 (choose!1668 l!1114 (h!22736 keys!40)))))

(declare-fun e!572310 () Bool)

(assert (=> d!121529 e!572310))

(declare-fun res!682294 () Bool)

(assert (=> d!121529 (=> (not res!682294) (not e!572310))))

(assert (=> d!121529 (= res!682294 (isStrictlySorted!627 l!1114))))

(assert (=> d!121529 (= (lemmaGetValueByKeyIsDefinedImpliesContainsKey!19 l!1114 (h!22736 keys!40)) lt!449439)))

(declare-fun b!1017248 () Bool)

(assert (=> b!1017248 (= e!572310 (isDefined!410 (getValueByKey!561 l!1114 (h!22736 keys!40))))))

(assert (= (and d!121529 res!682294) b!1017248))

(assert (=> d!121529 m!938527))

(declare-fun m!938671 () Bool)

(assert (=> d!121529 m!938671))

(assert (=> d!121529 m!938511))

(declare-fun m!938673 () Bool)

(assert (=> b!1017248 m!938673))

(assert (=> b!1017248 m!938673))

(declare-fun m!938675 () Bool)

(assert (=> b!1017248 m!938675))

(assert (=> b!1017043 d!121529))

(declare-fun d!121541 () Bool)

(assert (=> d!121541 (isDefined!410 (getValueByKey!561 lt!449396 (h!22736 keys!40)))))

(declare-fun lt!449442 () Unit!33263)

(declare-fun choose!1669 (List!21541 (_ BitVec 64)) Unit!33263)

(assert (=> d!121541 (= lt!449442 (choose!1669 lt!449396 (h!22736 keys!40)))))

(declare-fun e!572317 () Bool)

(assert (=> d!121541 e!572317))

(declare-fun res!682299 () Bool)

(assert (=> d!121541 (=> (not res!682299) (not e!572317))))

(assert (=> d!121541 (= res!682299 (isStrictlySorted!627 lt!449396))))

(assert (=> d!121541 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!389 lt!449396 (h!22736 keys!40)) lt!449442)))

(declare-fun b!1017257 () Bool)

(assert (=> b!1017257 (= e!572317 (containsKey!499 lt!449396 (h!22736 keys!40)))))

(assert (= (and d!121541 res!682299) b!1017257))

(assert (=> d!121541 m!938521))

(assert (=> d!121541 m!938521))

(assert (=> d!121541 m!938523))

(declare-fun m!938683 () Bool)

(assert (=> d!121541 m!938683))

(declare-fun m!938685 () Bool)

(assert (=> d!121541 m!938685))

(declare-fun m!938687 () Bool)

(assert (=> b!1017257 m!938687))

(assert (=> b!1017043 d!121541))

(declare-fun d!121547 () Bool)

(declare-fun res!682300 () Bool)

(declare-fun e!572318 () Bool)

(assert (=> d!121547 (=> res!682300 e!572318)))

(assert (=> d!121547 (= res!682300 (is-Nil!21539 keys!40))))

(assert (=> d!121547 (= (forall!289 keys!40 lambda!1064) e!572318)))

(declare-fun b!1017258 () Bool)

(declare-fun e!572319 () Bool)

(assert (=> b!1017258 (= e!572318 e!572319)))

(declare-fun res!682301 () Bool)

(assert (=> b!1017258 (=> (not res!682301) (not e!572319))))

(assert (=> b!1017258 (= res!682301 (dynLambda!1925 lambda!1064 (h!22736 keys!40)))))

(declare-fun b!1017259 () Bool)

(assert (=> b!1017259 (= e!572319 (forall!289 (t!30543 keys!40) lambda!1064))))

(assert (= (and d!121547 (not res!682300)) b!1017258))

(assert (= (and b!1017258 res!682301) b!1017259))

(declare-fun b_lambda!15609 () Bool)

(assert (=> (not b_lambda!15609) (not b!1017258)))

(declare-fun m!938689 () Bool)

(assert (=> b!1017258 m!938689))

(assert (=> b!1017259 m!938529))

(assert (=> b!1017047 d!121547))

(declare-fun b!1017266 () Bool)

(declare-fun e!572324 () Bool)

(declare-fun tp!70840 () Bool)

(assert (=> b!1017266 (= e!572324 (and tp_is_empty!23617 tp!70840))))

(assert (=> b!1017046 (= tp!70828 e!572324)))

(assert (= (and b!1017046 (is-Cons!21537 (t!30542 l!1114))) b!1017266))

(declare-fun b_lambda!15611 () Bool)

(assert (= b_lambda!15591 (or b!1017047 b_lambda!15611)))

(declare-fun bs!29575 () Bool)

(declare-fun d!121549 () Bool)

(assert (= bs!29575 (and d!121549 b!1017047)))

(assert (=> bs!29575 (= (dynLambda!1925 lambda!1064 (h!22736 (t!30543 keys!40))) (= (getValueByKey!561 l!1114 (h!22736 (t!30543 keys!40))) (Some!611 value!178)))))

(declare-fun m!938695 () Bool)

(assert (=> bs!29575 m!938695))

(assert (=> b!1017200 d!121549))

(declare-fun b_lambda!15613 () Bool)

(assert (= b_lambda!15585 (or b!1017044 b_lambda!15613)))

(declare-fun bs!29576 () Bool)

(declare-fun d!121553 () Bool)

(assert (= bs!29576 (and d!121553 b!1017044)))

(assert (=> bs!29576 (= (dynLambda!1925 lambda!1065 (h!22736 (t!30543 keys!40))) (= (getValueByKey!561 lt!449396 (h!22736 (t!30543 keys!40))) (Some!611 value!178)))))

(declare-fun m!938699 () Bool)

(assert (=> bs!29576 m!938699))

(assert (=> b!1017135 d!121553))

(declare-fun b_lambda!15615 () Bool)

(assert (= b_lambda!15609 (or b!1017047 b_lambda!15615)))

(declare-fun bs!29577 () Bool)

(declare-fun d!121555 () Bool)

(assert (= bs!29577 (and d!121555 b!1017047)))

(assert (=> bs!29577 (= (dynLambda!1925 lambda!1064 (h!22736 keys!40)) (= (getValueByKey!561 l!1114 (h!22736 keys!40)) (Some!611 value!178)))))

(assert (=> bs!29577 m!938673))

(assert (=> b!1017258 d!121555))

(declare-fun b_lambda!15617 () Bool)

(assert (= b_lambda!15583 (or b!1017044 b_lambda!15617)))

(declare-fun bs!29578 () Bool)

(declare-fun d!121557 () Bool)

(assert (= bs!29578 (and d!121557 b!1017044)))

(assert (=> bs!29578 (= (dynLambda!1925 lambda!1065 (h!22736 keys!40)) (= (getValueByKey!561 lt!449396 (h!22736 keys!40)) (Some!611 value!178)))))

(assert (=> bs!29578 m!938521))

(assert (=> b!1017129 d!121557))

(push 1)

(assert (not b!1017130))

(assert (not b!1017121))

(assert (not b!1017201))

(assert (not bs!29577))

(assert (not d!121529))

(assert (not b_lambda!15611))

(assert (not bs!29575))

(assert (not d!121489))

(assert (not b!1017257))

(assert (not bs!29578))

(assert (not b!1017248))

(assert (not bs!29576))

(assert (not b!1017165))

(assert (not b!1017266))

(assert (not b!1017136))

(assert (not b!1017164))

(assert (not b_lambda!15617))

(assert (not b!1017227))

(assert (not b!1017166))

(assert (not b_lambda!15615))

(assert (not d!121511))

(assert (not b!1017193))

(assert (not b_lambda!15613))

(assert tp_is_empty!23617)

(assert (not b!1017259))

(assert (not d!121541))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

