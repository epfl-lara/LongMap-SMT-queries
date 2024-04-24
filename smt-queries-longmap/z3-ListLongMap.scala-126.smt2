; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2190 () Bool)

(assert start!2190)

(declare-fun b!14714 () Bool)

(assert (=> b!14714 true))

(declare-fun res!11316 () Bool)

(declare-fun e!8835 () Bool)

(assert (=> start!2190 (=> (not res!11316) (not e!8835))))

(declare-datatypes ((B!554 0))(
  ( (B!555 (val!375 Int)) )
))
(declare-datatypes ((tuple2!546 0))(
  ( (tuple2!547 (_1!273 (_ BitVec 64)) (_2!273 B!554)) )
))
(declare-datatypes ((List!426 0))(
  ( (Nil!423) (Cons!422 (h!988 tuple2!546) (t!2828 List!426)) )
))
(declare-fun l!522 () List!426)

(declare-fun isStrictlySorted!111 (List!426) Bool)

(assert (=> start!2190 (= res!11316 (isStrictlySorted!111 l!522))))

(assert (=> start!2190 e!8835))

(declare-fun e!8839 () Bool)

(assert (=> start!2190 e!8839))

(declare-fun tp_is_empty!733 () Bool)

(assert (=> start!2190 tp_is_empty!733))

(declare-fun b!14713 () Bool)

(declare-fun e!8838 () Bool)

(declare-fun head!792 (List!426) tuple2!546)

(assert (=> b!14713 (= e!8838 (bvslt (_1!273 (head!792 Nil!423)) (_1!273 (head!792 l!522))))))

(declare-fun res!11315 () Bool)

(declare-fun e!8837 () Bool)

(assert (=> b!14714 (=> res!11315 e!8837)))

(declare-fun lambda!176 () Int)

(declare-fun forall!98 (List!426 Int) Bool)

(assert (=> b!14714 (= res!11315 (not (forall!98 Nil!423 lambda!176)))))

(declare-fun b!14715 () Bool)

(declare-fun e!8836 () Bool)

(assert (=> b!14715 (= e!8836 false)))

(declare-fun b!14716 () Bool)

(assert (=> b!14716 (= e!8836 e!8838)))

(declare-fun res!11314 () Bool)

(assert (=> b!14716 (= res!11314 false)))

(assert (=> b!14716 (=> (not res!11314) (not e!8838))))

(declare-fun b!14717 () Bool)

(declare-fun tp!2363 () Bool)

(assert (=> b!14717 (= e!8839 (and tp_is_empty!733 tp!2363))))

(declare-fun b!14718 () Bool)

(assert (=> b!14718 (= e!8835 e!8837)))

(declare-fun res!11317 () Bool)

(assert (=> b!14718 (=> res!11317 e!8837)))

(assert (=> b!14718 (= res!11317 false)))

(declare-fun b!14719 () Bool)

(assert (=> b!14719 (= e!8837 e!8836)))

(declare-fun c!1392 () Bool)

(declare-fun isEmpty!105 (List!426) Bool)

(assert (=> b!14719 (= c!1392 (isEmpty!105 l!522))))

(declare-fun b!14720 () Bool)

(declare-fun res!11318 () Bool)

(assert (=> b!14720 (=> (not res!11318) (not e!8835))))

(declare-fun value!159 () B!554)

(get-info :version)

(assert (=> b!14720 (= res!11318 (and (or (not ((_ is Cons!422) l!522)) (not (= (_2!273 (h!988 l!522)) value!159))) (or (not ((_ is Cons!422) l!522)) (= (_2!273 (h!988 l!522)) value!159)) ((_ is Nil!423) l!522)))))

(assert (= (and start!2190 res!11316) b!14720))

(assert (= (and b!14720 res!11318) b!14718))

(assert (= (and b!14718 (not res!11317)) b!14714))

(assert (= (and b!14714 (not res!11315)) b!14719))

(assert (= (and b!14719 c!1392) b!14715))

(assert (= (and b!14719 (not c!1392)) b!14716))

(assert (= (and b!14716 res!11314) b!14713))

(assert (= (and start!2190 ((_ is Cons!422) l!522)) b!14717))

(declare-fun m!9843 () Bool)

(assert (=> start!2190 m!9843))

(declare-fun m!9845 () Bool)

(assert (=> b!14713 m!9845))

(declare-fun m!9847 () Bool)

(assert (=> b!14713 m!9847))

(declare-fun m!9849 () Bool)

(assert (=> b!14714 m!9849))

(declare-fun m!9851 () Bool)

(assert (=> b!14719 m!9851))

(check-sat (not b!14713) (not b!14719) (not start!2190) (not b!14714) tp_is_empty!733 (not b!14717))
(check-sat)
(get-model)

(declare-fun d!2401 () Bool)

(assert (=> d!2401 (= (isEmpty!105 l!522) ((_ is Nil!423) l!522))))

(assert (=> b!14719 d!2401))

(declare-fun d!2403 () Bool)

(declare-fun res!11365 () Bool)

(declare-fun e!8888 () Bool)

(assert (=> d!2403 (=> res!11365 e!8888)))

(assert (=> d!2403 (= res!11365 ((_ is Nil!423) Nil!423))))

(assert (=> d!2403 (= (forall!98 Nil!423 lambda!176) e!8888)))

(declare-fun b!14795 () Bool)

(declare-fun e!8889 () Bool)

(assert (=> b!14795 (= e!8888 e!8889)))

(declare-fun res!11366 () Bool)

(assert (=> b!14795 (=> (not res!11366) (not e!8889))))

(declare-fun dynLambda!94 (Int tuple2!546) Bool)

(assert (=> b!14795 (= res!11366 (dynLambda!94 lambda!176 (h!988 Nil!423)))))

(declare-fun b!14796 () Bool)

(assert (=> b!14796 (= e!8889 (forall!98 (t!2828 Nil!423) lambda!176))))

(assert (= (and d!2403 (not res!11365)) b!14795))

(assert (= (and b!14795 res!11366) b!14796))

(declare-fun b_lambda!963 () Bool)

(assert (=> (not b_lambda!963) (not b!14795)))

(declare-fun m!9879 () Bool)

(assert (=> b!14795 m!9879))

(declare-fun m!9881 () Bool)

(assert (=> b!14796 m!9881))

(assert (=> b!14714 d!2403))

(declare-fun d!2413 () Bool)

(assert (not d!2413))

(assert (=> b!14713 d!2413))

(declare-fun d!2415 () Bool)

(assert (=> d!2415 (= (head!792 l!522) (h!988 l!522))))

(assert (=> b!14713 d!2415))

(declare-fun d!2419 () Bool)

(declare-fun res!11375 () Bool)

(declare-fun e!8899 () Bool)

(assert (=> d!2419 (=> res!11375 e!8899)))

(assert (=> d!2419 (= res!11375 (or ((_ is Nil!423) l!522) ((_ is Nil!423) (t!2828 l!522))))))

(assert (=> d!2419 (= (isStrictlySorted!111 l!522) e!8899)))

(declare-fun b!14806 () Bool)

(declare-fun e!8900 () Bool)

(assert (=> b!14806 (= e!8899 e!8900)))

(declare-fun res!11376 () Bool)

(assert (=> b!14806 (=> (not res!11376) (not e!8900))))

(assert (=> b!14806 (= res!11376 (bvslt (_1!273 (h!988 l!522)) (_1!273 (h!988 (t!2828 l!522)))))))

(declare-fun b!14807 () Bool)

(assert (=> b!14807 (= e!8900 (isStrictlySorted!111 (t!2828 l!522)))))

(assert (= (and d!2419 (not res!11375)) b!14806))

(assert (= (and b!14806 res!11376) b!14807))

(declare-fun m!9883 () Bool)

(assert (=> b!14807 m!9883))

(assert (=> start!2190 d!2419))

(declare-fun b!14814 () Bool)

(declare-fun e!8905 () Bool)

(declare-fun tp!2375 () Bool)

(assert (=> b!14814 (= e!8905 (and tp_is_empty!733 tp!2375))))

(assert (=> b!14717 (= tp!2363 e!8905)))

(assert (= (and b!14717 ((_ is Cons!422) (t!2828 l!522))) b!14814))

(declare-fun b_lambda!965 () Bool)

(assert (= b_lambda!963 (or b!14714 b_lambda!965)))

(declare-fun bs!601 () Bool)

(declare-fun d!2421 () Bool)

(assert (= bs!601 (and d!2421 b!14714)))

(assert (=> bs!601 (= (dynLambda!94 lambda!176 (h!988 Nil!423)) (= (_2!273 (h!988 Nil!423)) value!159))))

(assert (=> b!14795 d!2421))

(check-sat (not b!14796) (not b_lambda!965) (not b!14807) tp_is_empty!733 (not b!14814))
(check-sat)
