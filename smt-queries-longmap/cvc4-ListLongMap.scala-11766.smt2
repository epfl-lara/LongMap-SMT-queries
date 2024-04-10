; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!138156 () Bool)

(assert start!138156)

(declare-fun res!1082591 () Bool)

(declare-fun e!884912 () Bool)

(assert (=> start!138156 (=> (not res!1082591) (not e!884912))))

(declare-datatypes ((B!2940 0))(
  ( (B!2941 (val!19832 Int)) )
))
(declare-datatypes ((tuple2!25832 0))(
  ( (tuple2!25833 (_1!12927 (_ BitVec 64)) (_2!12927 B!2940)) )
))
(declare-datatypes ((List!36952 0))(
  ( (Nil!36949) (Cons!36948 (h!38491 tuple2!25832) (t!51870 List!36952)) )
))
(declare-fun l!556 () List!36952)

(declare-fun isStrictlySorted!1177 (List!36952) Bool)

(assert (=> start!138156 (= res!1082591 (isStrictlySorted!1177 l!556))))

(assert (=> start!138156 e!884912))

(declare-fun e!884913 () Bool)

(assert (=> start!138156 e!884913))

(assert (=> start!138156 true))

(declare-fun b!1585074 () Bool)

(declare-fun res!1082590 () Bool)

(assert (=> b!1585074 (=> (not res!1082590) (not e!884912))))

(declare-fun newKey!21 () (_ BitVec 64))

(assert (=> b!1585074 (= res!1082590 (and (is-Cons!36948 l!556) (bvslt (_1!12927 (h!38491 l!556)) newKey!21)))))

(declare-fun b!1585075 () Bool)

(assert (=> b!1585075 (= e!884912 (not (isStrictlySorted!1177 (t!51870 l!556))))))

(declare-fun b!1585076 () Bool)

(declare-fun tp_is_empty!39473 () Bool)

(declare-fun tp!115167 () Bool)

(assert (=> b!1585076 (= e!884913 (and tp_is_empty!39473 tp!115167))))

(assert (= (and start!138156 res!1082591) b!1585074))

(assert (= (and b!1585074 res!1082590) b!1585075))

(assert (= (and start!138156 (is-Cons!36948 l!556)) b!1585076))

(declare-fun m!1454087 () Bool)

(assert (=> start!138156 m!1454087))

(declare-fun m!1454089 () Bool)

(assert (=> b!1585075 m!1454089))

(push 1)

(assert (not start!138156))

(assert (not b!1585075))

(assert (not b!1585076))

(assert tp_is_empty!39473)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!167619 () Bool)

(declare-fun res!1082612 () Bool)

(declare-fun e!884939 () Bool)

(assert (=> d!167619 (=> res!1082612 e!884939)))

(assert (=> d!167619 (= res!1082612 (or (is-Nil!36949 l!556) (is-Nil!36949 (t!51870 l!556))))))

(assert (=> d!167619 (= (isStrictlySorted!1177 l!556) e!884939)))

(declare-fun b!1585106 () Bool)

(declare-fun e!884940 () Bool)

(assert (=> b!1585106 (= e!884939 e!884940)))

(declare-fun res!1082613 () Bool)

(assert (=> b!1585106 (=> (not res!1082613) (not e!884940))))

(assert (=> b!1585106 (= res!1082613 (bvslt (_1!12927 (h!38491 l!556)) (_1!12927 (h!38491 (t!51870 l!556)))))))

(declare-fun b!1585107 () Bool)

(assert (=> b!1585107 (= e!884940 (isStrictlySorted!1177 (t!51870 l!556)))))

(assert (= (and d!167619 (not res!1082612)) b!1585106))

(assert (= (and b!1585106 res!1082613) b!1585107))

(assert (=> b!1585107 m!1454089))

(assert (=> start!138156 d!167619))

(declare-fun d!167623 () Bool)

(declare-fun res!1082614 () Bool)

(declare-fun e!884942 () Bool)

(assert (=> d!167623 (=> res!1082614 e!884942)))

(assert (=> d!167623 (= res!1082614 (or (is-Nil!36949 (t!51870 l!556)) (is-Nil!36949 (t!51870 (t!51870 l!556)))))))

(assert (=> d!167623 (= (isStrictlySorted!1177 (t!51870 l!556)) e!884942)))

