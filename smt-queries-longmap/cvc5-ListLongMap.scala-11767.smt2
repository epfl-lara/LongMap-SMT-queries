; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!138164 () Bool)

(assert start!138164)

(declare-fun res!1082621 () Bool)

(declare-fun e!884951 () Bool)

(assert (=> start!138164 (=> (not res!1082621) (not e!884951))))

(declare-datatypes ((B!2942 0))(
  ( (B!2943 (val!19833 Int)) )
))
(declare-datatypes ((tuple2!25834 0))(
  ( (tuple2!25835 (_1!12928 (_ BitVec 64)) (_2!12928 B!2942)) )
))
(declare-datatypes ((List!36953 0))(
  ( (Nil!36950) (Cons!36949 (h!38492 tuple2!25834) (t!51871 List!36953)) )
))
(declare-fun l!556 () List!36953)

(declare-fun isStrictlySorted!1178 (List!36953) Bool)

(assert (=> start!138164 (= res!1082621 (isStrictlySorted!1178 l!556))))

(assert (=> start!138164 e!884951))

(declare-fun e!884952 () Bool)

(assert (=> start!138164 e!884952))

(assert (=> start!138164 true))

(declare-fun tp_is_empty!39475 () Bool)

(assert (=> start!138164 tp_is_empty!39475))

(declare-fun b!1585122 () Bool)

(declare-fun res!1082620 () Bool)

(assert (=> b!1585122 (=> (not res!1082620) (not e!884951))))

(declare-fun newKey!21 () (_ BitVec 64))

(assert (=> b!1585122 (= res!1082620 (and (is-Cons!36949 l!556) (bvslt (_1!12928 (h!38492 l!556)) newKey!21)))))

(declare-fun b!1585123 () Bool)

(assert (=> b!1585123 (= e!884951 false)))

(declare-fun newValue!21 () B!2942)

(declare-fun lt!677316 () Bool)

(declare-fun $colon$colon!1028 (List!36953 tuple2!25834) List!36953)

(declare-fun insertStrictlySorted!632 (List!36953 (_ BitVec 64) B!2942) List!36953)

(assert (=> b!1585123 (= lt!677316 (isStrictlySorted!1178 ($colon$colon!1028 (insertStrictlySorted!632 (t!51871 l!556) newKey!21 newValue!21) (h!38492 l!556))))))

(declare-fun b!1585124 () Bool)

(declare-fun tp!115179 () Bool)

(assert (=> b!1585124 (= e!884952 (and tp_is_empty!39475 tp!115179))))

(assert (= (and start!138164 res!1082621) b!1585122))

(assert (= (and b!1585122 res!1082620) b!1585123))

(assert (= (and start!138164 (is-Cons!36949 l!556)) b!1585124))

(declare-fun m!1454097 () Bool)

(assert (=> start!138164 m!1454097))

(declare-fun m!1454099 () Bool)

(assert (=> b!1585123 m!1454099))

(assert (=> b!1585123 m!1454099))

(declare-fun m!1454101 () Bool)

(assert (=> b!1585123 m!1454101))

(assert (=> b!1585123 m!1454101))

(declare-fun m!1454103 () Bool)

(assert (=> b!1585123 m!1454103))

(push 1)

(assert (not b!1585123))

(assert (not start!138164))

(assert (not b!1585124))

(assert tp_is_empty!39475)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

