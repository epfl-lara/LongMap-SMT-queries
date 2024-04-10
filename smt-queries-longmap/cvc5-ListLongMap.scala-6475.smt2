; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82690 () Bool)

(assert start!82690)

(declare-fun b_free!18823 () Bool)

(declare-fun b_next!18823 () Bool)

(assert (=> start!82690 (= b_free!18823 (not b_next!18823))))

(declare-fun tp!65589 () Bool)

(declare-fun b_and!30311 () Bool)

(assert (=> start!82690 (= tp!65589 b_and!30311)))

(declare-fun b!964172 () Bool)

(declare-fun e!543578 () Bool)

(declare-fun e!543579 () Bool)

(declare-fun mapRes!34432 () Bool)

(assert (=> b!964172 (= e!543578 (and e!543579 mapRes!34432))))

(declare-fun condMapEmpty!34432 () Bool)

(declare-datatypes ((V!33817 0))(
  ( (V!33818 (val!10863 Int)) )
))
(declare-datatypes ((ValueCell!10331 0))(
  ( (ValueCellFull!10331 (v!13421 V!33817)) (EmptyCell!10331) )
))
(declare-datatypes ((array!59339 0))(
  ( (array!59340 (arr!28538 (Array (_ BitVec 32) ValueCell!10331)) (size!29017 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59339)

(declare-fun mapDefault!34432 () ValueCell!10331)

