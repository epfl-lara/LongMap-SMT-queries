; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!138170 () Bool)

(assert start!138170)

(declare-fun res!1082638 () Bool)

(declare-fun e!884969 () Bool)

(assert (=> start!138170 (=> (not res!1082638) (not e!884969))))

(declare-datatypes ((B!2948 0))(
  ( (B!2949 (val!19836 Int)) )
))
(declare-datatypes ((tuple2!25840 0))(
  ( (tuple2!25841 (_1!12931 (_ BitVec 64)) (_2!12931 B!2948)) )
))
(declare-datatypes ((List!36956 0))(
  ( (Nil!36953) (Cons!36952 (h!38495 tuple2!25840) (t!51874 List!36956)) )
))
(declare-fun l!556 () List!36956)

(declare-fun isStrictlySorted!1181 (List!36956) Bool)

(assert (=> start!138170 (= res!1082638 (isStrictlySorted!1181 l!556))))

(assert (=> start!138170 e!884969))

(declare-fun e!884970 () Bool)

(assert (=> start!138170 e!884970))

(assert (=> start!138170 true))

(declare-fun tp_is_empty!39481 () Bool)

(assert (=> start!138170 tp_is_empty!39481))

(declare-fun b!1585149 () Bool)

(declare-fun res!1082639 () Bool)

(assert (=> b!1585149 (=> (not res!1082639) (not e!884969))))

(declare-fun newKey!21 () (_ BitVec 64))

(assert (=> b!1585149 (= res!1082639 (and (bvsge (_1!12931 (h!38495 l!556)) newKey!21) (is-Cons!36952 l!556) (= (_1!12931 (h!38495 l!556)) newKey!21)))))

(declare-fun b!1585150 () Bool)

(assert (=> b!1585150 (= e!884969 false)))

(declare-fun newValue!21 () B!2948)

(declare-fun lt!677325 () Bool)

(declare-fun $colon$colon!1031 (List!36956 tuple2!25840) List!36956)

(assert (=> b!1585150 (= lt!677325 (isStrictlySorted!1181 ($colon$colon!1031 (t!51874 l!556) (tuple2!25841 newKey!21 newValue!21))))))

(declare-fun b!1585151 () Bool)

(declare-fun tp!115188 () Bool)

(assert (=> b!1585151 (= e!884970 (and tp_is_empty!39481 tp!115188))))

(assert (= (and start!138170 res!1082638) b!1585149))

(assert (= (and b!1585149 res!1082639) b!1585150))

(assert (= (and start!138170 (is-Cons!36952 l!556)) b!1585151))

(declare-fun m!1454121 () Bool)

(assert (=> start!138170 m!1454121))

(declare-fun m!1454123 () Bool)

(assert (=> b!1585150 m!1454123))

(assert (=> b!1585150 m!1454123))

(declare-fun m!1454125 () Bool)

(assert (=> b!1585150 m!1454125))

(push 1)

(assert (not b!1585150))

(assert (not start!138170))

(assert (not b!1585151))

(assert tp_is_empty!39481)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

