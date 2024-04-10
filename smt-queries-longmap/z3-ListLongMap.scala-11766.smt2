; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!138154 () Bool)

(assert start!138154)

(declare-fun res!1082584 () Bool)

(declare-fun e!884907 () Bool)

(assert (=> start!138154 (=> (not res!1082584) (not e!884907))))

(declare-datatypes ((B!2938 0))(
  ( (B!2939 (val!19831 Int)) )
))
(declare-datatypes ((tuple2!25830 0))(
  ( (tuple2!25831 (_1!12926 (_ BitVec 64)) (_2!12926 B!2938)) )
))
(declare-datatypes ((List!36951 0))(
  ( (Nil!36948) (Cons!36947 (h!38490 tuple2!25830) (t!51869 List!36951)) )
))
(declare-fun l!556 () List!36951)

(declare-fun isStrictlySorted!1176 (List!36951) Bool)

(assert (=> start!138154 (= res!1082584 (isStrictlySorted!1176 l!556))))

(assert (=> start!138154 e!884907))

(declare-fun e!884906 () Bool)

(assert (=> start!138154 e!884906))

(assert (=> start!138154 true))

(declare-fun b!1585065 () Bool)

(declare-fun res!1082585 () Bool)

(assert (=> b!1585065 (=> (not res!1082585) (not e!884907))))

(declare-fun newKey!21 () (_ BitVec 64))

(get-info :version)

(assert (=> b!1585065 (= res!1082585 (and ((_ is Cons!36947) l!556) (bvslt (_1!12926 (h!38490 l!556)) newKey!21)))))

(declare-fun b!1585066 () Bool)

(assert (=> b!1585066 (= e!884907 (not (isStrictlySorted!1176 (t!51869 l!556))))))

(declare-fun b!1585067 () Bool)

(declare-fun tp_is_empty!39471 () Bool)

(declare-fun tp!115164 () Bool)

(assert (=> b!1585067 (= e!884906 (and tp_is_empty!39471 tp!115164))))

(assert (= (and start!138154 res!1082584) b!1585065))

(assert (= (and b!1585065 res!1082585) b!1585066))

(assert (= (and start!138154 ((_ is Cons!36947) l!556)) b!1585067))

(declare-fun m!1454083 () Bool)

(assert (=> start!138154 m!1454083))

(declare-fun m!1454085 () Bool)

(assert (=> b!1585066 m!1454085))

(check-sat (not b!1585066) (not start!138154) (not b!1585067) tp_is_empty!39471)
(check-sat)
(get-model)

(declare-fun d!167613 () Bool)

(declare-fun res!1082596 () Bool)

(declare-fun e!884918 () Bool)

(assert (=> d!167613 (=> res!1082596 e!884918)))

(assert (=> d!167613 (= res!1082596 (or ((_ is Nil!36948) (t!51869 l!556)) ((_ is Nil!36948) (t!51869 (t!51869 l!556)))))))

(assert (=> d!167613 (= (isStrictlySorted!1176 (t!51869 l!556)) e!884918)))

(declare-fun b!1585081 () Bool)

(declare-fun e!884919 () Bool)

(assert (=> b!1585081 (= e!884918 e!884919)))

(declare-fun res!1082597 () Bool)

(assert (=> b!1585081 (=> (not res!1082597) (not e!884919))))

(assert (=> b!1585081 (= res!1082597 (bvslt (_1!12926 (h!38490 (t!51869 l!556))) (_1!12926 (h!38490 (t!51869 (t!51869 l!556))))))))

(declare-fun b!1585082 () Bool)

(assert (=> b!1585082 (= e!884919 (isStrictlySorted!1176 (t!51869 (t!51869 l!556))))))

(assert (= (and d!167613 (not res!1082596)) b!1585081))

(assert (= (and b!1585081 res!1082597) b!1585082))

(declare-fun m!1454091 () Bool)

(assert (=> b!1585082 m!1454091))

(assert (=> b!1585066 d!167613))

(declare-fun d!167615 () Bool)

(declare-fun res!1082598 () Bool)

(declare-fun e!884920 () Bool)

(assert (=> d!167615 (=> res!1082598 e!884920)))

(assert (=> d!167615 (= res!1082598 (or ((_ is Nil!36948) l!556) ((_ is Nil!36948) (t!51869 l!556))))))

(assert (=> d!167615 (= (isStrictlySorted!1176 l!556) e!884920)))

(declare-fun b!1585083 () Bool)

(declare-fun e!884921 () Bool)

(assert (=> b!1585083 (= e!884920 e!884921)))

(declare-fun res!1082599 () Bool)

(assert (=> b!1585083 (=> (not res!1082599) (not e!884921))))

(assert (=> b!1585083 (= res!1082599 (bvslt (_1!12926 (h!38490 l!556)) (_1!12926 (h!38490 (t!51869 l!556)))))))

(declare-fun b!1585084 () Bool)

(assert (=> b!1585084 (= e!884921 (isStrictlySorted!1176 (t!51869 l!556)))))

(assert (= (and d!167615 (not res!1082598)) b!1585083))

(assert (= (and b!1585083 res!1082599) b!1585084))

(assert (=> b!1585084 m!1454085))

(assert (=> start!138154 d!167615))

(declare-fun b!1585089 () Bool)

(declare-fun e!884924 () Bool)

(declare-fun tp!115170 () Bool)

(assert (=> b!1585089 (= e!884924 (and tp_is_empty!39471 tp!115170))))

(assert (=> b!1585067 (= tp!115164 e!884924)))

(assert (= (and b!1585067 ((_ is Cons!36947) (t!51869 l!556))) b!1585089))

(check-sat (not b!1585084) (not b!1585082) (not b!1585089) tp_is_empty!39471)
(check-sat)
