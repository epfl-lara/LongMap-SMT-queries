; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37652 () Bool)

(assert start!37652)

(declare-fun b!385494 () Bool)

(declare-fun e!233981 () Bool)

(declare-fun tp_is_empty!9427 () Bool)

(assert (=> b!385494 (= e!233981 tp_is_empty!9427)))

(declare-fun b!385495 () Bool)

(declare-fun e!233977 () Bool)

(declare-fun e!233979 () Bool)

(declare-fun mapRes!15705 () Bool)

(assert (=> b!385495 (= e!233977 (and e!233979 mapRes!15705))))

(declare-fun condMapEmpty!15705 () Bool)

(declare-datatypes ((V!13675 0))(
  ( (V!13676 (val!4758 Int)) )
))
(declare-datatypes ((ValueCell!4370 0))(
  ( (ValueCellFull!4370 (v!6955 V!13675)) (EmptyCell!4370) )
))
(declare-datatypes ((array!22755 0))(
  ( (array!22756 (arr!10846 (Array (_ BitVec 32) ValueCell!4370)) (size!11198 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22755)

(declare-fun mapDefault!15705 () ValueCell!4370)

