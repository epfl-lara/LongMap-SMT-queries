; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!88508 () Bool)

(assert start!88508)

(declare-fun b!1017809 () Bool)

(declare-fun res!682583 () Bool)

(declare-fun e!572625 () Bool)

(assert (=> b!1017809 (=> (not res!682583) (not e!572625))))

(declare-datatypes ((B!1608 0))(
  ( (B!1609 (val!11888 Int)) )
))
(declare-datatypes ((tuple2!15402 0))(
  ( (tuple2!15403 (_1!7712 (_ BitVec 64)) (_2!7712 B!1608)) )
))
(declare-datatypes ((List!21611 0))(
  ( (Nil!21608) (Cons!21607 (h!22805 tuple2!15402) (t!30603 List!21611)) )
))
(declare-fun l!1036 () List!21611)

(declare-fun key!271 () (_ BitVec 64))

(declare-datatypes ((Option!633 0))(
  ( (Some!632 (v!14480 B!1608)) (None!631) )
))
(declare-fun isDefined!430 (Option!633) Bool)

(declare-fun getValueByKey!582 (List!21611 (_ BitVec 64)) Option!633)

(assert (=> b!1017809 (= res!682583 (isDefined!430 (getValueByKey!582 l!1036 key!271)))))

(declare-fun b!1017810 () Bool)

(declare-fun res!682585 () Bool)

(assert (=> b!1017810 (=> (not res!682585) (not e!572625))))

(declare-fun isStrictlySorted!643 (List!21611) Bool)

(assert (=> b!1017810 (= res!682585 (isStrictlySorted!643 (t!30603 l!1036)))))

(declare-fun b!1017811 () Bool)

(declare-fun containsKey!507 (List!21611 (_ BitVec 64)) Bool)

(assert (=> b!1017811 (= e!572625 (not (containsKey!507 l!1036 key!271)))))

(assert (=> b!1017811 (containsKey!507 (t!30603 l!1036) key!271)))

(declare-datatypes ((Unit!33175 0))(
  ( (Unit!33176) )
))
(declare-fun lt!449287 () Unit!33175)

(declare-fun lemmaGetValueByKeyIsDefinedImpliesContainsKey!27 (List!21611 (_ BitVec 64)) Unit!33175)

(assert (=> b!1017811 (= lt!449287 (lemmaGetValueByKeyIsDefinedImpliesContainsKey!27 (t!30603 l!1036) key!271))))

(declare-fun res!682582 () Bool)

(assert (=> start!88508 (=> (not res!682582) (not e!572625))))

(assert (=> start!88508 (= res!682582 (isStrictlySorted!643 l!1036))))

(assert (=> start!88508 e!572625))

(declare-fun e!572624 () Bool)

(assert (=> start!88508 e!572624))

(assert (=> start!88508 true))

(declare-fun b!1017812 () Bool)

(declare-fun res!682586 () Bool)

(assert (=> b!1017812 (=> (not res!682586) (not e!572625))))

(assert (=> b!1017812 (= res!682586 (isDefined!430 (getValueByKey!582 (t!30603 l!1036) key!271)))))

(declare-fun b!1017813 () Bool)

(declare-fun res!682584 () Bool)

(assert (=> b!1017813 (=> (not res!682584) (not e!572625))))

(assert (=> b!1017813 (= res!682584 (and (is-Cons!21607 l!1036) (not (= (_1!7712 (h!22805 l!1036)) key!271))))))

(declare-fun b!1017814 () Bool)

(declare-fun tp_is_empty!23675 () Bool)

(declare-fun tp!70961 () Bool)

(assert (=> b!1017814 (= e!572624 (and tp_is_empty!23675 tp!70961))))

(assert (= (and start!88508 res!682582) b!1017809))

(assert (= (and b!1017809 res!682583) b!1017813))

(assert (= (and b!1017813 res!682584) b!1017810))

(assert (= (and b!1017810 res!682585) b!1017812))

(assert (= (and b!1017812 res!682586) b!1017811))

(assert (= (and start!88508 (is-Cons!21607 l!1036)) b!1017814))

(declare-fun m!938443 () Bool)

(assert (=> b!1017811 m!938443))

(declare-fun m!938445 () Bool)

(assert (=> b!1017811 m!938445))

(declare-fun m!938447 () Bool)

(assert (=> b!1017811 m!938447))

(declare-fun m!938449 () Bool)

(assert (=> start!88508 m!938449))

(declare-fun m!938451 () Bool)

(assert (=> b!1017812 m!938451))

(assert (=> b!1017812 m!938451))

(declare-fun m!938453 () Bool)

(assert (=> b!1017812 m!938453))

(declare-fun m!938455 () Bool)

(assert (=> b!1017809 m!938455))

(assert (=> b!1017809 m!938455))

(declare-fun m!938457 () Bool)

(assert (=> b!1017809 m!938457))

(declare-fun m!938459 () Bool)

(assert (=> b!1017810 m!938459))

(push 1)

(assert (not b!1017809))

(assert (not b!1017811))

(assert (not b!1017814))

(assert (not start!88508))

(assert tp_is_empty!23675)

(assert (not b!1017810))

(assert (not b!1017812))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!121603 () Bool)

(declare-fun res!682591 () Bool)

(declare-fun e!572638 () Bool)

(assert (=> d!121603 (=> res!682591 e!572638)))

(assert (=> d!121603 (= res!682591 (or (is-Nil!21608 l!1036) (is-Nil!21608 (t!30603 l!1036))))))

(assert (=> d!121603 (= (isStrictlySorted!643 l!1036) e!572638)))

(declare-fun b!1017835 () Bool)

(declare-fun e!572639 () Bool)

(assert (=> b!1017835 (= e!572638 e!572639)))

(declare-fun res!682592 () Bool)

(assert (=> b!1017835 (=> (not res!682592) (not e!572639))))

(assert (=> b!1017835 (= res!682592 (bvslt (_1!7712 (h!22805 l!1036)) (_1!7712 (h!22805 (t!30603 l!1036)))))))

(declare-fun b!1017836 () Bool)

(assert (=> b!1017836 (= e!572639 (isStrictlySorted!643 (t!30603 l!1036)))))

(assert (= (and d!121603 (not res!682591)) b!1017835))

(assert (= (and b!1017835 res!682592) b!1017836))

(assert (=> b!1017836 m!938459))

(assert (=> start!88508 d!121603))

(declare-fun d!121605 () Bool)

(declare-fun isEmpty!923 (Option!633) Bool)

(assert (=> d!121605 (= (isDefined!430 (getValueByKey!582 l!1036 key!271)) (not (isEmpty!923 (getValueByKey!582 l!1036 key!271))))))

(declare-fun bs!29608 () Bool)

(assert (= bs!29608 d!121605))

(assert (=> bs!29608 m!938455))

(declare-fun m!938467 () Bool)

(assert (=> bs!29608 m!938467))

(assert (=> b!1017809 d!121605))

(declare-fun b!1017877 () Bool)

(declare-fun e!572668 () Option!633)

(assert (=> b!1017877 (= e!572668 (Some!632 (_2!7712 (h!22805 l!1036))))))

(declare-fun b!1017879 () Bool)

(declare-fun e!572669 () Option!633)

(assert (=> b!1017879 (= e!572669 (getValueByKey!582 (t!30603 l!1036) key!271))))

(declare-fun b!1017878 () Bool)

(assert (=> b!1017878 (= e!572668 e!572669)))

(declare-fun c!103081 () Bool)

(assert (=> b!1017878 (= c!103081 (and (is-Cons!21607 l!1036) (not (= (_1!7712 (h!22805 l!1036)) key!271))))))

(declare-fun d!121611 () Bool)

(declare-fun c!103080 () Bool)

(assert (=> d!121611 (= c!103080 (and (is-Cons!21607 l!1036) (= (_1!7712 (h!22805 l!1036)) key!271)))))

(assert (=> d!121611 (= (getValueByKey!582 l!1036 key!271) e!572668)))

(declare-fun b!1017880 () Bool)

(assert (=> b!1017880 (= e!572669 None!631)))

(assert (= (and d!121611 c!103080) b!1017877))

(assert (= (and d!121611 (not c!103080)) b!1017878))

(assert (= (and b!1017878 c!103081) b!1017879))

(assert (= (and b!1017878 (not c!103081)) b!1017880))

(assert (=> b!1017879 m!938451))

(assert (=> b!1017809 d!121611))

(declare-fun d!121629 () Bool)

(declare-fun res!682625 () Bool)

(declare-fun e!572686 () Bool)

(assert (=> d!121629 (=> res!682625 e!572686)))

(assert (=> d!121629 (= res!682625 (and (is-Cons!21607 l!1036) (= (_1!7712 (h!22805 l!1036)) key!271)))))

(assert (=> d!121629 (= (containsKey!507 l!1036 key!271) e!572686)))

(declare-fun b!1017897 () Bool)

(declare-fun e!572687 () Bool)

(assert (=> b!1017897 (= e!572686 e!572687)))

(declare-fun res!682626 () Bool)

(assert (=> b!1017897 (=> (not res!682626) (not e!572687))))

(assert (=> b!1017897 (= res!682626 (and (or (not (is-Cons!21607 l!1036)) (bvsle (_1!7712 (h!22805 l!1036)) key!271)) (is-Cons!21607 l!1036) (bvslt (_1!7712 (h!22805 l!1036)) key!271)))))

(declare-fun b!1017898 () Bool)

(assert (=> b!1017898 (= e!572687 (containsKey!507 (t!30603 l!1036) key!271))))

(assert (= (and d!121629 (not res!682625)) b!1017897))

(assert (= (and b!1017897 res!682626) b!1017898))

(assert (=> b!1017898 m!938445))

(assert (=> b!1017811 d!121629))

(declare-fun d!121635 () Bool)

(declare-fun res!682631 () Bool)

(declare-fun e!572692 () Bool)

(assert (=> d!121635 (=> res!682631 e!572692)))

(assert (=> d!121635 (= res!682631 (and (is-Cons!21607 (t!30603 l!1036)) (= (_1!7712 (h!22805 (t!30603 l!1036))) key!271)))))

(assert (=> d!121635 (= (containsKey!507 (t!30603 l!1036) key!271) e!572692)))

(declare-fun b!1017903 () Bool)

(declare-fun e!572693 () Bool)

(assert (=> b!1017903 (= e!572692 e!572693)))

(declare-fun res!682632 () Bool)

(assert (=> b!1017903 (=> (not res!682632) (not e!572693))))

(assert (=> b!1017903 (= res!682632 (and (or (not (is-Cons!21607 (t!30603 l!1036))) (bvsle (_1!7712 (h!22805 (t!30603 l!1036))) key!271)) (is-Cons!21607 (t!30603 l!1036)) (bvslt (_1!7712 (h!22805 (t!30603 l!1036))) key!271)))))

(declare-fun b!1017904 () Bool)

(assert (=> b!1017904 (= e!572693 (containsKey!507 (t!30603 (t!30603 l!1036)) key!271))))

(assert (= (and d!121635 (not res!682631)) b!1017903))

(assert (= (and b!1017903 res!682632) b!1017904))

(declare-fun m!938483 () Bool)

(assert (=> b!1017904 m!938483))

(assert (=> b!1017811 d!121635))

(declare-fun d!121641 () Bool)

(assert (=> d!121641 (containsKey!507 (t!30603 l!1036) key!271)))

(declare-fun lt!449296 () Unit!33175)

(declare-fun choose!1679 (List!21611 (_ BitVec 64)) Unit!33175)

(assert (=> d!121641 (= lt!449296 (choose!1679 (t!30603 l!1036) key!271))))

(declare-fun e!572702 () Bool)

(assert (=> d!121641 e!572702))

(declare-fun res!682641 () Bool)

(assert (=> d!121641 (=> (not res!682641) (not e!572702))))

(assert (=> d!121641 (= res!682641 (isStrictlySorted!643 (t!30603 l!1036)))))

(assert (=> d!121641 (= (lemmaGetValueByKeyIsDefinedImpliesContainsKey!27 (t!30603 l!1036) key!271) lt!449296)))

(declare-fun b!1017913 () Bool)

(assert (=> b!1017913 (= e!572702 (isDefined!430 (getValueByKey!582 (t!30603 l!1036) key!271)))))

(assert (= (and d!121641 res!682641) b!1017913))

(assert (=> d!121641 m!938445))

(declare-fun m!938489 () Bool)

(assert (=> d!121641 m!938489))

(assert (=> d!121641 m!938459))

(assert (=> b!1017913 m!938451))

(assert (=> b!1017913 m!938451))

(assert (=> b!1017913 m!938453))

(assert (=> b!1017811 d!121641))

(declare-fun d!121643 () Bool)

(declare-fun res!682642 () Bool)

(declare-fun e!572707 () Bool)

(assert (=> d!121643 (=> res!682642 e!572707)))

(assert (=> d!121643 (= res!682642 (or (is-Nil!21608 (t!30603 l!1036)) (is-Nil!21608 (t!30603 (t!30603 l!1036)))))))

(assert (=> d!121643 (= (isStrictlySorted!643 (t!30603 l!1036)) e!572707)))

(declare-fun b!1017922 () Bool)

(declare-fun e!572708 () Bool)

(assert (=> b!1017922 (= e!572707 e!572708)))

(declare-fun res!682643 () Bool)

(assert (=> b!1017922 (=> (not res!682643) (not e!572708))))

(assert (=> b!1017922 (= res!682643 (bvslt (_1!7712 (h!22805 (t!30603 l!1036))) (_1!7712 (h!22805 (t!30603 (t!30603 l!1036))))))))

(declare-fun b!1017923 () Bool)

(assert (=> b!1017923 (= e!572708 (isStrictlySorted!643 (t!30603 (t!30603 l!1036))))))

(assert (= (and d!121643 (not res!682642)) b!1017922))

(assert (= (and b!1017922 res!682643) b!1017923))

(declare-fun m!938491 () Bool)

(assert (=> b!1017923 m!938491))

(assert (=> b!1017810 d!121643))

(declare-fun d!121645 () Bool)

(assert (=> d!121645 (= (isDefined!430 (getValueByKey!582 (t!30603 l!1036) key!271)) (not (isEmpty!923 (getValueByKey!582 (t!30603 l!1036) key!271))))))

(declare-fun bs!29611 () Bool)

(assert (= bs!29611 d!121645))

(assert (=> bs!29611 m!938451))

(declare-fun m!938493 () Bool)

(assert (=> bs!29611 m!938493))

(assert (=> b!1017812 d!121645))

(declare-fun b!1017926 () Bool)

(declare-fun e!572711 () Option!633)

(assert (=> b!1017926 (= e!572711 (Some!632 (_2!7712 (h!22805 (t!30603 l!1036)))))))

(declare-fun b!1017928 () Bool)

(declare-fun e!572712 () Option!633)

(assert (=> b!1017928 (= e!572712 (getValueByKey!582 (t!30603 (t!30603 l!1036)) key!271))))

(declare-fun b!1017927 () Bool)

(assert (=> b!1017927 (= e!572711 e!572712)))

(declare-fun c!103083 () Bool)

(assert (=> b!1017927 (= c!103083 (and (is-Cons!21607 (t!30603 l!1036)) (not (= (_1!7712 (h!22805 (t!30603 l!1036))) key!271))))))

(declare-fun d!121647 () Bool)

(declare-fun c!103082 () Bool)

(assert (=> d!121647 (= c!103082 (and (is-Cons!21607 (t!30603 l!1036)) (= (_1!7712 (h!22805 (t!30603 l!1036))) key!271)))))

(assert (=> d!121647 (= (getValueByKey!582 (t!30603 l!1036) key!271) e!572711)))

(declare-fun b!1017929 () Bool)

(assert (=> b!1017929 (= e!572712 None!631)))

(assert (= (and d!121647 c!103082) b!1017926))

(assert (= (and d!121647 (not c!103082)) b!1017927))

(assert (= (and b!1017927 c!103083) b!1017928))

(assert (= (and b!1017927 (not c!103083)) b!1017929))

(declare-fun m!938495 () Bool)

(assert (=> b!1017928 m!938495))

(assert (=> b!1017812 d!121647))

(declare-fun b!1017934 () Bool)

(declare-fun e!572715 () Bool)

(declare-fun tp!70970 () Bool)

(assert (=> b!1017934 (= e!572715 (and tp_is_empty!23675 tp!70970))))

(assert (=> b!1017814 (= tp!70961 e!572715)))

(assert (= (and b!1017814 (is-Cons!21607 (t!30603 l!1036))) b!1017934))

(push 1)

(assert (not b!1017934))

(assert (not d!121641))

(assert (not b!1017913))

(assert (not b!1017923))

(assert (not b!1017879))

(assert (not b!1017904))

(assert (not b!1017836))

(assert (not b!1017928))

(assert (not d!121605))

(assert tp_is_empty!23675)

(assert (not d!121645))

(assert (not b!1017898))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

