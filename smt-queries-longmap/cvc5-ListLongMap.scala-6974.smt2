; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!88540 () Bool)

(assert start!88540)

(declare-fun b!1018427 () Bool)

(assert (=> b!1018427 true))

(assert (=> b!1018427 true))

(declare-fun bs!29573 () Bool)

(declare-fun b!1018426 () Bool)

(assert (= bs!29573 (and b!1018426 b!1018427)))

(declare-fun lambda!1084 () Int)

(declare-fun lambda!1085 () Int)

(declare-datatypes ((B!1554 0))(
  ( (B!1555 (val!11861 Int)) )
))
(declare-datatypes ((tuple2!15272 0))(
  ( (tuple2!15273 (_1!7647 (_ BitVec 64)) (_2!7647 B!1554)) )
))
(declare-datatypes ((List!21534 0))(
  ( (Nil!21531) (Cons!21530 (h!22737 tuple2!15272) (t!30527 List!21534)) )
))
(declare-fun l!1114 () List!21534)

(declare-fun lt!449936 () List!21534)

(assert (=> bs!29573 (= (= lt!449936 l!1114) (= lambda!1085 lambda!1084))))

(assert (=> b!1018426 true))

(assert (=> b!1018426 true))

(declare-fun b!1018421 () Bool)

(declare-fun res!682701 () Bool)

(declare-fun e!573058 () Bool)

(assert (=> b!1018421 (=> (not res!682701) (not e!573058))))

(declare-fun isEmpty!904 (List!21534) Bool)

(assert (=> b!1018421 (= res!682701 (not (isEmpty!904 l!1114)))))

(declare-fun b!1018422 () Bool)

(declare-fun res!682702 () Bool)

(assert (=> b!1018422 (=> (not res!682702) (not e!573058))))

(declare-fun newHead!31 () tuple2!15272)

(declare-fun head!974 (List!21534) tuple2!15272)

(assert (=> b!1018422 (= res!682702 (bvslt (_1!7647 newHead!31) (_1!7647 (head!974 l!1114))))))

(declare-fun b!1018423 () Bool)

(declare-fun e!573057 () Bool)

(assert (=> b!1018423 (= e!573058 (not e!573057))))

(declare-fun res!682699 () Bool)

(assert (=> b!1018423 (=> res!682699 e!573057)))

(declare-datatypes ((List!21535 0))(
  ( (Nil!21532) (Cons!21531 (h!22738 (_ BitVec 64)) (t!30528 List!21535)) )
))
(declare-fun keys!40 () List!21535)

(declare-fun forall!293 (List!21535 Int) Bool)

(assert (=> b!1018423 (= res!682699 (not (forall!293 (t!30528 keys!40) lambda!1084)))))

(declare-datatypes ((Option!610 0))(
  ( (Some!609 (v!14460 B!1554)) (None!608) )
))
(declare-fun isDefined!411 (Option!610) Bool)

(declare-fun getValueByKey!559 (List!21534 (_ BitVec 64)) Option!610)

(assert (=> b!1018423 (isDefined!411 (getValueByKey!559 lt!449936 (h!22738 keys!40)))))

(declare-datatypes ((Unit!33268 0))(
  ( (Unit!33269) )
))
(declare-fun lt!449933 () Unit!33268)

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!391 (List!21534 (_ BitVec 64)) Unit!33268)

(assert (=> b!1018423 (= lt!449933 (lemmaContainsKeyImpliesGetValueByKeyDefined!391 lt!449936 (h!22738 keys!40)))))

(assert (=> b!1018423 (= lt!449936 (Cons!21530 newHead!31 l!1114))))

(declare-fun containsKey!503 (List!21534 (_ BitVec 64)) Bool)

(assert (=> b!1018423 (containsKey!503 l!1114 (h!22738 keys!40))))

(declare-fun lt!449934 () Unit!33268)

(declare-fun lemmaGetValueByKeyIsDefinedImpliesContainsKey!21 (List!21534 (_ BitVec 64)) Unit!33268)

(assert (=> b!1018423 (= lt!449934 (lemmaGetValueByKeyIsDefinedImpliesContainsKey!21 l!1114 (h!22738 keys!40)))))

(declare-fun b!1018424 () Bool)

(declare-fun res!682700 () Bool)

(assert (=> b!1018424 (=> (not res!682700) (not e!573058))))

(assert (=> b!1018424 (= res!682700 (is-Cons!21531 keys!40))))

(assert (=> b!1018426 (= e!573057 (forall!293 keys!40 lambda!1085))))

(assert (=> b!1018426 (forall!293 (t!30528 keys!40) lambda!1085)))

(declare-fun lt!449935 () Unit!33268)

(declare-fun value!178 () B!1554)

(declare-fun lemmaForallGetValueByKeySameWithASmallerHead!55 (List!21534 List!21535 B!1554 tuple2!15272) Unit!33268)

(assert (=> b!1018426 (= lt!449935 (lemmaForallGetValueByKeySameWithASmallerHead!55 l!1114 (t!30528 keys!40) value!178 newHead!31))))

(declare-fun res!682703 () Bool)

(assert (=> b!1018427 (=> (not res!682703) (not e!573058))))

(assert (=> b!1018427 (= res!682703 (forall!293 keys!40 lambda!1084))))

(declare-fun res!682704 () Bool)

(assert (=> start!88540 (=> (not res!682704) (not e!573058))))

(declare-fun isStrictlySorted!617 (List!21534) Bool)

(assert (=> start!88540 (= res!682704 (isStrictlySorted!617 l!1114))))

(assert (=> start!88540 e!573058))

(declare-fun e!573056 () Bool)

(assert (=> start!88540 e!573056))

(assert (=> start!88540 true))

(declare-fun tp_is_empty!23621 () Bool)

(assert (=> start!88540 tp_is_empty!23621))

(declare-fun b!1018425 () Bool)

(declare-fun tp!70835 () Bool)

(assert (=> b!1018425 (= e!573056 (and tp_is_empty!23621 tp!70835))))

(assert (= (and start!88540 res!682704) b!1018421))

(assert (= (and b!1018421 res!682701) b!1018427))

(assert (= (and b!1018427 res!682703) b!1018422))

(assert (= (and b!1018422 res!682702) b!1018424))

(assert (= (and b!1018424 res!682700) b!1018423))

(assert (= (and b!1018423 (not res!682699)) b!1018426))

(assert (= (and start!88540 (is-Cons!21530 l!1114)) b!1018425))

(declare-fun m!940231 () Bool)

(assert (=> b!1018421 m!940231))

(declare-fun m!940233 () Bool)

(assert (=> b!1018426 m!940233))

(declare-fun m!940235 () Bool)

(assert (=> b!1018426 m!940235))

(declare-fun m!940237 () Bool)

(assert (=> b!1018426 m!940237))

(declare-fun m!940239 () Bool)

(assert (=> b!1018422 m!940239))

(declare-fun m!940241 () Bool)

(assert (=> start!88540 m!940241))

(declare-fun m!940243 () Bool)

(assert (=> b!1018423 m!940243))

(declare-fun m!940245 () Bool)

(assert (=> b!1018423 m!940245))

(declare-fun m!940247 () Bool)

(assert (=> b!1018423 m!940247))

(declare-fun m!940249 () Bool)

(assert (=> b!1018423 m!940249))

(declare-fun m!940251 () Bool)

(assert (=> b!1018423 m!940251))

(assert (=> b!1018423 m!940247))

(declare-fun m!940253 () Bool)

(assert (=> b!1018423 m!940253))

(declare-fun m!940255 () Bool)

(assert (=> b!1018427 m!940255))

(push 1)

(assert (not b!1018422))

(assert tp_is_empty!23621)

(assert (not b!1018426))

(assert (not b!1018423))

(assert (not b!1018421))

(assert (not b!1018427))

(assert (not b!1018425))

(assert (not start!88540))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!121943 () Bool)

(declare-fun res!682721 () Bool)

(declare-fun e!573075 () Bool)

(assert (=> d!121943 (=> res!682721 e!573075)))

(assert (=> d!121943 (= res!682721 (or (is-Nil!21531 l!1114) (is-Nil!21531 (t!30527 l!1114))))))

(assert (=> d!121943 (= (isStrictlySorted!617 l!1114) e!573075)))

(declare-fun b!1018448 () Bool)

(declare-fun e!573076 () Bool)

(assert (=> b!1018448 (= e!573075 e!573076)))

(declare-fun res!682722 () Bool)

(assert (=> b!1018448 (=> (not res!682722) (not e!573076))))

(assert (=> b!1018448 (= res!682722 (bvslt (_1!7647 (h!22737 l!1114)) (_1!7647 (h!22737 (t!30527 l!1114)))))))

(declare-fun b!1018449 () Bool)

(assert (=> b!1018449 (= e!573076 (isStrictlySorted!617 (t!30527 l!1114)))))

(assert (= (and d!121943 (not res!682721)) b!1018448))

(assert (= (and b!1018448 res!682722) b!1018449))

(declare-fun m!940265 () Bool)

(assert (=> b!1018449 m!940265))

(assert (=> start!88540 d!121943))

(declare-fun d!121949 () Bool)

(declare-fun res!682729 () Bool)

(declare-fun e!573083 () Bool)

(assert (=> d!121949 (=> res!682729 e!573083)))

(assert (=> d!121949 (= res!682729 (is-Nil!21532 keys!40))))

(assert (=> d!121949 (= (forall!293 keys!40 lambda!1085) e!573083)))

(declare-fun b!1018456 () Bool)

(declare-fun e!573084 () Bool)

(assert (=> b!1018456 (= e!573083 e!573084)))

(declare-fun res!682730 () Bool)

(assert (=> b!1018456 (=> (not res!682730) (not e!573084))))

(declare-fun dynLambda!1947 (Int (_ BitVec 64)) Bool)

(assert (=> b!1018456 (= res!682730 (dynLambda!1947 lambda!1085 (h!22738 keys!40)))))

(declare-fun b!1018457 () Bool)

(assert (=> b!1018457 (= e!573084 (forall!293 (t!30528 keys!40) lambda!1085))))

(assert (= (and d!121949 (not res!682729)) b!1018456))

(assert (= (and b!1018456 res!682730) b!1018457))

(declare-fun b_lambda!15591 () Bool)

(assert (=> (not b_lambda!15591) (not b!1018456)))

(declare-fun m!940267 () Bool)

(assert (=> b!1018456 m!940267))

(assert (=> b!1018457 m!940235))

(assert (=> b!1018426 d!121949))

(declare-fun d!121951 () Bool)

(declare-fun res!682732 () Bool)

(declare-fun e!573086 () Bool)

(assert (=> d!121951 (=> res!682732 e!573086)))

(assert (=> d!121951 (= res!682732 (is-Nil!21532 (t!30528 keys!40)))))

(assert (=> d!121951 (= (forall!293 (t!30528 keys!40) lambda!1085) e!573086)))

(declare-fun b!1018459 () Bool)

(declare-fun e!573087 () Bool)

(assert (=> b!1018459 (= e!573086 e!573087)))

(declare-fun res!682733 () Bool)

(assert (=> b!1018459 (=> (not res!682733) (not e!573087))))

(assert (=> b!1018459 (= res!682733 (dynLambda!1947 lambda!1085 (h!22738 (t!30528 keys!40))))))

(declare-fun b!1018460 () Bool)

(assert (=> b!1018460 (= e!573087 (forall!293 (t!30528 (t!30528 keys!40)) lambda!1085))))

(assert (= (and d!121951 (not res!682732)) b!1018459))

(assert (= (and b!1018459 res!682733) b!1018460))

(declare-fun b_lambda!15593 () Bool)

(assert (=> (not b_lambda!15593) (not b!1018459)))

(declare-fun m!940275 () Bool)

(assert (=> b!1018459 m!940275))

(declare-fun m!940277 () Bool)

(assert (=> b!1018460 m!940277))

(assert (=> b!1018426 d!121951))

(declare-fun bs!29575 () Bool)

(declare-fun b!1018485 () Bool)

(assert (= bs!29575 (and b!1018485 b!1018427)))

(declare-fun lambda!1090 () Int)

(assert (=> bs!29575 (= lambda!1090 lambda!1084)))

(declare-fun bs!29576 () Bool)

(assert (= bs!29576 (and b!1018485 b!1018426)))

(assert (=> bs!29576 (= (= l!1114 lt!449936) (= lambda!1090 lambda!1085))))

(assert (=> b!1018485 true))

(assert (=> b!1018485 true))

(declare-fun bs!29577 () Bool)

(declare-fun d!121957 () Bool)

(assert (= bs!29577 (and d!121957 b!1018427)))

(declare-fun lambda!1091 () Int)

(assert (=> bs!29577 (= (= (Cons!21530 newHead!31 l!1114) l!1114) (= lambda!1091 lambda!1084))))

(declare-fun bs!29578 () Bool)

(assert (= bs!29578 (and d!121957 b!1018426)))

(assert (=> bs!29578 (= (= (Cons!21530 newHead!31 l!1114) lt!449936) (= lambda!1091 lambda!1085))))

(declare-fun bs!29579 () Bool)

(assert (= bs!29579 (and d!121957 b!1018485)))

(assert (=> bs!29579 (= (= (Cons!21530 newHead!31 l!1114) l!1114) (= lambda!1091 lambda!1090))))

(assert (=> d!121957 true))

(assert (=> d!121957 true))

(assert (=> d!121957 true))

(assert (=> d!121957 (forall!293 (t!30528 keys!40) lambda!1091)))

(declare-fun lt!449945 () Unit!33268)

(declare-fun choose!1667 (List!21534 List!21535 B!1554 tuple2!15272) Unit!33268)

(assert (=> d!121957 (= lt!449945 (choose!1667 l!1114 (t!30528 keys!40) value!178 newHead!31))))

(declare-fun e!573107 () Bool)

(assert (=> d!121957 e!573107))

(declare-fun res!682757 () Bool)

(assert (=> d!121957 (=> (not res!682757) (not e!573107))))

(assert (=> d!121957 (= res!682757 (isStrictlySorted!617 l!1114))))

(assert (=> d!121957 (= (lemmaForallGetValueByKeySameWithASmallerHead!55 l!1114 (t!30528 keys!40) value!178 newHead!31) lt!449945)))

(declare-fun b!1018484 () Bool)

(declare-fun res!682759 () Bool)

(assert (=> b!1018484 (=> (not res!682759) (not e!573107))))

(assert (=> b!1018484 (= res!682759 (not (isEmpty!904 l!1114)))))

(declare-fun res!682758 () Bool)

(assert (=> b!1018485 (=> (not res!682758) (not e!573107))))

(assert (=> b!1018485 (= res!682758 (forall!293 (t!30528 keys!40) lambda!1090))))

(declare-fun b!1018486 () Bool)

(assert (=> b!1018486 (= e!573107 (bvslt (_1!7647 newHead!31) (_1!7647 (head!974 l!1114))))))

(assert (= (and d!121957 res!682757) b!1018484))

(assert (= (and b!1018484 res!682759) b!1018485))

(assert (= (and b!1018485 res!682758) b!1018486))

(declare-fun m!940291 () Bool)

(assert (=> d!121957 m!940291))

(declare-fun m!940293 () Bool)

(assert (=> d!121957 m!940293))

(assert (=> d!121957 m!940241))

(assert (=> b!1018484 m!940231))

(declare-fun m!940295 () Bool)

(assert (=> b!1018485 m!940295))

(assert (=> b!1018486 m!940239))

(assert (=> b!1018426 d!121957))

(declare-fun d!121971 () Bool)

(assert (=> d!121971 (= (isEmpty!904 l!1114) (is-Nil!21531 l!1114))))

(assert (=> b!1018421 d!121971))

(declare-fun d!121973 () Bool)

(declare-fun res!682764 () Bool)

(declare-fun e!573120 () Bool)

(assert (=> d!121973 (=> res!682764 e!573120)))

(assert (=> d!121973 (= res!682764 (is-Nil!21532 keys!40))))

(assert (=> d!121973 (= (forall!293 keys!40 lambda!1084) e!573120)))

(declare-fun b!1018509 () Bool)

(declare-fun e!573121 () Bool)

(assert (=> b!1018509 (= e!573120 e!573121)))

(declare-fun res!682765 () Bool)

(assert (=> b!1018509 (=> (not res!682765) (not e!573121))))

(assert (=> b!1018509 (= res!682765 (dynLambda!1947 lambda!1084 (h!22738 keys!40)))))

(declare-fun b!1018510 () Bool)

(assert (=> b!1018510 (= e!573121 (forall!293 (t!30528 keys!40) lambda!1084))))

(assert (= (and d!121973 (not res!682764)) b!1018509))

(assert (= (and b!1018509 res!682765) b!1018510))

(declare-fun b_lambda!15597 () Bool)

(assert (=> (not b_lambda!15597) (not b!1018509)))

(declare-fun m!940297 () Bool)

(assert (=> b!1018509 m!940297))

(assert (=> b!1018510 m!940245))

(assert (=> b!1018427 d!121973))

(declare-fun d!121975 () Bool)

(assert (=> d!121975 (= (head!974 l!1114) (h!22737 l!1114))))

(assert (=> b!1018422 d!121975))

(declare-fun d!121977 () Bool)

(assert (=> d!121977 (isDefined!411 (getValueByKey!559 lt!449936 (h!22738 keys!40)))))

(declare-fun lt!449948 () Unit!33268)

(declare-fun choose!1670 (List!21534 (_ BitVec 64)) Unit!33268)

(assert (=> d!121977 (= lt!449948 (choose!1670 lt!449936 (h!22738 keys!40)))))

(declare-fun e!573130 () Bool)

(assert (=> d!121977 e!573130))

(declare-fun res!682770 () Bool)

(assert (=> d!121977 (=> (not res!682770) (not e!573130))))

(assert (=> d!121977 (= res!682770 (isStrictlySorted!617 lt!449936))))

(assert (=> d!121977 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!391 lt!449936 (h!22738 keys!40)) lt!449948)))

(declare-fun b!1018523 () Bool)

(assert (=> b!1018523 (= e!573130 (containsKey!503 lt!449936 (h!22738 keys!40)))))

(assert (= (and d!121977 res!682770) b!1018523))

(assert (=> d!121977 m!940247))

(assert (=> d!121977 m!940247))

(assert (=> d!121977 m!940253))

(declare-fun m!940305 () Bool)

(assert (=> d!121977 m!940305))

(declare-fun m!940307 () Bool)

(assert (=> d!121977 m!940307))

(declare-fun m!940309 () Bool)

(assert (=> b!1018523 m!940309))

(assert (=> b!1018423 d!121977))

(declare-fun d!121987 () Bool)

(declare-fun res!682782 () Bool)

(declare-fun e!573142 () Bool)

(assert (=> d!121987 (=> res!682782 e!573142)))

(assert (=> d!121987 (= res!682782 (and (is-Cons!21530 l!1114) (= (_1!7647 (h!22737 l!1114)) (h!22738 keys!40))))))

(assert (=> d!121987 (= (containsKey!503 l!1114 (h!22738 keys!40)) e!573142)))

(declare-fun b!1018535 () Bool)

(declare-fun e!573143 () Bool)

(assert (=> b!1018535 (= e!573142 e!573143)))

(declare-fun res!682783 () Bool)

(assert (=> b!1018535 (=> (not res!682783) (not e!573143))))

(assert (=> b!1018535 (= res!682783 (and (or (not (is-Cons!21530 l!1114)) (bvsle (_1!7647 (h!22737 l!1114)) (h!22738 keys!40))) (is-Cons!21530 l!1114) (bvslt (_1!7647 (h!22737 l!1114)) (h!22738 keys!40))))))

(declare-fun b!1018536 () Bool)

(assert (=> b!1018536 (= e!573143 (containsKey!503 (t!30527 l!1114) (h!22738 keys!40)))))

(assert (= (and d!121987 (not res!682782)) b!1018535))

(assert (= (and b!1018535 res!682783) b!1018536))

(declare-fun m!940323 () Bool)

(assert (=> b!1018536 m!940323))

(assert (=> b!1018423 d!121987))

(declare-fun d!121995 () Bool)

(declare-fun res!682784 () Bool)

(declare-fun e!573144 () Bool)

(assert (=> d!121995 (=> res!682784 e!573144)))

(assert (=> d!121995 (= res!682784 (is-Nil!21532 (t!30528 keys!40)))))

(assert (=> d!121995 (= (forall!293 (t!30528 keys!40) lambda!1084) e!573144)))

(declare-fun b!1018537 () Bool)

(declare-fun e!573145 () Bool)

(assert (=> b!1018537 (= e!573144 e!573145)))

(declare-fun res!682785 () Bool)

(assert (=> b!1018537 (=> (not res!682785) (not e!573145))))

(assert (=> b!1018537 (= res!682785 (dynLambda!1947 lambda!1084 (h!22738 (t!30528 keys!40))))))

(declare-fun b!1018538 () Bool)

(assert (=> b!1018538 (= e!573145 (forall!293 (t!30528 (t!30528 keys!40)) lambda!1084))))

(assert (= (and d!121995 (not res!682784)) b!1018537))

(assert (= (and b!1018537 res!682785) b!1018538))

(declare-fun b_lambda!15605 () Bool)

(assert (=> (not b_lambda!15605) (not b!1018537)))

(declare-fun m!940325 () Bool)

(assert (=> b!1018537 m!940325))

(declare-fun m!940327 () Bool)

(assert (=> b!1018538 m!940327))

(assert (=> b!1018423 d!121995))

(declare-fun b!1018552 () Bool)

(declare-fun e!573154 () Option!610)

(declare-fun e!573155 () Option!610)

(assert (=> b!1018552 (= e!573154 e!573155)))

(declare-fun c!103421 () Bool)

(assert (=> b!1018552 (= c!103421 (and (is-Cons!21530 lt!449936) (not (= (_1!7647 (h!22737 lt!449936)) (h!22738 keys!40)))))))

(declare-fun b!1018554 () Bool)

(assert (=> b!1018554 (= e!573155 None!608)))

(declare-fun b!1018551 () Bool)

(assert (=> b!1018551 (= e!573154 (Some!609 (_2!7647 (h!22737 lt!449936))))))

(declare-fun b!1018553 () Bool)

(assert (=> b!1018553 (= e!573155 (getValueByKey!559 (t!30527 lt!449936) (h!22738 keys!40)))))

(declare-fun d!121997 () Bool)

(declare-fun c!103420 () Bool)

(assert (=> d!121997 (= c!103420 (and (is-Cons!21530 lt!449936) (= (_1!7647 (h!22737 lt!449936)) (h!22738 keys!40))))))

(assert (=> d!121997 (= (getValueByKey!559 lt!449936 (h!22738 keys!40)) e!573154)))

(assert (= (and d!121997 c!103420) b!1018551))

(assert (= (and d!121997 (not c!103420)) b!1018552))

(assert (= (and b!1018552 c!103421) b!1018553))

(assert (= (and b!1018552 (not c!103421)) b!1018554))

(declare-fun m!940329 () Bool)

(assert (=> b!1018553 m!940329))

(assert (=> b!1018423 d!121997))

(declare-fun d!121999 () Bool)

(declare-fun isEmpty!906 (Option!610) Bool)

(assert (=> d!121999 (= (isDefined!411 (getValueByKey!559 lt!449936 (h!22738 keys!40))) (not (isEmpty!906 (getValueByKey!559 lt!449936 (h!22738 keys!40)))))))

(declare-fun bs!29580 () Bool)

(assert (= bs!29580 d!121999))

(assert (=> bs!29580 m!940247))

(declare-fun m!940337 () Bool)

(assert (=> bs!29580 m!940337))

(assert (=> b!1018423 d!121999))

(declare-fun d!122003 () Bool)

(assert (=> d!122003 (containsKey!503 l!1114 (h!22738 keys!40))))

(declare-fun lt!449959 () Unit!33268)

(declare-fun choose!1671 (List!21534 (_ BitVec 64)) Unit!33268)

(assert (=> d!122003 (= lt!449959 (choose!1671 l!1114 (h!22738 keys!40)))))

(declare-fun e!573161 () Bool)

(assert (=> d!122003 e!573161))

(declare-fun res!682799 () Bool)

(assert (=> d!122003 (=> (not res!682799) (not e!573161))))

(assert (=> d!122003 (= res!682799 (isStrictlySorted!617 l!1114))))

(assert (=> d!122003 (= (lemmaGetValueByKeyIsDefinedImpliesContainsKey!21 l!1114 (h!22738 keys!40)) lt!449959)))

(declare-fun b!1018564 () Bool)

(assert (=> b!1018564 (= e!573161 (isDefined!411 (getValueByKey!559 l!1114 (h!22738 keys!40))))))

(assert (= (and d!122003 res!682799) b!1018564))

(assert (=> d!122003 m!940243))

(declare-fun m!940345 () Bool)

(assert (=> d!122003 m!940345))

(assert (=> d!122003 m!940241))

(declare-fun m!940347 () Bool)

(assert (=> b!1018564 m!940347))

(assert (=> b!1018564 m!940347))

(declare-fun m!940349 () Bool)

(assert (=> b!1018564 m!940349))

(assert (=> b!1018423 d!122003))

(declare-fun b!1018569 () Bool)

(declare-fun e!573164 () Bool)

(declare-fun tp!70838 () Bool)

(assert (=> b!1018569 (= e!573164 (and tp_is_empty!23621 tp!70838))))

(assert (=> b!1018425 (= tp!70835 e!573164)))

(assert (= (and b!1018425 (is-Cons!21530 (t!30527 l!1114))) b!1018569))

(declare-fun b_lambda!15609 () Bool)

(assert (= b_lambda!15591 (or b!1018426 b_lambda!15609)))

(declare-fun bs!29582 () Bool)

(declare-fun d!122009 () Bool)

(assert (= bs!29582 (and d!122009 b!1018426)))

(assert (=> bs!29582 (= (dynLambda!1947 lambda!1085 (h!22738 keys!40)) (= (getValueByKey!559 lt!449936 (h!22738 keys!40)) (Some!609 value!178)))))

(assert (=> bs!29582 m!940247))

(assert (=> b!1018456 d!122009))

(declare-fun b_lambda!15611 () Bool)

(assert (= b_lambda!15597 (or b!1018427 b_lambda!15611)))

(declare-fun bs!29583 () Bool)

(declare-fun d!122011 () Bool)

(assert (= bs!29583 (and d!122011 b!1018427)))

(assert (=> bs!29583 (= (dynLambda!1947 lambda!1084 (h!22738 keys!40)) (= (getValueByKey!559 l!1114 (h!22738 keys!40)) (Some!609 value!178)))))

(assert (=> bs!29583 m!940347))

(assert (=> b!1018509 d!122011))

(declare-fun b_lambda!15613 () Bool)

(assert (= b_lambda!15593 (or b!1018426 b_lambda!15613)))

(declare-fun bs!29584 () Bool)

(declare-fun d!122013 () Bool)

(assert (= bs!29584 (and d!122013 b!1018426)))

(assert (=> bs!29584 (= (dynLambda!1947 lambda!1085 (h!22738 (t!30528 keys!40))) (= (getValueByKey!559 lt!449936 (h!22738 (t!30528 keys!40))) (Some!609 value!178)))))

(declare-fun m!940351 () Bool)

(assert (=> bs!29584 m!940351))

(assert (=> b!1018459 d!122013))

(declare-fun b_lambda!15615 () Bool)

(assert (= b_lambda!15605 (or b!1018427 b_lambda!15615)))

(declare-fun bs!29585 () Bool)

(declare-fun d!122015 () Bool)

(assert (= bs!29585 (and d!122015 b!1018427)))

(assert (=> bs!29585 (= (dynLambda!1947 lambda!1084 (h!22738 (t!30528 keys!40))) (= (getValueByKey!559 l!1114 (h!22738 (t!30528 keys!40))) (Some!609 value!178)))))

(declare-fun m!940353 () Bool)

(assert (=> bs!29585 m!940353))

(assert (=> b!1018537 d!122015))

(push 1)

(assert (not b_lambda!15611))

(assert (not b_lambda!15613))

(assert (not b!1018484))

(assert (not d!121957))

(assert (not d!121977))

(assert tp_is_empty!23621)

(assert (not b!1018457))

(assert (not bs!29585))

(assert (not b!1018553))

(assert (not bs!29584))

(assert (not bs!29583))

(assert (not b!1018460))

(assert (not b!1018569))

(assert (not d!122003))

(assert (not b!1018510))

(assert (not d!121999))

(assert (not b!1018536))

(assert (not b!1018486))

(assert (not bs!29582))

(assert (not b_lambda!15615))

(assert (not b_lambda!15609))

(assert (not b!1018523))

(assert (not b!1018485))

(assert (not b!1018449))

(assert (not b!1018564))

(assert (not b!1018538))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

