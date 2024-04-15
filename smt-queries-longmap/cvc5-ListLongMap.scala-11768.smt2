; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!138138 () Bool)

(assert start!138138)

(declare-fun res!1082519 () Bool)

(declare-fun e!884780 () Bool)

(assert (=> start!138138 (=> (not res!1082519) (not e!884780))))

(declare-datatypes ((B!2952 0))(
  ( (B!2953 (val!19838 Int)) )
))
(declare-datatypes ((tuple2!25912 0))(
  ( (tuple2!25913 (_1!12967 (_ BitVec 64)) (_2!12967 B!2952)) )
))
(declare-datatypes ((List!36999 0))(
  ( (Nil!36996) (Cons!36995 (h!38539 tuple2!25912) (t!51909 List!36999)) )
))
(declare-fun l!556 () List!36999)

(declare-fun isStrictlySorted!1181 (List!36999) Bool)

(assert (=> start!138138 (= res!1082519 (isStrictlySorted!1181 l!556))))

(assert (=> start!138138 e!884780))

(declare-fun e!884781 () Bool)

(assert (=> start!138138 e!884781))

(assert (=> start!138138 true))

(declare-fun tp_is_empty!39485 () Bool)

(assert (=> start!138138 tp_is_empty!39485))

(declare-fun b!1584851 () Bool)

(declare-fun res!1082520 () Bool)

(assert (=> b!1584851 (=> (not res!1082520) (not e!884780))))

(declare-fun newKey!21 () (_ BitVec 64))

(assert (=> b!1584851 (= res!1082520 (and (bvsge (_1!12967 (h!38539 l!556)) newKey!21) (is-Cons!36995 l!556) (= (_1!12967 (h!38539 l!556)) newKey!21)))))

(declare-fun b!1584852 () Bool)

(assert (=> b!1584852 (= e!884780 false)))

(declare-fun newValue!21 () B!2952)

(declare-fun lt!677048 () Bool)

(declare-fun $colon$colon!1037 (List!36999 tuple2!25912) List!36999)

(assert (=> b!1584852 (= lt!677048 (isStrictlySorted!1181 ($colon$colon!1037 (t!51909 l!556) (tuple2!25913 newKey!21 newValue!21))))))

(declare-fun b!1584853 () Bool)

(declare-fun tp!115194 () Bool)

(assert (=> b!1584853 (= e!884781 (and tp_is_empty!39485 tp!115194))))

(assert (= (and start!138138 res!1082519) b!1584851))

(assert (= (and b!1584851 res!1082520) b!1584852))

(assert (= (and start!138138 (is-Cons!36995 l!556)) b!1584853))

(declare-fun m!1453251 () Bool)

(assert (=> start!138138 m!1453251))

(declare-fun m!1453253 () Bool)

(assert (=> b!1584852 m!1453253))

(assert (=> b!1584852 m!1453253))

(declare-fun m!1453255 () Bool)

(assert (=> b!1584852 m!1453255))

(push 1)

(assert (not b!1584852))

(assert (not start!138138))

(assert (not b!1584853))

(assert tp_is_empty!39485)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

