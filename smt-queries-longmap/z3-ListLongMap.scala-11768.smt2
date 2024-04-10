; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!138172 () Bool)

(assert start!138172)

(declare-fun res!1082644 () Bool)

(declare-fun e!884976 () Bool)

(assert (=> start!138172 (=> (not res!1082644) (not e!884976))))

(declare-datatypes ((B!2950 0))(
  ( (B!2951 (val!19837 Int)) )
))
(declare-datatypes ((tuple2!25842 0))(
  ( (tuple2!25843 (_1!12932 (_ BitVec 64)) (_2!12932 B!2950)) )
))
(declare-datatypes ((List!36957 0))(
  ( (Nil!36954) (Cons!36953 (h!38496 tuple2!25842) (t!51875 List!36957)) )
))
(declare-fun l!556 () List!36957)

(declare-fun isStrictlySorted!1182 (List!36957) Bool)

(assert (=> start!138172 (= res!1082644 (isStrictlySorted!1182 l!556))))

(assert (=> start!138172 e!884976))

(declare-fun e!884975 () Bool)

(assert (=> start!138172 e!884975))

(assert (=> start!138172 true))

(declare-fun tp_is_empty!39483 () Bool)

(assert (=> start!138172 tp_is_empty!39483))

(declare-fun b!1585158 () Bool)

(declare-fun res!1082645 () Bool)

(assert (=> b!1585158 (=> (not res!1082645) (not e!884976))))

(declare-fun newKey!21 () (_ BitVec 64))

(get-info :version)

(assert (=> b!1585158 (= res!1082645 (and (bvsge (_1!12932 (h!38496 l!556)) newKey!21) ((_ is Cons!36953) l!556) (= (_1!12932 (h!38496 l!556)) newKey!21)))))

(declare-fun b!1585159 () Bool)

(assert (=> b!1585159 (= e!884976 false)))

(declare-fun newValue!21 () B!2950)

(declare-fun lt!677328 () Bool)

(declare-fun $colon$colon!1032 (List!36957 tuple2!25842) List!36957)

(assert (=> b!1585159 (= lt!677328 (isStrictlySorted!1182 ($colon$colon!1032 (t!51875 l!556) (tuple2!25843 newKey!21 newValue!21))))))

(declare-fun b!1585160 () Bool)

(declare-fun tp!115191 () Bool)

(assert (=> b!1585160 (= e!884975 (and tp_is_empty!39483 tp!115191))))

(assert (= (and start!138172 res!1082644) b!1585158))

(assert (= (and b!1585158 res!1082645) b!1585159))

(assert (= (and start!138172 ((_ is Cons!36953) l!556)) b!1585160))

(declare-fun m!1454127 () Bool)

(assert (=> start!138172 m!1454127))

(declare-fun m!1454129 () Bool)

(assert (=> b!1585159 m!1454129))

(assert (=> b!1585159 m!1454129))

(declare-fun m!1454131 () Bool)

(assert (=> b!1585159 m!1454131))

(check-sat (not b!1585159) (not start!138172) (not b!1585160) tp_is_empty!39483)
(check-sat)
