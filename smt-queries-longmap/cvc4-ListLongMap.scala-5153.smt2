; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69886 () Bool)

(assert start!69886)

(declare-fun b!812538 () Bool)

(declare-fun res!555226 () Bool)

(declare-fun e!450077 () Bool)

(assert (=> b!812538 (=> (not res!555226) (not e!450077))))

(declare-datatypes ((array!44300 0))(
  ( (array!44301 (arr!21212 (Array (_ BitVec 32) (_ BitVec 64))) (size!21633 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44300)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44300 (_ BitVec 32)) Bool)

(assert (=> b!812538 (= res!555226 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!812539 () Bool)

(declare-fun e!450075 () Bool)

(declare-fun tp_is_empty!14039 () Bool)

(assert (=> b!812539 (= e!450075 tp_is_empty!14039)))

(declare-fun mapIsEmpty!22633 () Bool)

(declare-fun mapRes!22633 () Bool)

(assert (=> mapIsEmpty!22633 mapRes!22633))

(declare-fun mapNonEmpty!22633 () Bool)

(declare-fun tp!43741 () Bool)

(assert (=> mapNonEmpty!22633 (= mapRes!22633 (and tp!43741 e!450075))))

(declare-datatypes ((V!23719 0))(
  ( (V!23720 (val!7067 Int)) )
))
(declare-datatypes ((ValueCell!6604 0))(
  ( (ValueCellFull!6604 (v!9494 V!23719)) (EmptyCell!6604) )
))
(declare-fun mapRest!22633 () (Array (_ BitVec 32) ValueCell!6604))

(declare-fun mapValue!22633 () ValueCell!6604)

(declare-datatypes ((array!44302 0))(
  ( (array!44303 (arr!21213 (Array (_ BitVec 32) ValueCell!6604)) (size!21634 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44302)

(declare-fun mapKey!22633 () (_ BitVec 32))

(assert (=> mapNonEmpty!22633 (= (arr!21213 _values!788) (store mapRest!22633 mapKey!22633 mapValue!22633))))

(declare-fun b!812540 () Bool)

(declare-fun e!450076 () Bool)

(declare-fun e!450078 () Bool)

(assert (=> b!812540 (= e!450076 (and e!450078 mapRes!22633))))

(declare-fun condMapEmpty!22633 () Bool)

(declare-fun mapDefault!22633 () ValueCell!6604)

