; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!138176 () Bool)

(assert start!138176)

(declare-fun res!1082657 () Bool)

(declare-fun e!884987 () Bool)

(assert (=> start!138176 (=> (not res!1082657) (not e!884987))))

(declare-datatypes ((B!2954 0))(
  ( (B!2955 (val!19839 Int)) )
))
(declare-datatypes ((tuple2!25846 0))(
  ( (tuple2!25847 (_1!12934 (_ BitVec 64)) (_2!12934 B!2954)) )
))
(declare-datatypes ((List!36959 0))(
  ( (Nil!36956) (Cons!36955 (h!38498 tuple2!25846) (t!51877 List!36959)) )
))
(declare-fun l!556 () List!36959)

(declare-fun isStrictlySorted!1184 (List!36959) Bool)

(assert (=> start!138176 (= res!1082657 (isStrictlySorted!1184 l!556))))

(assert (=> start!138176 e!884987))

(declare-fun e!884988 () Bool)

(assert (=> start!138176 e!884988))

(assert (=> start!138176 true))

(declare-fun tp_is_empty!39487 () Bool)

(assert (=> start!138176 tp_is_empty!39487))

(declare-fun b!1585176 () Bool)

(declare-fun res!1082656 () Bool)

(assert (=> b!1585176 (=> (not res!1082656) (not e!884987))))

(declare-fun newKey!21 () (_ BitVec 64))

(assert (=> b!1585176 (= res!1082656 (and (or (not (is-Cons!36955 l!556)) (bvsge (_1!12934 (h!38498 l!556)) newKey!21)) (not (= (_1!12934 (h!38498 l!556)) newKey!21)) (is-Cons!36955 l!556) (bvsgt (_1!12934 (h!38498 l!556)) newKey!21)))))

(declare-fun b!1585177 () Bool)

(assert (=> b!1585177 (= e!884987 false)))

(declare-fun lt!677334 () Bool)

(declare-fun newValue!21 () B!2954)

(declare-fun $colon$colon!1034 (List!36959 tuple2!25846) List!36959)

(assert (=> b!1585177 (= lt!677334 (isStrictlySorted!1184 ($colon$colon!1034 l!556 (tuple2!25847 newKey!21 newValue!21))))))

(declare-fun b!1585178 () Bool)

(declare-fun tp!115197 () Bool)

(assert (=> b!1585178 (= e!884988 (and tp_is_empty!39487 tp!115197))))

(assert (= (and start!138176 res!1082657) b!1585176))

(assert (= (and b!1585176 res!1082656) b!1585177))

(assert (= (and start!138176 (is-Cons!36955 l!556)) b!1585178))

(declare-fun m!1454139 () Bool)

(assert (=> start!138176 m!1454139))

(declare-fun m!1454141 () Bool)

(assert (=> b!1585177 m!1454141))

(assert (=> b!1585177 m!1454141))

(declare-fun m!1454143 () Bool)

(assert (=> b!1585177 m!1454143))

(push 1)

(assert (not b!1585177))

(assert (not start!138176))

(assert (not b!1585178))

(assert tp_is_empty!39487)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

