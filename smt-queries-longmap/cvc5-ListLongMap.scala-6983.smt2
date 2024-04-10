; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!88504 () Bool)

(assert start!88504)

(declare-fun b!1017909 () Bool)

(declare-fun e!572693 () Bool)

(declare-datatypes ((B!1604 0))(
  ( (B!1605 (val!11886 Int)) )
))
(declare-datatypes ((tuple2!15318 0))(
  ( (tuple2!15319 (_1!7670 (_ BitVec 64)) (_2!7670 B!1604)) )
))
(declare-datatypes ((List!21574 0))(
  ( (Nil!21571) (Cons!21570 (h!22768 tuple2!15318) (t!30575 List!21574)) )
))
(declare-fun l!1036 () List!21574)

(declare-fun key!271 () (_ BitVec 64))

(declare-fun containsKey!505 (List!21574 (_ BitVec 64)) Bool)

(assert (=> b!1017909 (= e!572693 (not (containsKey!505 l!1036 key!271)))))

(assert (=> b!1017909 (containsKey!505 (t!30575 l!1036) key!271)))

(declare-datatypes ((Unit!33275 0))(
  ( (Unit!33276) )
))
(declare-fun lt!449481 () Unit!33275)

(declare-fun lemmaGetValueByKeyIsDefinedImpliesContainsKey!25 (List!21574 (_ BitVec 64)) Unit!33275)

(assert (=> b!1017909 (= lt!449481 (lemmaGetValueByKeyIsDefinedImpliesContainsKey!25 (t!30575 l!1036) key!271))))

(declare-fun b!1017910 () Bool)

(declare-fun e!572694 () Bool)

(declare-fun tp_is_empty!23671 () Bool)

(declare-fun tp!70954 () Bool)

(assert (=> b!1017910 (= e!572694 (and tp_is_empty!23671 tp!70954))))

(declare-fun b!1017911 () Bool)

(declare-fun res!682618 () Bool)

(assert (=> b!1017911 (=> (not res!682618) (not e!572693))))

(assert (=> b!1017911 (= res!682618 (and (is-Cons!21570 l!1036) (not (= (_1!7670 (h!22768 l!1036)) key!271))))))

(declare-fun res!682616 () Bool)

(assert (=> start!88504 (=> (not res!682616) (not e!572693))))

(declare-fun isStrictlySorted!645 (List!21574) Bool)

(assert (=> start!88504 (= res!682616 (isStrictlySorted!645 l!1036))))

(assert (=> start!88504 e!572693))

(assert (=> start!88504 e!572694))

(assert (=> start!88504 true))

(declare-fun b!1017912 () Bool)

(declare-fun res!682615 () Bool)

(assert (=> b!1017912 (=> (not res!682615) (not e!572693))))

(declare-datatypes ((Option!629 0))(
  ( (Some!628 (v!14479 B!1604)) (None!627) )
))
(declare-fun isDefined!425 (Option!629) Bool)

(declare-fun getValueByKey!578 (List!21574 (_ BitVec 64)) Option!629)

(assert (=> b!1017912 (= res!682615 (isDefined!425 (getValueByKey!578 (t!30575 l!1036) key!271)))))

(declare-fun b!1017913 () Bool)

(declare-fun res!682619 () Bool)

(assert (=> b!1017913 (=> (not res!682619) (not e!572693))))

(assert (=> b!1017913 (= res!682619 (isDefined!425 (getValueByKey!578 l!1036 key!271)))))

(declare-fun b!1017914 () Bool)

(declare-fun res!682617 () Bool)

(assert (=> b!1017914 (=> (not res!682617) (not e!572693))))

(assert (=> b!1017914 (= res!682617 (isStrictlySorted!645 (t!30575 l!1036)))))

(assert (= (and start!88504 res!682616) b!1017913))

(assert (= (and b!1017913 res!682619) b!1017911))

(assert (= (and b!1017911 res!682618) b!1017914))

(assert (= (and b!1017914 res!682617) b!1017912))

(assert (= (and b!1017912 res!682615) b!1017909))

(assert (= (and start!88504 (is-Cons!21570 l!1036)) b!1017910))

(declare-fun m!939019 () Bool)

(assert (=> b!1017913 m!939019))

(assert (=> b!1017913 m!939019))

(declare-fun m!939021 () Bool)

(assert (=> b!1017913 m!939021))

(declare-fun m!939023 () Bool)

(assert (=> b!1017914 m!939023))

(declare-fun m!939025 () Bool)

(assert (=> start!88504 m!939025))

(declare-fun m!939027 () Bool)

(assert (=> b!1017909 m!939027))

(declare-fun m!939029 () Bool)

(assert (=> b!1017909 m!939029))

(declare-fun m!939031 () Bool)

(assert (=> b!1017909 m!939031))

(declare-fun m!939033 () Bool)

(assert (=> b!1017912 m!939033))

(assert (=> b!1017912 m!939033))

(declare-fun m!939035 () Bool)

(assert (=> b!1017912 m!939035))

(push 1)

(assert (not b!1017909))

(assert (not b!1017912))

(assert (not b!1017913))

(assert tp_is_empty!23671)

(assert (not b!1017910))

(assert (not b!1017914))

(assert (not start!88504))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!121739 () Bool)

(declare-fun res!682658 () Bool)

(declare-fun e!572715 () Bool)

(assert (=> d!121739 (=> res!682658 e!572715)))

(assert (=> d!121739 (= res!682658 (or (is-Nil!21571 (t!30575 l!1036)) (is-Nil!21571 (t!30575 (t!30575 l!1036)))))))

(assert (=> d!121739 (= (isStrictlySorted!645 (t!30575 l!1036)) e!572715)))

(declare-fun b!1017959 () Bool)

(declare-fun e!572716 () Bool)

(assert (=> b!1017959 (= e!572715 e!572716)))

(declare-fun res!682659 () Bool)

(assert (=> b!1017959 (=> (not res!682659) (not e!572716))))

(assert (=> b!1017959 (= res!682659 (bvslt (_1!7670 (h!22768 (t!30575 l!1036))) (_1!7670 (h!22768 (t!30575 (t!30575 l!1036))))))))

(declare-fun b!1017960 () Bool)

(assert (=> b!1017960 (= e!572716 (isStrictlySorted!645 (t!30575 (t!30575 l!1036))))))

(assert (= (and d!121739 (not res!682658)) b!1017959))

(assert (= (and b!1017959 res!682659) b!1017960))

(declare-fun m!939073 () Bool)

(assert (=> b!1017960 m!939073))

(assert (=> b!1017914 d!121739))

(declare-fun d!121741 () Bool)

(declare-fun res!682672 () Bool)

(declare-fun e!572729 () Bool)

(assert (=> d!121741 (=> res!682672 e!572729)))

(assert (=> d!121741 (= res!682672 (and (is-Cons!21570 l!1036) (= (_1!7670 (h!22768 l!1036)) key!271)))))

(assert (=> d!121741 (= (containsKey!505 l!1036 key!271) e!572729)))

(declare-fun b!1017973 () Bool)

(declare-fun e!572730 () Bool)

(assert (=> b!1017973 (= e!572729 e!572730)))

(declare-fun res!682673 () Bool)

(assert (=> b!1017973 (=> (not res!682673) (not e!572730))))

(assert (=> b!1017973 (= res!682673 (and (or (not (is-Cons!21570 l!1036)) (bvsle (_1!7670 (h!22768 l!1036)) key!271)) (is-Cons!21570 l!1036) (bvslt (_1!7670 (h!22768 l!1036)) key!271)))))

(declare-fun b!1017974 () Bool)

(assert (=> b!1017974 (= e!572730 (containsKey!505 (t!30575 l!1036) key!271))))

(assert (= (and d!121741 (not res!682672)) b!1017973))

(assert (= (and b!1017973 res!682673) b!1017974))

(assert (=> b!1017974 m!939029))

(assert (=> b!1017909 d!121741))

(declare-fun d!121749 () Bool)

(declare-fun res!682674 () Bool)

(declare-fun e!572731 () Bool)

(assert (=> d!121749 (=> res!682674 e!572731)))

(assert (=> d!121749 (= res!682674 (and (is-Cons!21570 (t!30575 l!1036)) (= (_1!7670 (h!22768 (t!30575 l!1036))) key!271)))))

(assert (=> d!121749 (= (containsKey!505 (t!30575 l!1036) key!271) e!572731)))

(declare-fun b!1017975 () Bool)

(declare-fun e!572732 () Bool)

(assert (=> b!1017975 (= e!572731 e!572732)))

(declare-fun res!682675 () Bool)

(assert (=> b!1017975 (=> (not res!682675) (not e!572732))))

(assert (=> b!1017975 (= res!682675 (and (or (not (is-Cons!21570 (t!30575 l!1036))) (bvsle (_1!7670 (h!22768 (t!30575 l!1036))) key!271)) (is-Cons!21570 (t!30575 l!1036)) (bvslt (_1!7670 (h!22768 (t!30575 l!1036))) key!271)))))

(declare-fun b!1017976 () Bool)

(assert (=> b!1017976 (= e!572732 (containsKey!505 (t!30575 (t!30575 l!1036)) key!271))))

(assert (= (and d!121749 (not res!682674)) b!1017975))

(assert (= (and b!1017975 res!682675) b!1017976))

(declare-fun m!939077 () Bool)

(assert (=> b!1017976 m!939077))

(assert (=> b!1017909 d!121749))

(declare-fun d!121751 () Bool)

(assert (=> d!121751 (containsKey!505 (t!30575 l!1036) key!271)))

(declare-fun lt!449492 () Unit!33275)

(declare-fun choose!1672 (List!21574 (_ BitVec 64)) Unit!33275)

(assert (=> d!121751 (= lt!449492 (choose!1672 (t!30575 l!1036) key!271))))

(declare-fun e!572745 () Bool)

(assert (=> d!121751 e!572745))

(declare-fun res!682688 () Bool)

(assert (=> d!121751 (=> (not res!682688) (not e!572745))))

(assert (=> d!121751 (= res!682688 (isStrictlySorted!645 (t!30575 l!1036)))))

(assert (=> d!121751 (= (lemmaGetValueByKeyIsDefinedImpliesContainsKey!25 (t!30575 l!1036) key!271) lt!449492)))

(declare-fun b!1017989 () Bool)

(assert (=> b!1017989 (= e!572745 (isDefined!425 (getValueByKey!578 (t!30575 l!1036) key!271)))))

(assert (= (and d!121751 res!682688) b!1017989))

(assert (=> d!121751 m!939029))

(declare-fun m!939081 () Bool)

(assert (=> d!121751 m!939081))

(assert (=> d!121751 m!939023))

(assert (=> b!1017989 m!939033))

(assert (=> b!1017989 m!939033))

(assert (=> b!1017989 m!939035))

(assert (=> b!1017909 d!121751))

(declare-fun d!121757 () Bool)

(declare-fun res!682692 () Bool)

(declare-fun e!572749 () Bool)

(assert (=> d!121757 (=> res!682692 e!572749)))

(assert (=> d!121757 (= res!682692 (or (is-Nil!21571 l!1036) (is-Nil!21571 (t!30575 l!1036))))))

(assert (=> d!121757 (= (isStrictlySorted!645 l!1036) e!572749)))

(declare-fun b!1017993 () Bool)

(declare-fun e!572750 () Bool)

(assert (=> b!1017993 (= e!572749 e!572750)))

(declare-fun res!682693 () Bool)

(assert (=> b!1017993 (=> (not res!682693) (not e!572750))))

(assert (=> b!1017993 (= res!682693 (bvslt (_1!7670 (h!22768 l!1036)) (_1!7670 (h!22768 (t!30575 l!1036)))))))

(declare-fun b!1017994 () Bool)

(assert (=> b!1017994 (= e!572750 (isStrictlySorted!645 (t!30575 l!1036)))))

(assert (= (and d!121757 (not res!682692)) b!1017993))

(assert (= (and b!1017993 res!682693) b!1017994))

(assert (=> b!1017994 m!939023))

(assert (=> start!88504 d!121757))

(declare-fun d!121761 () Bool)

(declare-fun isEmpty!916 (Option!629) Bool)

(assert (=> d!121761 (= (isDefined!425 (getValueByKey!578 (t!30575 l!1036) key!271)) (not (isEmpty!916 (getValueByKey!578 (t!30575 l!1036) key!271))))))

(declare-fun bs!29635 () Bool)

(assert (= bs!29635 d!121761))

(assert (=> bs!29635 m!939033))

(declare-fun m!939087 () Bool)

(assert (=> bs!29635 m!939087))

(assert (=> b!1017912 d!121761))

(declare-fun b!1018017 () Bool)

(declare-fun e!572764 () Option!629)

(declare-fun e!572765 () Option!629)

(assert (=> b!1018017 (= e!572764 e!572765)))

(declare-fun c!103103 () Bool)

(assert (=> b!1018017 (= c!103103 (and (is-Cons!21570 (t!30575 l!1036)) (not (= (_1!7670 (h!22768 (t!30575 l!1036))) key!271))))))

(declare-fun b!1018018 () Bool)

(assert (=> b!1018018 (= e!572765 (getValueByKey!578 (t!30575 (t!30575 l!1036)) key!271))))

(declare-fun d!121767 () Bool)

(declare-fun c!103102 () Bool)

(assert (=> d!121767 (= c!103102 (and (is-Cons!21570 (t!30575 l!1036)) (= (_1!7670 (h!22768 (t!30575 l!1036))) key!271)))))

(assert (=> d!121767 (= (getValueByKey!578 (t!30575 l!1036) key!271) e!572764)))

(declare-fun b!1018019 () Bool)

(assert (=> b!1018019 (= e!572765 None!627)))

(declare-fun b!1018016 () Bool)

(assert (=> b!1018016 (= e!572764 (Some!628 (_2!7670 (h!22768 (t!30575 l!1036)))))))

(assert (= (and d!121767 c!103102) b!1018016))

(assert (= (and d!121767 (not c!103102)) b!1018017))

(assert (= (and b!1018017 c!103103) b!1018018))

(assert (= (and b!1018017 (not c!103103)) b!1018019))

(declare-fun m!939095 () Bool)

(assert (=> b!1018018 m!939095))

(assert (=> b!1017912 d!121767))

(declare-fun d!121773 () Bool)

(assert (=> d!121773 (= (isDefined!425 (getValueByKey!578 l!1036 key!271)) (not (isEmpty!916 (getValueByKey!578 l!1036 key!271))))))

(declare-fun bs!29637 () Bool)

(assert (= bs!29637 d!121773))

(assert (=> bs!29637 m!939019))

(declare-fun m!939097 () Bool)

(assert (=> bs!29637 m!939097))

(assert (=> b!1017913 d!121773))

(declare-fun b!1018025 () Bool)

(declare-fun e!572768 () Option!629)

(declare-fun e!572769 () Option!629)

(assert (=> b!1018025 (= e!572768 e!572769)))

(declare-fun c!103107 () Bool)

(assert (=> b!1018025 (= c!103107 (and (is-Cons!21570 l!1036) (not (= (_1!7670 (h!22768 l!1036)) key!271))))))

(declare-fun b!1018026 () Bool)

(assert (=> b!1018026 (= e!572769 (getValueByKey!578 (t!30575 l!1036) key!271))))

(declare-fun d!121777 () Bool)

(declare-fun c!103106 () Bool)

(assert (=> d!121777 (= c!103106 (and (is-Cons!21570 l!1036) (= (_1!7670 (h!22768 l!1036)) key!271)))))

(assert (=> d!121777 (= (getValueByKey!578 l!1036 key!271) e!572768)))

(declare-fun b!1018027 () Bool)

(assert (=> b!1018027 (= e!572769 None!627)))

(declare-fun b!1018024 () Bool)

(assert (=> b!1018024 (= e!572768 (Some!628 (_2!7670 (h!22768 l!1036))))))

(assert (= (and d!121777 c!103106) b!1018024))

(assert (= (and d!121777 (not c!103106)) b!1018025))

(assert (= (and b!1018025 c!103107) b!1018026))

(assert (= (and b!1018025 (not c!103107)) b!1018027))

(assert (=> b!1018026 m!939033))

(assert (=> b!1017913 d!121777))

(declare-fun b!1018040 () Bool)

(declare-fun e!572776 () Bool)

(declare-fun tp!70965 () Bool)

(assert (=> b!1018040 (= e!572776 (and tp_is_empty!23671 tp!70965))))

(assert (=> b!1017910 (= tp!70954 e!572776)))

(assert (= (and b!1017910 (is-Cons!21570 (t!30575 l!1036))) b!1018040))

(push 1)

(assert (not d!121751))

(assert (not b!1018018))

(assert (not d!121773))

(assert (not b!1017974))

(assert tp_is_empty!23671)

(assert (not b!1018040))

(assert (not d!121761))

(assert (not b!1017976))

(assert (not b!1017960))

(assert (not b!1017989))

(assert (not b!1018026))

(assert (not b!1017994))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

