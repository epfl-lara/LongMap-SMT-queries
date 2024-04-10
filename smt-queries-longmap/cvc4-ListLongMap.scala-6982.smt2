; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!88478 () Bool)

(assert start!88478)

(declare-fun b!1017780 () Bool)

(declare-fun res!682579 () Bool)

(declare-fun e!572619 () Bool)

(assert (=> b!1017780 (=> (not res!682579) (not e!572619))))

(declare-datatypes ((B!1602 0))(
  ( (B!1603 (val!11885 Int)) )
))
(declare-datatypes ((tuple2!15316 0))(
  ( (tuple2!15317 (_1!7669 (_ BitVec 64)) (_2!7669 B!1602)) )
))
(declare-datatypes ((List!21573 0))(
  ( (Nil!21570) (Cons!21569 (h!22767 tuple2!15316) (t!30574 List!21573)) )
))
(declare-fun l!1036 () List!21573)

(declare-fun key!271 () (_ BitVec 64))

(declare-datatypes ((Option!628 0))(
  ( (Some!627 (v!14478 B!1602)) (None!626) )
))
(declare-fun isDefined!424 (Option!628) Bool)

(declare-fun getValueByKey!577 (List!21573 (_ BitVec 64)) Option!628)

(assert (=> b!1017780 (= res!682579 (isDefined!424 (getValueByKey!577 l!1036 key!271)))))

(declare-fun res!682578 () Bool)

(assert (=> start!88478 (=> (not res!682578) (not e!572619))))

(declare-fun isStrictlySorted!644 (List!21573) Bool)

(assert (=> start!88478 (= res!682578 (isStrictlySorted!644 l!1036))))

(assert (=> start!88478 e!572619))

(declare-fun e!572618 () Bool)

(assert (=> start!88478 e!572618))

(assert (=> start!88478 true))

(declare-fun b!1017781 () Bool)

(declare-fun tp_is_empty!23669 () Bool)

(declare-fun tp!70942 () Bool)

(assert (=> b!1017781 (= e!572618 (and tp_is_empty!23669 tp!70942))))

(declare-fun b!1017782 () Bool)

(declare-fun res!682576 () Bool)

(assert (=> b!1017782 (=> (not res!682576) (not e!572619))))

(assert (=> b!1017782 (= res!682576 (isStrictlySorted!644 (t!30574 l!1036)))))

(declare-fun b!1017783 () Bool)

(declare-fun res!682577 () Bool)

(assert (=> b!1017783 (=> (not res!682577) (not e!572619))))

(assert (=> b!1017783 (= res!682577 (isDefined!424 (getValueByKey!577 (t!30574 l!1036) key!271)))))

(declare-fun b!1017784 () Bool)

(declare-fun ListPrimitiveSize!132 (List!21573) Int)

(assert (=> b!1017784 (= e!572619 (>= (ListPrimitiveSize!132 (t!30574 l!1036)) (ListPrimitiveSize!132 l!1036)))))

(declare-fun b!1017785 () Bool)

(declare-fun res!682580 () Bool)

(assert (=> b!1017785 (=> (not res!682580) (not e!572619))))

(assert (=> b!1017785 (= res!682580 (and (is-Cons!21569 l!1036) (not (= (_1!7669 (h!22767 l!1036)) key!271))))))

(assert (= (and start!88478 res!682578) b!1017780))

(assert (= (and b!1017780 res!682579) b!1017785))

(assert (= (and b!1017785 res!682580) b!1017782))

(assert (= (and b!1017782 res!682576) b!1017783))

(assert (= (and b!1017783 res!682577) b!1017784))

(assert (= (and start!88478 (is-Cons!21569 l!1036)) b!1017781))

(declare-fun m!938973 () Bool)

(assert (=> b!1017780 m!938973))

(assert (=> b!1017780 m!938973))

(declare-fun m!938975 () Bool)

(assert (=> b!1017780 m!938975))

(declare-fun m!938977 () Bool)

(assert (=> b!1017783 m!938977))

(assert (=> b!1017783 m!938977))

(declare-fun m!938979 () Bool)

(assert (=> b!1017783 m!938979))

(declare-fun m!938981 () Bool)

(assert (=> start!88478 m!938981))

(declare-fun m!938983 () Bool)

(assert (=> b!1017782 m!938983))

(declare-fun m!938985 () Bool)

(assert (=> b!1017784 m!938985))

(declare-fun m!938987 () Bool)

(assert (=> b!1017784 m!938987))

(push 1)

(assert (not start!88478))

(assert tp_is_empty!23669)

(assert (not b!1017781))

(assert (not b!1017782))

(assert (not b!1017784))

(assert (not b!1017783))

(assert (not b!1017780))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!121687 () Bool)

(declare-fun res!682585 () Bool)

(declare-fun e!572626 () Bool)

(assert (=> d!121687 (=> res!682585 e!572626)))

(assert (=> d!121687 (= res!682585 (or (is-Nil!21570 l!1036) (is-Nil!21570 (t!30574 l!1036))))))

(assert (=> d!121687 (= (isStrictlySorted!644 l!1036) e!572626)))

(declare-fun b!1017794 () Bool)

(declare-fun e!572627 () Bool)

(assert (=> b!1017794 (= e!572626 e!572627)))

(declare-fun res!682586 () Bool)

(assert (=> b!1017794 (=> (not res!682586) (not e!572627))))

(assert (=> b!1017794 (= res!682586 (bvslt (_1!7669 (h!22767 l!1036)) (_1!7669 (h!22767 (t!30574 l!1036)))))))

(declare-fun b!1017795 () Bool)

(assert (=> b!1017795 (= e!572627 (isStrictlySorted!644 (t!30574 l!1036)))))

(assert (= (and d!121687 (not res!682585)) b!1017794))

(assert (= (and b!1017794 res!682586) b!1017795))

(assert (=> b!1017795 m!938983))

(assert (=> start!88478 d!121687))

(declare-fun d!121691 () Bool)

(declare-fun lt!449473 () Int)

(assert (=> d!121691 (>= lt!449473 0)))

(declare-fun e!572632 () Int)

(assert (=> d!121691 (= lt!449473 e!572632)))

(declare-fun c!103064 () Bool)

(assert (=> d!121691 (= c!103064 (is-Nil!21570 (t!30574 l!1036)))))

(assert (=> d!121691 (= (ListPrimitiveSize!132 (t!30574 l!1036)) lt!449473)))

(declare-fun b!1017804 () Bool)

(assert (=> b!1017804 (= e!572632 0)))

(declare-fun b!1017805 () Bool)

(assert (=> b!1017805 (= e!572632 (+ 1 (ListPrimitiveSize!132 (t!30574 (t!30574 l!1036)))))))

(assert (= (and d!121691 c!103064) b!1017804))

(assert (= (and d!121691 (not c!103064)) b!1017805))

(declare-fun m!938991 () Bool)

(assert (=> b!1017805 m!938991))

(assert (=> b!1017784 d!121691))

(declare-fun d!121699 () Bool)

(declare-fun lt!449474 () Int)

(assert (=> d!121699 (>= lt!449474 0)))

(declare-fun e!572637 () Int)

(assert (=> d!121699 (= lt!449474 e!572637)))

(declare-fun c!103065 () Bool)

(assert (=> d!121699 (= c!103065 (is-Nil!21570 l!1036))))

(assert (=> d!121699 (= (ListPrimitiveSize!132 l!1036) lt!449474)))

(declare-fun b!1017810 () Bool)

(assert (=> b!1017810 (= e!572637 0)))

(declare-fun b!1017811 () Bool)

(assert (=> b!1017811 (= e!572637 (+ 1 (ListPrimitiveSize!132 (t!30574 l!1036))))))

(assert (= (and d!121699 c!103065) b!1017810))

(assert (= (and d!121699 (not c!103065)) b!1017811))

(assert (=> b!1017811 m!938985))

(assert (=> b!1017784 d!121699))

(declare-fun d!121701 () Bool)

(declare-fun isEmpty!913 (Option!628) Bool)

(assert (=> d!121701 (= (isDefined!424 (getValueByKey!577 l!1036 key!271)) (not (isEmpty!913 (getValueByKey!577 l!1036 key!271))))))

(declare-fun bs!29626 () Bool)

(assert (= bs!29626 d!121701))

(assert (=> bs!29626 m!938973))

(declare-fun m!938993 () Bool)

(assert (=> bs!29626 m!938993))

(assert (=> b!1017780 d!121701))

(declare-fun b!1017841 () Bool)

(declare-fun e!572654 () Option!628)

(declare-fun e!572655 () Option!628)

(assert (=> b!1017841 (= e!572654 e!572655)))

(declare-fun c!103079 () Bool)

(assert (=> b!1017841 (= c!103079 (and (is-Cons!21569 l!1036) (not (= (_1!7669 (h!22767 l!1036)) key!271))))))

(declare-fun b!1017843 () Bool)

(assert (=> b!1017843 (= e!572655 None!626)))

(declare-fun b!1017842 () Bool)

(assert (=> b!1017842 (= e!572655 (getValueByKey!577 (t!30574 l!1036) key!271))))

(declare-fun d!121703 () Bool)

(declare-fun c!103078 () Bool)

(assert (=> d!121703 (= c!103078 (and (is-Cons!21569 l!1036) (= (_1!7669 (h!22767 l!1036)) key!271)))))

(assert (=> d!121703 (= (getValueByKey!577 l!1036 key!271) e!572654)))

(declare-fun b!1017840 () Bool)

(assert (=> b!1017840 (= e!572654 (Some!627 (_2!7669 (h!22767 l!1036))))))

(assert (= (and d!121703 c!103078) b!1017840))

(assert (= (and d!121703 (not c!103078)) b!1017841))

(assert (= (and b!1017841 c!103079) b!1017842))

(assert (= (and b!1017841 (not c!103079)) b!1017843))

(assert (=> b!1017842 m!938977))

(assert (=> b!1017780 d!121703))

(declare-fun d!121715 () Bool)

(declare-fun res!682595 () Bool)

(declare-fun e!572656 () Bool)

(assert (=> d!121715 (=> res!682595 e!572656)))

(assert (=> d!121715 (= res!682595 (or (is-Nil!21570 (t!30574 l!1036)) (is-Nil!21570 (t!30574 (t!30574 l!1036)))))))

(assert (=> d!121715 (= (isStrictlySorted!644 (t!30574 l!1036)) e!572656)))

(declare-fun b!1017844 () Bool)

(declare-fun e!572657 () Bool)

(assert (=> b!1017844 (= e!572656 e!572657)))

(declare-fun res!682596 () Bool)

(assert (=> b!1017844 (=> (not res!682596) (not e!572657))))

(assert (=> b!1017844 (= res!682596 (bvslt (_1!7669 (h!22767 (t!30574 l!1036))) (_1!7669 (h!22767 (t!30574 (t!30574 l!1036))))))))

(declare-fun b!1017845 () Bool)

(assert (=> b!1017845 (= e!572657 (isStrictlySorted!644 (t!30574 (t!30574 l!1036))))))

(assert (= (and d!121715 (not res!682595)) b!1017844))

(assert (= (and b!1017844 res!682596) b!1017845))

(declare-fun m!939001 () Bool)

(assert (=> b!1017845 m!939001))

(assert (=> b!1017782 d!121715))

(declare-fun d!121717 () Bool)

(assert (=> d!121717 (= (isDefined!424 (getValueByKey!577 (t!30574 l!1036) key!271)) (not (isEmpty!913 (getValueByKey!577 (t!30574 l!1036) key!271))))))

(declare-fun bs!29628 () Bool)

(assert (= bs!29628 d!121717))

(assert (=> bs!29628 m!938977))

(declare-fun m!939003 () Bool)

(assert (=> bs!29628 m!939003))

(assert (=> b!1017783 d!121717))

(declare-fun b!1017847 () Bool)

(declare-fun e!572658 () Option!628)

(declare-fun e!572659 () Option!628)

(assert (=> b!1017847 (= e!572658 e!572659)))

(declare-fun c!103081 () Bool)

(assert (=> b!1017847 (= c!103081 (and (is-Cons!21569 (t!30574 l!1036)) (not (= (_1!7669 (h!22767 (t!30574 l!1036))) key!271))))))

(declare-fun b!1017849 () Bool)

(assert (=> b!1017849 (= e!572659 None!626)))

(declare-fun b!1017848 () Bool)

(assert (=> b!1017848 (= e!572659 (getValueByKey!577 (t!30574 (t!30574 l!1036)) key!271))))

(declare-fun d!121719 () Bool)

(declare-fun c!103080 () Bool)

(assert (=> d!121719 (= c!103080 (and (is-Cons!21569 (t!30574 l!1036)) (= (_1!7669 (h!22767 (t!30574 l!1036))) key!271)))))

(assert (=> d!121719 (= (getValueByKey!577 (t!30574 l!1036) key!271) e!572658)))

(declare-fun b!1017846 () Bool)

(assert (=> b!1017846 (= e!572658 (Some!627 (_2!7669 (h!22767 (t!30574 l!1036)))))))

(assert (= (and d!121719 c!103080) b!1017846))

(assert (= (and d!121719 (not c!103080)) b!1017847))

(assert (= (and b!1017847 c!103081) b!1017848))

(assert (= (and b!1017847 (not c!103081)) b!1017849))

(declare-fun m!939005 () Bool)

(assert (=> b!1017848 m!939005))

(assert (=> b!1017783 d!121719))

(declare-fun b!1017866 () Bool)

(declare-fun e!572670 () Bool)

(declare-fun tp!70945 () Bool)

(assert (=> b!1017866 (= e!572670 (and tp_is_empty!23669 tp!70945))))

(assert (=> b!1017781 (= tp!70942 e!572670)))

(assert (= (and b!1017781 (is-Cons!21569 (t!30574 l!1036))) b!1017866))

(push 1)

