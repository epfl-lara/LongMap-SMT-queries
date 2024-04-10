; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7166 () Bool)

(assert start!7166)

(assert (=> start!7166 false))

(declare-fun e!29255 () Bool)

(assert (=> start!7166 e!29255))

(declare-fun b!45954 () Bool)

(declare-fun tp_is_empty!1949 () Bool)

(declare-fun tp!6035 () Bool)

(assert (=> b!45954 (= e!29255 (and tp_is_empty!1949 tp!6035))))

(declare-datatypes ((B!852 0))(
  ( (B!853 (val!1013 Int)) )
))
(declare-datatypes ((tuple2!1674 0))(
  ( (tuple2!1675 (_1!848 (_ BitVec 64)) (_2!848 B!852)) )
))
(declare-datatypes ((List!1231 0))(
  ( (Nil!1228) (Cons!1227 (h!1807 tuple2!1674) (t!4256 List!1231)) )
))
(declare-fun l!812 () List!1231)

(assert (= (and start!7166 (is-Cons!1227 l!812)) b!45954))

(push 1)

(assert (not b!45954))

(assert tp_is_empty!1949)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

