; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!138176 () Bool)

(assert start!138176)

(declare-fun res!1082589 () Bool)

(declare-fun e!884886 () Bool)

(assert (=> start!138176 (=> (not res!1082589) (not e!884886))))

(declare-datatypes ((B!2978 0))(
  ( (B!2979 (val!19851 Int)) )
))
(declare-datatypes ((tuple2!25938 0))(
  ( (tuple2!25939 (_1!12980 (_ BitVec 64)) (_2!12980 B!2978)) )
))
(declare-datatypes ((List!37012 0))(
  ( (Nil!37009) (Cons!37008 (h!38552 tuple2!25938) (t!51922 List!37012)) )
))
(declare-fun l!556 () List!37012)

(declare-fun isStrictlySorted!1191 (List!37012) Bool)

(assert (=> start!138176 (= res!1082589 (isStrictlySorted!1191 l!556))))

(assert (=> start!138176 e!884886))

(declare-fun e!884885 () Bool)

(assert (=> start!138176 e!884885))

(assert (=> start!138176 true))

(declare-fun b!1584992 () Bool)

(declare-fun res!1082588 () Bool)

(assert (=> b!1584992 (=> (not res!1082588) (not e!884886))))

(declare-fun newKey!21 () (_ BitVec 64))

(get-info :version)

(assert (=> b!1584992 (= res!1082588 (and ((_ is Cons!37008) l!556) (bvslt (_1!12980 (h!38552 l!556)) newKey!21)))))

(declare-fun b!1584993 () Bool)

(declare-fun ListPrimitiveSize!226 (List!37012) Int)

(assert (=> b!1584993 (= e!884886 (>= (ListPrimitiveSize!226 (t!51922 l!556)) (ListPrimitiveSize!226 l!556)))))

(declare-fun b!1584994 () Bool)

(declare-fun tp_is_empty!39511 () Bool)

(declare-fun tp!115242 () Bool)

(assert (=> b!1584994 (= e!884885 (and tp_is_empty!39511 tp!115242))))

(assert (= (and start!138176 res!1082589) b!1584992))

(assert (= (and b!1584992 res!1082588) b!1584993))

(assert (= (and start!138176 ((_ is Cons!37008) l!556)) b!1584994))

(declare-fun m!1453317 () Bool)

(assert (=> start!138176 m!1453317))

(declare-fun m!1453319 () Bool)

(assert (=> b!1584993 m!1453319))

(declare-fun m!1453321 () Bool)

(assert (=> b!1584993 m!1453321))

(check-sat (not b!1584993) (not start!138176) (not b!1584994) tp_is_empty!39511)
(check-sat)
(get-model)

(declare-fun d!167409 () Bool)

(declare-fun lt!677078 () Int)

(assert (=> d!167409 (>= lt!677078 0)))

(declare-fun e!884901 () Int)

(assert (=> d!167409 (= lt!677078 e!884901)))

(declare-fun c!146878 () Bool)

(assert (=> d!167409 (= c!146878 ((_ is Nil!37009) (t!51922 l!556)))))

(assert (=> d!167409 (= (ListPrimitiveSize!226 (t!51922 l!556)) lt!677078)))

(declare-fun b!1585017 () Bool)

(assert (=> b!1585017 (= e!884901 0)))

(declare-fun b!1585018 () Bool)

(assert (=> b!1585018 (= e!884901 (+ 1 (ListPrimitiveSize!226 (t!51922 (t!51922 l!556)))))))

(assert (= (and d!167409 c!146878) b!1585017))

(assert (= (and d!167409 (not c!146878)) b!1585018))

(declare-fun m!1453335 () Bool)

(assert (=> b!1585018 m!1453335))

(assert (=> b!1584993 d!167409))

(declare-fun d!167411 () Bool)

(declare-fun lt!677079 () Int)

(assert (=> d!167411 (>= lt!677079 0)))

(declare-fun e!884902 () Int)

(assert (=> d!167411 (= lt!677079 e!884902)))

(declare-fun c!146879 () Bool)

(assert (=> d!167411 (= c!146879 ((_ is Nil!37009) l!556))))

(assert (=> d!167411 (= (ListPrimitiveSize!226 l!556) lt!677079)))

(declare-fun b!1585019 () Bool)

(assert (=> b!1585019 (= e!884902 0)))

(declare-fun b!1585020 () Bool)

(assert (=> b!1585020 (= e!884902 (+ 1 (ListPrimitiveSize!226 (t!51922 l!556))))))

(assert (= (and d!167411 c!146879) b!1585019))

(assert (= (and d!167411 (not c!146879)) b!1585020))

(assert (=> b!1585020 m!1453319))

(assert (=> b!1584993 d!167411))

(declare-fun d!167415 () Bool)

(declare-fun res!1082606 () Bool)

(declare-fun e!884910 () Bool)

(assert (=> d!167415 (=> res!1082606 e!884910)))

(assert (=> d!167415 (= res!1082606 (or ((_ is Nil!37009) l!556) ((_ is Nil!37009) (t!51922 l!556))))))

(assert (=> d!167415 (= (isStrictlySorted!1191 l!556) e!884910)))

(declare-fun b!1585031 () Bool)

(declare-fun e!884911 () Bool)

(assert (=> b!1585031 (= e!884910 e!884911)))

(declare-fun res!1082607 () Bool)

(assert (=> b!1585031 (=> (not res!1082607) (not e!884911))))

(assert (=> b!1585031 (= res!1082607 (bvslt (_1!12980 (h!38552 l!556)) (_1!12980 (h!38552 (t!51922 l!556)))))))

(declare-fun b!1585032 () Bool)

(assert (=> b!1585032 (= e!884911 (isStrictlySorted!1191 (t!51922 l!556)))))

(assert (= (and d!167415 (not res!1082606)) b!1585031))

(assert (= (and b!1585031 res!1082607) b!1585032))

(declare-fun m!1453339 () Bool)

(assert (=> b!1585032 m!1453339))

(assert (=> start!138176 d!167415))

(declare-fun b!1585039 () Bool)

(declare-fun e!884915 () Bool)

(declare-fun tp!115251 () Bool)

(assert (=> b!1585039 (= e!884915 (and tp_is_empty!39511 tp!115251))))

(assert (=> b!1584994 (= tp!115242 e!884915)))

(assert (= (and b!1584994 ((_ is Cons!37008) (t!51922 l!556))) b!1585039))

(check-sat (not b!1585020) (not b!1585032) tp_is_empty!39511 (not b!1585039) (not b!1585018))
(check-sat)
