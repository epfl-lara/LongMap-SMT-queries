; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107796 () Bool)

(assert start!107796)

(assert (=> start!107796 false))

(declare-fun e!727438 () Bool)

(assert (=> start!107796 e!727438))

(assert (=> start!107796 true))

(declare-fun b!1274640 () Bool)

(declare-fun tp_is_empty!33185 () Bool)

(declare-fun tp!97991 () Bool)

(assert (=> b!1274640 (= e!727438 (and tp_is_empty!33185 tp!97991))))

(declare-datatypes ((B!2142 0))(
  ( (B!2143 (val!16667 Int)) )
))
(declare-datatypes ((tuple2!21416 0))(
  ( (tuple2!21417 (_1!10719 (_ BitVec 64)) (_2!10719 B!2142)) )
))
(declare-datatypes ((List!28593 0))(
  ( (Nil!28590) (Cons!28589 (h!29798 tuple2!21416) (t!42126 List!28593)) )
))
(declare-fun l!595 () List!28593)

(assert (= (and start!107796 (is-Cons!28589 l!595)) b!1274640))

(push 1)

(assert (not b!1274640))

(assert tp_is_empty!33185)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

