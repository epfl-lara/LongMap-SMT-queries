; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96426 () Bool)

(assert start!96426)

(declare-fun b_free!23011 () Bool)

(declare-fun b_next!23011 () Bool)

(assert (=> start!96426 (= b_free!23011 (not b_next!23011))))

(declare-fun tp!80959 () Bool)

(declare-fun b_and!36659 () Bool)

(assert (=> start!96426 (= tp!80959 b_and!36659)))

(declare-fun b!1096141 () Bool)

(declare-fun e!625698 () Bool)

(declare-fun tp_is_empty!27061 () Bool)

(assert (=> b!1096141 (= e!625698 tp_is_empty!27061)))

(declare-fun b!1096142 () Bool)

(declare-fun e!625702 () Bool)

(assert (=> b!1096142 (= e!625702 tp_is_empty!27061)))

(declare-fun b!1096143 () Bool)

(declare-fun e!625699 () Bool)

(assert (=> b!1096143 (= e!625699 (not true))))

(declare-datatypes ((V!41209 0))(
  ( (V!41210 (val!13587 Int)) )
))
(declare-datatypes ((ValueCell!12821 0))(
  ( (ValueCellFull!12821 (v!16207 V!41209)) (EmptyCell!12821) )
))
(declare-datatypes ((array!70944 0))(
  ( (array!70945 (arr!34144 (Array (_ BitVec 32) ValueCell!12821)) (size!34682 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70944)

(declare-fun minValue!831 () V!41209)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun i!650 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((tuple2!17310 0))(
  ( (tuple2!17311 (_1!8666 (_ BitVec 64)) (_2!8666 V!41209)) )
))
(declare-datatypes ((List!23903 0))(
  ( (Nil!23900) (Cons!23899 (h!25108 tuple2!17310) (t!33951 List!23903)) )
))
(declare-datatypes ((ListLongMap!15279 0))(
  ( (ListLongMap!15280 (toList!7655 List!23903)) )
))
(declare-fun lt!489904 () ListLongMap!15279)

(declare-datatypes ((array!70946 0))(
  ( (array!70947 (arr!34145 (Array (_ BitVec 32) (_ BitVec 64))) (size!34683 (_ BitVec 32))) )
))
(declare-fun lt!489902 () array!70946)

(declare-fun zeroValue!831 () V!41209)

(declare-fun defaultEntry!882 () Int)

(declare-fun getCurrentListMapNoExtraKeys!4188 (array!70946 array!70944 (_ BitVec 32) (_ BitVec 32) V!41209 V!41209 (_ BitVec 32) Int) ListLongMap!15279)

(declare-fun dynLambda!2257 (Int (_ BitVec 64)) V!41209)

(assert (=> b!1096143 (= lt!489904 (getCurrentListMapNoExtraKeys!4188 lt!489902 (array!70945 (store (arr!34144 _values!874) i!650 (ValueCellFull!12821 (dynLambda!2257 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34682 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun _keys!1070 () array!70946)

(declare-fun lt!489903 () ListLongMap!15279)

(assert (=> b!1096143 (= lt!489903 (getCurrentListMapNoExtraKeys!4188 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!70946 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1096143 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35897 0))(
  ( (Unit!35898) )
))
(declare-fun lt!489905 () Unit!35897)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70946 (_ BitVec 64) (_ BitVec 32)) Unit!35897)

(assert (=> b!1096143 (= lt!489905 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1096144 () Bool)

(declare-fun res!731603 () Bool)

(declare-fun e!625700 () Bool)

(assert (=> b!1096144 (=> (not res!731603) (not e!625700))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1096144 (= res!731603 (validKeyInArray!0 k0!904))))

(declare-fun b!1096145 () Bool)

(declare-fun res!731604 () Bool)

(assert (=> b!1096145 (=> (not res!731604) (not e!625700))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70946 (_ BitVec 32)) Bool)

(assert (=> b!1096145 (= res!731604 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun res!731601 () Bool)

(assert (=> start!96426 (=> (not res!731601) (not e!625700))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96426 (= res!731601 (validMask!0 mask!1414))))

(assert (=> start!96426 e!625700))

(assert (=> start!96426 tp!80959))

(assert (=> start!96426 true))

(assert (=> start!96426 tp_is_empty!27061))

(declare-fun array_inv!26342 (array!70946) Bool)

(assert (=> start!96426 (array_inv!26342 _keys!1070)))

(declare-fun e!625697 () Bool)

(declare-fun array_inv!26343 (array!70944) Bool)

(assert (=> start!96426 (and (array_inv!26343 _values!874) e!625697)))

(declare-fun b!1096146 () Bool)

(declare-fun mapRes!42352 () Bool)

(assert (=> b!1096146 (= e!625697 (and e!625698 mapRes!42352))))

(declare-fun condMapEmpty!42352 () Bool)

(declare-fun mapDefault!42352 () ValueCell!12821)

(assert (=> b!1096146 (= condMapEmpty!42352 (= (arr!34144 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12821)) mapDefault!42352)))))

(declare-fun b!1096147 () Bool)

(declare-fun res!731599 () Bool)

(assert (=> b!1096147 (=> (not res!731599) (not e!625700))))

(assert (=> b!1096147 (= res!731599 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34683 _keys!1070))))))

(declare-fun b!1096148 () Bool)

(declare-fun res!731600 () Bool)

(assert (=> b!1096148 (=> (not res!731600) (not e!625700))))

(assert (=> b!1096148 (= res!731600 (= (select (arr!34145 _keys!1070) i!650) k0!904))))

(declare-fun mapNonEmpty!42352 () Bool)

(declare-fun tp!80960 () Bool)

(assert (=> mapNonEmpty!42352 (= mapRes!42352 (and tp!80960 e!625702))))

(declare-fun mapValue!42352 () ValueCell!12821)

(declare-fun mapKey!42352 () (_ BitVec 32))

(declare-fun mapRest!42352 () (Array (_ BitVec 32) ValueCell!12821))

(assert (=> mapNonEmpty!42352 (= (arr!34144 _values!874) (store mapRest!42352 mapKey!42352 mapValue!42352))))

(declare-fun b!1096149 () Bool)

(assert (=> b!1096149 (= e!625700 e!625699)))

(declare-fun res!731602 () Bool)

(assert (=> b!1096149 (=> (not res!731602) (not e!625699))))

(assert (=> b!1096149 (= res!731602 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!489902 mask!1414))))

(assert (=> b!1096149 (= lt!489902 (array!70947 (store (arr!34145 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34683 _keys!1070)))))

(declare-fun mapIsEmpty!42352 () Bool)

(assert (=> mapIsEmpty!42352 mapRes!42352))

(declare-fun b!1096150 () Bool)

(declare-fun res!731597 () Bool)

(assert (=> b!1096150 (=> (not res!731597) (not e!625700))))

(declare-datatypes ((List!23904 0))(
  ( (Nil!23901) (Cons!23900 (h!25109 (_ BitVec 64)) (t!33952 List!23904)) )
))
(declare-fun arrayNoDuplicates!0 (array!70946 (_ BitVec 32) List!23904) Bool)

(assert (=> b!1096150 (= res!731597 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23901))))

(declare-fun b!1096151 () Bool)

(declare-fun res!731598 () Bool)

(assert (=> b!1096151 (=> (not res!731598) (not e!625700))))

(assert (=> b!1096151 (= res!731598 (and (= (size!34682 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34683 _keys!1070) (size!34682 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1096152 () Bool)

(declare-fun res!731605 () Bool)

(assert (=> b!1096152 (=> (not res!731605) (not e!625699))))

(assert (=> b!1096152 (= res!731605 (arrayNoDuplicates!0 lt!489902 #b00000000000000000000000000000000 Nil!23901))))

(assert (= (and start!96426 res!731601) b!1096151))

(assert (= (and b!1096151 res!731598) b!1096145))

(assert (= (and b!1096145 res!731604) b!1096150))

(assert (= (and b!1096150 res!731597) b!1096147))

(assert (= (and b!1096147 res!731599) b!1096144))

(assert (= (and b!1096144 res!731603) b!1096148))

(assert (= (and b!1096148 res!731600) b!1096149))

(assert (= (and b!1096149 res!731602) b!1096152))

(assert (= (and b!1096152 res!731605) b!1096143))

(assert (= (and b!1096146 condMapEmpty!42352) mapIsEmpty!42352))

(assert (= (and b!1096146 (not condMapEmpty!42352)) mapNonEmpty!42352))

(get-info :version)

(assert (= (and mapNonEmpty!42352 ((_ is ValueCellFull!12821) mapValue!42352)) b!1096142))

(assert (= (and b!1096146 ((_ is ValueCellFull!12821) mapDefault!42352)) b!1096141))

(assert (= start!96426 b!1096146))

(declare-fun b_lambda!17647 () Bool)

(assert (=> (not b_lambda!17647) (not b!1096143)))

(declare-fun t!33950 () Bool)

(declare-fun tb!7869 () Bool)

(assert (=> (and start!96426 (= defaultEntry!882 defaultEntry!882) t!33950) tb!7869))

(declare-fun result!16269 () Bool)

(assert (=> tb!7869 (= result!16269 tp_is_empty!27061)))

(assert (=> b!1096143 t!33950))

(declare-fun b_and!36661 () Bool)

(assert (= b_and!36659 (and (=> t!33950 result!16269) b_and!36661)))

(declare-fun m!1015215 () Bool)

(assert (=> b!1096143 m!1015215))

(declare-fun m!1015217 () Bool)

(assert (=> b!1096143 m!1015217))

(declare-fun m!1015219 () Bool)

(assert (=> b!1096143 m!1015219))

(declare-fun m!1015221 () Bool)

(assert (=> b!1096143 m!1015221))

(declare-fun m!1015223 () Bool)

(assert (=> b!1096143 m!1015223))

(declare-fun m!1015225 () Bool)

(assert (=> b!1096143 m!1015225))

(declare-fun m!1015227 () Bool)

(assert (=> mapNonEmpty!42352 m!1015227))

(declare-fun m!1015229 () Bool)

(assert (=> b!1096145 m!1015229))

(declare-fun m!1015231 () Bool)

(assert (=> b!1096152 m!1015231))

(declare-fun m!1015233 () Bool)

(assert (=> b!1096149 m!1015233))

(declare-fun m!1015235 () Bool)

(assert (=> b!1096149 m!1015235))

(declare-fun m!1015237 () Bool)

(assert (=> start!96426 m!1015237))

(declare-fun m!1015239 () Bool)

(assert (=> start!96426 m!1015239))

(declare-fun m!1015241 () Bool)

(assert (=> start!96426 m!1015241))

(declare-fun m!1015243 () Bool)

(assert (=> b!1096144 m!1015243))

(declare-fun m!1015245 () Bool)

(assert (=> b!1096148 m!1015245))

(declare-fun m!1015247 () Bool)

(assert (=> b!1096150 m!1015247))

(check-sat (not b!1096144) tp_is_empty!27061 (not b!1096143) (not b_lambda!17647) (not start!96426) (not b_next!23011) (not mapNonEmpty!42352) (not b!1096152) (not b!1096149) (not b!1096145) b_and!36661 (not b!1096150))
(check-sat b_and!36661 (not b_next!23011))
