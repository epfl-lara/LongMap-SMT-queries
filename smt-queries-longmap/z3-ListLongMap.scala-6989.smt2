; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!88602 () Bool)

(assert start!88602)

(declare-fun b!1018323 () Bool)

(declare-fun res!682846 () Bool)

(declare-fun e!572968 () Bool)

(assert (=> b!1018323 (=> (not res!682846) (not e!572968))))

(declare-datatypes ((B!1642 0))(
  ( (B!1643 (val!11905 Int)) )
))
(declare-datatypes ((tuple2!15356 0))(
  ( (tuple2!15357 (_1!7689 (_ BitVec 64)) (_2!7689 B!1642)) )
))
(declare-datatypes ((List!21593 0))(
  ( (Nil!21590) (Cons!21589 (h!22787 tuple2!15356) (t!30594 List!21593)) )
))
(declare-fun l!996 () List!21593)

(declare-fun key!261 () (_ BitVec 64))

(declare-fun containsKey!518 (List!21593 (_ BitVec 64)) Bool)

(assert (=> b!1018323 (= res!682846 (containsKey!518 (t!30594 l!996) key!261))))

(declare-fun b!1018324 () Bool)

(declare-fun e!572970 () Bool)

(declare-fun tp_is_empty!23709 () Bool)

(declare-fun tp!71032 () Bool)

(assert (=> b!1018324 (= e!572970 (and tp_is_empty!23709 tp!71032))))

(declare-fun res!682847 () Bool)

(declare-fun e!572969 () Bool)

(assert (=> start!88602 (=> (not res!682847) (not e!572969))))

(declare-fun isStrictlySorted!658 (List!21593) Bool)

(assert (=> start!88602 (= res!682847 (isStrictlySorted!658 l!996))))

(assert (=> start!88602 e!572969))

(assert (=> start!88602 e!572970))

(assert (=> start!88602 true))

(assert (=> start!88602 tp_is_empty!23709))

(declare-fun b!1018325 () Bool)

(assert (=> b!1018325 (= e!572969 e!572968)))

(declare-fun res!682845 () Bool)

(assert (=> b!1018325 (=> (not res!682845) (not e!572968))))

(get-info :version)

(assert (=> b!1018325 (= res!682845 (and ((_ is Cons!21589) l!996) (bvslt (_1!7689 (h!22787 l!996)) key!261)))))

(declare-fun value!172 () B!1642)

(declare-fun lt!449526 () List!21593)

(declare-fun insertStrictlySorted!339 (List!21593 (_ BitVec 64) B!1642) List!21593)

(assert (=> b!1018325 (= lt!449526 (insertStrictlySorted!339 l!996 key!261 value!172))))

(declare-fun b!1018326 () Bool)

(declare-fun res!682843 () Bool)

(assert (=> b!1018326 (=> (not res!682843) (not e!572968))))

(assert (=> b!1018326 (= res!682843 (isStrictlySorted!658 (t!30594 l!996)))))

(declare-fun b!1018327 () Bool)

(assert (=> b!1018327 (= e!572968 (not true))))

(declare-fun length!42 (List!21593) Int)

(assert (=> b!1018327 (= (length!42 (insertStrictlySorted!339 (t!30594 l!996) key!261 value!172)) (length!42 (t!30594 l!996)))))

(declare-datatypes ((Unit!33283 0))(
  ( (Unit!33284) )
))
(declare-fun lt!449525 () Unit!33283)

(declare-fun lemmaAddExistingKeyPreservesSize!2 (List!21593 (_ BitVec 64) B!1642) Unit!33283)

(assert (=> b!1018327 (= lt!449525 (lemmaAddExistingKeyPreservesSize!2 (t!30594 l!996) key!261 value!172))))

(declare-fun b!1018328 () Bool)

(declare-fun res!682844 () Bool)

(assert (=> b!1018328 (=> (not res!682844) (not e!572969))))

(assert (=> b!1018328 (= res!682844 (containsKey!518 l!996 key!261))))

(assert (= (and start!88602 res!682847) b!1018328))

(assert (= (and b!1018328 res!682844) b!1018325))

(assert (= (and b!1018325 res!682845) b!1018326))

(assert (= (and b!1018326 res!682843) b!1018323))

(assert (= (and b!1018323 res!682846) b!1018327))

(assert (= (and start!88602 ((_ is Cons!21589) l!996)) b!1018324))

(declare-fun m!939229 () Bool)

(assert (=> b!1018326 m!939229))

(declare-fun m!939231 () Bool)

(assert (=> b!1018323 m!939231))

(declare-fun m!939233 () Bool)

(assert (=> b!1018325 m!939233))

(declare-fun m!939235 () Bool)

(assert (=> b!1018328 m!939235))

(declare-fun m!939237 () Bool)

(assert (=> start!88602 m!939237))

(declare-fun m!939239 () Bool)

(assert (=> b!1018327 m!939239))

(assert (=> b!1018327 m!939239))

(declare-fun m!939241 () Bool)

(assert (=> b!1018327 m!939241))

(declare-fun m!939243 () Bool)

(assert (=> b!1018327 m!939243))

(declare-fun m!939245 () Bool)

(assert (=> b!1018327 m!939245))

(check-sat tp_is_empty!23709 (not start!88602) (not b!1018323) (not b!1018328) (not b!1018326) (not b!1018327) (not b!1018325) (not b!1018324))
(check-sat)
