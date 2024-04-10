; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2036 () Bool)

(assert start!2036)

(declare-fun b!13735 () Bool)

(assert (=> b!13735 true))

(declare-fun b!13734 () Bool)

(declare-fun e!8203 () Bool)

(declare-fun tp_is_empty!687 () Bool)

(declare-fun tp!2225 () Bool)

(assert (=> b!13734 (= e!8203 (and tp_is_empty!687 tp!2225))))

(declare-fun res!10777 () Bool)

(declare-fun e!8204 () Bool)

(assert (=> start!2036 (=> (not res!10777) (not e!8204))))

(declare-datatypes ((B!508 0))(
  ( (B!509 (val!352 Int)) )
))
(declare-datatypes ((tuple2!504 0))(
  ( (tuple2!505 (_1!252 (_ BitVec 64)) (_2!252 B!508)) )
))
(declare-datatypes ((List!407 0))(
  ( (Nil!404) (Cons!403 (h!969 tuple2!504) (t!2803 List!407)) )
))
(declare-fun l!522 () List!407)

(declare-fun isStrictlySorted!94 (List!407) Bool)

(assert (=> start!2036 (= res!10777 (isStrictlySorted!94 l!522))))

(assert (=> start!2036 e!8204))

(assert (=> start!2036 e!8203))

(assert (=> start!2036 tp_is_empty!687))

(declare-fun res!10780 () Bool)

(assert (=> b!13735 (=> (not res!10780) (not e!8204))))

(declare-fun lambda!110 () Int)

(declare-fun forall!84 (List!407 Int) Bool)

(assert (=> b!13735 (= res!10780 (forall!84 Nil!404 lambda!110))))

(declare-fun b!13736 () Bool)

(declare-fun res!10779 () Bool)

(assert (=> b!13736 (=> (not res!10779) (not e!8204))))

(declare-fun isEmpty!91 (List!407) Bool)

(assert (=> b!13736 (= res!10779 (not (isEmpty!91 l!522)))))

(declare-fun b!13737 () Bool)

(declare-fun res!10778 () Bool)

(assert (=> b!13737 (=> (not res!10778) (not e!8204))))

(declare-fun value!159 () B!508)

(get-info :version)

(assert (=> b!13737 (= res!10778 (and (or (not ((_ is Cons!403) l!522)) (not (= (_2!252 (h!969 l!522)) value!159))) (or (not ((_ is Cons!403) l!522)) (= (_2!252 (h!969 l!522)) value!159)) ((_ is Nil!404) l!522)))))

(declare-fun b!13738 () Bool)

(assert (=> b!13738 (= e!8204 false)))

(assert (= (and start!2036 res!10777) b!13737))

(assert (= (and b!13737 res!10778) b!13735))

(assert (= (and b!13735 res!10780) b!13736))

(assert (= (and b!13736 res!10779) b!13738))

(assert (= (and start!2036 ((_ is Cons!403) l!522)) b!13734))

(declare-fun m!9269 () Bool)

(assert (=> start!2036 m!9269))

(declare-fun m!9271 () Bool)

(assert (=> b!13735 m!9271))

(declare-fun m!9273 () Bool)

(assert (=> b!13736 m!9273))

(check-sat tp_is_empty!687 (not b!13735) (not b!13734) (not start!2036) (not b!13736))
(check-sat)
