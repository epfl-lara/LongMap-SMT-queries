; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!138370 () Bool)

(assert start!138370)

(declare-fun b!1586097 () Bool)

(declare-fun e!885678 () Bool)

(declare-fun tp_is_empty!39549 () Bool)

(declare-fun tp!115353 () Bool)

(assert (=> b!1586097 (= e!885678 (and tp_is_empty!39549 tp!115353))))

(declare-fun b!1586099 () Bool)

(declare-fun e!885675 () Bool)

(declare-fun tp!115352 () Bool)

(assert (=> b!1586099 (= e!885675 (and tp_is_empty!39549 tp!115352))))

(declare-fun b!1586100 () Bool)

(declare-fun res!1083233 () Bool)

(declare-fun e!885676 () Bool)

(assert (=> b!1586100 (=> res!1083233 e!885676)))

(declare-datatypes ((B!3016 0))(
  ( (B!3017 (val!19870 Int)) )
))
(declare-datatypes ((tuple2!25908 0))(
  ( (tuple2!25909 (_1!12965 (_ BitVec 64)) (_2!12965 B!3016)) )
))
(declare-datatypes ((List!36990 0))(
  ( (Nil!36987) (Cons!36986 (h!38529 tuple2!25908) (t!51920 List!36990)) )
))
(declare-fun lt!677493 () List!36990)

(declare-fun newKey!21 () (_ BitVec 64))

(declare-fun containsKey!1022 (List!36990 (_ BitVec 64)) Bool)

(assert (=> b!1586100 (= res!1083233 (not (containsKey!1022 lt!677493 newKey!21)))))

(declare-fun b!1586101 () Bool)

(declare-fun res!1083232 () Bool)

(declare-fun e!885677 () Bool)

(assert (=> b!1586101 (=> (not res!1083232) (not e!885677))))

(declare-fun l!556 () List!36990)

(get-info :version)

(assert (=> b!1586101 (= res!1083232 (and (or (not ((_ is Cons!36986) l!556)) (bvsge (_1!12965 (h!38529 l!556)) newKey!21)) (or (not ((_ is Cons!36986) l!556)) (not (= (_1!12965 (h!38529 l!556)) newKey!21))) (or (not ((_ is Cons!36986) l!556)) (bvsle (_1!12965 (h!38529 l!556)) newKey!21)) (not ((_ is Nil!36987) l!556))))))

(declare-fun newValue!21 () B!3016)

(declare-fun b!1586102 () Bool)

(declare-fun contains!10545 (List!36990 tuple2!25908) Bool)

(assert (=> b!1586102 (= e!885676 (not (contains!10545 lt!677493 (tuple2!25909 newKey!21 newValue!21))))))

(declare-fun b!1586098 () Bool)

(assert (=> b!1586098 (= e!885677 e!885676)))

(declare-fun res!1083230 () Bool)

(assert (=> b!1586098 (=> res!1083230 e!885676)))

(declare-fun isStrictlySorted!1212 (List!36990) Bool)

(assert (=> b!1586098 (= res!1083230 (not (isStrictlySorted!1212 lt!677493)))))

(declare-fun err!229 () List!36990)

(assert (=> b!1586098 (= lt!677493 err!229)))

(assert (=> b!1586098 true))

(assert (=> b!1586098 e!885678))

(declare-fun res!1083231 () Bool)

(assert (=> start!138370 (=> (not res!1083231) (not e!885677))))

(assert (=> start!138370 (= res!1083231 (isStrictlySorted!1212 l!556))))

(assert (=> start!138370 e!885677))

(assert (=> start!138370 e!885675))

(assert (=> start!138370 true))

(assert (=> start!138370 tp_is_empty!39549))

(assert (= (and start!138370 res!1083231) b!1586101))

(assert (= (and b!1586101 res!1083232) b!1586098))

(assert (= (and b!1586098 ((_ is Cons!36986) err!229)) b!1586097))

(assert (= (and b!1586098 (not res!1083230)) b!1586100))

(assert (= (and b!1586100 (not res!1083233)) b!1586102))

(assert (= (and start!138370 ((_ is Cons!36986) l!556)) b!1586099))

(declare-fun m!1454645 () Bool)

(assert (=> b!1586100 m!1454645))

(declare-fun m!1454647 () Bool)

(assert (=> b!1586102 m!1454647))

(declare-fun m!1454649 () Bool)

(assert (=> b!1586098 m!1454649))

(declare-fun m!1454651 () Bool)

(assert (=> start!138370 m!1454651))

(check-sat (not b!1586100) (not b!1586097) tp_is_empty!39549 (not b!1586098) (not b!1586099) (not b!1586102) (not start!138370))
(check-sat)
