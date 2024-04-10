; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134454 () Bool)

(assert start!134454)

(assert (=> start!134454 false))

(assert (=> start!134454 true))

(declare-fun e!875075 () Bool)

(assert (=> start!134454 e!875075))

(declare-fun b!1569708 () Bool)

(declare-fun tp_is_empty!39083 () Bool)

(declare-fun tp!114171 () Bool)

(assert (=> b!1569708 (= e!875075 (and tp_is_empty!39083 tp!114171))))

(declare-datatypes ((B!2532 0))(
  ( (B!2533 (val!19628 Int)) )
))
(declare-datatypes ((tuple2!25358 0))(
  ( (tuple2!25359 (_1!12690 (_ BitVec 64)) (_2!12690 B!2532)) )
))
(declare-datatypes ((List!36748 0))(
  ( (Nil!36745) (Cons!36744 (h!38191 tuple2!25358) (t!51656 List!36748)) )
))
(declare-fun l!750 () List!36748)

(assert (= (and start!134454 (is-Cons!36744 l!750)) b!1569708))

(push 1)

(assert (not b!1569708))

(assert tp_is_empty!39083)

(check-sat)

(pop 1)

