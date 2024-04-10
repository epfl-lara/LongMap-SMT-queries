; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137942 () Bool)

(assert start!137942)

(assert (=> start!137942 false))

(declare-fun e!883978 () Bool)

(assert (=> start!137942 e!883978))

(assert (=> start!137942 true))

(declare-fun b!1583605 () Bool)

(declare-fun tp_is_empty!39413 () Bool)

(declare-fun tp!115009 () Bool)

(assert (=> b!1583605 (= e!883978 (and tp_is_empty!39413 tp!115009))))

(declare-datatypes ((B!2880 0))(
  ( (B!2881 (val!19802 Int)) )
))
(declare-datatypes ((tuple2!25772 0))(
  ( (tuple2!25773 (_1!12897 (_ BitVec 64)) (_2!12897 B!2880)) )
))
(declare-datatypes ((List!36922 0))(
  ( (Nil!36919) (Cons!36918 (h!38461 tuple2!25772) (t!51836 List!36922)) )
))
(declare-fun l!1251 () List!36922)

(assert (= (and start!137942 (is-Cons!36918 l!1251)) b!1583605))

(push 1)

(assert (not b!1583605))

(assert tp_is_empty!39413)

(check-sat)

(pop 1)

