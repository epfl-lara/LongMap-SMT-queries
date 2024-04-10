; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82266 () Bool)

(assert start!82266)

(declare-fun b_free!18539 () Bool)

(declare-fun b_next!18539 () Bool)

(assert (=> start!82266 (= b_free!18539 (not b_next!18539))))

(declare-fun tp!64578 () Bool)

(declare-fun b_and!30027 () Bool)

(assert (=> start!82266 (= tp!64578 b_and!30027)))

(declare-fun b!958972 () Bool)

(declare-fun e!540614 () Bool)

(declare-fun e!540613 () Bool)

(declare-fun mapRes!33847 () Bool)

(assert (=> b!958972 (= e!540614 (and e!540613 mapRes!33847))))

(declare-fun condMapEmpty!33847 () Bool)

(declare-datatypes ((V!33309 0))(
  ( (V!33310 (val!10673 Int)) )
))
(declare-datatypes ((ValueCell!10141 0))(
  ( (ValueCellFull!10141 (v!13230 V!33309)) (EmptyCell!10141) )
))
(declare-datatypes ((array!58589 0))(
  ( (array!58590 (arr!28168 (Array (_ BitVec 32) ValueCell!10141)) (size!28647 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58589)

(declare-fun mapDefault!33847 () ValueCell!10141)

