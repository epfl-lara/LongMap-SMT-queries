; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2032 () Bool)

(assert start!2032)

(declare-fun b!13704 () Bool)

(assert (=> b!13704 true))

(declare-fun b!13700 () Bool)

(declare-fun e!8191 () Bool)

(declare-fun tp_is_empty!683 () Bool)

(declare-fun tp!2219 () Bool)

(assert (=> b!13700 (= e!8191 (and tp_is_empty!683 tp!2219))))

(declare-fun res!10755 () Bool)

(declare-fun e!8192 () Bool)

(assert (=> start!2032 (=> (not res!10755) (not e!8192))))

(declare-datatypes ((B!504 0))(
  ( (B!505 (val!350 Int)) )
))
(declare-datatypes ((tuple2!500 0))(
  ( (tuple2!501 (_1!250 (_ BitVec 64)) (_2!250 B!504)) )
))
(declare-datatypes ((List!405 0))(
  ( (Nil!402) (Cons!401 (h!967 tuple2!500) (t!2801 List!405)) )
))
(declare-fun l!522 () List!405)

(declare-fun isStrictlySorted!92 (List!405) Bool)

(assert (=> start!2032 (= res!10755 (isStrictlySorted!92 l!522))))

(assert (=> start!2032 e!8192))

(assert (=> start!2032 e!8191))

(assert (=> start!2032 tp_is_empty!683))

(declare-fun b!13701 () Bool)

(assert (=> b!13701 (= e!8192 false)))

(declare-fun b!13702 () Bool)

(declare-fun res!10753 () Bool)

(assert (=> b!13702 (=> (not res!10753) (not e!8192))))

(declare-fun value!159 () B!504)

(assert (=> b!13702 (= res!10753 (and (or (not (is-Cons!401 l!522)) (not (= (_2!250 (h!967 l!522)) value!159))) (or (not (is-Cons!401 l!522)) (= (_2!250 (h!967 l!522)) value!159)) (is-Nil!402 l!522)))))

(declare-fun b!13703 () Bool)

(declare-fun res!10754 () Bool)

(assert (=> b!13703 (=> (not res!10754) (not e!8192))))

(declare-fun isEmpty!89 (List!405) Bool)

(assert (=> b!13703 (= res!10754 (not (isEmpty!89 l!522)))))

(declare-fun res!10756 () Bool)

(assert (=> b!13704 (=> (not res!10756) (not e!8192))))

(declare-fun lambda!104 () Int)

(declare-fun forall!82 (List!405 Int) Bool)

(assert (=> b!13704 (= res!10756 (forall!82 Nil!402 lambda!104))))

(assert (= (and start!2032 res!10755) b!13702))

(assert (= (and b!13702 res!10753) b!13704))

(assert (= (and b!13704 res!10756) b!13703))

(assert (= (and b!13703 res!10754) b!13701))

(assert (= (and start!2032 (is-Cons!401 l!522)) b!13700))

(declare-fun m!9257 () Bool)

(assert (=> start!2032 m!9257))

(declare-fun m!9259 () Bool)

(assert (=> b!13703 m!9259))

(declare-fun m!9261 () Bool)

(assert (=> b!13704 m!9261))

(push 1)

(assert (not start!2032))

(assert (not b!13703))

(assert (not b!13700))

(assert tp_is_empty!683)

(assert (not b!13704))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

