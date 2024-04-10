; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137926 () Bool)

(assert start!137926)

(declare-fun res!1081724 () Bool)

(declare-fun e!883947 () Bool)

(assert (=> start!137926 (=> (not res!1081724) (not e!883947))))

(declare-datatypes ((B!2864 0))(
  ( (B!2865 (val!19794 Int)) )
))
(declare-datatypes ((tuple2!25756 0))(
  ( (tuple2!25757 (_1!12889 (_ BitVec 64)) (_2!12889 B!2864)) )
))
(declare-datatypes ((List!36914 0))(
  ( (Nil!36911) (Cons!36910 (h!38453 tuple2!25756) (t!51828 List!36914)) )
))
(declare-fun l!548 () List!36914)

(declare-fun isStrictlySorted!1148 (List!36914) Bool)

(assert (=> start!137926 (= res!1081724 (isStrictlySorted!1148 l!548))))

(assert (=> start!137926 e!883947))

(declare-fun e!883948 () Bool)

(assert (=> start!137926 e!883948))

(assert (=> start!137926 true))

(declare-fun b!1583574 () Bool)

(declare-fun key!159 () (_ BitVec 64))

(assert (=> b!1583574 (= e!883947 (and (or (not (is-Cons!36910 l!548)) (not (= (_1!12889 (h!38453 l!548)) key!159))) (or (not (is-Cons!36910 l!548)) (= (_1!12889 (h!38453 l!548)) key!159)) (not (is-Nil!36911 l!548))))))

(declare-fun b!1583575 () Bool)

(declare-fun tp_is_empty!39397 () Bool)

(declare-fun tp!114985 () Bool)

(assert (=> b!1583575 (= e!883948 (and tp_is_empty!39397 tp!114985))))

(assert (= (and start!137926 res!1081724) b!1583574))

(assert (= (and start!137926 (is-Cons!36910 l!548)) b!1583575))

(declare-fun m!1453355 () Bool)

(assert (=> start!137926 m!1453355))

(push 1)

(assert (not start!137926))

(assert (not b!1583575))

