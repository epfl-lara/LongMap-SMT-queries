; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!88540 () Bool)

(assert start!88540)

(declare-fun b!1018080 () Bool)

(declare-fun res!682713 () Bool)

(declare-fun e!572801 () Bool)

(assert (=> b!1018080 (=> (not res!682713) (not e!572801))))

(declare-datatypes ((B!1610 0))(
  ( (B!1611 (val!11889 Int)) )
))
(declare-datatypes ((tuple2!15324 0))(
  ( (tuple2!15325 (_1!7673 (_ BitVec 64)) (_2!7673 B!1610)) )
))
(declare-datatypes ((List!21577 0))(
  ( (Nil!21574) (Cons!21573 (h!22771 tuple2!15324) (t!30578 List!21577)) )
))
(declare-fun l!1036 () List!21577)

(declare-fun key!271 () (_ BitVec 64))

(assert (=> b!1018080 (= res!682713 (or (not (is-Cons!21573 l!1036)) (= (_1!7673 (h!22771 l!1036)) key!271)))))

(declare-fun b!1018082 () Bool)

(declare-fun e!572802 () Bool)

(declare-fun tp_is_empty!23677 () Bool)

(declare-fun tp!70972 () Bool)

(assert (=> b!1018082 (= e!572802 (and tp_is_empty!23677 tp!70972))))

(declare-fun b!1018079 () Bool)

(declare-fun res!682714 () Bool)

(assert (=> b!1018079 (=> (not res!682714) (not e!572801))))

(declare-datatypes ((Option!632 0))(
  ( (Some!631 (v!14482 B!1610)) (None!630) )
))
(declare-fun isDefined!428 (Option!632) Bool)

(declare-fun getValueByKey!581 (List!21577 (_ BitVec 64)) Option!632)

(assert (=> b!1018079 (= res!682714 (isDefined!428 (getValueByKey!581 l!1036 key!271)))))

(declare-fun res!682715 () Bool)

(assert (=> start!88540 (=> (not res!682715) (not e!572801))))

(declare-fun isStrictlySorted!648 (List!21577) Bool)

(assert (=> start!88540 (= res!682715 (isStrictlySorted!648 l!1036))))

(assert (=> start!88540 e!572801))

(assert (=> start!88540 e!572802))

(assert (=> start!88540 true))

(declare-fun b!1018081 () Bool)

(declare-fun containsKey!508 (List!21577 (_ BitVec 64)) Bool)

(assert (=> b!1018081 (= e!572801 (not (containsKey!508 l!1036 key!271)))))

(assert (= (and start!88540 res!682715) b!1018079))

(assert (= (and b!1018079 res!682714) b!1018080))

(assert (= (and b!1018080 res!682713) b!1018081))

(assert (= (and start!88540 (is-Cons!21573 l!1036)) b!1018082))

(declare-fun m!939109 () Bool)

(assert (=> b!1018079 m!939109))

(assert (=> b!1018079 m!939109))

(declare-fun m!939111 () Bool)

(assert (=> b!1018079 m!939111))

(declare-fun m!939113 () Bool)

(assert (=> start!88540 m!939113))

(declare-fun m!939115 () Bool)

(assert (=> b!1018081 m!939115))

(push 1)

(assert tp_is_empty!23677)

(assert (not b!1018082))

(assert (not b!1018081))

(assert (not b!1018079))

(assert (not start!88540))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!121795 () Bool)

(declare-fun res!682742 () Bool)

(declare-fun e!572823 () Bool)

(assert (=> d!121795 (=> res!682742 e!572823)))

(assert (=> d!121795 (= res!682742 (and (is-Cons!21573 l!1036) (= (_1!7673 (h!22771 l!1036)) key!271)))))

(assert (=> d!121795 (= (containsKey!508 l!1036 key!271) e!572823)))

(declare-fun b!1018115 () Bool)

(declare-fun e!572825 () Bool)

(assert (=> b!1018115 (= e!572823 e!572825)))

(declare-fun res!682744 () Bool)

(assert (=> b!1018115 (=> (not res!682744) (not e!572825))))

(assert (=> b!1018115 (= res!682744 (and (or (not (is-Cons!21573 l!1036)) (bvsle (_1!7673 (h!22771 l!1036)) key!271)) (is-Cons!21573 l!1036) (bvslt (_1!7673 (h!22771 l!1036)) key!271)))))

(declare-fun b!1018117 () Bool)

(assert (=> b!1018117 (= e!572825 (containsKey!508 (t!30578 l!1036) key!271))))

(assert (= (and d!121795 (not res!682742)) b!1018115))

(assert (= (and b!1018115 res!682744) b!1018117))

(declare-fun m!939133 () Bool)

(assert (=> b!1018117 m!939133))

(assert (=> b!1018081 d!121795))

(declare-fun d!121799 () Bool)

(declare-fun res!682756 () Bool)

(declare-fun e!572837 () Bool)

(assert (=> d!121799 (=> res!682756 e!572837)))

(assert (=> d!121799 (= res!682756 (or (is-Nil!21574 l!1036) (is-Nil!21574 (t!30578 l!1036))))))

(assert (=> d!121799 (= (isStrictlySorted!648 l!1036) e!572837)))

(declare-fun b!1018129 () Bool)

(declare-fun e!572838 () Bool)

(assert (=> b!1018129 (= e!572837 e!572838)))

(declare-fun res!682757 () Bool)

(assert (=> b!1018129 (=> (not res!682757) (not e!572838))))

(assert (=> b!1018129 (= res!682757 (bvslt (_1!7673 (h!22771 l!1036)) (_1!7673 (h!22771 (t!30578 l!1036)))))))

(declare-fun b!1018130 () Bool)

(assert (=> b!1018130 (= e!572838 (isStrictlySorted!648 (t!30578 l!1036)))))

(assert (= (and d!121799 (not res!682756)) b!1018129))

(assert (= (and b!1018129 res!682757) b!1018130))

(declare-fun m!939141 () Bool)

(assert (=> b!1018130 m!939141))

(assert (=> start!88540 d!121799))

(declare-fun d!121807 () Bool)

(declare-fun isEmpty!919 (Option!632) Bool)

(assert (=> d!121807 (= (isDefined!428 (getValueByKey!581 l!1036 key!271)) (not (isEmpty!919 (getValueByKey!581 l!1036 key!271))))))

(declare-fun bs!29646 () Bool)

(assert (= bs!29646 d!121807))

(assert (=> bs!29646 m!939109))

(declare-fun m!939145 () Bool)

(assert (=> bs!29646 m!939145))

(assert (=> b!1018079 d!121807))

(declare-fun d!121810 () Bool)

(declare-fun c!103130 () Bool)

(assert (=> d!121810 (= c!103130 (and (is-Cons!21573 l!1036) (= (_1!7673 (h!22771 l!1036)) key!271)))))

(declare-fun e!572851 () Option!632)

(assert (=> d!121810 (= (getValueByKey!581 l!1036 key!271) e!572851)))

(declare-fun b!1018155 () Bool)

(assert (=> b!1018155 (= e!572851 (Some!631 (_2!7673 (h!22771 l!1036))))))

(declare-fun b!1018156 () Bool)

(declare-fun e!572852 () Option!632)

(assert (=> b!1018156 (= e!572851 e!572852)))

(declare-fun c!103131 () Bool)

(assert (=> b!1018156 (= c!103131 (and (is-Cons!21573 l!1036) (not (= (_1!7673 (h!22771 l!1036)) key!271))))))

(declare-fun b!1018157 () Bool)

(assert (=> b!1018157 (= e!572852 (getValueByKey!581 (t!30578 l!1036) key!271))))

(declare-fun b!1018158 () Bool)

(assert (=> b!1018158 (= e!572852 None!630)))

(assert (= (and d!121810 c!103130) b!1018155))

(assert (= (and d!121810 (not c!103130)) b!1018156))

(assert (= (and b!1018156 c!103131) b!1018157))

(assert (= (and b!1018156 (not c!103131)) b!1018158))

(declare-fun m!939147 () Bool)

(assert (=> b!1018157 m!939147))

(assert (=> b!1018079 d!121810))

(declare-fun b!1018171 () Bool)

(declare-fun e!572859 () Bool)

(declare-fun tp!70983 () Bool)

(assert (=> b!1018171 (= e!572859 (and tp_is_empty!23677 tp!70983))))

(assert (=> b!1018082 (= tp!70972 e!572859)))

(assert (= (and b!1018082 (is-Cons!21573 (t!30578 l!1036))) b!1018171))

(push 1)

(assert tp_is_empty!23677)

(assert (not b!1018171))

(assert (not b!1018157))

(assert (not b!1018117))

(assert (not b!1018130))

(assert (not d!121807))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!121817 () Bool)

(declare-fun c!103136 () Bool)

(assert (=> d!121817 (= c!103136 (and (is-Cons!21573 (t!30578 l!1036)) (= (_1!7673 (h!22771 (t!30578 l!1036))) key!271)))))

(declare-fun e!572878 () Option!632)

(assert (=> d!121817 (= (getValueByKey!581 (t!30578 l!1036) key!271) e!572878)))

(declare-fun b!1018194 () Bool)

(assert (=> b!1018194 (= e!572878 (Some!631 (_2!7673 (h!22771 (t!30578 l!1036)))))))

(declare-fun b!1018195 () Bool)

(declare-fun e!572879 () Option!632)

(assert (=> b!1018195 (= e!572878 e!572879)))

(declare-fun c!103137 () Bool)

(assert (=> b!1018195 (= c!103137 (and (is-Cons!21573 (t!30578 l!1036)) (not (= (_1!7673 (h!22771 (t!30578 l!1036))) key!271))))))

(declare-fun b!1018196 () Bool)

(assert (=> b!1018196 (= e!572879 (getValueByKey!581 (t!30578 (t!30578 l!1036)) key!271))))

(declare-fun b!1018197 () Bool)

(assert (=> b!1018197 (= e!572879 None!630)))

(assert (= (and d!121817 c!103136) b!1018194))

(assert (= (and d!121817 (not c!103136)) b!1018195))

(assert (= (and b!1018195 c!103137) b!1018196))

(assert (= (and b!1018195 (not c!103137)) b!1018197))

(declare-fun m!939157 () Bool)

(assert (=> b!1018196 m!939157))

(assert (=> b!1018157 d!121817))

(declare-fun d!121819 () Bool)

(assert (=> d!121819 (= (isEmpty!919 (getValueByKey!581 l!1036 key!271)) (not (is-Some!631 (getValueByKey!581 l!1036 key!271))))))

(assert (=> d!121807 d!121819))

(declare-fun d!121821 () Bool)

(declare-fun res!682770 () Bool)

(declare-fun e!572880 () Bool)

(assert (=> d!121821 (=> res!682770 e!572880)))

(assert (=> d!121821 (= res!682770 (and (is-Cons!21573 (t!30578 l!1036)) (= (_1!7673 (h!22771 (t!30578 l!1036))) key!271)))))

(assert (=> d!121821 (= (containsKey!508 (t!30578 l!1036) key!271) e!572880)))

(declare-fun b!1018198 () Bool)

(declare-fun e!572881 () Bool)

(assert (=> b!1018198 (= e!572880 e!572881)))

(declare-fun res!682771 () Bool)

(assert (=> b!1018198 (=> (not res!682771) (not e!572881))))

(assert (=> b!1018198 (= res!682771 (and (or (not (is-Cons!21573 (t!30578 l!1036))) (bvsle (_1!7673 (h!22771 (t!30578 l!1036))) key!271)) (is-Cons!21573 (t!30578 l!1036)) (bvslt (_1!7673 (h!22771 (t!30578 l!1036))) key!271)))))

(declare-fun b!1018199 () Bool)

(assert (=> b!1018199 (= e!572881 (containsKey!508 (t!30578 (t!30578 l!1036)) key!271))))

(assert (= (and d!121821 (not res!682770)) b!1018198))

(assert (= (and b!1018198 res!682771) b!1018199))

(declare-fun m!939159 () Bool)

(assert (=> b!1018199 m!939159))

(assert (=> b!1018117 d!121821))

(declare-fun d!121823 () Bool)

(declare-fun res!682772 () Bool)

(declare-fun e!572882 () Bool)

(assert (=> d!121823 (=> res!682772 e!572882)))

(assert (=> d!121823 (= res!682772 (or (is-Nil!21574 (t!30578 l!1036)) (is-Nil!21574 (t!30578 (t!30578 l!1036)))))))

(assert (=> d!121823 (= (isStrictlySorted!648 (t!30578 l!1036)) e!572882)))

(declare-fun b!1018200 () Bool)

(declare-fun e!572883 () Bool)

(assert (=> b!1018200 (= e!572882 e!572883)))

(declare-fun res!682773 () Bool)

(assert (=> b!1018200 (=> (not res!682773) (not e!572883))))

(assert (=> b!1018200 (= res!682773 (bvslt (_1!7673 (h!22771 (t!30578 l!1036))) (_1!7673 (h!22771 (t!30578 (t!30578 l!1036))))))))

(declare-fun b!1018201 () Bool)

(assert (=> b!1018201 (= e!572883 (isStrictlySorted!648 (t!30578 (t!30578 l!1036))))))

(assert (= (and d!121823 (not res!682772)) b!1018200))

(assert (= (and b!1018200 res!682773) b!1018201))

(declare-fun m!939161 () Bool)

(assert (=> b!1018201 m!939161))

(assert (=> b!1018130 d!121823))

(declare-fun b!1018202 () Bool)

(declare-fun e!572884 () Bool)

(declare-fun tp!70988 () Bool)

(assert (=> b!1018202 (= e!572884 (and tp_is_empty!23677 tp!70988))))

(assert (=> b!1018171 (= tp!70983 e!572884)))

(assert (= (and b!1018171 (is-Cons!21573 (t!30578 (t!30578 l!1036)))) b!1018202))

(push 1)

(assert tp_is_empty!23677)

(assert (not b!1018202))

(assert (not b!1018199))

(assert (not b!1018196))

(assert (not b!1018201))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

