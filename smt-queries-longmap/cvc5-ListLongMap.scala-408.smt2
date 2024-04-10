; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7618 () Bool)

(assert start!7618)

(assert (=> start!7618 false))

(declare-fun e!31198 () Bool)

(assert (=> start!7618 e!31198))

(assert (=> start!7618 true))

(declare-fun b!48599 () Bool)

(declare-fun tp_is_empty!2113 () Bool)

(declare-fun tp!6428 () Bool)

(assert (=> b!48599 (= e!31198 (and tp_is_empty!2113 tp!6428))))

(declare-datatypes ((B!962 0))(
  ( (B!963 (val!1101 Int)) )
))
(declare-datatypes ((tuple2!1784 0))(
  ( (tuple2!1785 (_1!903 (_ BitVec 64)) (_2!903 B!962)) )
))
(declare-datatypes ((List!1298 0))(
  ( (Nil!1295) (Cons!1294 (h!1874 tuple2!1784) (t!4326 List!1298)) )
))
(declare-fun l!1333 () List!1298)

(assert (= (and start!7618 (is-Cons!1294 l!1333)) b!48599))

(push 1)

(assert (not b!48599))

(assert tp_is_empty!2113)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

