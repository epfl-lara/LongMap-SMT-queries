; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96064 () Bool)

(assert start!96064)

(declare-fun b_free!22717 () Bool)

(declare-fun b_next!22717 () Bool)

(assert (=> start!96064 (= b_free!22717 (not b_next!22717))))

(declare-fun tp!79999 () Bool)

(declare-fun b_and!36109 () Bool)

(assert (=> start!96064 (= tp!79999 b_and!36109)))

(declare-fun mapNonEmpty!41833 () Bool)

(declare-fun mapRes!41833 () Bool)

(declare-fun tp!80000 () Bool)

(declare-fun e!622295 () Bool)

(assert (=> mapNonEmpty!41833 (= mapRes!41833 (and tp!80000 e!622295))))

(declare-datatypes ((V!40753 0))(
  ( (V!40754 (val!13416 Int)) )
))
(declare-datatypes ((ValueCell!12650 0))(
  ( (ValueCellFull!12650 (v!16037 V!40753)) (EmptyCell!12650) )
))
(declare-fun mapValue!41833 () ValueCell!12650)

(declare-datatypes ((array!70361 0))(
  ( (array!70362 (arr!33854 (Array (_ BitVec 32) ValueCell!12650)) (size!34390 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70361)

(declare-fun mapKey!41833 () (_ BitVec 32))

(declare-fun mapRest!41833 () (Array (_ BitVec 32) ValueCell!12650))

(assert (=> mapNonEmpty!41833 (= (arr!33854 _values!874) (store mapRest!41833 mapKey!41833 mapValue!41833))))

(declare-fun b!1089514 () Bool)

(declare-fun e!622293 () Bool)

(declare-fun e!622296 () Bool)

(assert (=> b!1089514 (= e!622293 e!622296)))

(declare-fun res!726756 () Bool)

(assert (=> b!1089514 (=> (not res!726756) (not e!622296))))

(declare-datatypes ((array!70363 0))(
  ( (array!70364 (arr!33855 (Array (_ BitVec 32) (_ BitVec 64))) (size!34391 (_ BitVec 32))) )
))
(declare-fun lt!485754 () array!70363)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70363 (_ BitVec 32)) Bool)

(assert (=> b!1089514 (= res!726756 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!485754 mask!1414))))

(declare-fun _keys!1070 () array!70363)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1089514 (= lt!485754 (array!70364 (store (arr!33855 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34391 _keys!1070)))))

(declare-fun b!1089515 () Bool)

(declare-fun e!622297 () Bool)

(declare-fun tp_is_empty!26719 () Bool)

(assert (=> b!1089515 (= e!622297 tp_is_empty!26719)))

(declare-fun b!1089516 () Bool)

(declare-fun res!726765 () Bool)

(assert (=> b!1089516 (=> (not res!726765) (not e!622296))))

(declare-datatypes ((List!23632 0))(
  ( (Nil!23629) (Cons!23628 (h!24837 (_ BitVec 64)) (t!33407 List!23632)) )
))
(declare-fun arrayNoDuplicates!0 (array!70363 (_ BitVec 32) List!23632) Bool)

(assert (=> b!1089516 (= res!726765 (arrayNoDuplicates!0 lt!485754 #b00000000000000000000000000000000 Nil!23629))))

(declare-fun b!1089517 () Bool)

(declare-fun res!726764 () Bool)

(assert (=> b!1089517 (=> (not res!726764) (not e!622293))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1089517 (= res!726764 (and (= (size!34390 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34391 _keys!1070) (size!34390 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1089518 () Bool)

(declare-fun e!622291 () Bool)

(assert (=> b!1089518 (= e!622291 true)))

(declare-datatypes ((tuple2!17044 0))(
  ( (tuple2!17045 (_1!8533 (_ BitVec 64)) (_2!8533 V!40753)) )
))
(declare-datatypes ((List!23633 0))(
  ( (Nil!23630) (Cons!23629 (h!24838 tuple2!17044) (t!33408 List!23633)) )
))
(declare-datatypes ((ListLongMap!15013 0))(
  ( (ListLongMap!15014 (toList!7522 List!23633)) )
))
(declare-fun lt!485750 () ListLongMap!15013)

(declare-fun k!904 () (_ BitVec 64))

(declare-fun lt!485752 () ListLongMap!15013)

(declare-fun -!847 (ListLongMap!15013 (_ BitVec 64)) ListLongMap!15013)

(assert (=> b!1089518 (= (-!847 lt!485750 k!904) lt!485752)))

(declare-fun lt!485759 () ListLongMap!15013)

(declare-fun zeroValue!831 () V!40753)

(declare-datatypes ((Unit!35860 0))(
  ( (Unit!35861) )
))
(declare-fun lt!485755 () Unit!35860)

(declare-fun addRemoveCommutativeForDiffKeys!74 (ListLongMap!15013 (_ BitVec 64) V!40753 (_ BitVec 64)) Unit!35860)

(assert (=> b!1089518 (= lt!485755 (addRemoveCommutativeForDiffKeys!74 lt!485759 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k!904))))

(declare-fun b!1089519 () Bool)

(declare-fun res!726758 () Bool)

(assert (=> b!1089519 (=> (not res!726758) (not e!622293))))

(assert (=> b!1089519 (= res!726758 (= (select (arr!33855 _keys!1070) i!650) k!904))))

(declare-fun b!1089520 () Bool)

(declare-fun res!726763 () Bool)

(assert (=> b!1089520 (=> (not res!726763) (not e!622293))))

(assert (=> b!1089520 (= res!726763 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23629))))

(declare-fun b!1089521 () Bool)

(assert (=> b!1089521 (= e!622295 tp_is_empty!26719)))

(declare-fun mapIsEmpty!41833 () Bool)

(assert (=> mapIsEmpty!41833 mapRes!41833))

(declare-fun res!726762 () Bool)

(assert (=> start!96064 (=> (not res!726762) (not e!622293))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96064 (= res!726762 (validMask!0 mask!1414))))

(assert (=> start!96064 e!622293))

(assert (=> start!96064 tp!79999))

(assert (=> start!96064 true))

(assert (=> start!96064 tp_is_empty!26719))

(declare-fun array_inv!26110 (array!70363) Bool)

(assert (=> start!96064 (array_inv!26110 _keys!1070)))

(declare-fun e!622298 () Bool)

(declare-fun array_inv!26111 (array!70361) Bool)

(assert (=> start!96064 (and (array_inv!26111 _values!874) e!622298)))

(declare-fun b!1089522 () Bool)

(declare-fun res!726761 () Bool)

(assert (=> b!1089522 (=> (not res!726761) (not e!622293))))

(assert (=> b!1089522 (= res!726761 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34391 _keys!1070))))))

(declare-fun b!1089523 () Bool)

(declare-fun res!726757 () Bool)

(assert (=> b!1089523 (=> (not res!726757) (not e!622293))))

(assert (=> b!1089523 (= res!726757 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1089524 () Bool)

(assert (=> b!1089524 (= e!622298 (and e!622297 mapRes!41833))))

(declare-fun condMapEmpty!41833 () Bool)

(declare-fun mapDefault!41833 () ValueCell!12650)

