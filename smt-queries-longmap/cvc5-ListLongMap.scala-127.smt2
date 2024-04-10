; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2220 () Bool)

(assert start!2220)

(declare-fun res!11389 () Bool)

(declare-fun e!8923 () Bool)

(assert (=> start!2220 (=> (not res!11389) (not e!8923))))

(declare-datatypes ((B!560 0))(
  ( (B!561 (val!378 Int)) )
))
(declare-datatypes ((tuple2!556 0))(
  ( (tuple2!557 (_1!278 (_ BitVec 64)) (_2!278 B!560)) )
))
(declare-datatypes ((List!433 0))(
  ( (Nil!430) (Cons!429 (h!995 tuple2!556) (t!2835 List!433)) )
))
(declare-fun l!522 () List!433)

(declare-fun isStrictlySorted!120 (List!433) Bool)

(assert (=> start!2220 (= res!11389 (isStrictlySorted!120 l!522))))

(assert (=> start!2220 e!8923))

(declare-fun e!8924 () Bool)

(assert (=> start!2220 e!8924))

(declare-fun tp_is_empty!739 () Bool)

(assert (=> start!2220 tp_is_empty!739))

(declare-fun b!14836 () Bool)

(declare-fun value!159 () B!560)

(assert (=> b!14836 (= e!8923 (and (or (not (is-Cons!429 l!522)) (not (= (_2!278 (h!995 l!522)) value!159))) (or (not (is-Cons!429 l!522)) (= (_2!278 (h!995 l!522)) value!159)) (not (is-Nil!430 l!522))))))

(declare-fun b!14837 () Bool)

(declare-fun tp!2381 () Bool)

(assert (=> b!14837 (= e!8924 (and tp_is_empty!739 tp!2381))))

(assert (= (and start!2220 res!11389) b!14836))

(assert (= (and start!2220 (is-Cons!429 l!522)) b!14837))

(declare-fun m!9899 () Bool)

(assert (=> start!2220 m!9899))

(push 1)

(assert (not start!2220))

(assert (not b!14837))

(assert tp_is_empty!739)

(check-sat)

