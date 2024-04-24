; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96222 () Bool)

(assert start!96222)

(declare-fun b_free!22639 () Bool)

(declare-fun b_next!22639 () Bool)

(assert (=> start!96222 (= b_free!22639 (not b_next!22639))))

(declare-fun tp!79766 () Bool)

(declare-fun b_and!35963 () Bool)

(assert (=> start!96222 (= tp!79766 b_and!35963)))

(declare-fun b!1089125 () Bool)

(declare-fun e!622215 () Bool)

(declare-fun tp_is_empty!26641 () Bool)

(assert (=> b!1089125 (= e!622215 tp_is_empty!26641)))

(declare-fun b!1089126 () Bool)

(declare-fun e!622212 () Bool)

(declare-fun e!622211 () Bool)

(assert (=> b!1089126 (= e!622212 e!622211)))

(declare-fun res!726000 () Bool)

(assert (=> b!1089126 (=> (not res!726000) (not e!622211))))

(declare-datatypes ((array!70247 0))(
  ( (array!70248 (arr!33791 (Array (_ BitVec 32) (_ BitVec 64))) (size!34328 (_ BitVec 32))) )
))
(declare-fun lt!484744 () array!70247)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70247 (_ BitVec 32)) Bool)

(assert (=> b!1089126 (= res!726000 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!484744 mask!1414))))

(declare-fun _keys!1070 () array!70247)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1089126 (= lt!484744 (array!70248 (store (arr!33791 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34328 _keys!1070)))))

(declare-fun b!1089127 () Bool)

(declare-fun res!725992 () Bool)

(assert (=> b!1089127 (=> (not res!725992) (not e!622212))))

(declare-datatypes ((List!23585 0))(
  ( (Nil!23582) (Cons!23581 (h!24799 (_ BitVec 64)) (t!33274 List!23585)) )
))
(declare-fun arrayNoDuplicates!0 (array!70247 (_ BitVec 32) List!23585) Bool)

(assert (=> b!1089127 (= res!725992 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23582))))

(declare-fun b!1089128 () Bool)

(declare-fun e!622214 () Bool)

(declare-fun e!622217 () Bool)

(assert (=> b!1089128 (= e!622214 e!622217)))

(declare-fun res!725994 () Bool)

(assert (=> b!1089128 (=> res!725994 e!622217)))

(declare-fun k0!904 () (_ BitVec 64))

(assert (=> b!1089128 (= res!725994 (= #b0000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-datatypes ((V!40649 0))(
  ( (V!40650 (val!13377 Int)) )
))
(declare-datatypes ((tuple2!16992 0))(
  ( (tuple2!16993 (_1!8507 (_ BitVec 64)) (_2!8507 V!40649)) )
))
(declare-datatypes ((List!23586 0))(
  ( (Nil!23583) (Cons!23582 (h!24800 tuple2!16992) (t!33275 List!23586)) )
))
(declare-datatypes ((ListLongMap!14969 0))(
  ( (ListLongMap!14970 (toList!7500 List!23586)) )
))
(declare-fun lt!484743 () ListLongMap!14969)

(declare-fun lt!484748 () ListLongMap!14969)

(assert (=> b!1089128 (= lt!484743 lt!484748)))

(declare-fun lt!484747 () ListLongMap!14969)

(declare-fun lt!484751 () tuple2!16992)

(declare-fun +!3322 (ListLongMap!14969 tuple2!16992) ListLongMap!14969)

(assert (=> b!1089128 (= lt!484748 (+!3322 lt!484747 lt!484751))))

(declare-fun lt!484752 () ListLongMap!14969)

(declare-fun lt!484749 () ListLongMap!14969)

(assert (=> b!1089128 (= lt!484752 lt!484749)))

(declare-fun lt!484754 () ListLongMap!14969)

(assert (=> b!1089128 (= lt!484749 (+!3322 lt!484754 lt!484751))))

(declare-fun lt!484755 () ListLongMap!14969)

(assert (=> b!1089128 (= lt!484743 (+!3322 lt!484755 lt!484751))))

(declare-fun zeroValue!831 () V!40649)

(assert (=> b!1089128 (= lt!484751 (tuple2!16993 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1089130 () Bool)

(declare-fun res!725995 () Bool)

(assert (=> b!1089130 (=> (not res!725995) (not e!622212))))

(assert (=> b!1089130 (= res!725995 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34328 _keys!1070))))))

(declare-fun b!1089131 () Bool)

(declare-fun res!725993 () Bool)

(assert (=> b!1089131 (=> (not res!725993) (not e!622212))))

(assert (=> b!1089131 (= res!725993 (= (select (arr!33791 _keys!1070) i!650) k0!904))))

(declare-fun b!1089132 () Bool)

(declare-fun res!725999 () Bool)

(assert (=> b!1089132 (=> (not res!725999) (not e!622211))))

(assert (=> b!1089132 (= res!725999 (arrayNoDuplicates!0 lt!484744 #b00000000000000000000000000000000 Nil!23582))))

(declare-fun b!1089133 () Bool)

(assert (=> b!1089133 (= e!622211 (not e!622214))))

(declare-fun res!725991 () Bool)

(assert (=> b!1089133 (=> res!725991 e!622214)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1089133 (= res!725991 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40649)

(declare-datatypes ((ValueCell!12611 0))(
  ( (ValueCellFull!12611 (v!15994 V!40649)) (EmptyCell!12611) )
))
(declare-datatypes ((array!70249 0))(
  ( (array!70250 (arr!33792 (Array (_ BitVec 32) ValueCell!12611)) (size!34329 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70249)

(declare-fun getCurrentListMap!4261 (array!70247 array!70249 (_ BitVec 32) (_ BitVec 32) V!40649 V!40649 (_ BitVec 32) Int) ListLongMap!14969)

(assert (=> b!1089133 (= lt!484752 (getCurrentListMap!4261 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!484745 () array!70249)

(assert (=> b!1089133 (= lt!484743 (getCurrentListMap!4261 lt!484744 lt!484745 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1089133 (and (= lt!484755 lt!484747) (= lt!484747 lt!484755))))

(declare-fun -!812 (ListLongMap!14969 (_ BitVec 64)) ListLongMap!14969)

(assert (=> b!1089133 (= lt!484747 (-!812 lt!484754 k0!904))))

(declare-datatypes ((Unit!35791 0))(
  ( (Unit!35792) )
))
(declare-fun lt!484750 () Unit!35791)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!90 (array!70247 array!70249 (_ BitVec 32) (_ BitVec 32) V!40649 V!40649 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35791)

(assert (=> b!1089133 (= lt!484750 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!90 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4066 (array!70247 array!70249 (_ BitVec 32) (_ BitVec 32) V!40649 V!40649 (_ BitVec 32) Int) ListLongMap!14969)

(assert (=> b!1089133 (= lt!484755 (getCurrentListMapNoExtraKeys!4066 lt!484744 lt!484745 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2187 (Int (_ BitVec 64)) V!40649)

(assert (=> b!1089133 (= lt!484745 (array!70250 (store (arr!33792 _values!874) i!650 (ValueCellFull!12611 (dynLambda!2187 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34329 _values!874)))))

(assert (=> b!1089133 (= lt!484754 (getCurrentListMapNoExtraKeys!4066 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70247 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1089133 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!484746 () Unit!35791)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70247 (_ BitVec 64) (_ BitVec 32)) Unit!35791)

(assert (=> b!1089133 (= lt!484746 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1089134 () Bool)

(declare-fun e!622216 () Bool)

(assert (=> b!1089134 (= e!622216 tp_is_empty!26641)))

(declare-fun b!1089135 () Bool)

(declare-fun res!725996 () Bool)

(assert (=> b!1089135 (=> (not res!725996) (not e!622212))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1089135 (= res!725996 (validKeyInArray!0 k0!904))))

(declare-fun b!1089136 () Bool)

(declare-fun res!725997 () Bool)

(assert (=> b!1089136 (=> (not res!725997) (not e!622212))))

(assert (=> b!1089136 (= res!725997 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun res!725998 () Bool)

(assert (=> start!96222 (=> (not res!725998) (not e!622212))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96222 (= res!725998 (validMask!0 mask!1414))))

(assert (=> start!96222 e!622212))

(assert (=> start!96222 tp!79766))

(assert (=> start!96222 true))

(assert (=> start!96222 tp_is_empty!26641))

(declare-fun array_inv!26116 (array!70247) Bool)

(assert (=> start!96222 (array_inv!26116 _keys!1070)))

(declare-fun e!622210 () Bool)

(declare-fun array_inv!26117 (array!70249) Bool)

(assert (=> start!96222 (and (array_inv!26117 _values!874) e!622210)))

(declare-fun b!1089129 () Bool)

(declare-fun mapRes!41716 () Bool)

(assert (=> b!1089129 (= e!622210 (and e!622216 mapRes!41716))))

(declare-fun condMapEmpty!41716 () Bool)

(declare-fun mapDefault!41716 () ValueCell!12611)

(assert (=> b!1089129 (= condMapEmpty!41716 (= (arr!33792 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12611)) mapDefault!41716)))))

(declare-fun mapNonEmpty!41716 () Bool)

(declare-fun tp!79765 () Bool)

(assert (=> mapNonEmpty!41716 (= mapRes!41716 (and tp!79765 e!622215))))

(declare-fun mapValue!41716 () ValueCell!12611)

(declare-fun mapRest!41716 () (Array (_ BitVec 32) ValueCell!12611))

(declare-fun mapKey!41716 () (_ BitVec 32))

(assert (=> mapNonEmpty!41716 (= (arr!33792 _values!874) (store mapRest!41716 mapKey!41716 mapValue!41716))))

(declare-fun mapIsEmpty!41716 () Bool)

(assert (=> mapIsEmpty!41716 mapRes!41716))

(declare-fun b!1089137 () Bool)

(assert (=> b!1089137 (= e!622217 true)))

(assert (=> b!1089137 (= (-!812 lt!484749 k0!904) lt!484748)))

(declare-fun lt!484753 () Unit!35791)

(declare-fun addRemoveCommutativeForDiffKeys!54 (ListLongMap!14969 (_ BitVec 64) V!40649 (_ BitVec 64)) Unit!35791)

(assert (=> b!1089137 (= lt!484753 (addRemoveCommutativeForDiffKeys!54 lt!484754 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(declare-fun b!1089138 () Bool)

(declare-fun res!725990 () Bool)

(assert (=> b!1089138 (=> (not res!725990) (not e!622212))))

(assert (=> b!1089138 (= res!725990 (and (= (size!34329 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34328 _keys!1070) (size!34329 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(assert (= (and start!96222 res!725998) b!1089138))

(assert (= (and b!1089138 res!725990) b!1089136))

(assert (= (and b!1089136 res!725997) b!1089127))

(assert (= (and b!1089127 res!725992) b!1089130))

(assert (= (and b!1089130 res!725995) b!1089135))

(assert (= (and b!1089135 res!725996) b!1089131))

(assert (= (and b!1089131 res!725993) b!1089126))

(assert (= (and b!1089126 res!726000) b!1089132))

(assert (= (and b!1089132 res!725999) b!1089133))

(assert (= (and b!1089133 (not res!725991)) b!1089128))

(assert (= (and b!1089128 (not res!725994)) b!1089137))

(assert (= (and b!1089129 condMapEmpty!41716) mapIsEmpty!41716))

(assert (= (and b!1089129 (not condMapEmpty!41716)) mapNonEmpty!41716))

(get-info :version)

(assert (= (and mapNonEmpty!41716 ((_ is ValueCellFull!12611) mapValue!41716)) b!1089125))

(assert (= (and b!1089129 ((_ is ValueCellFull!12611) mapDefault!41716)) b!1089134))

(assert (= start!96222 b!1089129))

(declare-fun b_lambda!17319 () Bool)

(assert (=> (not b_lambda!17319) (not b!1089133)))

(declare-fun t!33273 () Bool)

(declare-fun tb!7509 () Bool)

(assert (=> (and start!96222 (= defaultEntry!882 defaultEntry!882) t!33273) tb!7509))

(declare-fun result!15545 () Bool)

(assert (=> tb!7509 (= result!15545 tp_is_empty!26641)))

(assert (=> b!1089133 t!33273))

(declare-fun b_and!35965 () Bool)

(assert (= b_and!35963 (and (=> t!33273 result!15545) b_and!35965)))

(declare-fun m!1008419 () Bool)

(assert (=> start!96222 m!1008419))

(declare-fun m!1008421 () Bool)

(assert (=> start!96222 m!1008421))

(declare-fun m!1008423 () Bool)

(assert (=> start!96222 m!1008423))

(declare-fun m!1008425 () Bool)

(assert (=> b!1089137 m!1008425))

(declare-fun m!1008427 () Bool)

(assert (=> b!1089137 m!1008427))

(declare-fun m!1008429 () Bool)

(assert (=> b!1089128 m!1008429))

(declare-fun m!1008431 () Bool)

(assert (=> b!1089128 m!1008431))

(declare-fun m!1008433 () Bool)

(assert (=> b!1089128 m!1008433))

(declare-fun m!1008435 () Bool)

(assert (=> b!1089127 m!1008435))

(declare-fun m!1008437 () Bool)

(assert (=> b!1089136 m!1008437))

(declare-fun m!1008439 () Bool)

(assert (=> b!1089131 m!1008439))

(declare-fun m!1008441 () Bool)

(assert (=> b!1089132 m!1008441))

(declare-fun m!1008443 () Bool)

(assert (=> b!1089135 m!1008443))

(declare-fun m!1008445 () Bool)

(assert (=> b!1089133 m!1008445))

(declare-fun m!1008447 () Bool)

(assert (=> b!1089133 m!1008447))

(declare-fun m!1008449 () Bool)

(assert (=> b!1089133 m!1008449))

(declare-fun m!1008451 () Bool)

(assert (=> b!1089133 m!1008451))

(declare-fun m!1008453 () Bool)

(assert (=> b!1089133 m!1008453))

(declare-fun m!1008455 () Bool)

(assert (=> b!1089133 m!1008455))

(declare-fun m!1008457 () Bool)

(assert (=> b!1089133 m!1008457))

(declare-fun m!1008459 () Bool)

(assert (=> b!1089133 m!1008459))

(declare-fun m!1008461 () Bool)

(assert (=> b!1089133 m!1008461))

(declare-fun m!1008463 () Bool)

(assert (=> b!1089133 m!1008463))

(declare-fun m!1008465 () Bool)

(assert (=> mapNonEmpty!41716 m!1008465))

(declare-fun m!1008467 () Bool)

(assert (=> b!1089126 m!1008467))

(declare-fun m!1008469 () Bool)

(assert (=> b!1089126 m!1008469))

(check-sat b_and!35965 (not b_lambda!17319) (not b!1089126) (not mapNonEmpty!41716) (not b!1089128) (not start!96222) (not b!1089135) (not b!1089137) (not b!1089136) tp_is_empty!26641 (not b_next!22639) (not b!1089133) (not b!1089127) (not b!1089132))
(check-sat b_and!35965 (not b_next!22639))
