; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!138178 () Bool)

(assert start!138178)

(declare-fun res!1082663 () Bool)

(declare-fun e!884993 () Bool)

(assert (=> start!138178 (=> (not res!1082663) (not e!884993))))

(declare-datatypes ((B!2956 0))(
  ( (B!2957 (val!19840 Int)) )
))
(declare-datatypes ((tuple2!25848 0))(
  ( (tuple2!25849 (_1!12935 (_ BitVec 64)) (_2!12935 B!2956)) )
))
(declare-datatypes ((List!36960 0))(
  ( (Nil!36957) (Cons!36956 (h!38499 tuple2!25848) (t!51878 List!36960)) )
))
(declare-fun l!556 () List!36960)

(declare-fun isStrictlySorted!1185 (List!36960) Bool)

(assert (=> start!138178 (= res!1082663 (isStrictlySorted!1185 l!556))))

(assert (=> start!138178 e!884993))

(declare-fun e!884994 () Bool)

(assert (=> start!138178 e!884994))

(assert (=> start!138178 true))

(declare-fun tp_is_empty!39489 () Bool)

(assert (=> start!138178 tp_is_empty!39489))

(declare-fun b!1585185 () Bool)

(declare-fun res!1082662 () Bool)

(assert (=> b!1585185 (=> (not res!1082662) (not e!884993))))

(declare-fun newKey!21 () (_ BitVec 64))

(get-info :version)

(assert (=> b!1585185 (= res!1082662 (and (or (not ((_ is Cons!36956) l!556)) (bvsge (_1!12935 (h!38499 l!556)) newKey!21)) (not (= (_1!12935 (h!38499 l!556)) newKey!21)) ((_ is Cons!36956) l!556) (bvsgt (_1!12935 (h!38499 l!556)) newKey!21)))))

(declare-fun b!1585186 () Bool)

(assert (=> b!1585186 (= e!884993 false)))

(declare-fun newValue!21 () B!2956)

(declare-fun lt!677337 () Bool)

(declare-fun $colon$colon!1035 (List!36960 tuple2!25848) List!36960)

(assert (=> b!1585186 (= lt!677337 (isStrictlySorted!1185 ($colon$colon!1035 l!556 (tuple2!25849 newKey!21 newValue!21))))))

(declare-fun b!1585187 () Bool)

(declare-fun tp!115200 () Bool)

(assert (=> b!1585187 (= e!884994 (and tp_is_empty!39489 tp!115200))))

(assert (= (and start!138178 res!1082663) b!1585185))

(assert (= (and b!1585185 res!1082662) b!1585186))

(assert (= (and start!138178 ((_ is Cons!36956) l!556)) b!1585187))

(declare-fun m!1454145 () Bool)

(assert (=> start!138178 m!1454145))

(declare-fun m!1454147 () Bool)

(assert (=> b!1585186 m!1454147))

(assert (=> b!1585186 m!1454147))

(declare-fun m!1454149 () Bool)

(assert (=> b!1585186 m!1454149))

(check-sat (not start!138178) (not b!1585186) (not b!1585187) tp_is_empty!39489)
