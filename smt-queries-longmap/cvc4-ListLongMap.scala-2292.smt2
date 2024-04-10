; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37218 () Bool)

(assert start!37218)

(declare-fun b_free!8345 () Bool)

(declare-fun b_next!8345 () Bool)

(assert (=> start!37218 (= b_free!8345 (not b_next!8345))))

(declare-fun tp!29750 () Bool)

(declare-fun b_and!15587 () Bool)

(assert (=> start!37218 (= tp!29750 b_and!15587)))

(declare-fun b!376206 () Bool)

(declare-fun e!229135 () Bool)

(declare-fun e!229137 () Bool)

(declare-fun mapRes!15054 () Bool)

(assert (=> b!376206 (= e!229135 (and e!229137 mapRes!15054))))

(declare-fun condMapEmpty!15054 () Bool)

(declare-datatypes ((V!13095 0))(
  ( (V!13096 (val!4541 Int)) )
))
(declare-datatypes ((ValueCell!4153 0))(
  ( (ValueCellFull!4153 (v!6738 V!13095)) (EmptyCell!4153) )
))
(declare-datatypes ((array!21919 0))(
  ( (array!21920 (arr!10428 (Array (_ BitVec 32) ValueCell!4153)) (size!10780 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21919)

(declare-fun mapDefault!15054 () ValueCell!4153)

