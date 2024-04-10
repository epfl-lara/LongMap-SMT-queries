; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!138168 () Bool)

(assert start!138168)

(declare-fun res!1082632 () Bool)

(declare-fun e!884964 () Bool)

(assert (=> start!138168 (=> (not res!1082632) (not e!884964))))

(declare-datatypes ((B!2946 0))(
  ( (B!2947 (val!19835 Int)) )
))
(declare-datatypes ((tuple2!25838 0))(
  ( (tuple2!25839 (_1!12930 (_ BitVec 64)) (_2!12930 B!2946)) )
))
(declare-datatypes ((List!36955 0))(
  ( (Nil!36952) (Cons!36951 (h!38494 tuple2!25838) (t!51873 List!36955)) )
))
(declare-fun l!556 () List!36955)

(declare-fun isStrictlySorted!1180 (List!36955) Bool)

(assert (=> start!138168 (= res!1082632 (isStrictlySorted!1180 l!556))))

(assert (=> start!138168 e!884964))

(declare-fun e!884963 () Bool)

(assert (=> start!138168 e!884963))

(assert (=> start!138168 true))

(declare-fun tp_is_empty!39479 () Bool)

(assert (=> start!138168 tp_is_empty!39479))

(declare-fun b!1585140 () Bool)

(declare-fun res!1082633 () Bool)

(assert (=> b!1585140 (=> (not res!1082633) (not e!884964))))

(declare-fun newKey!21 () (_ BitVec 64))

(assert (=> b!1585140 (= res!1082633 (and (is-Cons!36951 l!556) (bvslt (_1!12930 (h!38494 l!556)) newKey!21)))))

(declare-fun b!1585141 () Bool)

(assert (=> b!1585141 (= e!884964 false)))

(declare-fun newValue!21 () B!2946)

(declare-fun lt!677322 () Bool)

(declare-fun $colon$colon!1030 (List!36955 tuple2!25838) List!36955)

(declare-fun insertStrictlySorted!634 (List!36955 (_ BitVec 64) B!2946) List!36955)

(assert (=> b!1585141 (= lt!677322 (isStrictlySorted!1180 ($colon$colon!1030 (insertStrictlySorted!634 (t!51873 l!556) newKey!21 newValue!21) (h!38494 l!556))))))

(declare-fun b!1585142 () Bool)

(declare-fun tp!115185 () Bool)

(assert (=> b!1585142 (= e!884963 (and tp_is_empty!39479 tp!115185))))

(assert (= (and start!138168 res!1082632) b!1585140))

(assert (= (and b!1585140 res!1082633) b!1585141))

(assert (= (and start!138168 (is-Cons!36951 l!556)) b!1585142))

(declare-fun m!1454113 () Bool)

(assert (=> start!138168 m!1454113))

(declare-fun m!1454115 () Bool)

(assert (=> b!1585141 m!1454115))

(assert (=> b!1585141 m!1454115))

(declare-fun m!1454117 () Bool)

(assert (=> b!1585141 m!1454117))

(assert (=> b!1585141 m!1454117))

(declare-fun m!1454119 () Bool)

(assert (=> b!1585141 m!1454119))

(push 1)

(assert (not b!1585141))

(assert (not start!138168))

(assert (not b!1585142))

(assert tp_is_empty!39479)

(check-sat)

