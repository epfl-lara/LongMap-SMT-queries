; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69892 () Bool)

(assert start!69892)

(declare-fun mapNonEmpty!22642 () Bool)

(declare-fun mapRes!22642 () Bool)

(declare-fun tp!43750 () Bool)

(declare-fun e!450122 () Bool)

(assert (=> mapNonEmpty!22642 (= mapRes!22642 (and tp!43750 e!450122))))

(declare-datatypes ((V!23727 0))(
  ( (V!23728 (val!7070 Int)) )
))
(declare-datatypes ((ValueCell!6607 0))(
  ( (ValueCellFull!6607 (v!9497 V!23727)) (EmptyCell!6607) )
))
(declare-fun mapRest!22642 () (Array (_ BitVec 32) ValueCell!6607))

(declare-datatypes ((array!44312 0))(
  ( (array!44313 (arr!21218 (Array (_ BitVec 32) ValueCell!6607)) (size!21639 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44312)

(declare-fun mapValue!22642 () ValueCell!6607)

(declare-fun mapKey!22642 () (_ BitVec 32))

(assert (=> mapNonEmpty!22642 (= (arr!21218 _values!788) (store mapRest!22642 mapKey!22642 mapValue!22642))))

(declare-fun b!812592 () Bool)

(declare-fun e!450121 () Bool)

(declare-fun tp_is_empty!14045 () Bool)

(assert (=> b!812592 (= e!450121 tp_is_empty!14045)))

(declare-fun b!812593 () Bool)

(declare-fun e!450119 () Bool)

(assert (=> b!812593 (= e!450119 (and e!450121 mapRes!22642))))

(declare-fun condMapEmpty!22642 () Bool)

(declare-fun mapDefault!22642 () ValueCell!6607)

