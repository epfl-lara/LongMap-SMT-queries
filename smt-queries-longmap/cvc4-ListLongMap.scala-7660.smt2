; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96284 () Bool)

(assert start!96284)

(declare-fun b_free!22937 () Bool)

(declare-fun b_next!22937 () Bool)

(assert (=> start!96284 (= b_free!22937 (not b_next!22937))))

(declare-fun tp!80660 () Bool)

(declare-fun b_and!36549 () Bool)

(assert (=> start!96284 (= tp!80660 b_and!36549)))

(declare-fun b!1094077 () Bool)

(declare-fun res!730109 () Bool)

(declare-fun e!624650 () Bool)

(assert (=> b!1094077 (=> (not res!730109) (not e!624650))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((array!70793 0))(
  ( (array!70794 (arr!34070 (Array (_ BitVec 32) (_ BitVec 64))) (size!34606 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70793)

(declare-datatypes ((V!41045 0))(
  ( (V!41046 (val!13526 Int)) )
))
(declare-datatypes ((ValueCell!12760 0))(
  ( (ValueCellFull!12760 (v!16147 V!41045)) (EmptyCell!12760) )
))
(declare-datatypes ((array!70795 0))(
  ( (array!70796 (arr!34071 (Array (_ BitVec 32) ValueCell!12760)) (size!34607 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70795)

(assert (=> b!1094077 (= res!730109 (and (= (size!34607 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34606 _keys!1070) (size!34607 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun res!730110 () Bool)

(assert (=> start!96284 (=> (not res!730110) (not e!624650))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96284 (= res!730110 (validMask!0 mask!1414))))

(assert (=> start!96284 e!624650))

(assert (=> start!96284 tp!80660))

(assert (=> start!96284 true))

(declare-fun tp_is_empty!26939 () Bool)

(assert (=> start!96284 tp_is_empty!26939))

(declare-fun array_inv!26258 (array!70793) Bool)

(assert (=> start!96284 (array_inv!26258 _keys!1070)))

(declare-fun e!624646 () Bool)

(declare-fun array_inv!26259 (array!70795) Bool)

(assert (=> start!96284 (and (array_inv!26259 _values!874) e!624646)))

(declare-fun b!1094078 () Bool)

(declare-fun res!730114 () Bool)

(assert (=> b!1094078 (=> (not res!730114) (not e!624650))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70793 (_ BitVec 32)) Bool)

(assert (=> b!1094078 (= res!730114 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun mapNonEmpty!42163 () Bool)

(declare-fun mapRes!42163 () Bool)

(declare-fun tp!80659 () Bool)

(declare-fun e!624647 () Bool)

(assert (=> mapNonEmpty!42163 (= mapRes!42163 (and tp!80659 e!624647))))

(declare-fun mapKey!42163 () (_ BitVec 32))

(declare-fun mapRest!42163 () (Array (_ BitVec 32) ValueCell!12760))

(declare-fun mapValue!42163 () ValueCell!12760)

(assert (=> mapNonEmpty!42163 (= (arr!34071 _values!874) (store mapRest!42163 mapKey!42163 mapValue!42163))))

(declare-fun b!1094079 () Bool)

(declare-fun res!730113 () Bool)

(assert (=> b!1094079 (=> (not res!730113) (not e!624650))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1094079 (= res!730113 (validKeyInArray!0 k!904))))

(declare-fun b!1094080 () Bool)

(declare-fun res!730112 () Bool)

(assert (=> b!1094080 (=> (not res!730112) (not e!624650))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1094080 (= res!730112 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34606 _keys!1070))))))

(declare-fun b!1094081 () Bool)

(declare-fun res!730115 () Bool)

(assert (=> b!1094081 (=> (not res!730115) (not e!624650))))

(declare-datatypes ((List!23804 0))(
  ( (Nil!23801) (Cons!23800 (h!25009 (_ BitVec 64)) (t!33799 List!23804)) )
))
(declare-fun arrayNoDuplicates!0 (array!70793 (_ BitVec 32) List!23804) Bool)

(assert (=> b!1094081 (= res!730115 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23801))))

(declare-fun b!1094082 () Bool)

(declare-fun e!624645 () Bool)

(assert (=> b!1094082 (= e!624646 (and e!624645 mapRes!42163))))

(declare-fun condMapEmpty!42163 () Bool)

(declare-fun mapDefault!42163 () ValueCell!12760)

