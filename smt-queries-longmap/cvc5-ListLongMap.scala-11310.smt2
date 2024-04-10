; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131764 () Bool)

(assert start!131764)

(declare-fun mapNonEmpty!58333 () Bool)

(declare-fun mapRes!58333 () Bool)

(declare-fun tp!110860 () Bool)

(declare-fun e!858459 () Bool)

(assert (=> mapNonEmpty!58333 (= mapRes!58333 (and tp!110860 e!858459))))

(declare-datatypes ((V!58781 0))(
  ( (V!58782 (val!18954 Int)) )
))
(declare-datatypes ((ValueCell!17966 0))(
  ( (ValueCellFull!17966 (v!21755 V!58781)) (EmptyCell!17966) )
))
(declare-fun mapValue!58333 () ValueCell!17966)

(declare-fun mapRest!58333 () (Array (_ BitVec 32) ValueCell!17966))

(declare-fun mapKey!58333 () (_ BitVec 32))

(declare-datatypes ((array!102734 0))(
  ( (array!102735 (arr!49569 (Array (_ BitVec 32) ValueCell!17966)) (size!50119 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102734)

(assert (=> mapNonEmpty!58333 (= (arr!49569 _values!470) (store mapRest!58333 mapKey!58333 mapValue!58333))))

(declare-fun b!1542831 () Bool)

(declare-fun res!1058690 () Bool)

(declare-fun e!858457 () Bool)

(assert (=> b!1542831 (=> (not res!1058690) (not e!858457))))

(declare-datatypes ((array!102736 0))(
  ( (array!102737 (arr!49570 (Array (_ BitVec 32) (_ BitVec 64))) (size!50120 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102736)

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1542831 (= res!1058690 (and (= (size!50119 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50120 _keys!618) (size!50119 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1542832 () Bool)

(declare-fun tp_is_empty!37753 () Bool)

(assert (=> b!1542832 (= e!858459 tp_is_empty!37753)))

(declare-fun res!1058689 () Bool)

(assert (=> start!131764 (=> (not res!1058689) (not e!858457))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131764 (= res!1058689 (validMask!0 mask!926))))

(assert (=> start!131764 e!858457))

(assert (=> start!131764 true))

(declare-fun e!858455 () Bool)

(declare-fun array_inv!38569 (array!102734) Bool)

(assert (=> start!131764 (and (array_inv!38569 _values!470) e!858455)))

(declare-fun array_inv!38570 (array!102736) Bool)

(assert (=> start!131764 (array_inv!38570 _keys!618)))

(declare-fun b!1542833 () Bool)

(declare-fun e!858458 () Bool)

(assert (=> b!1542833 (= e!858458 tp_is_empty!37753)))

(declare-fun mapIsEmpty!58333 () Bool)

(assert (=> mapIsEmpty!58333 mapRes!58333))

(declare-fun b!1542834 () Bool)

(assert (=> b!1542834 (= e!858455 (and e!858458 mapRes!58333))))

(declare-fun condMapEmpty!58333 () Bool)

(declare-fun mapDefault!58333 () ValueCell!17966)

