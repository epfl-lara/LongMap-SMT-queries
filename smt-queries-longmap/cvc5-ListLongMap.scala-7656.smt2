; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96256 () Bool)

(assert start!96256)

(declare-fun b_free!22909 () Bool)

(declare-fun b_next!22909 () Bool)

(assert (=> start!96256 (= b_free!22909 (not b_next!22909))))

(declare-fun tp!80576 () Bool)

(declare-fun b_and!36493 () Bool)

(assert (=> start!96256 (= tp!80576 b_and!36493)))

(declare-fun b!1093545 () Bool)

(declare-fun e!624397 () Bool)

(assert (=> b!1093545 (= e!624397 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((V!41009 0))(
  ( (V!41010 (val!13512 Int)) )
))
(declare-fun minValue!831 () V!41009)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-fun zeroValue!831 () V!41009)

(declare-datatypes ((tuple2!17190 0))(
  ( (tuple2!17191 (_1!8606 (_ BitVec 64)) (_2!8606 V!41009)) )
))
(declare-datatypes ((List!23784 0))(
  ( (Nil!23781) (Cons!23780 (h!24989 tuple2!17190) (t!33751 List!23784)) )
))
(declare-datatypes ((ListLongMap!15159 0))(
  ( (ListLongMap!15160 (toList!7595 List!23784)) )
))
(declare-fun lt!489071 () ListLongMap!15159)

(declare-datatypes ((array!70739 0))(
  ( (array!70740 (arr!34043 (Array (_ BitVec 32) (_ BitVec 64))) (size!34579 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70739)

(declare-datatypes ((ValueCell!12746 0))(
  ( (ValueCellFull!12746 (v!16133 V!41009)) (EmptyCell!12746) )
))
(declare-datatypes ((array!70741 0))(
  ( (array!70742 (arr!34044 (Array (_ BitVec 32) ValueCell!12746)) (size!34580 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70741)

(declare-fun getCurrentListMap!4351 (array!70739 array!70741 (_ BitVec 32) (_ BitVec 32) V!41009 V!41009 (_ BitVec 32) Int) ListLongMap!15159)

(assert (=> b!1093545 (= lt!489071 (getCurrentListMap!4351 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!489072 () array!70739)

(declare-fun lt!489077 () array!70741)

(declare-fun lt!489078 () ListLongMap!15159)

(assert (=> b!1093545 (= lt!489078 (getCurrentListMap!4351 lt!489072 lt!489077 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!489079 () ListLongMap!15159)

(declare-fun lt!489074 () ListLongMap!15159)

(assert (=> b!1093545 (and (= lt!489079 lt!489074) (= lt!489074 lt!489079))))

(declare-fun lt!489075 () ListLongMap!15159)

(declare-fun k!904 () (_ BitVec 64))

(declare-fun -!914 (ListLongMap!15159 (_ BitVec 64)) ListLongMap!15159)

(assert (=> b!1093545 (= lt!489074 (-!914 lt!489075 k!904))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((Unit!35994 0))(
  ( (Unit!35995) )
))
(declare-fun lt!489073 () Unit!35994)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!170 (array!70739 array!70741 (_ BitVec 32) (_ BitVec 32) V!41009 V!41009 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35994)

(assert (=> b!1093545 (= lt!489073 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!170 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4111 (array!70739 array!70741 (_ BitVec 32) (_ BitVec 32) V!41009 V!41009 (_ BitVec 32) Int) ListLongMap!15159)

(assert (=> b!1093545 (= lt!489079 (getCurrentListMapNoExtraKeys!4111 lt!489072 lt!489077 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2248 (Int (_ BitVec 64)) V!41009)

(assert (=> b!1093545 (= lt!489077 (array!70742 (store (arr!34044 _values!874) i!650 (ValueCellFull!12746 (dynLambda!2248 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34580 _values!874)))))

(assert (=> b!1093545 (= lt!489075 (getCurrentListMapNoExtraKeys!4111 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70739 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1093545 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-fun lt!489076 () Unit!35994)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70739 (_ BitVec 64) (_ BitVec 32)) Unit!35994)

(assert (=> b!1093545 (= lt!489076 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1093546 () Bool)

(declare-fun res!729737 () Bool)

(declare-fun e!624393 () Bool)

(assert (=> b!1093546 (=> (not res!729737) (not e!624393))))

(assert (=> b!1093546 (= res!729737 (and (= (size!34580 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34579 _keys!1070) (size!34580 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1093547 () Bool)

(assert (=> b!1093547 (= e!624393 e!624397)))

(declare-fun res!729730 () Bool)

(assert (=> b!1093547 (=> (not res!729730) (not e!624397))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70739 (_ BitVec 32)) Bool)

(assert (=> b!1093547 (= res!729730 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!489072 mask!1414))))

(assert (=> b!1093547 (= lt!489072 (array!70740 (store (arr!34043 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34579 _keys!1070)))))

(declare-fun b!1093548 () Bool)

(declare-fun res!729736 () Bool)

(assert (=> b!1093548 (=> (not res!729736) (not e!624397))))

(declare-datatypes ((List!23785 0))(
  ( (Nil!23782) (Cons!23781 (h!24990 (_ BitVec 64)) (t!33752 List!23785)) )
))
(declare-fun arrayNoDuplicates!0 (array!70739 (_ BitVec 32) List!23785) Bool)

(assert (=> b!1093548 (= res!729736 (arrayNoDuplicates!0 lt!489072 #b00000000000000000000000000000000 Nil!23782))))

(declare-fun b!1093549 () Bool)

(declare-fun res!729735 () Bool)

(assert (=> b!1093549 (=> (not res!729735) (not e!624393))))

(assert (=> b!1093549 (= res!729735 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23782))))

(declare-fun res!729738 () Bool)

(assert (=> start!96256 (=> (not res!729738) (not e!624393))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96256 (= res!729738 (validMask!0 mask!1414))))

(assert (=> start!96256 e!624393))

(assert (=> start!96256 tp!80576))

(assert (=> start!96256 true))

(declare-fun tp_is_empty!26911 () Bool)

(assert (=> start!96256 tp_is_empty!26911))

(declare-fun array_inv!26234 (array!70739) Bool)

(assert (=> start!96256 (array_inv!26234 _keys!1070)))

(declare-fun e!624396 () Bool)

(declare-fun array_inv!26235 (array!70741) Bool)

(assert (=> start!96256 (and (array_inv!26235 _values!874) e!624396)))

(declare-fun mapNonEmpty!42121 () Bool)

(declare-fun mapRes!42121 () Bool)

(declare-fun tp!80575 () Bool)

(declare-fun e!624398 () Bool)

(assert (=> mapNonEmpty!42121 (= mapRes!42121 (and tp!80575 e!624398))))

(declare-fun mapRest!42121 () (Array (_ BitVec 32) ValueCell!12746))

(declare-fun mapKey!42121 () (_ BitVec 32))

(declare-fun mapValue!42121 () ValueCell!12746)

(assert (=> mapNonEmpty!42121 (= (arr!34044 _values!874) (store mapRest!42121 mapKey!42121 mapValue!42121))))

(declare-fun b!1093550 () Bool)

(declare-fun e!624395 () Bool)

(assert (=> b!1093550 (= e!624396 (and e!624395 mapRes!42121))))

(declare-fun condMapEmpty!42121 () Bool)

(declare-fun mapDefault!42121 () ValueCell!12746)

