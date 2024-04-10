; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137930 () Bool)

(assert start!137930)

(declare-fun res!1081730 () Bool)

(declare-fun e!883959 () Bool)

(assert (=> start!137930 (=> (not res!1081730) (not e!883959))))

(declare-datatypes ((B!2868 0))(
  ( (B!2869 (val!19796 Int)) )
))
(declare-datatypes ((tuple2!25760 0))(
  ( (tuple2!25761 (_1!12891 (_ BitVec 64)) (_2!12891 B!2868)) )
))
(declare-datatypes ((List!36916 0))(
  ( (Nil!36913) (Cons!36912 (h!38455 tuple2!25760) (t!51830 List!36916)) )
))
(declare-fun l!548 () List!36916)

(declare-fun isStrictlySorted!1150 (List!36916) Bool)

(assert (=> start!137930 (= res!1081730 (isStrictlySorted!1150 l!548))))

(assert (=> start!137930 e!883959))

(declare-fun e!883960 () Bool)

(assert (=> start!137930 e!883960))

(assert (=> start!137930 true))

(declare-fun b!1583586 () Bool)

(declare-fun key!159 () (_ BitVec 64))

(assert (=> b!1583586 (= e!883959 (and (or (not (is-Cons!36912 l!548)) (not (= (_1!12891 (h!38455 l!548)) key!159))) (or (not (is-Cons!36912 l!548)) (= (_1!12891 (h!38455 l!548)) key!159)) (not (is-Nil!36913 l!548))))))

(declare-fun b!1583587 () Bool)

(declare-fun tp_is_empty!39401 () Bool)

(declare-fun tp!114991 () Bool)

(assert (=> b!1583587 (= e!883960 (and tp_is_empty!39401 tp!114991))))

(assert (= (and start!137930 res!1081730) b!1583586))

(assert (= (and start!137930 (is-Cons!36912 l!548)) b!1583587))

(declare-fun m!1453359 () Bool)

(assert (=> start!137930 m!1453359))

(push 1)

(assert (not start!137930))

