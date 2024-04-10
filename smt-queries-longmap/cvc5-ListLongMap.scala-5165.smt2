; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69964 () Bool)

(assert start!69964)

(declare-fun b_free!12397 () Bool)

(declare-fun b_next!12397 () Bool)

(assert (=> start!69964 (= b_free!12397 (not b_next!12397))))

(declare-fun tp!43902 () Bool)

(declare-fun b_and!21165 () Bool)

(assert (=> start!69964 (= tp!43902 b_and!21165)))

(declare-fun b!813250 () Bool)

(declare-fun e!450615 () Bool)

(declare-fun e!450614 () Bool)

(declare-fun mapRes!22738 () Bool)

(assert (=> b!813250 (= e!450615 (and e!450614 mapRes!22738))))

(declare-fun condMapEmpty!22738 () Bool)

(declare-datatypes ((V!23811 0))(
  ( (V!23812 (val!7101 Int)) )
))
(declare-datatypes ((ValueCell!6638 0))(
  ( (ValueCellFull!6638 (v!9528 V!23811)) (EmptyCell!6638) )
))
(declare-datatypes ((array!44426 0))(
  ( (array!44427 (arr!21274 (Array (_ BitVec 32) ValueCell!6638)) (size!21695 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44426)

(declare-fun mapDefault!22738 () ValueCell!6638)

