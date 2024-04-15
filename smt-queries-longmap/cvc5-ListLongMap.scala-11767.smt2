; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!138132 () Bool)

(assert start!138132)

(declare-fun res!1082502 () Bool)

(declare-fun e!884762 () Bool)

(assert (=> start!138132 (=> (not res!1082502) (not e!884762))))

(declare-datatypes ((B!2946 0))(
  ( (B!2947 (val!19835 Int)) )
))
(declare-datatypes ((tuple2!25906 0))(
  ( (tuple2!25907 (_1!12964 (_ BitVec 64)) (_2!12964 B!2946)) )
))
(declare-datatypes ((List!36996 0))(
  ( (Nil!36993) (Cons!36992 (h!38536 tuple2!25906) (t!51906 List!36996)) )
))
(declare-fun l!556 () List!36996)

(declare-fun isStrictlySorted!1178 (List!36996) Bool)

(assert (=> start!138132 (= res!1082502 (isStrictlySorted!1178 l!556))))

(assert (=> start!138132 e!884762))

(declare-fun e!884763 () Bool)

(assert (=> start!138132 e!884763))

(assert (=> start!138132 true))

(declare-fun tp_is_empty!39479 () Bool)

(assert (=> start!138132 tp_is_empty!39479))

(declare-fun b!1584824 () Bool)

(declare-fun res!1082501 () Bool)

(assert (=> b!1584824 (=> (not res!1082501) (not e!884762))))

(declare-fun newKey!21 () (_ BitVec 64))

(assert (=> b!1584824 (= res!1082501 (and (is-Cons!36992 l!556) (bvslt (_1!12964 (h!38536 l!556)) newKey!21)))))

(declare-fun b!1584825 () Bool)

(assert (=> b!1584825 (= e!884762 false)))

(declare-fun newValue!21 () B!2946)

(declare-fun lt!677039 () Bool)

(declare-fun $colon$colon!1034 (List!36996 tuple2!25906) List!36996)

(declare-fun insertStrictlySorted!635 (List!36996 (_ BitVec 64) B!2946) List!36996)

(assert (=> b!1584825 (= lt!677039 (isStrictlySorted!1178 ($colon$colon!1034 (insertStrictlySorted!635 (t!51906 l!556) newKey!21 newValue!21) (h!38536 l!556))))))

(declare-fun b!1584826 () Bool)

(declare-fun tp!115185 () Bool)

(assert (=> b!1584826 (= e!884763 (and tp_is_empty!39479 tp!115185))))

(assert (= (and start!138132 res!1082502) b!1584824))

(assert (= (and b!1584824 res!1082501) b!1584825))

(assert (= (and start!138132 (is-Cons!36992 l!556)) b!1584826))

(declare-fun m!1453231 () Bool)

(assert (=> start!138132 m!1453231))

(declare-fun m!1453233 () Bool)

(assert (=> b!1584825 m!1453233))

(assert (=> b!1584825 m!1453233))

(declare-fun m!1453235 () Bool)

(assert (=> b!1584825 m!1453235))

(assert (=> b!1584825 m!1453235))

(declare-fun m!1453237 () Bool)

(assert (=> b!1584825 m!1453237))

(push 1)

(assert (not start!138132))

(assert (not b!1584825))

(assert (not b!1584826))

(assert tp_is_empty!39479)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

