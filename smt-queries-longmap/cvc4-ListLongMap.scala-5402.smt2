; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72124 () Bool)

(assert start!72124)

(assert (=> start!72124 false))

(declare-fun e!466908 () Bool)

(assert (=> start!72124 e!466908))

(declare-fun b!836771 () Bool)

(declare-fun tp_is_empty!15287 () Bool)

(declare-fun tp!47515 () Bool)

(assert (=> b!836771 (= e!466908 (and tp_is_empty!15287 tp!47515))))

(declare-datatypes ((B!1218 0))(
  ( (B!1219 (val!7691 Int)) )
))
(declare-datatypes ((tuple2!10242 0))(
  ( (tuple2!10243 (_1!5132 (_ BitVec 64)) (_2!5132 B!1218)) )
))
(declare-datatypes ((List!16002 0))(
  ( (Nil!15999) (Cons!15998 (h!17129 tuple2!10242) (t!22373 List!16002)) )
))
(declare-fun l!390 () List!16002)

(assert (= (and start!72124 (is-Cons!15998 l!390)) b!836771))

(push 1)

(assert (not b!836771))

(assert tp_is_empty!15287)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

