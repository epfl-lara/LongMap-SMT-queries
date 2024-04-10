; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!88544 () Bool)

(assert start!88544)

(declare-fun b!1018103 () Bool)

(declare-fun res!682733 () Bool)

(declare-fun e!572814 () Bool)

(assert (=> b!1018103 (=> (not res!682733) (not e!572814))))

(declare-datatypes ((B!1614 0))(
  ( (B!1615 (val!11891 Int)) )
))
(declare-datatypes ((tuple2!15328 0))(
  ( (tuple2!15329 (_1!7675 (_ BitVec 64)) (_2!7675 B!1614)) )
))
(declare-datatypes ((List!21579 0))(
  ( (Nil!21576) (Cons!21575 (h!22773 tuple2!15328) (t!30580 List!21579)) )
))
(declare-fun l!1036 () List!21579)

(declare-fun key!271 () (_ BitVec 64))

(declare-datatypes ((Option!634 0))(
  ( (Some!633 (v!14484 B!1614)) (None!632) )
))
(declare-fun isDefined!430 (Option!634) Bool)

(declare-fun getValueByKey!583 (List!21579 (_ BitVec 64)) Option!634)

(assert (=> b!1018103 (= res!682733 (isDefined!430 (getValueByKey!583 l!1036 key!271)))))

(declare-fun b!1018104 () Bool)

(declare-fun res!682731 () Bool)

(assert (=> b!1018104 (=> (not res!682731) (not e!572814))))

(assert (=> b!1018104 (= res!682731 (or (not (is-Cons!21575 l!1036)) (= (_1!7675 (h!22773 l!1036)) key!271)))))

(declare-fun res!682732 () Bool)

(assert (=> start!88544 (=> (not res!682732) (not e!572814))))

(declare-fun isStrictlySorted!650 (List!21579) Bool)

(assert (=> start!88544 (= res!682732 (isStrictlySorted!650 l!1036))))

(assert (=> start!88544 e!572814))

(declare-fun e!572813 () Bool)

(assert (=> start!88544 e!572813))

(assert (=> start!88544 true))

(declare-fun b!1018105 () Bool)

(declare-fun containsKey!510 (List!21579 (_ BitVec 64)) Bool)

(assert (=> b!1018105 (= e!572814 (not (containsKey!510 l!1036 key!271)))))

(declare-fun b!1018106 () Bool)

(declare-fun tp_is_empty!23681 () Bool)

(declare-fun tp!70978 () Bool)

(assert (=> b!1018106 (= e!572813 (and tp_is_empty!23681 tp!70978))))

(assert (= (and start!88544 res!682732) b!1018103))

(assert (= (and b!1018103 res!682733) b!1018104))

(assert (= (and b!1018104 res!682731) b!1018105))

(assert (= (and start!88544 (is-Cons!21575 l!1036)) b!1018106))

(declare-fun m!939125 () Bool)

(assert (=> b!1018103 m!939125))

(assert (=> b!1018103 m!939125))

(declare-fun m!939127 () Bool)

(assert (=> b!1018103 m!939127))

(declare-fun m!939129 () Bool)

(assert (=> start!88544 m!939129))

(declare-fun m!939131 () Bool)

(assert (=> b!1018105 m!939131))

(push 1)

(assert (not b!1018106))

(assert (not b!1018103))

(assert (not b!1018105))

(assert (not start!88544))

(assert tp_is_empty!23681)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!121793 () Bool)

(declare-fun res!682743 () Bool)

(declare-fun e!572824 () Bool)

(assert (=> d!121793 (=> res!682743 e!572824)))

(assert (=> d!121793 (= res!682743 (and (is-Cons!21575 l!1036) (= (_1!7675 (h!22773 l!1036)) key!271)))))

(assert (=> d!121793 (= (containsKey!510 l!1036 key!271) e!572824)))

(declare-fun b!1018116 () Bool)

(declare-fun e!572826 () Bool)

(assert (=> b!1018116 (= e!572824 e!572826)))

(declare-fun res!682745 () Bool)

(assert (=> b!1018116 (=> (not res!682745) (not e!572826))))

(assert (=> b!1018116 (= res!682745 (and (or (not (is-Cons!21575 l!1036)) (bvsle (_1!7675 (h!22773 l!1036)) key!271)) (is-Cons!21575 l!1036) (bvslt (_1!7675 (h!22773 l!1036)) key!271)))))

(declare-fun b!1018118 () Bool)

(assert (=> b!1018118 (= e!572826 (containsKey!510 (t!30580 l!1036) key!271))))

(assert (= (and d!121793 (not res!682743)) b!1018116))

(assert (= (and b!1018116 res!682745) b!1018118))

(declare-fun m!939135 () Bool)

(assert (=> b!1018118 m!939135))

(assert (=> b!1018105 d!121793))

(declare-fun d!121801 () Bool)

(declare-fun res!682754 () Bool)

(declare-fun e!572835 () Bool)

(assert (=> d!121801 (=> res!682754 e!572835)))

(assert (=> d!121801 (= res!682754 (or (is-Nil!21576 l!1036) (is-Nil!21576 (t!30580 l!1036))))))

(assert (=> d!121801 (= (isStrictlySorted!650 l!1036) e!572835)))

(declare-fun b!1018127 () Bool)

(declare-fun e!572836 () Bool)

(assert (=> b!1018127 (= e!572835 e!572836)))

(declare-fun res!682755 () Bool)

(assert (=> b!1018127 (=> (not res!682755) (not e!572836))))

(assert (=> b!1018127 (= res!682755 (bvslt (_1!7675 (h!22773 l!1036)) (_1!7675 (h!22773 (t!30580 l!1036)))))))

(declare-fun b!1018128 () Bool)

(assert (=> b!1018128 (= e!572836 (isStrictlySorted!650 (t!30580 l!1036)))))

(assert (= (and d!121801 (not res!682754)) b!1018127))

(assert (= (and b!1018127 res!682755) b!1018128))

(declare-fun m!939139 () Bool)

(assert (=> b!1018128 m!939139))

(assert (=> start!88544 d!121801))

(declare-fun d!121805 () Bool)

(declare-fun isEmpty!920 (Option!634) Bool)

(assert (=> d!121805 (= (isDefined!430 (getValueByKey!583 l!1036 key!271)) (not (isEmpty!920 (getValueByKey!583 l!1036 key!271))))))

(declare-fun bs!29645 () Bool)

(assert (= bs!29645 d!121805))

(assert (=> bs!29645 m!939125))

(declare-fun m!939143 () Bool)

(assert (=> bs!29645 m!939143))

(assert (=> b!1018103 d!121805))

(declare-fun b!1018162 () Bool)

(declare-fun e!572854 () Option!634)

(assert (=> b!1018162 (= e!572854 None!632)))

(declare-fun d!121811 () Bool)

(declare-fun c!103132 () Bool)

(assert (=> d!121811 (= c!103132 (and (is-Cons!21575 l!1036) (= (_1!7675 (h!22773 l!1036)) key!271)))))

(declare-fun e!572853 () Option!634)

(assert (=> d!121811 (= (getValueByKey!583 l!1036 key!271) e!572853)))

(declare-fun b!1018159 () Bool)

(assert (=> b!1018159 (= e!572853 (Some!633 (_2!7675 (h!22773 l!1036))))))

(declare-fun b!1018160 () Bool)

(assert (=> b!1018160 (= e!572853 e!572854)))

(declare-fun c!103133 () Bool)

(assert (=> b!1018160 (= c!103133 (and (is-Cons!21575 l!1036) (not (= (_1!7675 (h!22773 l!1036)) key!271))))))

(declare-fun b!1018161 () Bool)

(assert (=> b!1018161 (= e!572854 (getValueByKey!583 (t!30580 l!1036) key!271))))

(assert (= (and d!121811 c!103132) b!1018159))

(assert (= (and d!121811 (not c!103132)) b!1018160))

(assert (= (and b!1018160 c!103133) b!1018161))

(assert (= (and b!1018160 (not c!103133)) b!1018162))

(declare-fun m!939149 () Bool)

(assert (=> b!1018161 m!939149))

(assert (=> b!1018103 d!121811))

(declare-fun b!1018172 () Bool)

(declare-fun e!572860 () Bool)

(declare-fun tp!70984 () Bool)

(assert (=> b!1018172 (= e!572860 (and tp_is_empty!23681 tp!70984))))

(assert (=> b!1018106 (= tp!70978 e!572860)))

(assert (= (and b!1018106 (is-Cons!21575 (t!30580 l!1036))) b!1018172))

(push 1)

(assert (not b!1018118))

(assert (not b!1018172))

(assert tp_is_empty!23681)

(assert (not d!121805))

(assert (not b!1018161))

(assert (not b!1018128))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!121829 () Bool)

(assert (=> d!121829 (= (isEmpty!920 (getValueByKey!583 l!1036 key!271)) (not (is-Some!633 (getValueByKey!583 l!1036 key!271))))))

(assert (=> d!121805 d!121829))

(declare-fun b!1018214 () Bool)

(declare-fun e!572892 () Option!634)

(assert (=> b!1018214 (= e!572892 None!632)))

(declare-fun d!121835 () Bool)

(declare-fun c!103140 () Bool)

(assert (=> d!121835 (= c!103140 (and (is-Cons!21575 (t!30580 l!1036)) (= (_1!7675 (h!22773 (t!30580 l!1036))) key!271)))))

(declare-fun e!572891 () Option!634)

(assert (=> d!121835 (= (getValueByKey!583 (t!30580 l!1036) key!271) e!572891)))

(declare-fun b!1018211 () Bool)

(assert (=> b!1018211 (= e!572891 (Some!633 (_2!7675 (h!22773 (t!30580 l!1036)))))))

(declare-fun b!1018212 () Bool)

(assert (=> b!1018212 (= e!572891 e!572892)))

(declare-fun c!103141 () Bool)

(assert (=> b!1018212 (= c!103141 (and (is-Cons!21575 (t!30580 l!1036)) (not (= (_1!7675 (h!22773 (t!30580 l!1036))) key!271))))))

(declare-fun b!1018213 () Bool)

(assert (=> b!1018213 (= e!572892 (getValueByKey!583 (t!30580 (t!30580 l!1036)) key!271))))

(assert (= (and d!121835 c!103140) b!1018211))

(assert (= (and d!121835 (not c!103140)) b!1018212))

(assert (= (and b!1018212 c!103141) b!1018213))

(assert (= (and b!1018212 (not c!103141)) b!1018214))

(declare-fun m!939169 () Bool)

(assert (=> b!1018213 m!939169))

(assert (=> b!1018161 d!121835))

(declare-fun d!121837 () Bool)

(declare-fun res!682778 () Bool)

(declare-fun e!572893 () Bool)

(assert (=> d!121837 (=> res!682778 e!572893)))

(assert (=> d!121837 (= res!682778 (and (is-Cons!21575 (t!30580 l!1036)) (= (_1!7675 (h!22773 (t!30580 l!1036))) key!271)))))

(assert (=> d!121837 (= (containsKey!510 (t!30580 l!1036) key!271) e!572893)))

(declare-fun b!1018215 () Bool)

(declare-fun e!572894 () Bool)

(assert (=> b!1018215 (= e!572893 e!572894)))

(declare-fun res!682779 () Bool)

(assert (=> b!1018215 (=> (not res!682779) (not e!572894))))

(assert (=> b!1018215 (= res!682779 (and (or (not (is-Cons!21575 (t!30580 l!1036))) (bvsle (_1!7675 (h!22773 (t!30580 l!1036))) key!271)) (is-Cons!21575 (t!30580 l!1036)) (bvslt (_1!7675 (h!22773 (t!30580 l!1036))) key!271)))))

(declare-fun b!1018216 () Bool)

(assert (=> b!1018216 (= e!572894 (containsKey!510 (t!30580 (t!30580 l!1036)) key!271))))

(assert (= (and d!121837 (not res!682778)) b!1018215))

(assert (= (and b!1018215 res!682779) b!1018216))

(declare-fun m!939171 () Bool)

(assert (=> b!1018216 m!939171))

(assert (=> b!1018118 d!121837))

