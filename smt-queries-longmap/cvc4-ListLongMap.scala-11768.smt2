; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!138174 () Bool)

(assert start!138174)

(declare-fun res!1082650 () Bool)

(declare-fun e!884982 () Bool)

(assert (=> start!138174 (=> (not res!1082650) (not e!884982))))

(declare-datatypes ((B!2952 0))(
  ( (B!2953 (val!19838 Int)) )
))
(declare-datatypes ((tuple2!25844 0))(
  ( (tuple2!25845 (_1!12933 (_ BitVec 64)) (_2!12933 B!2952)) )
))
(declare-datatypes ((List!36958 0))(
  ( (Nil!36955) (Cons!36954 (h!38497 tuple2!25844) (t!51876 List!36958)) )
))
(declare-fun l!556 () List!36958)

(declare-fun isStrictlySorted!1183 (List!36958) Bool)

(assert (=> start!138174 (= res!1082650 (isStrictlySorted!1183 l!556))))

(assert (=> start!138174 e!884982))

(declare-fun e!884981 () Bool)

(assert (=> start!138174 e!884981))

(assert (=> start!138174 true))

(declare-fun tp_is_empty!39485 () Bool)

(assert (=> start!138174 tp_is_empty!39485))

(declare-fun b!1585167 () Bool)

(declare-fun res!1082651 () Bool)

(assert (=> b!1585167 (=> (not res!1082651) (not e!884982))))

(declare-fun newKey!21 () (_ BitVec 64))

(assert (=> b!1585167 (= res!1082651 (and (bvsge (_1!12933 (h!38497 l!556)) newKey!21) (is-Cons!36954 l!556) (= (_1!12933 (h!38497 l!556)) newKey!21)))))

(declare-fun b!1585168 () Bool)

(assert (=> b!1585168 (= e!884982 false)))

(declare-fun newValue!21 () B!2952)

(declare-fun lt!677331 () Bool)

(declare-fun $colon$colon!1033 (List!36958 tuple2!25844) List!36958)

(assert (=> b!1585168 (= lt!677331 (isStrictlySorted!1183 ($colon$colon!1033 (t!51876 l!556) (tuple2!25845 newKey!21 newValue!21))))))

(declare-fun b!1585169 () Bool)

(declare-fun tp!115194 () Bool)

(assert (=> b!1585169 (= e!884981 (and tp_is_empty!39485 tp!115194))))

(assert (= (and start!138174 res!1082650) b!1585167))

(assert (= (and b!1585167 res!1082651) b!1585168))

(assert (= (and start!138174 (is-Cons!36954 l!556)) b!1585169))

(declare-fun m!1454133 () Bool)

(assert (=> start!138174 m!1454133))

(declare-fun m!1454135 () Bool)

(assert (=> b!1585168 m!1454135))

(assert (=> b!1585168 m!1454135))

(declare-fun m!1454137 () Bool)

(assert (=> b!1585168 m!1454137))

(push 1)

(assert (not b!1585168))

(assert (not start!138174))

(assert (not b!1585169))

(assert tp_is_empty!39485)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

