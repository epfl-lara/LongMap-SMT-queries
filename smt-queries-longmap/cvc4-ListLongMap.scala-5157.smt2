; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69910 () Bool)

(assert start!69910)

(declare-fun mapNonEmpty!22669 () Bool)

(declare-fun mapRes!22669 () Bool)

(declare-fun tp!43777 () Bool)

(declare-fun e!450254 () Bool)

(assert (=> mapNonEmpty!22669 (= mapRes!22669 (and tp!43777 e!450254))))

(declare-fun mapKey!22669 () (_ BitVec 32))

(declare-datatypes ((V!23751 0))(
  ( (V!23752 (val!7079 Int)) )
))
(declare-datatypes ((ValueCell!6616 0))(
  ( (ValueCellFull!6616 (v!9506 V!23751)) (EmptyCell!6616) )
))
(declare-fun mapValue!22669 () ValueCell!6616)

(declare-datatypes ((array!44344 0))(
  ( (array!44345 (arr!21234 (Array (_ BitVec 32) ValueCell!6616)) (size!21655 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44344)

(declare-fun mapRest!22669 () (Array (_ BitVec 32) ValueCell!6616))

(assert (=> mapNonEmpty!22669 (= (arr!21234 _values!788) (store mapRest!22669 mapKey!22669 mapValue!22669))))

(declare-fun b!812754 () Bool)

(declare-fun e!450258 () Bool)

(declare-fun e!450257 () Bool)

(assert (=> b!812754 (= e!450258 (and e!450257 mapRes!22669))))

(declare-fun condMapEmpty!22669 () Bool)

(declare-fun mapDefault!22669 () ValueCell!6616)

