; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96470 () Bool)

(assert start!96470)

(declare-fun b_free!23049 () Bool)

(declare-fun b_next!23049 () Bool)

(assert (=> start!96470 (= b_free!23049 (not b_next!23049))))

(declare-fun tp!81074 () Bool)

(declare-fun b_and!36761 () Bool)

(assert (=> start!96470 (= tp!81074 b_and!36761)))

(declare-fun b!1097016 () Bool)

(declare-fun e!626135 () Bool)

(declare-fun tp_is_empty!27099 () Bool)

(assert (=> b!1097016 (= e!626135 tp_is_empty!27099)))

(declare-fun mapNonEmpty!42409 () Bool)

(declare-fun mapRes!42409 () Bool)

(declare-fun tp!81073 () Bool)

(assert (=> mapNonEmpty!42409 (= mapRes!42409 (and tp!81073 e!626135))))

(declare-datatypes ((V!41259 0))(
  ( (V!41260 (val!13606 Int)) )
))
(declare-datatypes ((ValueCell!12840 0))(
  ( (ValueCellFull!12840 (v!16227 V!41259)) (EmptyCell!12840) )
))
(declare-fun mapRest!42409 () (Array (_ BitVec 32) ValueCell!12840))

(declare-datatypes ((array!71109 0))(
  ( (array!71110 (arr!34226 (Array (_ BitVec 32) ValueCell!12840)) (size!34762 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71109)

(declare-fun mapValue!42409 () ValueCell!12840)

(declare-fun mapKey!42409 () (_ BitVec 32))

(assert (=> mapNonEmpty!42409 (= (arr!34226 _values!874) (store mapRest!42409 mapKey!42409 mapValue!42409))))

(declare-fun b!1097017 () Bool)

(declare-fun e!626136 () Bool)

(assert (=> b!1097017 (= e!626136 tp_is_empty!27099)))

(declare-fun b!1097018 () Bool)

(declare-fun e!626132 () Bool)

(assert (=> b!1097018 (= e!626132 (and e!626136 mapRes!42409))))

(declare-fun condMapEmpty!42409 () Bool)

(declare-fun mapDefault!42409 () ValueCell!12840)

(assert (=> b!1097018 (= condMapEmpty!42409 (= (arr!34226 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12840)) mapDefault!42409)))))

(declare-fun mapIsEmpty!42409 () Bool)

(assert (=> mapIsEmpty!42409 mapRes!42409))

(declare-fun b!1097019 () Bool)

(declare-fun res!732181 () Bool)

(declare-fun e!626133 () Bool)

(assert (=> b!1097019 (=> (not res!732181) (not e!626133))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1097019 (= res!732181 (validKeyInArray!0 k0!904))))

(declare-fun b!1097020 () Bool)

(declare-fun res!732182 () Bool)

(assert (=> b!1097020 (=> (not res!732182) (not e!626133))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((array!71111 0))(
  ( (array!71112 (arr!34227 (Array (_ BitVec 32) (_ BitVec 64))) (size!34763 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71111)

(assert (=> b!1097020 (= res!732182 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34763 _keys!1070))))))

(declare-fun res!732186 () Bool)

(assert (=> start!96470 (=> (not res!732186) (not e!626133))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96470 (= res!732186 (validMask!0 mask!1414))))

(assert (=> start!96470 e!626133))

(assert (=> start!96470 tp!81074))

(assert (=> start!96470 true))

(assert (=> start!96470 tp_is_empty!27099))

(declare-fun array_inv!26370 (array!71111) Bool)

(assert (=> start!96470 (array_inv!26370 _keys!1070)))

(declare-fun array_inv!26371 (array!71109) Bool)

(assert (=> start!96470 (and (array_inv!26371 _values!874) e!626132)))

(declare-fun b!1097021 () Bool)

(declare-fun e!626137 () Bool)

(assert (=> b!1097021 (= e!626133 e!626137)))

(declare-fun res!732179 () Bool)

(assert (=> b!1097021 (=> (not res!732179) (not e!626137))))

(declare-fun lt!490341 () array!71111)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71111 (_ BitVec 32)) Bool)

(assert (=> b!1097021 (= res!732179 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!490341 mask!1414))))

(assert (=> b!1097021 (= lt!490341 (array!71112 (store (arr!34227 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34763 _keys!1070)))))

(declare-fun b!1097022 () Bool)

(declare-fun res!732183 () Bool)

(assert (=> b!1097022 (=> (not res!732183) (not e!626133))))

(declare-datatypes ((List!23901 0))(
  ( (Nil!23898) (Cons!23897 (h!25106 (_ BitVec 64)) (t!33996 List!23901)) )
))
(declare-fun arrayNoDuplicates!0 (array!71111 (_ BitVec 32) List!23901) Bool)

(assert (=> b!1097022 (= res!732183 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23898))))

(declare-fun b!1097023 () Bool)

(declare-fun res!732180 () Bool)

(assert (=> b!1097023 (=> (not res!732180) (not e!626133))))

(assert (=> b!1097023 (= res!732180 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1097024 () Bool)

(declare-fun res!732187 () Bool)

(assert (=> b!1097024 (=> (not res!732187) (not e!626133))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1097024 (= res!732187 (and (= (size!34762 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34763 _keys!1070) (size!34762 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1097025 () Bool)

(declare-datatypes ((tuple2!17278 0))(
  ( (tuple2!17279 (_1!8650 (_ BitVec 64)) (_2!8650 V!41259)) )
))
(declare-datatypes ((List!23902 0))(
  ( (Nil!23899) (Cons!23898 (h!25107 tuple2!17278) (t!33997 List!23902)) )
))
(declare-datatypes ((ListLongMap!15247 0))(
  ( (ListLongMap!15248 (toList!7639 List!23902)) )
))
(declare-fun lt!490345 () ListLongMap!15247)

(declare-fun lt!490344 () ListLongMap!15247)

(assert (=> b!1097025 (= e!626137 (not (= lt!490345 lt!490344)))))

(assert (=> b!1097025 (= lt!490344 lt!490345)))

(declare-fun lt!490342 () ListLongMap!15247)

(declare-fun -!929 (ListLongMap!15247 (_ BitVec 64)) ListLongMap!15247)

(assert (=> b!1097025 (= lt!490345 (-!929 lt!490342 k0!904))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((Unit!36090 0))(
  ( (Unit!36091) )
))
(declare-fun lt!490340 () Unit!36090)

(declare-fun zeroValue!831 () V!41259)

(declare-fun minValue!831 () V!41259)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!185 (array!71111 array!71109 (_ BitVec 32) (_ BitVec 32) V!41259 V!41259 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36090)

(assert (=> b!1097025 (= lt!490340 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!185 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4155 (array!71111 array!71109 (_ BitVec 32) (_ BitVec 32) V!41259 V!41259 (_ BitVec 32) Int) ListLongMap!15247)

(declare-fun dynLambda!2290 (Int (_ BitVec 64)) V!41259)

(assert (=> b!1097025 (= lt!490344 (getCurrentListMapNoExtraKeys!4155 lt!490341 (array!71110 (store (arr!34226 _values!874) i!650 (ValueCellFull!12840 (dynLambda!2290 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34762 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1097025 (= lt!490342 (getCurrentListMapNoExtraKeys!4155 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71111 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1097025 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!490343 () Unit!36090)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71111 (_ BitVec 64) (_ BitVec 32)) Unit!36090)

(assert (=> b!1097025 (= lt!490343 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1097026 () Bool)

(declare-fun res!732184 () Bool)

(assert (=> b!1097026 (=> (not res!732184) (not e!626137))))

(assert (=> b!1097026 (= res!732184 (arrayNoDuplicates!0 lt!490341 #b00000000000000000000000000000000 Nil!23898))))

(declare-fun b!1097027 () Bool)

(declare-fun res!732185 () Bool)

(assert (=> b!1097027 (=> (not res!732185) (not e!626133))))

(assert (=> b!1097027 (= res!732185 (= (select (arr!34227 _keys!1070) i!650) k0!904))))

(assert (= (and start!96470 res!732186) b!1097024))

(assert (= (and b!1097024 res!732187) b!1097023))

(assert (= (and b!1097023 res!732180) b!1097022))

(assert (= (and b!1097022 res!732183) b!1097020))

(assert (= (and b!1097020 res!732182) b!1097019))

(assert (= (and b!1097019 res!732181) b!1097027))

(assert (= (and b!1097027 res!732185) b!1097021))

(assert (= (and b!1097021 res!732179) b!1097026))

(assert (= (and b!1097026 res!732184) b!1097025))

(assert (= (and b!1097018 condMapEmpty!42409) mapIsEmpty!42409))

(assert (= (and b!1097018 (not condMapEmpty!42409)) mapNonEmpty!42409))

(get-info :version)

(assert (= (and mapNonEmpty!42409 ((_ is ValueCellFull!12840) mapValue!42409)) b!1097016))

(assert (= (and b!1097018 ((_ is ValueCellFull!12840) mapDefault!42409)) b!1097017))

(assert (= start!96470 b!1097018))

(declare-fun b_lambda!17707 () Bool)

(assert (=> (not b_lambda!17707) (not b!1097025)))

(declare-fun t!33995 () Bool)

(declare-fun tb!7915 () Bool)

(assert (=> (and start!96470 (= defaultEntry!882 defaultEntry!882) t!33995) tb!7915))

(declare-fun result!16353 () Bool)

(assert (=> tb!7915 (= result!16353 tp_is_empty!27099)))

(assert (=> b!1097025 t!33995))

(declare-fun b_and!36763 () Bool)

(assert (= b_and!36761 (and (=> t!33995 result!16353) b_and!36763)))

(declare-fun m!1016491 () Bool)

(assert (=> b!1097021 m!1016491))

(declare-fun m!1016493 () Bool)

(assert (=> b!1097021 m!1016493))

(declare-fun m!1016495 () Bool)

(assert (=> b!1097022 m!1016495))

(declare-fun m!1016497 () Bool)

(assert (=> start!96470 m!1016497))

(declare-fun m!1016499 () Bool)

(assert (=> start!96470 m!1016499))

(declare-fun m!1016501 () Bool)

(assert (=> start!96470 m!1016501))

(declare-fun m!1016503 () Bool)

(assert (=> b!1097027 m!1016503))

(declare-fun m!1016505 () Bool)

(assert (=> b!1097023 m!1016505))

(declare-fun m!1016507 () Bool)

(assert (=> b!1097019 m!1016507))

(declare-fun m!1016509 () Bool)

(assert (=> mapNonEmpty!42409 m!1016509))

(declare-fun m!1016511 () Bool)

(assert (=> b!1097025 m!1016511))

(declare-fun m!1016513 () Bool)

(assert (=> b!1097025 m!1016513))

(declare-fun m!1016515 () Bool)

(assert (=> b!1097025 m!1016515))

(declare-fun m!1016517 () Bool)

(assert (=> b!1097025 m!1016517))

(declare-fun m!1016519 () Bool)

(assert (=> b!1097025 m!1016519))

(declare-fun m!1016521 () Bool)

(assert (=> b!1097025 m!1016521))

(declare-fun m!1016523 () Bool)

(assert (=> b!1097025 m!1016523))

(declare-fun m!1016525 () Bool)

(assert (=> b!1097025 m!1016525))

(declare-fun m!1016527 () Bool)

(assert (=> b!1097026 m!1016527))

(check-sat (not b!1097022) (not b!1097025) (not start!96470) (not b!1097023) (not mapNonEmpty!42409) (not b!1097021) (not b!1097026) tp_is_empty!27099 (not b_next!23049) (not b!1097019) b_and!36763 (not b_lambda!17707))
(check-sat b_and!36763 (not b_next!23049))
