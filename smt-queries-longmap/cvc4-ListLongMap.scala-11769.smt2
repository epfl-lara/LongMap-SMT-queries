; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!138180 () Bool)

(assert start!138180)

(declare-fun res!1082668 () Bool)

(declare-fun e!884999 () Bool)

(assert (=> start!138180 (=> (not res!1082668) (not e!884999))))

(declare-datatypes ((B!2958 0))(
  ( (B!2959 (val!19841 Int)) )
))
(declare-datatypes ((tuple2!25850 0))(
  ( (tuple2!25851 (_1!12936 (_ BitVec 64)) (_2!12936 B!2958)) )
))
(declare-datatypes ((List!36961 0))(
  ( (Nil!36958) (Cons!36957 (h!38500 tuple2!25850) (t!51879 List!36961)) )
))
(declare-fun l!556 () List!36961)

(declare-fun isStrictlySorted!1186 (List!36961) Bool)

(assert (=> start!138180 (= res!1082668 (isStrictlySorted!1186 l!556))))

(assert (=> start!138180 e!884999))

(declare-fun e!885000 () Bool)

(assert (=> start!138180 e!885000))

(assert (=> start!138180 true))

(declare-fun tp_is_empty!39491 () Bool)

(assert (=> start!138180 tp_is_empty!39491))

(declare-fun b!1585194 () Bool)

(declare-fun res!1082669 () Bool)

(assert (=> b!1585194 (=> (not res!1082669) (not e!884999))))

(declare-fun newKey!21 () (_ BitVec 64))

(assert (=> b!1585194 (= res!1082669 (and (or (not (is-Cons!36957 l!556)) (bvsge (_1!12936 (h!38500 l!556)) newKey!21)) (not (= (_1!12936 (h!38500 l!556)) newKey!21)) (is-Cons!36957 l!556) (bvsgt (_1!12936 (h!38500 l!556)) newKey!21)))))

(declare-fun b!1585195 () Bool)

(assert (=> b!1585195 (= e!884999 false)))

(declare-fun newValue!21 () B!2958)

(declare-fun lt!677340 () Bool)

(declare-fun $colon$colon!1036 (List!36961 tuple2!25850) List!36961)

(assert (=> b!1585195 (= lt!677340 (isStrictlySorted!1186 ($colon$colon!1036 l!556 (tuple2!25851 newKey!21 newValue!21))))))

(declare-fun b!1585196 () Bool)

(declare-fun tp!115203 () Bool)

(assert (=> b!1585196 (= e!885000 (and tp_is_empty!39491 tp!115203))))

(assert (= (and start!138180 res!1082668) b!1585194))

(assert (= (and b!1585194 res!1082669) b!1585195))

(assert (= (and start!138180 (is-Cons!36957 l!556)) b!1585196))

(declare-fun m!1454151 () Bool)

(assert (=> start!138180 m!1454151))

(declare-fun m!1454153 () Bool)

(assert (=> b!1585195 m!1454153))

(assert (=> b!1585195 m!1454153))

(declare-fun m!1454155 () Bool)

(assert (=> b!1585195 m!1454155))

(push 1)

(assert (not b!1585195))

(assert (not start!138180))

(assert (not b!1585196))

(assert tp_is_empty!39491)

(check-sat)

(pop 1)

