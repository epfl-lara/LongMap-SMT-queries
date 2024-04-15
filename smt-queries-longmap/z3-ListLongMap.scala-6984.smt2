; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!88540 () Bool)

(assert start!88540)

(declare-fun b!1017945 () Bool)

(declare-fun e!572720 () Bool)

(declare-datatypes ((B!1610 0))(
  ( (B!1611 (val!11889 Int)) )
))
(declare-datatypes ((tuple2!15404 0))(
  ( (tuple2!15405 (_1!7713 (_ BitVec 64)) (_2!7713 B!1610)) )
))
(declare-datatypes ((List!21612 0))(
  ( (Nil!21609) (Cons!21608 (h!22806 tuple2!15404) (t!30604 List!21612)) )
))
(declare-fun l!1036 () List!21612)

(declare-fun key!271 () (_ BitVec 64))

(declare-fun containsKey!508 (List!21612 (_ BitVec 64)) Bool)

(assert (=> b!1017945 (= e!572720 (not (containsKey!508 l!1036 key!271)))))

(declare-fun b!1017946 () Bool)

(declare-fun e!572721 () Bool)

(declare-fun tp_is_empty!23677 () Bool)

(declare-fun tp!70973 () Bool)

(assert (=> b!1017946 (= e!572721 (and tp_is_empty!23677 tp!70973))))

(declare-fun b!1017943 () Bool)

(declare-fun res!682651 () Bool)

(assert (=> b!1017943 (=> (not res!682651) (not e!572720))))

(declare-datatypes ((Option!634 0))(
  ( (Some!633 (v!14481 B!1610)) (None!632) )
))
(declare-fun isDefined!431 (Option!634) Bool)

(declare-fun getValueByKey!583 (List!21612 (_ BitVec 64)) Option!634)

(assert (=> b!1017943 (= res!682651 (isDefined!431 (getValueByKey!583 l!1036 key!271)))))

(declare-fun b!1017944 () Bool)

(declare-fun res!682650 () Bool)

(assert (=> b!1017944 (=> (not res!682650) (not e!572720))))

(get-info :version)

(assert (=> b!1017944 (= res!682650 (or (not ((_ is Cons!21608) l!1036)) (= (_1!7713 (h!22806 l!1036)) key!271)))))

(declare-fun res!682652 () Bool)

(assert (=> start!88540 (=> (not res!682652) (not e!572720))))

(declare-fun isStrictlySorted!644 (List!21612) Bool)

(assert (=> start!88540 (= res!682652 (isStrictlySorted!644 l!1036))))

(assert (=> start!88540 e!572720))

(assert (=> start!88540 e!572721))

(assert (=> start!88540 true))

(assert (= (and start!88540 res!682652) b!1017943))

(assert (= (and b!1017943 res!682651) b!1017944))

(assert (= (and b!1017944 res!682650) b!1017945))

(assert (= (and start!88540 ((_ is Cons!21608) l!1036)) b!1017946))

(declare-fun m!938497 () Bool)

(assert (=> b!1017945 m!938497))

(declare-fun m!938499 () Bool)

(assert (=> b!1017943 m!938499))

(assert (=> b!1017943 m!938499))

(declare-fun m!938501 () Bool)

(assert (=> b!1017943 m!938501))

(declare-fun m!938503 () Bool)

(assert (=> start!88540 m!938503))

(check-sat (not start!88540) (not b!1017943) (not b!1017946) tp_is_empty!23677 (not b!1017945))
(check-sat)
(get-model)

(declare-fun d!121651 () Bool)

(declare-fun res!682675 () Bool)

(declare-fun e!572738 () Bool)

(assert (=> d!121651 (=> res!682675 e!572738)))

(assert (=> d!121651 (= res!682675 (and ((_ is Cons!21608) l!1036) (= (_1!7713 (h!22806 l!1036)) key!271)))))

(assert (=> d!121651 (= (containsKey!508 l!1036 key!271) e!572738)))

(declare-fun b!1017975 () Bool)

(declare-fun e!572739 () Bool)

(assert (=> b!1017975 (= e!572738 e!572739)))

(declare-fun res!682676 () Bool)

(assert (=> b!1017975 (=> (not res!682676) (not e!572739))))

(assert (=> b!1017975 (= res!682676 (and (or (not ((_ is Cons!21608) l!1036)) (bvsle (_1!7713 (h!22806 l!1036)) key!271)) ((_ is Cons!21608) l!1036) (bvslt (_1!7713 (h!22806 l!1036)) key!271)))))

(declare-fun b!1017976 () Bool)

(assert (=> b!1017976 (= e!572739 (containsKey!508 (t!30604 l!1036) key!271))))

(assert (= (and d!121651 (not res!682675)) b!1017975))

(assert (= (and b!1017975 res!682676) b!1017976))

(declare-fun m!938521 () Bool)

(assert (=> b!1017976 m!938521))

(assert (=> b!1017945 d!121651))

(declare-fun d!121655 () Bool)

(declare-fun res!682681 () Bool)

(declare-fun e!572748 () Bool)

(assert (=> d!121655 (=> res!682681 e!572748)))

(assert (=> d!121655 (= res!682681 (or ((_ is Nil!21609) l!1036) ((_ is Nil!21609) (t!30604 l!1036))))))

(assert (=> d!121655 (= (isStrictlySorted!644 l!1036) e!572748)))

(declare-fun b!1017989 () Bool)

(declare-fun e!572749 () Bool)

(assert (=> b!1017989 (= e!572748 e!572749)))

(declare-fun res!682682 () Bool)

(assert (=> b!1017989 (=> (not res!682682) (not e!572749))))

(assert (=> b!1017989 (= res!682682 (bvslt (_1!7713 (h!22806 l!1036)) (_1!7713 (h!22806 (t!30604 l!1036)))))))

(declare-fun b!1017990 () Bool)

(assert (=> b!1017990 (= e!572749 (isStrictlySorted!644 (t!30604 l!1036)))))

(assert (= (and d!121655 (not res!682681)) b!1017989))

(assert (= (and b!1017989 res!682682) b!1017990))

(declare-fun m!938525 () Bool)

(assert (=> b!1017990 m!938525))

(assert (=> start!88540 d!121655))

(declare-fun d!121659 () Bool)

(declare-fun isEmpty!925 (Option!634) Bool)

(assert (=> d!121659 (= (isDefined!431 (getValueByKey!583 l!1036 key!271)) (not (isEmpty!925 (getValueByKey!583 l!1036 key!271))))))

(declare-fun bs!29616 () Bool)

(assert (= bs!29616 d!121659))

(assert (=> bs!29616 m!938499))

(declare-fun m!938527 () Bool)

(assert (=> bs!29616 m!938527))

(assert (=> b!1017943 d!121659))

(declare-fun b!1018015 () Bool)

(declare-fun e!572767 () Option!634)

(assert (=> b!1018015 (= e!572767 (getValueByKey!583 (t!30604 l!1036) key!271))))

(declare-fun b!1018014 () Bool)

(declare-fun e!572766 () Option!634)

(assert (=> b!1018014 (= e!572766 e!572767)))

(declare-fun c!103095 () Bool)

(assert (=> b!1018014 (= c!103095 (and ((_ is Cons!21608) l!1036) (not (= (_1!7713 (h!22806 l!1036)) key!271))))))

(declare-fun b!1018016 () Bool)

(assert (=> b!1018016 (= e!572767 None!632)))

(declare-fun b!1018013 () Bool)

(assert (=> b!1018013 (= e!572766 (Some!633 (_2!7713 (h!22806 l!1036))))))

(declare-fun d!121663 () Bool)

(declare-fun c!103094 () Bool)

(assert (=> d!121663 (= c!103094 (and ((_ is Cons!21608) l!1036) (= (_1!7713 (h!22806 l!1036)) key!271)))))

(assert (=> d!121663 (= (getValueByKey!583 l!1036 key!271) e!572766)))

(assert (= (and d!121663 c!103094) b!1018013))

(assert (= (and d!121663 (not c!103094)) b!1018014))

(assert (= (and b!1018014 c!103095) b!1018015))

(assert (= (and b!1018014 (not c!103095)) b!1018016))

(declare-fun m!938535 () Bool)

(assert (=> b!1018015 m!938535))

(assert (=> b!1017943 d!121663))

(declare-fun b!1018023 () Bool)

(declare-fun e!572772 () Bool)

(declare-fun tp!70982 () Bool)

(assert (=> b!1018023 (= e!572772 (and tp_is_empty!23677 tp!70982))))

(assert (=> b!1017946 (= tp!70973 e!572772)))

(assert (= (and b!1017946 ((_ is Cons!21608) (t!30604 l!1036))) b!1018023))

(check-sat (not b!1017990) (not d!121659) tp_is_empty!23677 (not b!1018023) (not b!1017976) (not b!1018015))
(check-sat)
(get-model)

(declare-fun d!121675 () Bool)

(assert (=> d!121675 (= (isEmpty!925 (getValueByKey!583 l!1036 key!271)) (not ((_ is Some!633) (getValueByKey!583 l!1036 key!271))))))

(assert (=> d!121659 d!121675))

(declare-fun d!121677 () Bool)

(declare-fun res!682707 () Bool)

(declare-fun e!572797 () Bool)

(assert (=> d!121677 (=> res!682707 e!572797)))

(assert (=> d!121677 (= res!682707 (or ((_ is Nil!21609) (t!30604 l!1036)) ((_ is Nil!21609) (t!30604 (t!30604 l!1036)))))))

(assert (=> d!121677 (= (isStrictlySorted!644 (t!30604 l!1036)) e!572797)))

(declare-fun b!1018058 () Bool)

(declare-fun e!572798 () Bool)

(assert (=> b!1018058 (= e!572797 e!572798)))

(declare-fun res!682708 () Bool)

(assert (=> b!1018058 (=> (not res!682708) (not e!572798))))

(assert (=> b!1018058 (= res!682708 (bvslt (_1!7713 (h!22806 (t!30604 l!1036))) (_1!7713 (h!22806 (t!30604 (t!30604 l!1036))))))))

(declare-fun b!1018059 () Bool)

(assert (=> b!1018059 (= e!572798 (isStrictlySorted!644 (t!30604 (t!30604 l!1036))))))

(assert (= (and d!121677 (not res!682707)) b!1018058))

(assert (= (and b!1018058 res!682708) b!1018059))

(declare-fun m!938545 () Bool)

(assert (=> b!1018059 m!938545))

(assert (=> b!1017990 d!121677))

(declare-fun b!1018062 () Bool)

(declare-fun e!572800 () Option!634)

(assert (=> b!1018062 (= e!572800 (getValueByKey!583 (t!30604 (t!30604 l!1036)) key!271))))

(declare-fun b!1018061 () Bool)

(declare-fun e!572799 () Option!634)

(assert (=> b!1018061 (= e!572799 e!572800)))

(declare-fun c!103103 () Bool)

(assert (=> b!1018061 (= c!103103 (and ((_ is Cons!21608) (t!30604 l!1036)) (not (= (_1!7713 (h!22806 (t!30604 l!1036))) key!271))))))

(declare-fun b!1018063 () Bool)

(assert (=> b!1018063 (= e!572800 None!632)))

(declare-fun b!1018060 () Bool)

(assert (=> b!1018060 (= e!572799 (Some!633 (_2!7713 (h!22806 (t!30604 l!1036)))))))

(declare-fun d!121679 () Bool)

(declare-fun c!103102 () Bool)

(assert (=> d!121679 (= c!103102 (and ((_ is Cons!21608) (t!30604 l!1036)) (= (_1!7713 (h!22806 (t!30604 l!1036))) key!271)))))

(assert (=> d!121679 (= (getValueByKey!583 (t!30604 l!1036) key!271) e!572799)))

(assert (= (and d!121679 c!103102) b!1018060))

(assert (= (and d!121679 (not c!103102)) b!1018061))

(assert (= (and b!1018061 c!103103) b!1018062))

(assert (= (and b!1018061 (not c!103103)) b!1018063))

(declare-fun m!938547 () Bool)

(assert (=> b!1018062 m!938547))

(assert (=> b!1018015 d!121679))

(declare-fun d!121681 () Bool)

(declare-fun res!682709 () Bool)

(declare-fun e!572801 () Bool)

(assert (=> d!121681 (=> res!682709 e!572801)))

(assert (=> d!121681 (= res!682709 (and ((_ is Cons!21608) (t!30604 l!1036)) (= (_1!7713 (h!22806 (t!30604 l!1036))) key!271)))))

(assert (=> d!121681 (= (containsKey!508 (t!30604 l!1036) key!271) e!572801)))

(declare-fun b!1018064 () Bool)

(declare-fun e!572802 () Bool)

(assert (=> b!1018064 (= e!572801 e!572802)))

(declare-fun res!682710 () Bool)

(assert (=> b!1018064 (=> (not res!682710) (not e!572802))))

(assert (=> b!1018064 (= res!682710 (and (or (not ((_ is Cons!21608) (t!30604 l!1036))) (bvsle (_1!7713 (h!22806 (t!30604 l!1036))) key!271)) ((_ is Cons!21608) (t!30604 l!1036)) (bvslt (_1!7713 (h!22806 (t!30604 l!1036))) key!271)))))

(declare-fun b!1018065 () Bool)

(assert (=> b!1018065 (= e!572802 (containsKey!508 (t!30604 (t!30604 l!1036)) key!271))))

(assert (= (and d!121681 (not res!682709)) b!1018064))

(assert (= (and b!1018064 res!682710) b!1018065))

(declare-fun m!938549 () Bool)

(assert (=> b!1018065 m!938549))

(assert (=> b!1017976 d!121681))

(declare-fun b!1018066 () Bool)

(declare-fun e!572803 () Bool)

(declare-fun tp!70989 () Bool)

(assert (=> b!1018066 (= e!572803 (and tp_is_empty!23677 tp!70989))))

(assert (=> b!1018023 (= tp!70982 e!572803)))

(assert (= (and b!1018023 ((_ is Cons!21608) (t!30604 (t!30604 l!1036)))) b!1018066))

(check-sat (not b!1018066) tp_is_empty!23677 (not b!1018065) (not b!1018062) (not b!1018059))
(check-sat)
