; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96250 () Bool)

(assert start!96250)

(declare-fun b_free!22909 () Bool)

(declare-fun b_next!22909 () Bool)

(assert (=> start!96250 (= b_free!22909 (not b_next!22909))))

(declare-fun tp!80575 () Bool)

(declare-fun b_and!36467 () Bool)

(assert (=> start!96250 (= tp!80575 b_and!36467)))

(declare-fun b!1093392 () Bool)

(declare-fun e!624305 () Bool)

(declare-fun e!624300 () Bool)

(declare-fun mapRes!42121 () Bool)

(assert (=> b!1093392 (= e!624305 (and e!624300 mapRes!42121))))

(declare-fun condMapEmpty!42121 () Bool)

(declare-datatypes ((V!41009 0))(
  ( (V!41010 (val!13512 Int)) )
))
(declare-datatypes ((ValueCell!12746 0))(
  ( (ValueCellFull!12746 (v!16132 V!41009)) (EmptyCell!12746) )
))
(declare-datatypes ((array!70654 0))(
  ( (array!70655 (arr!34001 (Array (_ BitVec 32) ValueCell!12746)) (size!34539 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70654)

(declare-fun mapDefault!42121 () ValueCell!12746)

(assert (=> b!1093392 (= condMapEmpty!42121 (= (arr!34001 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12746)) mapDefault!42121)))))

(declare-fun b!1093393 () Bool)

(declare-fun e!624304 () Bool)

(assert (=> b!1093393 (= e!624304 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!41009)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-datatypes ((tuple2!17250 0))(
  ( (tuple2!17251 (_1!8636 (_ BitVec 64)) (_2!8636 V!41009)) )
))
(declare-datatypes ((List!23817 0))(
  ( (Nil!23814) (Cons!23813 (h!25022 tuple2!17250) (t!33775 List!23817)) )
))
(declare-datatypes ((ListLongMap!15219 0))(
  ( (ListLongMap!15220 (toList!7625 List!23817)) )
))
(declare-fun lt!488875 () ListLongMap!15219)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-fun zeroValue!831 () V!41009)

(declare-datatypes ((array!70656 0))(
  ( (array!70657 (arr!34002 (Array (_ BitVec 32) (_ BitVec 64))) (size!34540 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70656)

(declare-fun getCurrentListMap!4288 (array!70656 array!70654 (_ BitVec 32) (_ BitVec 32) V!41009 V!41009 (_ BitVec 32) Int) ListLongMap!15219)

(assert (=> b!1093393 (= lt!488875 (getCurrentListMap!4288 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!488876 () ListLongMap!15219)

(declare-fun lt!488877 () array!70654)

(declare-fun lt!488874 () array!70656)

(assert (=> b!1093393 (= lt!488876 (getCurrentListMap!4288 lt!488874 lt!488877 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!488878 () ListLongMap!15219)

(declare-fun lt!488873 () ListLongMap!15219)

(assert (=> b!1093393 (and (= lt!488878 lt!488873) (= lt!488873 lt!488878))))

(declare-fun lt!488871 () ListLongMap!15219)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun -!897 (ListLongMap!15219 (_ BitVec 64)) ListLongMap!15219)

(assert (=> b!1093393 (= lt!488873 (-!897 lt!488871 k0!904))))

(declare-datatypes ((Unit!35829 0))(
  ( (Unit!35830) )
))
(declare-fun lt!488879 () Unit!35829)

(declare-fun i!650 () (_ BitVec 32))

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!172 (array!70656 array!70654 (_ BitVec 32) (_ BitVec 32) V!41009 V!41009 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35829)

(assert (=> b!1093393 (= lt!488879 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!172 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4158 (array!70656 array!70654 (_ BitVec 32) (_ BitVec 32) V!41009 V!41009 (_ BitVec 32) Int) ListLongMap!15219)

(assert (=> b!1093393 (= lt!488878 (getCurrentListMapNoExtraKeys!4158 lt!488874 lt!488877 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2229 (Int (_ BitVec 64)) V!41009)

(assert (=> b!1093393 (= lt!488877 (array!70655 (store (arr!34001 _values!874) i!650 (ValueCellFull!12746 (dynLambda!2229 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34539 _values!874)))))

(assert (=> b!1093393 (= lt!488871 (getCurrentListMapNoExtraKeys!4158 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70656 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1093393 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!488872 () Unit!35829)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70656 (_ BitVec 64) (_ BitVec 32)) Unit!35829)

(assert (=> b!1093393 (= lt!488872 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1093394 () Bool)

(declare-fun res!729663 () Bool)

(declare-fun e!624303 () Bool)

(assert (=> b!1093394 (=> (not res!729663) (not e!624303))))

(declare-datatypes ((List!23818 0))(
  ( (Nil!23815) (Cons!23814 (h!25023 (_ BitVec 64)) (t!33776 List!23818)) )
))
(declare-fun arrayNoDuplicates!0 (array!70656 (_ BitVec 32) List!23818) Bool)

(assert (=> b!1093394 (= res!729663 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23815))))

(declare-fun b!1093395 () Bool)

(declare-fun tp_is_empty!26911 () Bool)

(assert (=> b!1093395 (= e!624300 tp_is_empty!26911)))

(declare-fun b!1093396 () Bool)

(declare-fun res!729662 () Bool)

(assert (=> b!1093396 (=> (not res!729662) (not e!624303))))

(assert (=> b!1093396 (= res!729662 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34540 _keys!1070))))))

(declare-fun b!1093397 () Bool)

(declare-fun res!729667 () Bool)

(assert (=> b!1093397 (=> (not res!729667) (not e!624303))))

(assert (=> b!1093397 (= res!729667 (and (= (size!34539 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34540 _keys!1070) (size!34539 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun res!729669 () Bool)

(assert (=> start!96250 (=> (not res!729669) (not e!624303))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96250 (= res!729669 (validMask!0 mask!1414))))

(assert (=> start!96250 e!624303))

(assert (=> start!96250 tp!80575))

(assert (=> start!96250 true))

(assert (=> start!96250 tp_is_empty!26911))

(declare-fun array_inv!26248 (array!70656) Bool)

(assert (=> start!96250 (array_inv!26248 _keys!1070)))

(declare-fun array_inv!26249 (array!70654) Bool)

(assert (=> start!96250 (and (array_inv!26249 _values!874) e!624305)))

(declare-fun b!1093398 () Bool)

(declare-fun res!729666 () Bool)

(assert (=> b!1093398 (=> (not res!729666) (not e!624303))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1093398 (= res!729666 (validKeyInArray!0 k0!904))))

(declare-fun mapNonEmpty!42121 () Bool)

(declare-fun tp!80576 () Bool)

(declare-fun e!624302 () Bool)

(assert (=> mapNonEmpty!42121 (= mapRes!42121 (and tp!80576 e!624302))))

(declare-fun mapRest!42121 () (Array (_ BitVec 32) ValueCell!12746))

(declare-fun mapKey!42121 () (_ BitVec 32))

(declare-fun mapValue!42121 () ValueCell!12746)

(assert (=> mapNonEmpty!42121 (= (arr!34001 _values!874) (store mapRest!42121 mapKey!42121 mapValue!42121))))

(declare-fun b!1093399 () Bool)

(assert (=> b!1093399 (= e!624303 e!624304)))

(declare-fun res!729665 () Bool)

(assert (=> b!1093399 (=> (not res!729665) (not e!624304))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70656 (_ BitVec 32)) Bool)

(assert (=> b!1093399 (= res!729665 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!488874 mask!1414))))

(assert (=> b!1093399 (= lt!488874 (array!70657 (store (arr!34002 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34540 _keys!1070)))))

(declare-fun b!1093400 () Bool)

(declare-fun res!729661 () Bool)

(assert (=> b!1093400 (=> (not res!729661) (not e!624303))))

(assert (=> b!1093400 (= res!729661 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1093401 () Bool)

(declare-fun res!729664 () Bool)

(assert (=> b!1093401 (=> (not res!729664) (not e!624304))))

(assert (=> b!1093401 (= res!729664 (arrayNoDuplicates!0 lt!488874 #b00000000000000000000000000000000 Nil!23815))))

(declare-fun b!1093402 () Bool)

(assert (=> b!1093402 (= e!624302 tp_is_empty!26911)))

(declare-fun mapIsEmpty!42121 () Bool)

(assert (=> mapIsEmpty!42121 mapRes!42121))

(declare-fun b!1093403 () Bool)

(declare-fun res!729668 () Bool)

(assert (=> b!1093403 (=> (not res!729668) (not e!624303))))

(assert (=> b!1093403 (= res!729668 (= (select (arr!34002 _keys!1070) i!650) k0!904))))

(assert (= (and start!96250 res!729669) b!1093397))

(assert (= (and b!1093397 res!729667) b!1093400))

(assert (= (and b!1093400 res!729661) b!1093394))

(assert (= (and b!1093394 res!729663) b!1093396))

(assert (= (and b!1093396 res!729662) b!1093398))

(assert (= (and b!1093398 res!729666) b!1093403))

(assert (= (and b!1093403 res!729668) b!1093399))

(assert (= (and b!1093399 res!729665) b!1093401))

(assert (= (and b!1093401 res!729664) b!1093393))

(assert (= (and b!1093392 condMapEmpty!42121) mapIsEmpty!42121))

(assert (= (and b!1093392 (not condMapEmpty!42121)) mapNonEmpty!42121))

(get-info :version)

(assert (= (and mapNonEmpty!42121 ((_ is ValueCellFull!12746) mapValue!42121)) b!1093402))

(assert (= (and b!1093392 ((_ is ValueCellFull!12746) mapDefault!42121)) b!1093395))

(assert (= start!96250 b!1093392))

(declare-fun b_lambda!17557 () Bool)

(assert (=> (not b_lambda!17557) (not b!1093393)))

(declare-fun t!33774 () Bool)

(declare-fun tb!7779 () Bool)

(assert (=> (and start!96250 (= defaultEntry!882 defaultEntry!882) t!33774) tb!7779))

(declare-fun result!16085 () Bool)

(assert (=> tb!7779 (= result!16085 tp_is_empty!26911)))

(assert (=> b!1093393 t!33774))

(declare-fun b_and!36469 () Bool)

(assert (= b_and!36467 (and (=> t!33774 result!16085) b_and!36469)))

(declare-fun m!1012799 () Bool)

(assert (=> b!1093403 m!1012799))

(declare-fun m!1012801 () Bool)

(assert (=> b!1093394 m!1012801))

(declare-fun m!1012803 () Bool)

(assert (=> b!1093401 m!1012803))

(declare-fun m!1012805 () Bool)

(assert (=> start!96250 m!1012805))

(declare-fun m!1012807 () Bool)

(assert (=> start!96250 m!1012807))

(declare-fun m!1012809 () Bool)

(assert (=> start!96250 m!1012809))

(declare-fun m!1012811 () Bool)

(assert (=> b!1093399 m!1012811))

(declare-fun m!1012813 () Bool)

(assert (=> b!1093399 m!1012813))

(declare-fun m!1012815 () Bool)

(assert (=> mapNonEmpty!42121 m!1012815))

(declare-fun m!1012817 () Bool)

(assert (=> b!1093398 m!1012817))

(declare-fun m!1012819 () Bool)

(assert (=> b!1093393 m!1012819))

(declare-fun m!1012821 () Bool)

(assert (=> b!1093393 m!1012821))

(declare-fun m!1012823 () Bool)

(assert (=> b!1093393 m!1012823))

(declare-fun m!1012825 () Bool)

(assert (=> b!1093393 m!1012825))

(declare-fun m!1012827 () Bool)

(assert (=> b!1093393 m!1012827))

(declare-fun m!1012829 () Bool)

(assert (=> b!1093393 m!1012829))

(declare-fun m!1012831 () Bool)

(assert (=> b!1093393 m!1012831))

(declare-fun m!1012833 () Bool)

(assert (=> b!1093393 m!1012833))

(declare-fun m!1012835 () Bool)

(assert (=> b!1093393 m!1012835))

(declare-fun m!1012837 () Bool)

(assert (=> b!1093393 m!1012837))

(declare-fun m!1012839 () Bool)

(assert (=> b!1093400 m!1012839))

(check-sat (not b!1093399) (not start!96250) (not b!1093393) b_and!36469 (not b_lambda!17557) (not b!1093394) (not b_next!22909) (not b!1093400) (not mapNonEmpty!42121) (not b!1093401) tp_is_empty!26911 (not b!1093398))
(check-sat b_and!36469 (not b_next!22909))
