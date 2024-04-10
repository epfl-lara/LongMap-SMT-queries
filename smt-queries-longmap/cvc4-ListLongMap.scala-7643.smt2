; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96182 () Bool)

(assert start!96182)

(declare-fun b_free!22835 () Bool)

(declare-fun b_next!22835 () Bool)

(assert (=> start!96182 (= b_free!22835 (not b_next!22835))))

(declare-fun tp!80353 () Bool)

(declare-fun b_and!36345 () Bool)

(assert (=> start!96182 (= tp!80353 b_and!36345)))

(declare-fun b!1092119 () Bool)

(declare-fun res!728719 () Bool)

(declare-fun e!623713 () Bool)

(assert (=> b!1092119 (=> (not res!728719) (not e!623713))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1092119 (= res!728719 (validKeyInArray!0 k!904))))

(declare-fun b!1092120 () Bool)

(declare-fun res!728718 () Bool)

(assert (=> b!1092120 (=> (not res!728718) (not e!623713))))

(declare-datatypes ((array!70593 0))(
  ( (array!70594 (arr!33970 (Array (_ BitVec 32) (_ BitVec 64))) (size!34506 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70593)

(declare-datatypes ((List!23730 0))(
  ( (Nil!23727) (Cons!23726 (h!24935 (_ BitVec 64)) (t!33623 List!23730)) )
))
(declare-fun arrayNoDuplicates!0 (array!70593 (_ BitVec 32) List!23730) Bool)

(assert (=> b!1092120 (= res!728718 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23727))))

(declare-fun b!1092121 () Bool)

(declare-fun e!623712 () Bool)

(assert (=> b!1092121 (= e!623712 true)))

(declare-datatypes ((V!40909 0))(
  ( (V!40910 (val!13475 Int)) )
))
(declare-datatypes ((tuple2!17146 0))(
  ( (tuple2!17147 (_1!8584 (_ BitVec 64)) (_2!8584 V!40909)) )
))
(declare-datatypes ((List!23731 0))(
  ( (Nil!23728) (Cons!23727 (h!24936 tuple2!17146) (t!33624 List!23731)) )
))
(declare-datatypes ((ListLongMap!15115 0))(
  ( (ListLongMap!15116 (toList!7573 List!23731)) )
))
(declare-fun lt!488024 () ListLongMap!15115)

(declare-fun lt!488035 () ListLongMap!15115)

(declare-fun -!892 (ListLongMap!15115 (_ BitVec 64)) ListLongMap!15115)

(assert (=> b!1092121 (= (-!892 lt!488024 k!904) lt!488035)))

(declare-datatypes ((Unit!35950 0))(
  ( (Unit!35951) )
))
(declare-fun lt!488028 () Unit!35950)

(declare-fun minValue!831 () V!40909)

(declare-fun lt!488023 () ListLongMap!15115)

(declare-fun addRemoveCommutativeForDiffKeys!113 (ListLongMap!15115 (_ BitVec 64) V!40909 (_ BitVec 64)) Unit!35950)

(assert (=> b!1092121 (= lt!488028 (addRemoveCommutativeForDiffKeys!113 lt!488023 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k!904))))

(declare-fun mapIsEmpty!42010 () Bool)

(declare-fun mapRes!42010 () Bool)

(assert (=> mapIsEmpty!42010 mapRes!42010))

(declare-fun b!1092122 () Bool)

(declare-fun res!728716 () Bool)

(assert (=> b!1092122 (=> (not res!728716) (not e!623713))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1092122 (= res!728716 (= (select (arr!33970 _keys!1070) i!650) k!904))))

(declare-fun res!728721 () Bool)

(assert (=> start!96182 (=> (not res!728721) (not e!623713))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96182 (= res!728721 (validMask!0 mask!1414))))

(assert (=> start!96182 e!623713))

(assert (=> start!96182 tp!80353))

(assert (=> start!96182 true))

(declare-fun tp_is_empty!26837 () Bool)

(assert (=> start!96182 tp_is_empty!26837))

(declare-fun array_inv!26190 (array!70593) Bool)

(assert (=> start!96182 (array_inv!26190 _keys!1070)))

(declare-datatypes ((ValueCell!12709 0))(
  ( (ValueCellFull!12709 (v!16096 V!40909)) (EmptyCell!12709) )
))
(declare-datatypes ((array!70595 0))(
  ( (array!70596 (arr!33971 (Array (_ BitVec 32) ValueCell!12709)) (size!34507 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70595)

(declare-fun e!623709 () Bool)

(declare-fun array_inv!26191 (array!70595) Bool)

(assert (=> start!96182 (and (array_inv!26191 _values!874) e!623709)))

(declare-fun b!1092123 () Bool)

(declare-fun e!623708 () Bool)

(assert (=> b!1092123 (= e!623713 e!623708)))

(declare-fun res!728715 () Bool)

(assert (=> b!1092123 (=> (not res!728715) (not e!623708))))

(declare-fun lt!488032 () array!70593)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70593 (_ BitVec 32)) Bool)

(assert (=> b!1092123 (= res!728715 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!488032 mask!1414))))

(assert (=> b!1092123 (= lt!488032 (array!70594 (store (arr!33970 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34506 _keys!1070)))))

(declare-fun b!1092124 () Bool)

(declare-fun res!728711 () Bool)

(assert (=> b!1092124 (=> (not res!728711) (not e!623713))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1092124 (= res!728711 (and (= (size!34507 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34506 _keys!1070) (size!34507 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1092125 () Bool)

(declare-fun e!623710 () Bool)

(assert (=> b!1092125 (= e!623708 (not e!623710))))

(declare-fun res!728720 () Bool)

(assert (=> b!1092125 (=> res!728720 e!623710)))

(assert (=> b!1092125 (= res!728720 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!488031 () ListLongMap!15115)

(declare-fun defaultEntry!882 () Int)

(declare-fun zeroValue!831 () V!40909)

(declare-fun getCurrentListMap!4329 (array!70593 array!70595 (_ BitVec 32) (_ BitVec 32) V!40909 V!40909 (_ BitVec 32) Int) ListLongMap!15115)

(assert (=> b!1092125 (= lt!488031 (getCurrentListMap!4329 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!488033 () array!70595)

(declare-fun lt!488030 () ListLongMap!15115)

(assert (=> b!1092125 (= lt!488030 (getCurrentListMap!4329 lt!488032 lt!488033 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!488026 () ListLongMap!15115)

(declare-fun lt!488029 () ListLongMap!15115)

(assert (=> b!1092125 (and (= lt!488026 lt!488029) (= lt!488029 lt!488026))))

(assert (=> b!1092125 (= lt!488029 (-!892 lt!488023 k!904))))

(declare-fun lt!488027 () Unit!35950)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!148 (array!70593 array!70595 (_ BitVec 32) (_ BitVec 32) V!40909 V!40909 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35950)

(assert (=> b!1092125 (= lt!488027 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!148 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4089 (array!70593 array!70595 (_ BitVec 32) (_ BitVec 32) V!40909 V!40909 (_ BitVec 32) Int) ListLongMap!15115)

(assert (=> b!1092125 (= lt!488026 (getCurrentListMapNoExtraKeys!4089 lt!488032 lt!488033 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2226 (Int (_ BitVec 64)) V!40909)

(assert (=> b!1092125 (= lt!488033 (array!70596 (store (arr!33971 _values!874) i!650 (ValueCellFull!12709 (dynLambda!2226 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34507 _values!874)))))

(assert (=> b!1092125 (= lt!488023 (getCurrentListMapNoExtraKeys!4089 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70593 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1092125 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-fun lt!488034 () Unit!35950)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70593 (_ BitVec 64) (_ BitVec 32)) Unit!35950)

(assert (=> b!1092125 (= lt!488034 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1092126 () Bool)

(declare-fun e!623711 () Bool)

(assert (=> b!1092126 (= e!623711 tp_is_empty!26837)))

(declare-fun mapNonEmpty!42010 () Bool)

(declare-fun tp!80354 () Bool)

(declare-fun e!623707 () Bool)

(assert (=> mapNonEmpty!42010 (= mapRes!42010 (and tp!80354 e!623707))))

(declare-fun mapRest!42010 () (Array (_ BitVec 32) ValueCell!12709))

(declare-fun mapKey!42010 () (_ BitVec 32))

(declare-fun mapValue!42010 () ValueCell!12709)

(assert (=> mapNonEmpty!42010 (= (arr!33971 _values!874) (store mapRest!42010 mapKey!42010 mapValue!42010))))

(declare-fun b!1092127 () Bool)

(declare-fun res!728717 () Bool)

(assert (=> b!1092127 (=> (not res!728717) (not e!623713))))

(assert (=> b!1092127 (= res!728717 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34506 _keys!1070))))))

(declare-fun b!1092128 () Bool)

(declare-fun res!728714 () Bool)

(assert (=> b!1092128 (=> (not res!728714) (not e!623713))))

(assert (=> b!1092128 (= res!728714 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1092129 () Bool)

(assert (=> b!1092129 (= e!623709 (and e!623711 mapRes!42010))))

(declare-fun condMapEmpty!42010 () Bool)

(declare-fun mapDefault!42010 () ValueCell!12709)

