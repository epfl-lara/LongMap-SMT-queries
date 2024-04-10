; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96280 () Bool)

(assert start!96280)

(declare-fun b_free!22933 () Bool)

(declare-fun b_next!22933 () Bool)

(assert (=> start!96280 (= b_free!22933 (not b_next!22933))))

(declare-fun tp!80647 () Bool)

(declare-fun b_and!36541 () Bool)

(assert (=> start!96280 (= tp!80647 b_and!36541)))

(declare-fun mapIsEmpty!42157 () Bool)

(declare-fun mapRes!42157 () Bool)

(assert (=> mapIsEmpty!42157 mapRes!42157))

(declare-fun mapNonEmpty!42157 () Bool)

(declare-fun tp!80648 () Bool)

(declare-fun e!624610 () Bool)

(assert (=> mapNonEmpty!42157 (= mapRes!42157 (and tp!80648 e!624610))))

(declare-fun mapKey!42157 () (_ BitVec 32))

(declare-datatypes ((V!41041 0))(
  ( (V!41042 (val!13524 Int)) )
))
(declare-datatypes ((ValueCell!12758 0))(
  ( (ValueCellFull!12758 (v!16145 V!41041)) (EmptyCell!12758) )
))
(declare-datatypes ((array!70785 0))(
  ( (array!70786 (arr!34066 (Array (_ BitVec 32) ValueCell!12758)) (size!34602 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70785)

(declare-fun mapRest!42157 () (Array (_ BitVec 32) ValueCell!12758))

(declare-fun mapValue!42157 () ValueCell!12758)

(assert (=> mapNonEmpty!42157 (= (arr!34066 _values!874) (store mapRest!42157 mapKey!42157 mapValue!42157))))

(declare-fun b!1094001 () Bool)

(declare-fun res!730056 () Bool)

(declare-fun e!624613 () Bool)

(assert (=> b!1094001 (=> (not res!730056) (not e!624613))))

(declare-datatypes ((array!70787 0))(
  ( (array!70788 (arr!34067 (Array (_ BitVec 32) (_ BitVec 64))) (size!34603 (_ BitVec 32))) )
))
(declare-fun lt!489403 () array!70787)

(declare-datatypes ((List!23800 0))(
  ( (Nil!23797) (Cons!23796 (h!25005 (_ BitVec 64)) (t!33791 List!23800)) )
))
(declare-fun arrayNoDuplicates!0 (array!70787 (_ BitVec 32) List!23800) Bool)

(assert (=> b!1094001 (= res!730056 (arrayNoDuplicates!0 lt!489403 #b00000000000000000000000000000000 Nil!23797))))

(declare-fun b!1094002 () Bool)

(declare-fun e!624614 () Bool)

(declare-fun tp_is_empty!26935 () Bool)

(assert (=> b!1094002 (= e!624614 tp_is_empty!26935)))

(declare-fun b!1094003 () Bool)

(declare-fun res!730062 () Bool)

(declare-fun e!624612 () Bool)

(assert (=> b!1094003 (=> (not res!730062) (not e!624612))))

(declare-fun _keys!1070 () array!70787)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70787 (_ BitVec 32)) Bool)

(assert (=> b!1094003 (= res!730062 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1094004 () Bool)

(declare-fun res!730054 () Bool)

(assert (=> b!1094004 (=> (not res!730054) (not e!624612))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1094004 (= res!730054 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34603 _keys!1070))))))

(declare-fun res!730057 () Bool)

(assert (=> start!96280 (=> (not res!730057) (not e!624612))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96280 (= res!730057 (validMask!0 mask!1414))))

(assert (=> start!96280 e!624612))

(assert (=> start!96280 tp!80647))

(assert (=> start!96280 true))

(assert (=> start!96280 tp_is_empty!26935))

(declare-fun array_inv!26254 (array!70787) Bool)

(assert (=> start!96280 (array_inv!26254 _keys!1070)))

(declare-fun e!624609 () Bool)

(declare-fun array_inv!26255 (array!70785) Bool)

(assert (=> start!96280 (and (array_inv!26255 _values!874) e!624609)))

(declare-fun b!1094005 () Bool)

(assert (=> b!1094005 (= e!624610 tp_is_empty!26935)))

(declare-fun b!1094006 () Bool)

(assert (=> b!1094006 (= e!624613 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((tuple2!17204 0))(
  ( (tuple2!17205 (_1!8613 (_ BitVec 64)) (_2!8613 V!41041)) )
))
(declare-datatypes ((List!23801 0))(
  ( (Nil!23798) (Cons!23797 (h!25006 tuple2!17204) (t!33792 List!23801)) )
))
(declare-datatypes ((ListLongMap!15173 0))(
  ( (ListLongMap!15174 (toList!7602 List!23801)) )
))
(declare-fun lt!489396 () ListLongMap!15173)

(declare-fun minValue!831 () V!41041)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-fun zeroValue!831 () V!41041)

(declare-fun getCurrentListMap!4358 (array!70787 array!70785 (_ BitVec 32) (_ BitVec 32) V!41041 V!41041 (_ BitVec 32) Int) ListLongMap!15173)

(assert (=> b!1094006 (= lt!489396 (getCurrentListMap!4358 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!489397 () array!70785)

(declare-fun lt!489400 () ListLongMap!15173)

(assert (=> b!1094006 (= lt!489400 (getCurrentListMap!4358 lt!489403 lt!489397 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!489399 () ListLongMap!15173)

(declare-fun lt!489398 () ListLongMap!15173)

(assert (=> b!1094006 (and (= lt!489399 lt!489398) (= lt!489398 lt!489399))))

(declare-fun lt!489395 () ListLongMap!15173)

(declare-fun k!904 () (_ BitVec 64))

(declare-fun -!921 (ListLongMap!15173 (_ BitVec 64)) ListLongMap!15173)

(assert (=> b!1094006 (= lt!489398 (-!921 lt!489395 k!904))))

(declare-datatypes ((Unit!36008 0))(
  ( (Unit!36009) )
))
(declare-fun lt!489401 () Unit!36008)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!177 (array!70787 array!70785 (_ BitVec 32) (_ BitVec 32) V!41041 V!41041 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36008)

(assert (=> b!1094006 (= lt!489401 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!177 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4118 (array!70787 array!70785 (_ BitVec 32) (_ BitVec 32) V!41041 V!41041 (_ BitVec 32) Int) ListLongMap!15173)

(assert (=> b!1094006 (= lt!489399 (getCurrentListMapNoExtraKeys!4118 lt!489403 lt!489397 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2255 (Int (_ BitVec 64)) V!41041)

(assert (=> b!1094006 (= lt!489397 (array!70786 (store (arr!34066 _values!874) i!650 (ValueCellFull!12758 (dynLambda!2255 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34602 _values!874)))))

(assert (=> b!1094006 (= lt!489395 (getCurrentListMapNoExtraKeys!4118 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70787 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1094006 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-fun lt!489402 () Unit!36008)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70787 (_ BitVec 64) (_ BitVec 32)) Unit!36008)

(assert (=> b!1094006 (= lt!489402 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1094007 () Bool)

(declare-fun res!730061 () Bool)

(assert (=> b!1094007 (=> (not res!730061) (not e!624612))))

(assert (=> b!1094007 (= res!730061 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23797))))

(declare-fun b!1094008 () Bool)

(declare-fun res!730055 () Bool)

(assert (=> b!1094008 (=> (not res!730055) (not e!624612))))

(assert (=> b!1094008 (= res!730055 (and (= (size!34602 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34603 _keys!1070) (size!34602 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1094009 () Bool)

(assert (=> b!1094009 (= e!624612 e!624613)))

(declare-fun res!730058 () Bool)

(assert (=> b!1094009 (=> (not res!730058) (not e!624613))))

(assert (=> b!1094009 (= res!730058 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!489403 mask!1414))))

(assert (=> b!1094009 (= lt!489403 (array!70788 (store (arr!34067 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34603 _keys!1070)))))

(declare-fun b!1094010 () Bool)

(declare-fun res!730059 () Bool)

(assert (=> b!1094010 (=> (not res!730059) (not e!624612))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1094010 (= res!730059 (validKeyInArray!0 k!904))))

(declare-fun b!1094011 () Bool)

(declare-fun res!730060 () Bool)

(assert (=> b!1094011 (=> (not res!730060) (not e!624612))))

(assert (=> b!1094011 (= res!730060 (= (select (arr!34067 _keys!1070) i!650) k!904))))

(declare-fun b!1094012 () Bool)

(assert (=> b!1094012 (= e!624609 (and e!624614 mapRes!42157))))

(declare-fun condMapEmpty!42157 () Bool)

(declare-fun mapDefault!42157 () ValueCell!12758)

