; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107772 () Bool)

(assert start!107772)

(assert (=> start!107772 false))

(declare-fun e!727360 () Bool)

(assert (=> start!107772 e!727360))

(assert (=> start!107772 true))

(declare-fun b!1274538 () Bool)

(declare-fun tp_is_empty!33167 () Bool)

(declare-fun tp!97955 () Bool)

(assert (=> b!1274538 (= e!727360 (and tp_is_empty!33167 tp!97955))))

(declare-datatypes ((B!2124 0))(
  ( (B!2125 (val!16658 Int)) )
))
(declare-datatypes ((tuple2!21398 0))(
  ( (tuple2!21399 (_1!10710 (_ BitVec 64)) (_2!10710 B!2124)) )
))
(declare-datatypes ((List!28584 0))(
  ( (Nil!28581) (Cons!28580 (h!29789 tuple2!21398) (t!42117 List!28584)) )
))
(declare-fun l!595 () List!28584)

(assert (= (and start!107772 (is-Cons!28580 l!595)) b!1274538))

(push 1)

(assert (not b!1274538))

