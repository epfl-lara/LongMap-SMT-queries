; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96940 () Bool)

(assert start!96940)

(declare-fun b_free!23125 () Bool)

(declare-fun b_next!23125 () Bool)

(assert (=> start!96940 (= b_free!23125 (not b_next!23125))))

(declare-fun tp!81319 () Bool)

(declare-fun b_and!37007 () Bool)

(assert (=> start!96940 (= tp!81319 b_and!37007)))

(declare-fun b!1101147 () Bool)

(declare-fun e!628606 () Bool)

(declare-fun tp_is_empty!27175 () Bool)

(assert (=> b!1101147 (= e!628606 tp_is_empty!27175)))

(declare-fun b!1101148 () Bool)

(declare-fun res!734434 () Bool)

(declare-fun e!628602 () Bool)

(assert (=> b!1101148 (=> (not res!734434) (not e!628602))))

(declare-datatypes ((array!71303 0))(
  ( (array!71304 (arr!34311 (Array (_ BitVec 32) (_ BitVec 64))) (size!34848 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71303)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71303 (_ BitVec 32)) Bool)

(assert (=> b!1101148 (= res!734434 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1101149 () Bool)

(declare-fun res!734430 () Bool)

(assert (=> b!1101149 (=> (not res!734430) (not e!628602))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1101149 (= res!734430 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34848 _keys!1070))))))

(declare-fun b!1101150 () Bool)

(declare-fun e!628603 () Bool)

(assert (=> b!1101150 (= e!628602 e!628603)))

(declare-fun res!734435 () Bool)

(assert (=> b!1101150 (=> (not res!734435) (not e!628603))))

(declare-fun lt!493104 () array!71303)

(assert (=> b!1101150 (= res!734435 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!493104 mask!1414))))

(assert (=> b!1101150 (= lt!493104 (array!71304 (store (arr!34311 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34848 _keys!1070)))))

(declare-fun b!1101151 () Bool)

(declare-fun res!734429 () Bool)

(assert (=> b!1101151 (=> (not res!734429) (not e!628602))))

(declare-fun k0!904 () (_ BitVec 64))

(assert (=> b!1101151 (= res!734429 (= (select (arr!34311 _keys!1070) i!650) k0!904))))

(declare-fun b!1101152 () Bool)

(declare-fun res!734433 () Bool)

(assert (=> b!1101152 (=> (not res!734433) (not e!628602))))

(declare-datatypes ((List!23974 0))(
  ( (Nil!23971) (Cons!23970 (h!25188 (_ BitVec 64)) (t!34137 List!23974)) )
))
(declare-fun arrayNoDuplicates!0 (array!71303 (_ BitVec 32) List!23974) Bool)

(assert (=> b!1101152 (= res!734433 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23971))))

(declare-fun mapNonEmpty!42541 () Bool)

(declare-fun mapRes!42541 () Bool)

(declare-fun tp!81320 () Bool)

(assert (=> mapNonEmpty!42541 (= mapRes!42541 (and tp!81320 e!628606))))

(declare-datatypes ((V!41361 0))(
  ( (V!41362 (val!13644 Int)) )
))
(declare-datatypes ((ValueCell!12878 0))(
  ( (ValueCellFull!12878 (v!16267 V!41361)) (EmptyCell!12878) )
))
(declare-fun mapValue!42541 () ValueCell!12878)

(declare-fun mapKey!42541 () (_ BitVec 32))

(declare-datatypes ((array!71305 0))(
  ( (array!71306 (arr!34312 (Array (_ BitVec 32) ValueCell!12878)) (size!34849 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71305)

(declare-fun mapRest!42541 () (Array (_ BitVec 32) ValueCell!12878))

(assert (=> mapNonEmpty!42541 (= (arr!34312 _values!874) (store mapRest!42541 mapKey!42541 mapValue!42541))))

(declare-fun b!1101153 () Bool)

(declare-fun res!734432 () Bool)

(assert (=> b!1101153 (=> (not res!734432) (not e!628602))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1101153 (= res!734432 (and (= (size!34849 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34848 _keys!1070) (size!34849 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!42541 () Bool)

(assert (=> mapIsEmpty!42541 mapRes!42541))

(declare-fun e!628604 () Bool)

(declare-datatypes ((tuple2!17352 0))(
  ( (tuple2!17353 (_1!8687 (_ BitVec 64)) (_2!8687 V!41361)) )
))
(declare-datatypes ((List!23975 0))(
  ( (Nil!23972) (Cons!23971 (h!25189 tuple2!17352) (t!34138 List!23975)) )
))
(declare-datatypes ((ListLongMap!15329 0))(
  ( (ListLongMap!15330 (toList!7680 List!23975)) )
))
(declare-fun lt!493105 () ListLongMap!15329)

(declare-fun b!1101154 () Bool)

(declare-fun lt!493108 () tuple2!17352)

(declare-fun lt!493103 () ListLongMap!15329)

(declare-fun +!3412 (ListLongMap!15329 tuple2!17352) ListLongMap!15329)

(assert (=> b!1101154 (= e!628604 (= lt!493103 (+!3412 lt!493105 lt!493108)))))

(declare-fun b!1101155 () Bool)

(declare-fun e!628605 () Bool)

(assert (=> b!1101155 (= e!628603 (not e!628605))))

(declare-fun res!734436 () Bool)

(assert (=> b!1101155 (=> res!734436 e!628605)))

(assert (=> b!1101155 (= res!734436 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!41361)

(declare-fun zeroValue!831 () V!41361)

(declare-fun getCurrentListMap!4387 (array!71303 array!71305 (_ BitVec 32) (_ BitVec 32) V!41361 V!41361 (_ BitVec 32) Int) ListLongMap!15329)

(assert (=> b!1101155 (= lt!493103 (getCurrentListMap!4387 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!493100 () array!71305)

(declare-fun lt!493101 () ListLongMap!15329)

(assert (=> b!1101155 (= lt!493101 (getCurrentListMap!4387 lt!493104 lt!493100 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!493102 () ListLongMap!15329)

(declare-fun lt!493106 () ListLongMap!15329)

(assert (=> b!1101155 (and (= lt!493102 lt!493106) (= lt!493106 lt!493102))))

(declare-fun -!951 (ListLongMap!15329 (_ BitVec 64)) ListLongMap!15329)

(assert (=> b!1101155 (= lt!493106 (-!951 lt!493105 k0!904))))

(declare-datatypes ((Unit!36153 0))(
  ( (Unit!36154) )
))
(declare-fun lt!493099 () Unit!36153)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!221 (array!71303 array!71305 (_ BitVec 32) (_ BitVec 32) V!41361 V!41361 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36153)

(assert (=> b!1101155 (= lt!493099 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!221 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4228 (array!71303 array!71305 (_ BitVec 32) (_ BitVec 32) V!41361 V!41361 (_ BitVec 32) Int) ListLongMap!15329)

(assert (=> b!1101155 (= lt!493102 (getCurrentListMapNoExtraKeys!4228 lt!493104 lt!493100 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2346 (Int (_ BitVec 64)) V!41361)

(assert (=> b!1101155 (= lt!493100 (array!71306 (store (arr!34312 _values!874) i!650 (ValueCellFull!12878 (dynLambda!2346 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34849 _values!874)))))

(assert (=> b!1101155 (= lt!493105 (getCurrentListMapNoExtraKeys!4228 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71303 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1101155 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!493107 () Unit!36153)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71303 (_ BitVec 64) (_ BitVec 32)) Unit!36153)

(assert (=> b!1101155 (= lt!493107 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1101156 () Bool)

(assert (=> b!1101156 (= e!628605 (= lt!493101 (+!3412 lt!493106 lt!493108)))))

(assert (=> b!1101156 e!628604))

(declare-fun res!734437 () Bool)

(assert (=> b!1101156 (=> (not res!734437) (not e!628604))))

(assert (=> b!1101156 (= res!734437 (= lt!493101 (+!3412 lt!493102 lt!493108)))))

(assert (=> b!1101156 (= lt!493108 (tuple2!17353 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1101157 () Bool)

(declare-fun res!734431 () Bool)

(assert (=> b!1101157 (=> (not res!734431) (not e!628603))))

(assert (=> b!1101157 (= res!734431 (arrayNoDuplicates!0 lt!493104 #b00000000000000000000000000000000 Nil!23971))))

(declare-fun b!1101158 () Bool)

(declare-fun res!734428 () Bool)

(assert (=> b!1101158 (=> (not res!734428) (not e!628602))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1101158 (= res!734428 (validKeyInArray!0 k0!904))))

(declare-fun b!1101159 () Bool)

(declare-fun e!628601 () Bool)

(assert (=> b!1101159 (= e!628601 tp_is_empty!27175)))

(declare-fun res!734427 () Bool)

(assert (=> start!96940 (=> (not res!734427) (not e!628602))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96940 (= res!734427 (validMask!0 mask!1414))))

(assert (=> start!96940 e!628602))

(assert (=> start!96940 tp!81319))

(assert (=> start!96940 true))

(assert (=> start!96940 tp_is_empty!27175))

(declare-fun array_inv!26452 (array!71303) Bool)

(assert (=> start!96940 (array_inv!26452 _keys!1070)))

(declare-fun e!628599 () Bool)

(declare-fun array_inv!26453 (array!71305) Bool)

(assert (=> start!96940 (and (array_inv!26453 _values!874) e!628599)))

(declare-fun b!1101160 () Bool)

(assert (=> b!1101160 (= e!628599 (and e!628601 mapRes!42541))))

(declare-fun condMapEmpty!42541 () Bool)

(declare-fun mapDefault!42541 () ValueCell!12878)

(assert (=> b!1101160 (= condMapEmpty!42541 (= (arr!34312 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12878)) mapDefault!42541)))))

(assert (= (and start!96940 res!734427) b!1101153))

(assert (= (and b!1101153 res!734432) b!1101148))

(assert (= (and b!1101148 res!734434) b!1101152))

(assert (= (and b!1101152 res!734433) b!1101149))

(assert (= (and b!1101149 res!734430) b!1101158))

(assert (= (and b!1101158 res!734428) b!1101151))

(assert (= (and b!1101151 res!734429) b!1101150))

(assert (= (and b!1101150 res!734435) b!1101157))

(assert (= (and b!1101157 res!734431) b!1101155))

(assert (= (and b!1101155 (not res!734436)) b!1101156))

(assert (= (and b!1101156 res!734437) b!1101154))

(assert (= (and b!1101160 condMapEmpty!42541) mapIsEmpty!42541))

(assert (= (and b!1101160 (not condMapEmpty!42541)) mapNonEmpty!42541))

(get-info :version)

(assert (= (and mapNonEmpty!42541 ((_ is ValueCellFull!12878) mapValue!42541)) b!1101147))

(assert (= (and b!1101160 ((_ is ValueCellFull!12878) mapDefault!42541)) b!1101159))

(assert (= start!96940 b!1101160))

(declare-fun b_lambda!17973 () Bool)

(assert (=> (not b_lambda!17973) (not b!1101155)))

(declare-fun t!34136 () Bool)

(declare-fun tb!7983 () Bool)

(assert (=> (and start!96940 (= defaultEntry!882 defaultEntry!882) t!34136) tb!7983))

(declare-fun result!16509 () Bool)

(assert (=> tb!7983 (= result!16509 tp_is_empty!27175)))

(assert (=> b!1101155 t!34136))

(declare-fun b_and!37009 () Bool)

(assert (= b_and!37007 (and (=> t!34136 result!16509) b_and!37009)))

(declare-fun m!1021497 () Bool)

(assert (=> mapNonEmpty!42541 m!1021497))

(declare-fun m!1021499 () Bool)

(assert (=> b!1101155 m!1021499))

(declare-fun m!1021501 () Bool)

(assert (=> b!1101155 m!1021501))

(declare-fun m!1021503 () Bool)

(assert (=> b!1101155 m!1021503))

(declare-fun m!1021505 () Bool)

(assert (=> b!1101155 m!1021505))

(declare-fun m!1021507 () Bool)

(assert (=> b!1101155 m!1021507))

(declare-fun m!1021509 () Bool)

(assert (=> b!1101155 m!1021509))

(declare-fun m!1021511 () Bool)

(assert (=> b!1101155 m!1021511))

(declare-fun m!1021513 () Bool)

(assert (=> b!1101155 m!1021513))

(declare-fun m!1021515 () Bool)

(assert (=> b!1101155 m!1021515))

(declare-fun m!1021517 () Bool)

(assert (=> b!1101155 m!1021517))

(declare-fun m!1021519 () Bool)

(assert (=> b!1101157 m!1021519))

(declare-fun m!1021521 () Bool)

(assert (=> b!1101150 m!1021521))

(declare-fun m!1021523 () Bool)

(assert (=> b!1101150 m!1021523))

(declare-fun m!1021525 () Bool)

(assert (=> b!1101148 m!1021525))

(declare-fun m!1021527 () Bool)

(assert (=> start!96940 m!1021527))

(declare-fun m!1021529 () Bool)

(assert (=> start!96940 m!1021529))

(declare-fun m!1021531 () Bool)

(assert (=> start!96940 m!1021531))

(declare-fun m!1021533 () Bool)

(assert (=> b!1101158 m!1021533))

(declare-fun m!1021535 () Bool)

(assert (=> b!1101152 m!1021535))

(declare-fun m!1021537 () Bool)

(assert (=> b!1101156 m!1021537))

(declare-fun m!1021539 () Bool)

(assert (=> b!1101156 m!1021539))

(declare-fun m!1021541 () Bool)

(assert (=> b!1101154 m!1021541))

(declare-fun m!1021543 () Bool)

(assert (=> b!1101151 m!1021543))

(check-sat b_and!37009 (not mapNonEmpty!42541) (not b!1101152) (not b!1101158) (not b!1101150) (not b!1101155) (not b!1101156) (not b!1101157) (not b_next!23125) (not b!1101154) tp_is_empty!27175 (not b_lambda!17973) (not b!1101148) (not start!96940))
(check-sat b_and!37009 (not b_next!23125))
