; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!138184 () Bool)

(assert start!138184)

(declare-fun res!1082680 () Bool)

(declare-fun e!885011 () Bool)

(assert (=> start!138184 (=> (not res!1082680) (not e!885011))))

(declare-datatypes ((B!2962 0))(
  ( (B!2963 (val!19843 Int)) )
))
(declare-datatypes ((tuple2!25854 0))(
  ( (tuple2!25855 (_1!12938 (_ BitVec 64)) (_2!12938 B!2962)) )
))
(declare-datatypes ((List!36963 0))(
  ( (Nil!36960) (Cons!36959 (h!38502 tuple2!25854) (t!51881 List!36963)) )
))
(declare-fun l!556 () List!36963)

(declare-fun isStrictlySorted!1188 (List!36963) Bool)

(assert (=> start!138184 (= res!1082680 (isStrictlySorted!1188 l!556))))

(assert (=> start!138184 e!885011))

(declare-fun e!885012 () Bool)

(assert (=> start!138184 e!885012))

(assert (=> start!138184 true))

(declare-fun tp_is_empty!39495 () Bool)

(assert (=> start!138184 tp_is_empty!39495))

(declare-fun b!1585212 () Bool)

(declare-fun res!1082681 () Bool)

(assert (=> b!1585212 (=> (not res!1082681) (not e!885011))))

(declare-fun newKey!21 () (_ BitVec 64))

(get-info :version)

(assert (=> b!1585212 (= res!1082681 (and (or (not ((_ is Cons!36959) l!556)) (bvsge (_1!12938 (h!38502 l!556)) newKey!21)) (or (not ((_ is Cons!36959) l!556)) (not (= (_1!12938 (h!38502 l!556)) newKey!21))) (or (not ((_ is Cons!36959) l!556)) (bvsle (_1!12938 (h!38502 l!556)) newKey!21)) ((_ is Nil!36960) l!556)))))

(declare-fun b!1585213 () Bool)

(assert (=> b!1585213 (= e!885011 false)))

(declare-fun lt!677346 () Bool)

(declare-fun newValue!21 () B!2962)

(declare-fun $colon$colon!1038 (List!36963 tuple2!25854) List!36963)

(assert (=> b!1585213 (= lt!677346 (isStrictlySorted!1188 ($colon$colon!1038 Nil!36960 (tuple2!25855 newKey!21 newValue!21))))))

(declare-fun b!1585214 () Bool)

(declare-fun tp!115209 () Bool)

(assert (=> b!1585214 (= e!885012 (and tp_is_empty!39495 tp!115209))))

(assert (= (and start!138184 res!1082680) b!1585212))

(assert (= (and b!1585212 res!1082681) b!1585213))

(assert (= (and start!138184 ((_ is Cons!36959) l!556)) b!1585214))

(declare-fun m!1454163 () Bool)

(assert (=> start!138184 m!1454163))

(declare-fun m!1454165 () Bool)

(assert (=> b!1585213 m!1454165))

(assert (=> b!1585213 m!1454165))

(declare-fun m!1454167 () Bool)

(assert (=> b!1585213 m!1454167))

(check-sat (not b!1585213) (not start!138184) (not b!1585214) tp_is_empty!39495)
