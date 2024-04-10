; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!88506 () Bool)

(assert start!88506)

(declare-fun b!1017927 () Bool)

(declare-fun e!572699 () Bool)

(declare-datatypes ((B!1606 0))(
  ( (B!1607 (val!11887 Int)) )
))
(declare-datatypes ((tuple2!15320 0))(
  ( (tuple2!15321 (_1!7671 (_ BitVec 64)) (_2!7671 B!1606)) )
))
(declare-datatypes ((List!21575 0))(
  ( (Nil!21572) (Cons!21571 (h!22769 tuple2!15320) (t!30576 List!21575)) )
))
(declare-fun l!1036 () List!21575)

(declare-fun key!271 () (_ BitVec 64))

(declare-fun containsKey!506 (List!21575 (_ BitVec 64)) Bool)

(assert (=> b!1017927 (= e!572699 (not (containsKey!506 l!1036 key!271)))))

(assert (=> b!1017927 (containsKey!506 (t!30576 l!1036) key!271)))

(declare-datatypes ((Unit!33277 0))(
  ( (Unit!33278) )
))
(declare-fun lt!449484 () Unit!33277)

(declare-fun lemmaGetValueByKeyIsDefinedImpliesContainsKey!26 (List!21575 (_ BitVec 64)) Unit!33277)

(assert (=> b!1017927 (= lt!449484 (lemmaGetValueByKeyIsDefinedImpliesContainsKey!26 (t!30576 l!1036) key!271))))

(declare-fun b!1017928 () Bool)

(declare-fun res!682634 () Bool)

(assert (=> b!1017928 (=> (not res!682634) (not e!572699))))

(declare-fun isStrictlySorted!646 (List!21575) Bool)

(assert (=> b!1017928 (= res!682634 (isStrictlySorted!646 (t!30576 l!1036)))))

(declare-fun b!1017929 () Bool)

(declare-fun res!682630 () Bool)

(assert (=> b!1017929 (=> (not res!682630) (not e!572699))))

(declare-datatypes ((Option!630 0))(
  ( (Some!629 (v!14480 B!1606)) (None!628) )
))
(declare-fun isDefined!426 (Option!630) Bool)

(declare-fun getValueByKey!579 (List!21575 (_ BitVec 64)) Option!630)

(assert (=> b!1017929 (= res!682630 (isDefined!426 (getValueByKey!579 l!1036 key!271)))))

(declare-fun b!1017930 () Bool)

(declare-fun res!682633 () Bool)

(assert (=> b!1017930 (=> (not res!682633) (not e!572699))))

(get-info :version)

(assert (=> b!1017930 (= res!682633 (and ((_ is Cons!21571) l!1036) (not (= (_1!7671 (h!22769 l!1036)) key!271))))))

(declare-fun res!682631 () Bool)

(assert (=> start!88506 (=> (not res!682631) (not e!572699))))

(assert (=> start!88506 (= res!682631 (isStrictlySorted!646 l!1036))))

(assert (=> start!88506 e!572699))

(declare-fun e!572700 () Bool)

(assert (=> start!88506 e!572700))

(assert (=> start!88506 true))

(declare-fun b!1017931 () Bool)

(declare-fun tp_is_empty!23673 () Bool)

(declare-fun tp!70957 () Bool)

(assert (=> b!1017931 (= e!572700 (and tp_is_empty!23673 tp!70957))))

(declare-fun b!1017932 () Bool)

(declare-fun res!682632 () Bool)

(assert (=> b!1017932 (=> (not res!682632) (not e!572699))))

(assert (=> b!1017932 (= res!682632 (isDefined!426 (getValueByKey!579 (t!30576 l!1036) key!271)))))

(assert (= (and start!88506 res!682631) b!1017929))

(assert (= (and b!1017929 res!682630) b!1017930))

(assert (= (and b!1017930 res!682633) b!1017928))

(assert (= (and b!1017928 res!682634) b!1017932))

(assert (= (and b!1017932 res!682632) b!1017927))

(assert (= (and start!88506 ((_ is Cons!21571) l!1036)) b!1017931))

(declare-fun m!939037 () Bool)

(assert (=> b!1017929 m!939037))

(assert (=> b!1017929 m!939037))

(declare-fun m!939039 () Bool)

(assert (=> b!1017929 m!939039))

(declare-fun m!939041 () Bool)

(assert (=> b!1017927 m!939041))

(declare-fun m!939043 () Bool)

(assert (=> b!1017927 m!939043))

(declare-fun m!939045 () Bool)

(assert (=> b!1017927 m!939045))

(declare-fun m!939047 () Bool)

(assert (=> start!88506 m!939047))

(declare-fun m!939049 () Bool)

(assert (=> b!1017932 m!939049))

(assert (=> b!1017932 m!939049))

(declare-fun m!939051 () Bool)

(assert (=> b!1017932 m!939051))

(declare-fun m!939053 () Bool)

(assert (=> b!1017928 m!939053))

(check-sat (not b!1017929) (not b!1017931) (not b!1017932) (not start!88506) (not b!1017928) (not b!1017927) tp_is_empty!23673)
(check-sat)
(get-model)

(declare-fun d!121743 () Bool)

(declare-fun res!682689 () Bool)

(declare-fun e!572746 () Bool)

(assert (=> d!121743 (=> res!682689 e!572746)))

(assert (=> d!121743 (= res!682689 (and ((_ is Cons!21571) l!1036) (= (_1!7671 (h!22769 l!1036)) key!271)))))

(assert (=> d!121743 (= (containsKey!506 l!1036 key!271) e!572746)))

(declare-fun b!1017990 () Bool)

(declare-fun e!572747 () Bool)

(assert (=> b!1017990 (= e!572746 e!572747)))

(declare-fun res!682690 () Bool)

(assert (=> b!1017990 (=> (not res!682690) (not e!572747))))

(assert (=> b!1017990 (= res!682690 (and (or (not ((_ is Cons!21571) l!1036)) (bvsle (_1!7671 (h!22769 l!1036)) key!271)) ((_ is Cons!21571) l!1036) (bvslt (_1!7671 (h!22769 l!1036)) key!271)))))

(declare-fun b!1017991 () Bool)

(assert (=> b!1017991 (= e!572747 (containsKey!506 (t!30576 l!1036) key!271))))

(assert (= (and d!121743 (not res!682689)) b!1017990))

(assert (= (and b!1017990 res!682690) b!1017991))

(assert (=> b!1017991 m!939043))

(assert (=> b!1017927 d!121743))

(declare-fun d!121759 () Bool)

(declare-fun res!682694 () Bool)

(declare-fun e!572751 () Bool)

(assert (=> d!121759 (=> res!682694 e!572751)))

(assert (=> d!121759 (= res!682694 (and ((_ is Cons!21571) (t!30576 l!1036)) (= (_1!7671 (h!22769 (t!30576 l!1036))) key!271)))))

(assert (=> d!121759 (= (containsKey!506 (t!30576 l!1036) key!271) e!572751)))

(declare-fun b!1017995 () Bool)

(declare-fun e!572752 () Bool)

(assert (=> b!1017995 (= e!572751 e!572752)))

(declare-fun res!682695 () Bool)

(assert (=> b!1017995 (=> (not res!682695) (not e!572752))))

(assert (=> b!1017995 (= res!682695 (and (or (not ((_ is Cons!21571) (t!30576 l!1036))) (bvsle (_1!7671 (h!22769 (t!30576 l!1036))) key!271)) ((_ is Cons!21571) (t!30576 l!1036)) (bvslt (_1!7671 (h!22769 (t!30576 l!1036))) key!271)))))

(declare-fun b!1017996 () Bool)

(assert (=> b!1017996 (= e!572752 (containsKey!506 (t!30576 (t!30576 l!1036)) key!271))))

(assert (= (and d!121759 (not res!682694)) b!1017995))

(assert (= (and b!1017995 res!682695) b!1017996))

(declare-fun m!939085 () Bool)

(assert (=> b!1017996 m!939085))

(assert (=> b!1017927 d!121759))

(declare-fun d!121765 () Bool)

(assert (=> d!121765 (containsKey!506 (t!30576 l!1036) key!271)))

(declare-fun lt!449496 () Unit!33277)

(declare-fun choose!1673 (List!21575 (_ BitVec 64)) Unit!33277)

(assert (=> d!121765 (= lt!449496 (choose!1673 (t!30576 l!1036) key!271))))

(declare-fun e!572763 () Bool)

(assert (=> d!121765 e!572763))

(declare-fun res!682698 () Bool)

(assert (=> d!121765 (=> (not res!682698) (not e!572763))))

(assert (=> d!121765 (= res!682698 (isStrictlySorted!646 (t!30576 l!1036)))))

(assert (=> d!121765 (= (lemmaGetValueByKeyIsDefinedImpliesContainsKey!26 (t!30576 l!1036) key!271) lt!449496)))

(declare-fun b!1018015 () Bool)

(assert (=> b!1018015 (= e!572763 (isDefined!426 (getValueByKey!579 (t!30576 l!1036) key!271)))))

(assert (= (and d!121765 res!682698) b!1018015))

(assert (=> d!121765 m!939043))

(declare-fun m!939091 () Bool)

(assert (=> d!121765 m!939091))

(assert (=> d!121765 m!939053))

(assert (=> b!1018015 m!939049))

(assert (=> b!1018015 m!939049))

(assert (=> b!1018015 m!939051))

(assert (=> b!1017927 d!121765))

(declare-fun d!121771 () Bool)

(declare-fun res!682703 () Bool)

(declare-fun e!572782 () Bool)

(assert (=> d!121771 (=> res!682703 e!572782)))

(assert (=> d!121771 (= res!682703 (or ((_ is Nil!21572) (t!30576 l!1036)) ((_ is Nil!21572) (t!30576 (t!30576 l!1036)))))))

(assert (=> d!121771 (= (isStrictlySorted!646 (t!30576 l!1036)) e!572782)))

(declare-fun b!1018046 () Bool)

(declare-fun e!572783 () Bool)

(assert (=> b!1018046 (= e!572782 e!572783)))

(declare-fun res!682704 () Bool)

(assert (=> b!1018046 (=> (not res!682704) (not e!572783))))

(assert (=> b!1018046 (= res!682704 (bvslt (_1!7671 (h!22769 (t!30576 l!1036))) (_1!7671 (h!22769 (t!30576 (t!30576 l!1036))))))))

(declare-fun b!1018047 () Bool)

(assert (=> b!1018047 (= e!572783 (isStrictlySorted!646 (t!30576 (t!30576 l!1036))))))

(assert (= (and d!121771 (not res!682703)) b!1018046))

(assert (= (and b!1018046 res!682704) b!1018047))

(declare-fun m!939101 () Bool)

(assert (=> b!1018047 m!939101))

(assert (=> b!1017928 d!121771))

(declare-fun d!121781 () Bool)

(declare-fun res!682705 () Bool)

(declare-fun e!572784 () Bool)

(assert (=> d!121781 (=> res!682705 e!572784)))

(assert (=> d!121781 (= res!682705 (or ((_ is Nil!21572) l!1036) ((_ is Nil!21572) (t!30576 l!1036))))))

(assert (=> d!121781 (= (isStrictlySorted!646 l!1036) e!572784)))

(declare-fun b!1018048 () Bool)

(declare-fun e!572785 () Bool)

(assert (=> b!1018048 (= e!572784 e!572785)))

(declare-fun res!682706 () Bool)

(assert (=> b!1018048 (=> (not res!682706) (not e!572785))))

(assert (=> b!1018048 (= res!682706 (bvslt (_1!7671 (h!22769 l!1036)) (_1!7671 (h!22769 (t!30576 l!1036)))))))

(declare-fun b!1018049 () Bool)

(assert (=> b!1018049 (= e!572785 (isStrictlySorted!646 (t!30576 l!1036)))))

(assert (= (and d!121781 (not res!682705)) b!1018048))

(assert (= (and b!1018048 res!682706) b!1018049))

(assert (=> b!1018049 m!939053))

(assert (=> start!88506 d!121781))

(declare-fun d!121783 () Bool)

(declare-fun isEmpty!917 (Option!630) Bool)

(assert (=> d!121783 (= (isDefined!426 (getValueByKey!579 l!1036 key!271)) (not (isEmpty!917 (getValueByKey!579 l!1036 key!271))))))

(declare-fun bs!29639 () Bool)

(assert (= bs!29639 d!121783))

(assert (=> bs!29639 m!939037))

(declare-fun m!939103 () Bool)

(assert (=> bs!29639 m!939103))

(assert (=> b!1017929 d!121783))

(declare-fun b!1018058 () Bool)

(declare-fun e!572790 () Option!630)

(assert (=> b!1018058 (= e!572790 (Some!629 (_2!7671 (h!22769 l!1036))))))

(declare-fun d!121785 () Bool)

(declare-fun c!103114 () Bool)

(assert (=> d!121785 (= c!103114 (and ((_ is Cons!21571) l!1036) (= (_1!7671 (h!22769 l!1036)) key!271)))))

(assert (=> d!121785 (= (getValueByKey!579 l!1036 key!271) e!572790)))

(declare-fun b!1018060 () Bool)

(declare-fun e!572791 () Option!630)

(assert (=> b!1018060 (= e!572791 (getValueByKey!579 (t!30576 l!1036) key!271))))

(declare-fun b!1018059 () Bool)

(assert (=> b!1018059 (= e!572790 e!572791)))

(declare-fun c!103115 () Bool)

(assert (=> b!1018059 (= c!103115 (and ((_ is Cons!21571) l!1036) (not (= (_1!7671 (h!22769 l!1036)) key!271))))))

(declare-fun b!1018061 () Bool)

(assert (=> b!1018061 (= e!572791 None!628)))

(assert (= (and d!121785 c!103114) b!1018058))

(assert (= (and d!121785 (not c!103114)) b!1018059))

(assert (= (and b!1018059 c!103115) b!1018060))

(assert (= (and b!1018059 (not c!103115)) b!1018061))

(assert (=> b!1018060 m!939049))

(assert (=> b!1017929 d!121785))

(declare-fun d!121787 () Bool)

(assert (=> d!121787 (= (isDefined!426 (getValueByKey!579 (t!30576 l!1036) key!271)) (not (isEmpty!917 (getValueByKey!579 (t!30576 l!1036) key!271))))))

(declare-fun bs!29640 () Bool)

(assert (= bs!29640 d!121787))

(assert (=> bs!29640 m!939049))

(declare-fun m!939105 () Bool)

(assert (=> bs!29640 m!939105))

(assert (=> b!1017932 d!121787))

(declare-fun b!1018062 () Bool)

(declare-fun e!572792 () Option!630)

(assert (=> b!1018062 (= e!572792 (Some!629 (_2!7671 (h!22769 (t!30576 l!1036)))))))

(declare-fun d!121789 () Bool)

(declare-fun c!103116 () Bool)

(assert (=> d!121789 (= c!103116 (and ((_ is Cons!21571) (t!30576 l!1036)) (= (_1!7671 (h!22769 (t!30576 l!1036))) key!271)))))

(assert (=> d!121789 (= (getValueByKey!579 (t!30576 l!1036) key!271) e!572792)))

(declare-fun b!1018064 () Bool)

(declare-fun e!572793 () Option!630)

(assert (=> b!1018064 (= e!572793 (getValueByKey!579 (t!30576 (t!30576 l!1036)) key!271))))

(declare-fun b!1018063 () Bool)

(assert (=> b!1018063 (= e!572792 e!572793)))

(declare-fun c!103117 () Bool)

(assert (=> b!1018063 (= c!103117 (and ((_ is Cons!21571) (t!30576 l!1036)) (not (= (_1!7671 (h!22769 (t!30576 l!1036))) key!271))))))

(declare-fun b!1018065 () Bool)

(assert (=> b!1018065 (= e!572793 None!628)))

(assert (= (and d!121789 c!103116) b!1018062))

(assert (= (and d!121789 (not c!103116)) b!1018063))

(assert (= (and b!1018063 c!103117) b!1018064))

(assert (= (and b!1018063 (not c!103117)) b!1018065))

(declare-fun m!939107 () Bool)

(assert (=> b!1018064 m!939107))

(assert (=> b!1017932 d!121789))

(declare-fun b!1018070 () Bool)

(declare-fun e!572796 () Bool)

(declare-fun tp!70969 () Bool)

(assert (=> b!1018070 (= e!572796 (and tp_is_empty!23673 tp!70969))))

(assert (=> b!1017931 (= tp!70957 e!572796)))

(assert (= (and b!1017931 ((_ is Cons!21571) (t!30576 l!1036))) b!1018070))

(check-sat (not b!1018070) (not b!1018064) (not d!121783) tp_is_empty!23673 (not b!1018047) (not b!1018060) (not b!1017991) (not b!1018015) (not b!1018049) (not d!121787) (not b!1017996) (not d!121765))
(check-sat)
