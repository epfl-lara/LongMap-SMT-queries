; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!138628 () Bool)

(assert start!138628)

(declare-fun res!1083614 () Bool)

(declare-fun e!886583 () Bool)

(assert (=> start!138628 (=> (not res!1083614) (not e!886583))))

(declare-datatypes ((B!2964 0))(
  ( (B!2965 (val!19844 Int)) )
))
(declare-datatypes ((tuple2!25916 0))(
  ( (tuple2!25917 (_1!12969 (_ BitVec 64)) (_2!12969 B!2964)) )
))
(declare-datatypes ((List!36996 0))(
  ( (Nil!36993) (Cons!36992 (h!38553 tuple2!25916) (t!51907 List!36996)) )
))
(declare-fun l!556 () List!36996)

(declare-fun isStrictlySorted!1177 (List!36996) Bool)

(assert (=> start!138628 (= res!1083614 (isStrictlySorted!1177 l!556))))

(assert (=> start!138628 e!886583))

(declare-fun e!886582 () Bool)

(assert (=> start!138628 e!886582))

(assert (=> start!138628 true))

(declare-fun tp_is_empty!39497 () Bool)

(assert (=> start!138628 tp_is_empty!39497))

(declare-fun b!1587736 () Bool)

(declare-fun res!1083615 () Bool)

(assert (=> b!1587736 (=> (not res!1083615) (not e!886583))))

(declare-fun newKey!21 () (_ BitVec 64))

(assert (=> b!1587736 (= res!1083615 (and (or (not (is-Cons!36992 l!556)) (bvsge (_1!12969 (h!38553 l!556)) newKey!21)) (or (not (is-Cons!36992 l!556)) (not (= (_1!12969 (h!38553 l!556)) newKey!21))) (or (not (is-Cons!36992 l!556)) (bvsle (_1!12969 (h!38553 l!556)) newKey!21)) (is-Nil!36993 l!556)))))

(declare-fun b!1587737 () Bool)

(assert (=> b!1587737 (= e!886583 false)))

(declare-fun lt!678261 () Bool)

(declare-fun newValue!21 () B!2964)

(declare-fun $colon$colon!1033 (List!36996 tuple2!25916) List!36996)

(assert (=> b!1587737 (= lt!678261 (isStrictlySorted!1177 ($colon$colon!1033 Nil!36993 (tuple2!25917 newKey!21 newValue!21))))))

(declare-fun b!1587738 () Bool)

(declare-fun tp!115213 () Bool)

(assert (=> b!1587738 (= e!886582 (and tp_is_empty!39497 tp!115213))))

(assert (= (and start!138628 res!1083614) b!1587736))

(assert (= (and b!1587736 res!1083615) b!1587737))

(assert (= (and start!138628 (is-Cons!36992 l!556)) b!1587738))

(declare-fun m!1456497 () Bool)

(assert (=> start!138628 m!1456497))

(declare-fun m!1456499 () Bool)

(assert (=> b!1587737 m!1456499))

(assert (=> b!1587737 m!1456499))

(declare-fun m!1456501 () Bool)

(assert (=> b!1587737 m!1456501))

(push 1)

(assert (not b!1587737))

(assert (not start!138628))

(assert (not b!1587738))

(assert tp_is_empty!39497)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

