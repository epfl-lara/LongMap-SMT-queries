; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2224 () Bool)

(assert start!2224)

(declare-fun res!11395 () Bool)

(declare-fun e!8935 () Bool)

(assert (=> start!2224 (=> (not res!11395) (not e!8935))))

(declare-datatypes ((B!564 0))(
  ( (B!565 (val!380 Int)) )
))
(declare-datatypes ((tuple2!560 0))(
  ( (tuple2!561 (_1!280 (_ BitVec 64)) (_2!280 B!564)) )
))
(declare-datatypes ((List!435 0))(
  ( (Nil!432) (Cons!431 (h!997 tuple2!560) (t!2837 List!435)) )
))
(declare-fun l!522 () List!435)

(declare-fun isStrictlySorted!122 (List!435) Bool)

(assert (=> start!2224 (= res!11395 (isStrictlySorted!122 l!522))))

(assert (=> start!2224 e!8935))

(declare-fun e!8936 () Bool)

(assert (=> start!2224 e!8936))

(declare-fun tp_is_empty!743 () Bool)

(assert (=> start!2224 tp_is_empty!743))

(declare-fun b!14848 () Bool)

(declare-fun value!159 () B!564)

(assert (=> b!14848 (= e!8935 (and (or (not (is-Cons!431 l!522)) (not (= (_2!280 (h!997 l!522)) value!159))) (or (not (is-Cons!431 l!522)) (= (_2!280 (h!997 l!522)) value!159)) (not (is-Nil!432 l!522))))))

(declare-fun b!14849 () Bool)

(declare-fun tp!2387 () Bool)

(assert (=> b!14849 (= e!8936 (and tp_is_empty!743 tp!2387))))

(assert (= (and start!2224 res!11395) b!14848))

(assert (= (and start!2224 (is-Cons!431 l!522)) b!14849))

(declare-fun m!9903 () Bool)

(assert (=> start!2224 m!9903))

(push 1)

(assert (not start!2224))

(assert (not b!14849))

(assert tp_is_empty!743)

(check-sat)

(pop 1)

