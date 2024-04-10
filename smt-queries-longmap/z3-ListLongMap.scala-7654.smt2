; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96246 () Bool)

(assert start!96246)

(declare-fun b_free!22899 () Bool)

(declare-fun b_next!22899 () Bool)

(assert (=> start!96246 (= b_free!22899 (not b_next!22899))))

(declare-fun tp!80546 () Bool)

(declare-fun b_and!36473 () Bool)

(assert (=> start!96246 (= tp!80546 b_and!36473)))

(declare-fun b!1093355 () Bool)

(declare-fun res!729603 () Bool)

(declare-fun e!624305 () Bool)

(assert (=> b!1093355 (=> (not res!729603) (not e!624305))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((array!70719 0))(
  ( (array!70720 (arr!34033 (Array (_ BitVec 32) (_ BitVec 64))) (size!34569 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70719)

(assert (=> b!1093355 (= res!729603 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34569 _keys!1070))))))

(declare-fun b!1093356 () Bool)

(declare-fun res!729595 () Bool)

(declare-fun e!624303 () Bool)

(assert (=> b!1093356 (=> (not res!729595) (not e!624303))))

(declare-fun lt!488941 () array!70719)

(declare-datatypes ((List!23777 0))(
  ( (Nil!23774) (Cons!23773 (h!24982 (_ BitVec 64)) (t!33734 List!23777)) )
))
(declare-fun arrayNoDuplicates!0 (array!70719 (_ BitVec 32) List!23777) Bool)

(assert (=> b!1093356 (= res!729595 (arrayNoDuplicates!0 lt!488941 #b00000000000000000000000000000000 Nil!23774))))

(declare-fun b!1093357 () Bool)

(declare-fun res!729600 () Bool)

(assert (=> b!1093357 (=> (not res!729600) (not e!624305))))

(declare-fun k0!904 () (_ BitVec 64))

(assert (=> b!1093357 (= res!729600 (= (select (arr!34033 _keys!1070) i!650) k0!904))))

(declare-fun b!1093358 () Bool)

(declare-fun res!729602 () Bool)

(assert (=> b!1093358 (=> (not res!729602) (not e!624305))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1093358 (= res!729602 (validKeyInArray!0 k0!904))))

(declare-fun mapNonEmpty!42106 () Bool)

(declare-fun mapRes!42106 () Bool)

(declare-fun tp!80545 () Bool)

(declare-fun e!624308 () Bool)

(assert (=> mapNonEmpty!42106 (= mapRes!42106 (and tp!80545 e!624308))))

(declare-datatypes ((V!40995 0))(
  ( (V!40996 (val!13507 Int)) )
))
(declare-datatypes ((ValueCell!12741 0))(
  ( (ValueCellFull!12741 (v!16128 V!40995)) (EmptyCell!12741) )
))
(declare-datatypes ((array!70721 0))(
  ( (array!70722 (arr!34034 (Array (_ BitVec 32) ValueCell!12741)) (size!34570 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70721)

(declare-fun mapValue!42106 () ValueCell!12741)

(declare-fun mapRest!42106 () (Array (_ BitVec 32) ValueCell!12741))

(declare-fun mapKey!42106 () (_ BitVec 32))

(assert (=> mapNonEmpty!42106 (= (arr!34034 _values!874) (store mapRest!42106 mapKey!42106 mapValue!42106))))

(declare-fun b!1093359 () Bool)

(declare-fun tp_is_empty!26901 () Bool)

(assert (=> b!1093359 (= e!624308 tp_is_empty!26901)))

(declare-fun b!1093360 () Bool)

(assert (=> b!1093360 (= e!624303 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40995)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((tuple2!17184 0))(
  ( (tuple2!17185 (_1!8603 (_ BitVec 64)) (_2!8603 V!40995)) )
))
(declare-datatypes ((List!23778 0))(
  ( (Nil!23775) (Cons!23774 (h!24983 tuple2!17184) (t!33735 List!23778)) )
))
(declare-datatypes ((ListLongMap!15153 0))(
  ( (ListLongMap!15154 (toList!7592 List!23778)) )
))
(declare-fun lt!488943 () ListLongMap!15153)

(declare-fun zeroValue!831 () V!40995)

(declare-fun getCurrentListMap!4348 (array!70719 array!70721 (_ BitVec 32) (_ BitVec 32) V!40995 V!40995 (_ BitVec 32) Int) ListLongMap!15153)

(assert (=> b!1093360 (= lt!488943 (getCurrentListMap!4348 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!488940 () array!70721)

(declare-fun lt!488944 () ListLongMap!15153)

(assert (=> b!1093360 (= lt!488944 (getCurrentListMap!4348 lt!488941 lt!488940 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!488938 () ListLongMap!15153)

(declare-fun lt!488942 () ListLongMap!15153)

(assert (=> b!1093360 (and (= lt!488938 lt!488942) (= lt!488942 lt!488938))))

(declare-fun lt!488939 () ListLongMap!15153)

(declare-fun -!911 (ListLongMap!15153 (_ BitVec 64)) ListLongMap!15153)

(assert (=> b!1093360 (= lt!488942 (-!911 lt!488939 k0!904))))

(declare-datatypes ((Unit!35988 0))(
  ( (Unit!35989) )
))
(declare-fun lt!488936 () Unit!35988)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!167 (array!70719 array!70721 (_ BitVec 32) (_ BitVec 32) V!40995 V!40995 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35988)

(assert (=> b!1093360 (= lt!488936 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!167 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4108 (array!70719 array!70721 (_ BitVec 32) (_ BitVec 32) V!40995 V!40995 (_ BitVec 32) Int) ListLongMap!15153)

(assert (=> b!1093360 (= lt!488938 (getCurrentListMapNoExtraKeys!4108 lt!488941 lt!488940 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2245 (Int (_ BitVec 64)) V!40995)

(assert (=> b!1093360 (= lt!488940 (array!70722 (store (arr!34034 _values!874) i!650 (ValueCellFull!12741 (dynLambda!2245 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34570 _values!874)))))

(assert (=> b!1093360 (= lt!488939 (getCurrentListMapNoExtraKeys!4108 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70719 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1093360 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!488937 () Unit!35988)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70719 (_ BitVec 64) (_ BitVec 32)) Unit!35988)

(assert (=> b!1093360 (= lt!488937 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1093361 () Bool)

(declare-fun e!624307 () Bool)

(assert (=> b!1093361 (= e!624307 tp_is_empty!26901)))

(declare-fun b!1093362 () Bool)

(declare-fun res!729598 () Bool)

(assert (=> b!1093362 (=> (not res!729598) (not e!624305))))

(assert (=> b!1093362 (= res!729598 (and (= (size!34570 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34569 _keys!1070) (size!34570 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1093363 () Bool)

(assert (=> b!1093363 (= e!624305 e!624303)))

(declare-fun res!729599 () Bool)

(assert (=> b!1093363 (=> (not res!729599) (not e!624303))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70719 (_ BitVec 32)) Bool)

(assert (=> b!1093363 (= res!729599 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!488941 mask!1414))))

(assert (=> b!1093363 (= lt!488941 (array!70720 (store (arr!34033 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34569 _keys!1070)))))

(declare-fun mapIsEmpty!42106 () Bool)

(assert (=> mapIsEmpty!42106 mapRes!42106))

(declare-fun res!729596 () Bool)

(assert (=> start!96246 (=> (not res!729596) (not e!624305))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96246 (= res!729596 (validMask!0 mask!1414))))

(assert (=> start!96246 e!624305))

(assert (=> start!96246 tp!80546))

(assert (=> start!96246 true))

(assert (=> start!96246 tp_is_empty!26901))

(declare-fun array_inv!26228 (array!70719) Bool)

(assert (=> start!96246 (array_inv!26228 _keys!1070)))

(declare-fun e!624304 () Bool)

(declare-fun array_inv!26229 (array!70721) Bool)

(assert (=> start!96246 (and (array_inv!26229 _values!874) e!624304)))

(declare-fun b!1093364 () Bool)

(assert (=> b!1093364 (= e!624304 (and e!624307 mapRes!42106))))

(declare-fun condMapEmpty!42106 () Bool)

(declare-fun mapDefault!42106 () ValueCell!12741)

(assert (=> b!1093364 (= condMapEmpty!42106 (= (arr!34034 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12741)) mapDefault!42106)))))

(declare-fun b!1093365 () Bool)

(declare-fun res!729597 () Bool)

(assert (=> b!1093365 (=> (not res!729597) (not e!624305))))

(assert (=> b!1093365 (= res!729597 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1093366 () Bool)

(declare-fun res!729601 () Bool)

(assert (=> b!1093366 (=> (not res!729601) (not e!624305))))

(assert (=> b!1093366 (= res!729601 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23774))))

(assert (= (and start!96246 res!729596) b!1093362))

(assert (= (and b!1093362 res!729598) b!1093365))

(assert (= (and b!1093365 res!729597) b!1093366))

(assert (= (and b!1093366 res!729601) b!1093355))

(assert (= (and b!1093355 res!729603) b!1093358))

(assert (= (and b!1093358 res!729602) b!1093357))

(assert (= (and b!1093357 res!729600) b!1093363))

(assert (= (and b!1093363 res!729599) b!1093356))

(assert (= (and b!1093356 res!729595) b!1093360))

(assert (= (and b!1093364 condMapEmpty!42106) mapIsEmpty!42106))

(assert (= (and b!1093364 (not condMapEmpty!42106)) mapNonEmpty!42106))

(get-info :version)

(assert (= (and mapNonEmpty!42106 ((_ is ValueCellFull!12741) mapValue!42106)) b!1093359))

(assert (= (and b!1093364 ((_ is ValueCellFull!12741) mapDefault!42106)) b!1093361))

(assert (= start!96246 b!1093364))

(declare-fun b_lambda!17569 () Bool)

(assert (=> (not b_lambda!17569) (not b!1093360)))

(declare-fun t!33733 () Bool)

(declare-fun tb!7777 () Bool)

(assert (=> (and start!96246 (= defaultEntry!882 defaultEntry!882) t!33733) tb!7777))

(declare-fun result!16073 () Bool)

(assert (=> tb!7777 (= result!16073 tp_is_empty!26901)))

(assert (=> b!1093360 t!33733))

(declare-fun b_and!36475 () Bool)

(assert (= b_and!36473 (and (=> t!33733 result!16073) b_and!36475)))

(declare-fun m!1013215 () Bool)

(assert (=> b!1093363 m!1013215))

(declare-fun m!1013217 () Bool)

(assert (=> b!1093363 m!1013217))

(declare-fun m!1013219 () Bool)

(assert (=> mapNonEmpty!42106 m!1013219))

(declare-fun m!1013221 () Bool)

(assert (=> b!1093356 m!1013221))

(declare-fun m!1013223 () Bool)

(assert (=> b!1093360 m!1013223))

(declare-fun m!1013225 () Bool)

(assert (=> b!1093360 m!1013225))

(declare-fun m!1013227 () Bool)

(assert (=> b!1093360 m!1013227))

(declare-fun m!1013229 () Bool)

(assert (=> b!1093360 m!1013229))

(declare-fun m!1013231 () Bool)

(assert (=> b!1093360 m!1013231))

(declare-fun m!1013233 () Bool)

(assert (=> b!1093360 m!1013233))

(declare-fun m!1013235 () Bool)

(assert (=> b!1093360 m!1013235))

(declare-fun m!1013237 () Bool)

(assert (=> b!1093360 m!1013237))

(declare-fun m!1013239 () Bool)

(assert (=> b!1093360 m!1013239))

(declare-fun m!1013241 () Bool)

(assert (=> b!1093360 m!1013241))

(declare-fun m!1013243 () Bool)

(assert (=> b!1093365 m!1013243))

(declare-fun m!1013245 () Bool)

(assert (=> b!1093357 m!1013245))

(declare-fun m!1013247 () Bool)

(assert (=> start!96246 m!1013247))

(declare-fun m!1013249 () Bool)

(assert (=> start!96246 m!1013249))

(declare-fun m!1013251 () Bool)

(assert (=> start!96246 m!1013251))

(declare-fun m!1013253 () Bool)

(assert (=> b!1093366 m!1013253))

(declare-fun m!1013255 () Bool)

(assert (=> b!1093358 m!1013255))

(check-sat (not b!1093365) tp_is_empty!26901 (not b!1093363) (not b_lambda!17569) (not b!1093360) b_and!36475 (not b_next!22899) (not start!96246) (not b!1093366) (not mapNonEmpty!42106) (not b!1093358) (not b!1093356))
(check-sat b_and!36475 (not b_next!22899))
