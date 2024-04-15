; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!138144 () Bool)

(assert start!138144)

(declare-fun res!1082538 () Bool)

(declare-fun e!884799 () Bool)

(assert (=> start!138144 (=> (not res!1082538) (not e!884799))))

(declare-datatypes ((B!2958 0))(
  ( (B!2959 (val!19841 Int)) )
))
(declare-datatypes ((tuple2!25918 0))(
  ( (tuple2!25919 (_1!12970 (_ BitVec 64)) (_2!12970 B!2958)) )
))
(declare-datatypes ((List!37002 0))(
  ( (Nil!36999) (Cons!36998 (h!38542 tuple2!25918) (t!51912 List!37002)) )
))
(declare-fun l!556 () List!37002)

(declare-fun isStrictlySorted!1184 (List!37002) Bool)

(assert (=> start!138144 (= res!1082538 (isStrictlySorted!1184 l!556))))

(assert (=> start!138144 e!884799))

(declare-fun e!884798 () Bool)

(assert (=> start!138144 e!884798))

(assert (=> start!138144 true))

(declare-fun tp_is_empty!39491 () Bool)

(assert (=> start!138144 tp_is_empty!39491))

(declare-fun b!1584878 () Bool)

(declare-fun res!1082537 () Bool)

(assert (=> b!1584878 (=> (not res!1082537) (not e!884799))))

(declare-fun newKey!21 () (_ BitVec 64))

(assert (=> b!1584878 (= res!1082537 (and (or (not (is-Cons!36998 l!556)) (bvsge (_1!12970 (h!38542 l!556)) newKey!21)) (not (= (_1!12970 (h!38542 l!556)) newKey!21)) (is-Cons!36998 l!556) (bvsgt (_1!12970 (h!38542 l!556)) newKey!21)))))

(declare-fun b!1584879 () Bool)

(assert (=> b!1584879 (= e!884799 false)))

(declare-fun newValue!21 () B!2958)

(declare-fun lt!677057 () Bool)

(declare-fun $colon$colon!1040 (List!37002 tuple2!25918) List!37002)

(assert (=> b!1584879 (= lt!677057 (isStrictlySorted!1184 ($colon$colon!1040 l!556 (tuple2!25919 newKey!21 newValue!21))))))

(declare-fun b!1584880 () Bool)

(declare-fun tp!115203 () Bool)

(assert (=> b!1584880 (= e!884798 (and tp_is_empty!39491 tp!115203))))

(assert (= (and start!138144 res!1082538) b!1584878))

(assert (= (and b!1584878 res!1082537) b!1584879))

(assert (= (and start!138144 (is-Cons!36998 l!556)) b!1584880))

(declare-fun m!1453269 () Bool)

(assert (=> start!138144 m!1453269))

(declare-fun m!1453271 () Bool)

(assert (=> b!1584879 m!1453271))

(assert (=> b!1584879 m!1453271))

(declare-fun m!1453273 () Bool)

(assert (=> b!1584879 m!1453273))

(push 1)

(assert (not b!1584879))

(assert (not start!138144))

(assert (not b!1584880))

(assert tp_is_empty!39491)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

