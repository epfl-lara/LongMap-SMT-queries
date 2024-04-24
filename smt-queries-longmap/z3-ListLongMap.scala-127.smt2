; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2220 () Bool)

(assert start!2220)

(declare-fun res!11387 () Bool)

(declare-fun e!8919 () Bool)

(assert (=> start!2220 (=> (not res!11387) (not e!8919))))

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

(declare-fun isStrictlySorted!114 (List!429) Bool)

(assert (=> start!2220 (= res!11387 (isStrictlySorted!114 l!522))))

(assert (=> start!2220 e!8919))

(declare-fun e!8920 () Bool)

(assert (=> start!2220 e!8920))

(declare-fun tp_is_empty!739 () Bool)

(assert (=> start!2220 tp_is_empty!739))

(declare-fun b!14830 () Bool)

(declare-fun value!159 () B!560)

(get-info :version)

(assert (=> b!14830 (= e!8919 (and (or (not ((_ is Cons!425) l!522)) (not (= (_2!276 (h!991 l!522)) value!159))) (or (not ((_ is Cons!425) l!522)) (= (_2!276 (h!991 l!522)) value!159)) (not ((_ is Nil!426) l!522))))))

(declare-fun b!14831 () Bool)

(declare-fun tp!2381 () Bool)

(assert (=> b!14831 (= e!8920 (and tp_is_empty!739 tp!2381))))

(assert (= (and start!2220 res!11387) b!14830))

(assert (= (and start!2220 ((_ is Cons!425) l!522)) b!14831))

(declare-fun m!9891 () Bool)

(assert (=> start!2220 m!9891))

(check-sat (not start!2220) (not b!14831) tp_is_empty!739)
(check-sat)
