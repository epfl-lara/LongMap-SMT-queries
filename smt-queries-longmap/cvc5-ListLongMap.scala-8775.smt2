; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106720 () Bool)

(assert start!106720)

(assert (=> start!106720 false))

(declare-fun e!721820 () Bool)

(assert (=> start!106720 e!721820))

(assert (=> start!106720 true))

(declare-fun b!1267123 () Bool)

(declare-fun tp_is_empty!32563 () Bool)

(declare-fun tp!96533 () Bool)

(assert (=> b!1267123 (= e!721820 (and tp_is_empty!32563 tp!96533))))

(declare-datatypes ((B!2042 0))(
  ( (B!2043 (val!16356 Int)) )
))
(declare-datatypes ((tuple2!21230 0))(
  ( (tuple2!21231 (_1!10626 (_ BitVec 64)) (_2!10626 B!2042)) )
))
(declare-datatypes ((List!28348 0))(
  ( (Nil!28345) (Cons!28344 (h!29553 tuple2!21230) (t!41875 List!28348)) )
))
(declare-fun l!874 () List!28348)

(assert (= (and start!106720 (is-Cons!28344 l!874)) b!1267123))

(push 1)

(assert (not b!1267123))

(assert tp_is_empty!32563)

(check-sat)

(pop 1)

