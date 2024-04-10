; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!138166 () Bool)

(assert start!138166)

(declare-fun res!1082627 () Bool)

(declare-fun e!884957 () Bool)

(assert (=> start!138166 (=> (not res!1082627) (not e!884957))))

(declare-datatypes ((B!2944 0))(
  ( (B!2945 (val!19834 Int)) )
))
(declare-datatypes ((tuple2!25836 0))(
  ( (tuple2!25837 (_1!12929 (_ BitVec 64)) (_2!12929 B!2944)) )
))
(declare-datatypes ((List!36954 0))(
  ( (Nil!36951) (Cons!36950 (h!38493 tuple2!25836) (t!51872 List!36954)) )
))
(declare-fun l!556 () List!36954)

(declare-fun isStrictlySorted!1179 (List!36954) Bool)

(assert (=> start!138166 (= res!1082627 (isStrictlySorted!1179 l!556))))

(assert (=> start!138166 e!884957))

(declare-fun e!884958 () Bool)

(assert (=> start!138166 e!884958))

(assert (=> start!138166 true))

(declare-fun tp_is_empty!39477 () Bool)

(assert (=> start!138166 tp_is_empty!39477))

(declare-fun b!1585131 () Bool)

(declare-fun res!1082626 () Bool)

(assert (=> b!1585131 (=> (not res!1082626) (not e!884957))))

(declare-fun newKey!21 () (_ BitVec 64))

(get-info :version)

(assert (=> b!1585131 (= res!1082626 (and ((_ is Cons!36950) l!556) (bvslt (_1!12929 (h!38493 l!556)) newKey!21)))))

(declare-fun b!1585132 () Bool)

(assert (=> b!1585132 (= e!884957 false)))

(declare-fun newValue!21 () B!2944)

(declare-fun lt!677319 () Bool)

(declare-fun $colon$colon!1029 (List!36954 tuple2!25836) List!36954)

(declare-fun insertStrictlySorted!633 (List!36954 (_ BitVec 64) B!2944) List!36954)

(assert (=> b!1585132 (= lt!677319 (isStrictlySorted!1179 ($colon$colon!1029 (insertStrictlySorted!633 (t!51872 l!556) newKey!21 newValue!21) (h!38493 l!556))))))

(declare-fun b!1585133 () Bool)

(declare-fun tp!115182 () Bool)

(assert (=> b!1585133 (= e!884958 (and tp_is_empty!39477 tp!115182))))

(assert (= (and start!138166 res!1082627) b!1585131))

(assert (= (and b!1585131 res!1082626) b!1585132))

(assert (= (and start!138166 ((_ is Cons!36950) l!556)) b!1585133))

(declare-fun m!1454105 () Bool)

(assert (=> start!138166 m!1454105))

(declare-fun m!1454107 () Bool)

(assert (=> b!1585132 m!1454107))

(assert (=> b!1585132 m!1454107))

(declare-fun m!1454109 () Bool)

(assert (=> b!1585132 m!1454109))

(assert (=> b!1585132 m!1454109))

(declare-fun m!1454111 () Bool)

(assert (=> b!1585132 m!1454111))

(check-sat (not b!1585132) (not start!138166) (not b!1585133) tp_is_empty!39477)
