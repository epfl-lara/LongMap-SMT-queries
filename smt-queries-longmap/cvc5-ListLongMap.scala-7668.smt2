; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96328 () Bool)

(assert start!96328)

(declare-fun b!1094746 () Bool)

(declare-fun e!625017 () Bool)

(declare-fun e!625019 () Bool)

(assert (=> b!1094746 (= e!625017 e!625019)))

(declare-fun res!730568 () Bool)

(assert (=> b!1094746 (=> (not res!730568) (not e!625019))))

(declare-datatypes ((array!70879 0))(
  ( (array!70880 (arr!34113 (Array (_ BitVec 32) (_ BitVec 64))) (size!34649 (_ BitVec 32))) )
))
(declare-fun lt!489696 () array!70879)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70879 (_ BitVec 32)) Bool)

(assert (=> b!1094746 (= res!730568 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!489696 mask!1414))))

(declare-fun _keys!1070 () array!70879)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1094746 (= lt!489696 (array!70880 (store (arr!34113 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34649 _keys!1070)))))

(declare-fun res!730566 () Bool)

(assert (=> start!96328 (=> (not res!730566) (not e!625017))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96328 (= res!730566 (validMask!0 mask!1414))))

(assert (=> start!96328 e!625017))

(assert (=> start!96328 true))

(declare-fun array_inv!26286 (array!70879) Bool)

(assert (=> start!96328 (array_inv!26286 _keys!1070)))

(declare-datatypes ((V!41105 0))(
  ( (V!41106 (val!13548 Int)) )
))
(declare-datatypes ((ValueCell!12782 0))(
  ( (ValueCellFull!12782 (v!16169 V!41105)) (EmptyCell!12782) )
))
(declare-datatypes ((array!70881 0))(
  ( (array!70882 (arr!34114 (Array (_ BitVec 32) ValueCell!12782)) (size!34650 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70881)

(declare-fun e!625014 () Bool)

(declare-fun array_inv!26287 (array!70881) Bool)

(assert (=> start!96328 (and (array_inv!26287 _values!874) e!625014)))

(declare-fun b!1094747 () Bool)

(declare-fun res!730569 () Bool)

(assert (=> b!1094747 (=> (not res!730569) (not e!625017))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1094747 (= res!730569 (and (= (size!34650 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34649 _keys!1070) (size!34650 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1094748 () Bool)

(declare-fun res!730571 () Bool)

(assert (=> b!1094748 (=> (not res!730571) (not e!625017))))

(declare-fun k!904 () (_ BitVec 64))

(assert (=> b!1094748 (= res!730571 (= (select (arr!34113 _keys!1070) i!650) k!904))))

(declare-fun b!1094749 () Bool)

(declare-fun e!625018 () Bool)

(declare-fun tp_is_empty!26983 () Bool)

(assert (=> b!1094749 (= e!625018 tp_is_empty!26983)))

(declare-fun mapIsEmpty!42229 () Bool)

(declare-fun mapRes!42229 () Bool)

(assert (=> mapIsEmpty!42229 mapRes!42229))

(declare-fun b!1094750 () Bool)

(declare-fun e!625016 () Bool)

(assert (=> b!1094750 (= e!625016 tp_is_empty!26983)))

(declare-fun b!1094751 () Bool)

(declare-fun res!730565 () Bool)

(assert (=> b!1094751 (=> (not res!730565) (not e!625017))))

(assert (=> b!1094751 (= res!730565 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1094752 () Bool)

(declare-fun res!730570 () Bool)

(assert (=> b!1094752 (=> (not res!730570) (not e!625017))))

(assert (=> b!1094752 (= res!730570 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34649 _keys!1070))))))

(declare-fun b!1094753 () Bool)

(assert (=> b!1094753 (= e!625019 false)))

(declare-fun lt!489697 () Bool)

(declare-datatypes ((List!23827 0))(
  ( (Nil!23824) (Cons!23823 (h!25032 (_ BitVec 64)) (t!33834 List!23827)) )
))
(declare-fun arrayNoDuplicates!0 (array!70879 (_ BitVec 32) List!23827) Bool)

(assert (=> b!1094753 (= lt!489697 (arrayNoDuplicates!0 lt!489696 #b00000000000000000000000000000000 Nil!23824))))

(declare-fun b!1094754 () Bool)

(declare-fun res!730567 () Bool)

(assert (=> b!1094754 (=> (not res!730567) (not e!625017))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1094754 (= res!730567 (validKeyInArray!0 k!904))))

(declare-fun mapNonEmpty!42229 () Bool)

(declare-fun tp!80744 () Bool)

(assert (=> mapNonEmpty!42229 (= mapRes!42229 (and tp!80744 e!625016))))

(declare-fun mapKey!42229 () (_ BitVec 32))

(declare-fun mapValue!42229 () ValueCell!12782)

(declare-fun mapRest!42229 () (Array (_ BitVec 32) ValueCell!12782))

(assert (=> mapNonEmpty!42229 (= (arr!34114 _values!874) (store mapRest!42229 mapKey!42229 mapValue!42229))))

(declare-fun b!1094755 () Bool)

(declare-fun res!730572 () Bool)

(assert (=> b!1094755 (=> (not res!730572) (not e!625017))))

(assert (=> b!1094755 (= res!730572 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23824))))

(declare-fun b!1094756 () Bool)

(assert (=> b!1094756 (= e!625014 (and e!625018 mapRes!42229))))

(declare-fun condMapEmpty!42229 () Bool)

(declare-fun mapDefault!42229 () ValueCell!12782)

