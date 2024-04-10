; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106340 () Bool)

(assert start!106340)

(assert (=> start!106340 false))

(declare-fun e!720374 () Bool)

(assert (=> start!106340 e!720374))

(assert (=> start!106340 true))

(declare-fun b!1264966 () Bool)

(declare-fun tp_is_empty!32471 () Bool)

(declare-fun tp!96272 () Bool)

(assert (=> b!1264966 (= e!720374 (and tp_is_empty!32471 tp!96272))))

(declare-datatypes ((B!1938 0))(
  ( (B!1939 (val!16304 Int)) )
))
(declare-datatypes ((tuple2!21126 0))(
  ( (tuple2!21127 (_1!10574 (_ BitVec 64)) (_2!10574 B!1938)) )
))
(declare-datatypes ((List!28296 0))(
  ( (Nil!28293) (Cons!28292 (h!29501 tuple2!21126) (t!41817 List!28296)) )
))
(declare-fun l!706 () List!28296)

(assert (= (and start!106340 (is-Cons!28292 l!706)) b!1264966))

(push 1)

(assert (not b!1264966))

(assert tp_is_empty!32471)

(check-sat)

