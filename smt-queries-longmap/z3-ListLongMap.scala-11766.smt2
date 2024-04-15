; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!138116 () Bool)

(assert start!138116)

(declare-fun res!1082447 () Bool)

(declare-fun e!884699 () Bool)

(assert (=> start!138116 (=> (not res!1082447) (not e!884699))))

(declare-datatypes ((B!2936 0))(
  ( (B!2937 (val!19830 Int)) )
))
(declare-datatypes ((tuple2!25896 0))(
  ( (tuple2!25897 (_1!12959 (_ BitVec 64)) (_2!12959 B!2936)) )
))
(declare-datatypes ((List!36991 0))(
  ( (Nil!36988) (Cons!36987 (h!38531 tuple2!25896) (t!51901 List!36991)) )
))
(declare-fun l!556 () List!36991)

(declare-fun isStrictlySorted!1173 (List!36991) Bool)

(assert (=> start!138116 (= res!1082447 (isStrictlySorted!1173 l!556))))

(assert (=> start!138116 e!884699))

(declare-fun e!884700 () Bool)

(assert (=> start!138116 e!884700))

(assert (=> start!138116 true))

(declare-fun b!1584740 () Bool)

(declare-fun res!1082448 () Bool)

(assert (=> b!1584740 (=> (not res!1082448) (not e!884699))))

(declare-fun newKey!21 () (_ BitVec 64))

(get-info :version)

(assert (=> b!1584740 (= res!1082448 (and ((_ is Cons!36987) l!556) (bvslt (_1!12959 (h!38531 l!556)) newKey!21)))))

(declare-fun b!1584741 () Bool)

(assert (=> b!1584741 (= e!884699 (not (isStrictlySorted!1173 (t!51901 l!556))))))

(declare-fun b!1584742 () Bool)

(declare-fun tp_is_empty!39469 () Bool)

(declare-fun tp!115161 () Bool)

(assert (=> b!1584742 (= e!884700 (and tp_is_empty!39469 tp!115161))))

(assert (= (and start!138116 res!1082447) b!1584740))

(assert (= (and b!1584740 res!1082448) b!1584741))

(assert (= (and start!138116 ((_ is Cons!36987) l!556)) b!1584742))

(declare-fun m!1453197 () Bool)

(assert (=> start!138116 m!1453197))

(declare-fun m!1453199 () Bool)

(assert (=> b!1584741 m!1453199))

(check-sat (not b!1584741) (not start!138116) (not b!1584742) tp_is_empty!39469)
(check-sat)
(get-model)

(declare-fun d!167371 () Bool)

(declare-fun res!1082465 () Bool)

(declare-fun e!884717 () Bool)

(assert (=> d!167371 (=> res!1082465 e!884717)))

(assert (=> d!167371 (= res!1082465 (or ((_ is Nil!36988) (t!51901 l!556)) ((_ is Nil!36988) (t!51901 (t!51901 l!556)))))))

(assert (=> d!167371 (= (isStrictlySorted!1173 (t!51901 l!556)) e!884717)))

(declare-fun b!1584765 () Bool)

(declare-fun e!884718 () Bool)

(assert (=> b!1584765 (= e!884717 e!884718)))

(declare-fun res!1082466 () Bool)

(assert (=> b!1584765 (=> (not res!1082466) (not e!884718))))

(assert (=> b!1584765 (= res!1082466 (bvslt (_1!12959 (h!38531 (t!51901 l!556))) (_1!12959 (h!38531 (t!51901 (t!51901 l!556))))))))

(declare-fun b!1584766 () Bool)

(assert (=> b!1584766 (= e!884718 (isStrictlySorted!1173 (t!51901 (t!51901 l!556))))))

(assert (= (and d!167371 (not res!1082465)) b!1584765))

(assert (= (and b!1584765 res!1082466) b!1584766))

(declare-fun m!1453209 () Bool)

(assert (=> b!1584766 m!1453209))

(assert (=> b!1584741 d!167371))

(declare-fun d!167373 () Bool)

(declare-fun res!1082467 () Bool)

(declare-fun e!884719 () Bool)

(assert (=> d!167373 (=> res!1082467 e!884719)))

(assert (=> d!167373 (= res!1082467 (or ((_ is Nil!36988) l!556) ((_ is Nil!36988) (t!51901 l!556))))))

(assert (=> d!167373 (= (isStrictlySorted!1173 l!556) e!884719)))

(declare-fun b!1584767 () Bool)

(declare-fun e!884720 () Bool)

(assert (=> b!1584767 (= e!884719 e!884720)))

(declare-fun res!1082468 () Bool)

(assert (=> b!1584767 (=> (not res!1082468) (not e!884720))))

(assert (=> b!1584767 (= res!1082468 (bvslt (_1!12959 (h!38531 l!556)) (_1!12959 (h!38531 (t!51901 l!556)))))))

(declare-fun b!1584768 () Bool)

(assert (=> b!1584768 (= e!884720 (isStrictlySorted!1173 (t!51901 l!556)))))

(assert (= (and d!167373 (not res!1082467)) b!1584767))

(assert (= (and b!1584767 res!1082468) b!1584768))

(assert (=> b!1584768 m!1453199))

(assert (=> start!138116 d!167373))

(declare-fun b!1584773 () Bool)

(declare-fun e!884723 () Bool)

(declare-fun tp!115170 () Bool)

(assert (=> b!1584773 (= e!884723 (and tp_is_empty!39469 tp!115170))))

(assert (=> b!1584742 (= tp!115161 e!884723)))

(assert (= (and b!1584742 ((_ is Cons!36987) (t!51901 l!556))) b!1584773))

(check-sat (not b!1584768) (not b!1584766) (not b!1584773) tp_is_empty!39469)
(check-sat)
