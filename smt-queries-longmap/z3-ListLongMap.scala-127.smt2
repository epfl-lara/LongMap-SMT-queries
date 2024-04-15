; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2220 () Bool)

(assert start!2220)

(declare-fun res!11389 () Bool)

(declare-fun e!8923 () Bool)

(assert (=> start!2220 (=> (not res!11389) (not e!8923))))

(declare-datatypes ((B!560 0))(
  ( (B!561 (val!378 Int)) )
))
(declare-datatypes ((tuple2!552 0))(
  ( (tuple2!553 (_1!276 (_ BitVec 64)) (_2!276 B!560)) )
))
(declare-datatypes ((List!429 0))(
  ( (Nil!426) (Cons!425 (h!991 tuple2!552) (t!2831 List!429)) )
))
(declare-fun l!522 () List!429)

(declare-fun isStrictlySorted!117 (List!429) Bool)

(assert (=> start!2220 (= res!11389 (isStrictlySorted!117 l!522))))

(assert (=> start!2220 e!8923))

(declare-fun e!8924 () Bool)

(assert (=> start!2220 e!8924))

(declare-fun tp_is_empty!739 () Bool)

(assert (=> start!2220 tp_is_empty!739))

(declare-fun b!14836 () Bool)

(declare-fun value!159 () B!560)

(get-info :version)

(assert (=> b!14836 (= e!8923 (and (or (not ((_ is Cons!425) l!522)) (not (= (_2!276 (h!991 l!522)) value!159))) (or (not ((_ is Cons!425) l!522)) (= (_2!276 (h!991 l!522)) value!159)) (not ((_ is Nil!426) l!522))))))

(declare-fun b!14837 () Bool)

(declare-fun tp!2381 () Bool)

(assert (=> b!14837 (= e!8924 (and tp_is_empty!739 tp!2381))))

(assert (= (and start!2220 res!11389) b!14836))

(assert (= (and start!2220 ((_ is Cons!425) l!522)) b!14837))

(declare-fun m!9891 () Bool)

(assert (=> start!2220 m!9891))

(check-sat (not start!2220) (not b!14837) tp_is_empty!739)
(check-sat)
