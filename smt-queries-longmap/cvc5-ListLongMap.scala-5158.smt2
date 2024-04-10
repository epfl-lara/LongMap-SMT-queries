; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69912 () Bool)

(assert start!69912)

(declare-fun mapNonEmpty!22672 () Bool)

(declare-fun mapRes!22672 () Bool)

(declare-fun tp!43780 () Bool)

(declare-fun e!450273 () Bool)

(assert (=> mapNonEmpty!22672 (= mapRes!22672 (and tp!43780 e!450273))))

(declare-datatypes ((V!23755 0))(
  ( (V!23756 (val!7080 Int)) )
))
(declare-datatypes ((ValueCell!6617 0))(
  ( (ValueCellFull!6617 (v!9507 V!23755)) (EmptyCell!6617) )
))
(declare-fun mapValue!22672 () ValueCell!6617)

(declare-datatypes ((array!44346 0))(
  ( (array!44347 (arr!21235 (Array (_ BitVec 32) ValueCell!6617)) (size!21656 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44346)

(declare-fun mapRest!22672 () (Array (_ BitVec 32) ValueCell!6617))

(declare-fun mapKey!22672 () (_ BitVec 32))

(assert (=> mapNonEmpty!22672 (= (arr!21235 _values!788) (store mapRest!22672 mapKey!22672 mapValue!22672))))

(declare-fun b!812774 () Bool)

(declare-fun e!450270 () Bool)

(declare-datatypes ((array!44348 0))(
  ( (array!44349 (arr!21236 (Array (_ BitVec 32) (_ BitVec 64))) (size!21657 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44348)

(assert (=> b!812774 (= e!450270 (bvsgt #b00000000000000000000000000000000 (size!21657 _keys!976)))))

(declare-fun res!555348 () Bool)

(assert (=> start!69912 (=> (not res!555348) (not e!450270))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69912 (= res!555348 (validMask!0 mask!1312))))

(assert (=> start!69912 e!450270))

(declare-fun array_inv!17011 (array!44348) Bool)

(assert (=> start!69912 (array_inv!17011 _keys!976)))

(assert (=> start!69912 true))

(declare-fun e!450271 () Bool)

(declare-fun array_inv!17012 (array!44346) Bool)

(assert (=> start!69912 (and (array_inv!17012 _values!788) e!450271)))

(declare-fun mapIsEmpty!22672 () Bool)

(assert (=> mapIsEmpty!22672 mapRes!22672))

(declare-fun b!812775 () Bool)

(declare-fun res!555346 () Bool)

(assert (=> b!812775 (=> (not res!555346) (not e!450270))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44348 (_ BitVec 32)) Bool)

(assert (=> b!812775 (= res!555346 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!812776 () Bool)

(declare-fun e!450269 () Bool)

(assert (=> b!812776 (= e!450271 (and e!450269 mapRes!22672))))

(declare-fun condMapEmpty!22672 () Bool)

(declare-fun mapDefault!22672 () ValueCell!6617)

