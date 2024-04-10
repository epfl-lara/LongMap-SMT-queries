; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!88174 () Bool)

(assert start!88174)

(declare-fun b!1016620 () Bool)

(assert (=> b!1016620 true))

(assert (=> b!1016620 true))

(declare-fun b!1016616 () Bool)

(declare-fun e!571916 () Bool)

(declare-datatypes ((List!21529 0))(
  ( (Nil!21526) (Cons!21525 (h!22723 (_ BitVec 64)) (t!30530 List!21529)) )
))
(declare-fun keys!40 () List!21529)

(declare-fun lambda!1030 () Int)

(declare-fun forall!283 (List!21529 Int) Bool)

(assert (=> b!1016616 (= e!571916 (not (forall!283 (t!30530 keys!40) lambda!1030)))))

(declare-datatypes ((B!1538 0))(
  ( (B!1539 (val!11853 Int)) )
))
(declare-datatypes ((tuple2!15252 0))(
  ( (tuple2!15253 (_1!7637 (_ BitVec 64)) (_2!7637 B!1538)) )
))
(declare-datatypes ((List!21530 0))(
  ( (Nil!21527) (Cons!21526 (h!22724 tuple2!15252) (t!30531 List!21530)) )
))
(declare-fun lt!449290 () List!21530)

(declare-datatypes ((Option!606 0))(
  ( (Some!605 (v!14456 B!1538)) (None!604) )
))
(declare-fun isDefined!404 (Option!606) Bool)

(declare-fun getValueByKey!555 (List!21530 (_ BitVec 64)) Option!606)

(assert (=> b!1016616 (isDefined!404 (getValueByKey!555 lt!449290 (h!22723 keys!40)))))

(declare-datatypes ((Unit!33251 0))(
  ( (Unit!33252) )
))
(declare-fun lt!449292 () Unit!33251)

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!383 (List!21530 (_ BitVec 64)) Unit!33251)

(assert (=> b!1016616 (= lt!449292 (lemmaContainsKeyImpliesGetValueByKeyDefined!383 lt!449290 (h!22723 keys!40)))))

(declare-fun newHead!31 () tuple2!15252)

(declare-fun l!1114 () List!21530)

(assert (=> b!1016616 (= lt!449290 (Cons!21526 newHead!31 l!1114))))

(declare-fun containsKey!493 (List!21530 (_ BitVec 64)) Bool)

(assert (=> b!1016616 (containsKey!493 l!1114 (h!22723 keys!40))))

(declare-fun lt!449291 () Unit!33251)

(declare-fun lemmaGetValueByKeyIsDefinedImpliesContainsKey!13 (List!21530 (_ BitVec 64)) Unit!33251)

(assert (=> b!1016616 (= lt!449291 (lemmaGetValueByKeyIsDefinedImpliesContainsKey!13 l!1114 (h!22723 keys!40)))))

(declare-fun b!1016617 () Bool)

(declare-fun e!571917 () Bool)

(declare-fun tp_is_empty!23605 () Bool)

(declare-fun tp!70792 () Bool)

(assert (=> b!1016617 (= e!571917 (and tp_is_empty!23605 tp!70792))))

(declare-fun b!1016618 () Bool)

(declare-fun res!681894 () Bool)

(assert (=> b!1016618 (=> (not res!681894) (not e!571916))))

(assert (=> b!1016618 (= res!681894 (is-Cons!21525 keys!40))))

(declare-fun res!681892 () Bool)

(assert (=> start!88174 (=> (not res!681892) (not e!571916))))

(declare-fun isStrictlySorted!621 (List!21530) Bool)

(assert (=> start!88174 (= res!681892 (isStrictlySorted!621 l!1114))))

(assert (=> start!88174 e!571916))

(assert (=> start!88174 e!571917))

(assert (=> start!88174 true))

(assert (=> start!88174 tp_is_empty!23605))

(declare-fun b!1016619 () Bool)

(declare-fun res!681893 () Bool)

(assert (=> b!1016619 (=> (not res!681893) (not e!571916))))

(declare-fun isEmpty!886 (List!21530) Bool)

(assert (=> b!1016619 (= res!681893 (not (isEmpty!886 l!1114)))))

(declare-fun res!681895 () Bool)

(assert (=> b!1016620 (=> (not res!681895) (not e!571916))))

(assert (=> b!1016620 (= res!681895 (forall!283 keys!40 lambda!1030))))

(declare-fun b!1016621 () Bool)

(declare-fun res!681896 () Bool)

(assert (=> b!1016621 (=> (not res!681896) (not e!571916))))

(declare-fun head!970 (List!21530) tuple2!15252)

(assert (=> b!1016621 (= res!681896 (bvslt (_1!7637 newHead!31) (_1!7637 (head!970 l!1114))))))

(assert (= (and start!88174 res!681892) b!1016619))

(assert (= (and b!1016619 res!681893) b!1016620))

(assert (= (and b!1016620 res!681895) b!1016621))

(assert (= (and b!1016621 res!681896) b!1016618))

(assert (= (and b!1016618 res!681894) b!1016616))

(assert (= (and start!88174 (is-Cons!21526 l!1114)) b!1016617))

(declare-fun m!938203 () Bool)

(assert (=> b!1016619 m!938203))

(declare-fun m!938205 () Bool)

(assert (=> b!1016621 m!938205))

(declare-fun m!938207 () Bool)

(assert (=> b!1016616 m!938207))

(declare-fun m!938209 () Bool)

(assert (=> b!1016616 m!938209))

(declare-fun m!938211 () Bool)

(assert (=> b!1016616 m!938211))

(assert (=> b!1016616 m!938207))

(declare-fun m!938213 () Bool)

(assert (=> b!1016616 m!938213))

(declare-fun m!938215 () Bool)

(assert (=> b!1016616 m!938215))

(declare-fun m!938217 () Bool)

(assert (=> b!1016616 m!938217))

(declare-fun m!938219 () Bool)

(assert (=> b!1016620 m!938219))

(declare-fun m!938221 () Bool)

(assert (=> start!88174 m!938221))

(push 1)

(assert (not b!1016621))

(assert (not b!1016619))

(assert (not start!88174))

(assert tp_is_empty!23605)

(assert (not b!1016616))

(assert (not b!1016617))

(assert (not b!1016620))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!121315 () Bool)

(assert (=> d!121315 (= (head!970 l!1114) (h!22724 l!1114))))

(assert (=> b!1016621 d!121315))

(declare-fun d!121317 () Bool)

(declare-fun res!681943 () Bool)

(declare-fun e!571946 () Bool)

(assert (=> d!121317 (=> res!681943 e!571946)))

(assert (=> d!121317 (= res!681943 (and (is-Cons!21526 l!1114) (= (_1!7637 (h!22724 l!1114)) (h!22723 keys!40))))))

(assert (=> d!121317 (= (containsKey!493 l!1114 (h!22723 keys!40)) e!571946)))

(declare-fun b!1016686 () Bool)

(declare-fun e!571947 () Bool)

(assert (=> b!1016686 (= e!571946 e!571947)))

(declare-fun res!681944 () Bool)

(assert (=> b!1016686 (=> (not res!681944) (not e!571947))))

(assert (=> b!1016686 (= res!681944 (and (or (not (is-Cons!21526 l!1114)) (bvsle (_1!7637 (h!22724 l!1114)) (h!22723 keys!40))) (is-Cons!21526 l!1114) (bvslt (_1!7637 (h!22724 l!1114)) (h!22723 keys!40))))))

(declare-fun b!1016687 () Bool)

(assert (=> b!1016687 (= e!571947 (containsKey!493 (t!30531 l!1114) (h!22723 keys!40)))))

(assert (= (and d!121317 (not res!681943)) b!1016686))

(assert (= (and b!1016686 res!681944) b!1016687))

(declare-fun m!938267 () Bool)

(assert (=> b!1016687 m!938267))

(assert (=> b!1016616 d!121317))

(declare-fun b!1016713 () Bool)

(declare-fun e!571964 () Option!606)

(declare-fun e!571965 () Option!606)

(assert (=> b!1016713 (= e!571964 e!571965)))

(declare-fun c!102950 () Bool)

(assert (=> b!1016713 (= c!102950 (and (is-Cons!21526 lt!449290) (not (= (_1!7637 (h!22724 lt!449290)) (h!22723 keys!40)))))))

(declare-fun b!1016712 () Bool)

(assert (=> b!1016712 (= e!571964 (Some!605 (_2!7637 (h!22724 lt!449290))))))

(declare-fun d!121321 () Bool)

(declare-fun c!102949 () Bool)

(assert (=> d!121321 (= c!102949 (and (is-Cons!21526 lt!449290) (= (_1!7637 (h!22724 lt!449290)) (h!22723 keys!40))))))

(assert (=> d!121321 (= (getValueByKey!555 lt!449290 (h!22723 keys!40)) e!571964)))

(declare-fun b!1016714 () Bool)

(assert (=> b!1016714 (= e!571965 (getValueByKey!555 (t!30531 lt!449290) (h!22723 keys!40)))))

(declare-fun b!1016715 () Bool)

(assert (=> b!1016715 (= e!571965 None!604)))

(assert (= (and d!121321 c!102949) b!1016712))

(assert (= (and d!121321 (not c!102949)) b!1016713))

(assert (= (and b!1016713 c!102950) b!1016714))

(assert (= (and b!1016713 (not c!102950)) b!1016715))

(declare-fun m!938277 () Bool)

(assert (=> b!1016714 m!938277))

(assert (=> b!1016616 d!121321))

(declare-fun d!121331 () Bool)

(declare-fun isEmpty!890 (Option!606) Bool)

(assert (=> d!121331 (= (isDefined!404 (getValueByKey!555 lt!449290 (h!22723 keys!40))) (not (isEmpty!890 (getValueByKey!555 lt!449290 (h!22723 keys!40)))))))

(declare-fun bs!29528 () Bool)

(assert (= bs!29528 d!121331))

(assert (=> bs!29528 m!938207))

(declare-fun m!938279 () Bool)

(assert (=> bs!29528 m!938279))

(assert (=> b!1016616 d!121331))

(declare-fun d!121333 () Bool)

(assert (=> d!121333 (isDefined!404 (getValueByKey!555 lt!449290 (h!22723 keys!40)))))

(declare-fun lt!449316 () Unit!33251)

(declare-fun choose!1651 (List!21530 (_ BitVec 64)) Unit!33251)

(assert (=> d!121333 (= lt!449316 (choose!1651 lt!449290 (h!22723 keys!40)))))

(declare-fun e!571977 () Bool)

(assert (=> d!121333 e!571977))

(declare-fun res!681962 () Bool)

(assert (=> d!121333 (=> (not res!681962) (not e!571977))))

(assert (=> d!121333 (= res!681962 (isStrictlySorted!621 lt!449290))))

(assert (=> d!121333 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!383 lt!449290 (h!22723 keys!40)) lt!449316)))

(declare-fun b!1016729 () Bool)

(assert (=> b!1016729 (= e!571977 (containsKey!493 lt!449290 (h!22723 keys!40)))))

(assert (= (and d!121333 res!681962) b!1016729))

(assert (=> d!121333 m!938207))

(assert (=> d!121333 m!938207))

(assert (=> d!121333 m!938213))

(declare-fun m!938289 () Bool)

(assert (=> d!121333 m!938289))

(declare-fun m!938291 () Bool)

(assert (=> d!121333 m!938291))

(declare-fun m!938293 () Bool)

(assert (=> b!1016729 m!938293))

(assert (=> b!1016616 d!121333))

(declare-fun d!121339 () Bool)

(assert (=> d!121339 (containsKey!493 l!1114 (h!22723 keys!40))))

(declare-fun lt!449322 () Unit!33251)

(declare-fun choose!1653 (List!21530 (_ BitVec 64)) Unit!33251)

(assert (=> d!121339 (= lt!449322 (choose!1653 l!1114 (h!22723 keys!40)))))

(declare-fun e!571991 () Bool)

(assert (=> d!121339 e!571991))

(declare-fun res!681976 () Bool)

(assert (=> d!121339 (=> (not res!681976) (not e!571991))))

(assert (=> d!121339 (= res!681976 (isStrictlySorted!621 l!1114))))

(assert (=> d!121339 (= (lemmaGetValueByKeyIsDefinedImpliesContainsKey!13 l!1114 (h!22723 keys!40)) lt!449322)))

(declare-fun b!1016743 () Bool)

(assert (=> b!1016743 (= e!571991 (isDefined!404 (getValueByKey!555 l!1114 (h!22723 keys!40))))))

(assert (= (and d!121339 res!681976) b!1016743))

(assert (=> d!121339 m!938215))

(declare-fun m!938303 () Bool)

(assert (=> d!121339 m!938303))

(assert (=> d!121339 m!938221))

(declare-fun m!938305 () Bool)

(assert (=> b!1016743 m!938305))

(assert (=> b!1016743 m!938305))

(declare-fun m!938309 () Bool)

(assert (=> b!1016743 m!938309))

(assert (=> b!1016616 d!121339))

(declare-fun d!121345 () Bool)

(declare-fun res!681983 () Bool)

(declare-fun e!572004 () Bool)

(assert (=> d!121345 (=> res!681983 e!572004)))

(assert (=> d!121345 (= res!681983 (is-Nil!21526 (t!30530 keys!40)))))

(assert (=> d!121345 (= (forall!283 (t!30530 keys!40) lambda!1030) e!572004)))

(declare-fun b!1016762 () Bool)

(declare-fun e!572005 () Bool)

(assert (=> b!1016762 (= e!572004 e!572005)))

(declare-fun res!681984 () Bool)

(assert (=> b!1016762 (=> (not res!681984) (not e!572005))))

(declare-fun dynLambda!1919 (Int (_ BitVec 64)) Bool)

(assert (=> b!1016762 (= res!681984 (dynLambda!1919 lambda!1030 (h!22723 (t!30530 keys!40))))))

(declare-fun b!1016763 () Bool)

(assert (=> b!1016763 (= e!572005 (forall!283 (t!30530 (t!30530 keys!40)) lambda!1030))))

(assert (= (and d!121345 (not res!681983)) b!1016762))

(assert (= (and b!1016762 res!681984) b!1016763))

(declare-fun b_lambda!15537 () Bool)

(assert (=> (not b_lambda!15537) (not b!1016762)))

(declare-fun m!938315 () Bool)

(assert (=> b!1016762 m!938315))

(declare-fun m!938317 () Bool)

(assert (=> b!1016763 m!938317))

(assert (=> b!1016616 d!121345))

(declare-fun d!121349 () Bool)

(declare-fun res!681990 () Bool)

(declare-fun e!572014 () Bool)

(assert (=> d!121349 (=> res!681990 e!572014)))

(assert (=> d!121349 (= res!681990 (or (is-Nil!21527 l!1114) (is-Nil!21527 (t!30531 l!1114))))))

(assert (=> d!121349 (= (isStrictlySorted!621 l!1114) e!572014)))

(declare-fun b!1016774 () Bool)

(declare-fun e!572015 () Bool)

(assert (=> b!1016774 (= e!572014 e!572015)))

(declare-fun res!681991 () Bool)

(assert (=> b!1016774 (=> (not res!681991) (not e!572015))))

(assert (=> b!1016774 (= res!681991 (bvslt (_1!7637 (h!22724 l!1114)) (_1!7637 (h!22724 (t!30531 l!1114)))))))

(declare-fun b!1016775 () Bool)

(assert (=> b!1016775 (= e!572015 (isStrictlySorted!621 (t!30531 l!1114)))))

(assert (= (and d!121349 (not res!681990)) b!1016774))

(assert (= (and b!1016774 res!681991) b!1016775))

(declare-fun m!938329 () Bool)

(assert (=> b!1016775 m!938329))

(assert (=> start!88174 d!121349))

(declare-fun d!121359 () Bool)

(assert (=> d!121359 (= (isEmpty!886 l!1114) (is-Nil!21527 l!1114))))

(assert (=> b!1016619 d!121359))

(declare-fun d!121361 () Bool)

(declare-fun res!681992 () Bool)

(declare-fun e!572016 () Bool)

(assert (=> d!121361 (=> res!681992 e!572016)))

(assert (=> d!121361 (= res!681992 (is-Nil!21526 keys!40))))

(assert (=> d!121361 (= (forall!283 keys!40 lambda!1030) e!572016)))

(declare-fun b!1016776 () Bool)

(declare-fun e!572017 () Bool)

(assert (=> b!1016776 (= e!572016 e!572017)))

(declare-fun res!681993 () Bool)

(assert (=> b!1016776 (=> (not res!681993) (not e!572017))))

(assert (=> b!1016776 (= res!681993 (dynLambda!1919 lambda!1030 (h!22723 keys!40)))))

(declare-fun b!1016777 () Bool)

(assert (=> b!1016777 (= e!572017 (forall!283 (t!30530 keys!40) lambda!1030))))

(assert (= (and d!121361 (not res!681992)) b!1016776))

(assert (= (and b!1016776 res!681993) b!1016777))

(declare-fun b_lambda!15543 () Bool)

(assert (=> (not b_lambda!15543) (not b!1016776)))

(declare-fun m!938331 () Bool)

(assert (=> b!1016776 m!938331))

(assert (=> b!1016777 m!938209))

(assert (=> b!1016620 d!121361))

(declare-fun b!1016784 () Bool)

(declare-fun e!572022 () Bool)

(declare-fun tp!70804 () Bool)

(assert (=> b!1016784 (= e!572022 (and tp_is_empty!23605 tp!70804))))

(assert (=> b!1016617 (= tp!70792 e!572022)))

(assert (= (and b!1016617 (is-Cons!21526 (t!30531 l!1114))) b!1016784))

(declare-fun b_lambda!15545 () Bool)

(assert (= b_lambda!15543 (or b!1016620 b_lambda!15545)))

(declare-fun bs!29532 () Bool)

(declare-fun d!121363 () Bool)

(assert (= bs!29532 (and d!121363 b!1016620)))

(declare-fun value!178 () B!1538)

(assert (=> bs!29532 (= (dynLambda!1919 lambda!1030 (h!22723 keys!40)) (= (getValueByKey!555 l!1114 (h!22723 keys!40)) (Some!605 value!178)))))

(assert (=> bs!29532 m!938305))

(assert (=> b!1016776 d!121363))

(declare-fun b_lambda!15547 () Bool)

(assert (= b_lambda!15537 (or b!1016620 b_lambda!15547)))

(declare-fun bs!29533 () Bool)

(declare-fun d!121365 () Bool)

(assert (= bs!29533 (and d!121365 b!1016620)))

(assert (=> bs!29533 (= (dynLambda!1919 lambda!1030 (h!22723 (t!30530 keys!40))) (= (getValueByKey!555 l!1114 (h!22723 (t!30530 keys!40))) (Some!605 value!178)))))

(declare-fun m!938333 () Bool)

(assert (=> bs!29533 m!938333))

(assert (=> b!1016762 d!121365))

(push 1)

