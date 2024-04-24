; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96650 () Bool)

(assert start!96650)

(declare-fun b_free!22993 () Bool)

(declare-fun b_next!22993 () Bool)

(assert (=> start!96650 (= b_free!22993 (not b_next!22993))))

(declare-fun tp!80905 () Bool)

(declare-fun b_and!36659 () Bool)

(assert (=> start!96650 (= tp!80905 b_and!36659)))

(declare-fun b!1097279 () Bool)

(declare-fun e!626486 () Bool)

(declare-fun tp_is_empty!27043 () Bool)

(assert (=> b!1097279 (= e!626486 tp_is_empty!27043)))

(declare-fun b!1097280 () Bool)

(declare-fun res!731951 () Bool)

(declare-fun e!626484 () Bool)

(assert (=> b!1097280 (=> (not res!731951) (not e!626484))))

(declare-datatypes ((array!71027 0))(
  ( (array!71028 (arr!34179 (Array (_ BitVec 32) (_ BitVec 64))) (size!34716 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71027)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1097280 (= res!731951 (= (select (arr!34179 _keys!1070) i!650) k0!904))))

(declare-fun b!1097281 () Bool)

(declare-fun e!626483 () Bool)

(assert (=> b!1097281 (= e!626483 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((V!41185 0))(
  ( (V!41186 (val!13578 Int)) )
))
(declare-datatypes ((ValueCell!12812 0))(
  ( (ValueCellFull!12812 (v!16195 V!41185)) (EmptyCell!12812) )
))
(declare-datatypes ((array!71029 0))(
  ( (array!71030 (arr!34180 (Array (_ BitVec 32) ValueCell!12812)) (size!34717 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71029)

(declare-fun minValue!831 () V!41185)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun lt!490509 () array!71027)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((tuple2!17250 0))(
  ( (tuple2!17251 (_1!8636 (_ BitVec 64)) (_2!8636 V!41185)) )
))
(declare-datatypes ((List!23871 0))(
  ( (Nil!23868) (Cons!23867 (h!25085 tuple2!17250) (t!33902 List!23871)) )
))
(declare-datatypes ((ListLongMap!15227 0))(
  ( (ListLongMap!15228 (toList!7629 List!23871)) )
))
(declare-fun lt!490512 () ListLongMap!15227)

(declare-fun zeroValue!831 () V!41185)

(declare-fun getCurrentListMapNoExtraKeys!4182 (array!71027 array!71029 (_ BitVec 32) (_ BitVec 32) V!41185 V!41185 (_ BitVec 32) Int) ListLongMap!15227)

(declare-fun dynLambda!2300 (Int (_ BitVec 64)) V!41185)

(assert (=> b!1097281 (= lt!490512 (getCurrentListMapNoExtraKeys!4182 lt!490509 (array!71030 (store (arr!34180 _values!874) i!650 (ValueCellFull!12812 (dynLambda!2300 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34717 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!490510 () ListLongMap!15227)

(assert (=> b!1097281 (= lt!490510 (getCurrentListMapNoExtraKeys!4182 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71027 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1097281 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36045 0))(
  ( (Unit!36046) )
))
(declare-fun lt!490511 () Unit!36045)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71027 (_ BitVec 64) (_ BitVec 32)) Unit!36045)

(assert (=> b!1097281 (= lt!490511 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1097282 () Bool)

(declare-fun res!731946 () Bool)

(assert (=> b!1097282 (=> (not res!731946) (not e!626484))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71027 (_ BitVec 32)) Bool)

(assert (=> b!1097282 (= res!731946 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1097283 () Bool)

(declare-fun res!731953 () Bool)

(assert (=> b!1097283 (=> (not res!731953) (not e!626483))))

(declare-datatypes ((List!23872 0))(
  ( (Nil!23869) (Cons!23868 (h!25086 (_ BitVec 64)) (t!33903 List!23872)) )
))
(declare-fun arrayNoDuplicates!0 (array!71027 (_ BitVec 32) List!23872) Bool)

(assert (=> b!1097283 (= res!731953 (arrayNoDuplicates!0 lt!490509 #b00000000000000000000000000000000 Nil!23869))))

(declare-fun b!1097284 () Bool)

(declare-fun e!626485 () Bool)

(declare-fun mapRes!42325 () Bool)

(assert (=> b!1097284 (= e!626485 (and e!626486 mapRes!42325))))

(declare-fun condMapEmpty!42325 () Bool)

(declare-fun mapDefault!42325 () ValueCell!12812)

(assert (=> b!1097284 (= condMapEmpty!42325 (= (arr!34180 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12812)) mapDefault!42325)))))

(declare-fun mapIsEmpty!42325 () Bool)

(assert (=> mapIsEmpty!42325 mapRes!42325))

(declare-fun b!1097285 () Bool)

(declare-fun res!731945 () Bool)

(assert (=> b!1097285 (=> (not res!731945) (not e!626484))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1097285 (= res!731945 (validKeyInArray!0 k0!904))))

(declare-fun b!1097286 () Bool)

(declare-fun res!731948 () Bool)

(assert (=> b!1097286 (=> (not res!731948) (not e!626484))))

(assert (=> b!1097286 (= res!731948 (and (= (size!34717 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34716 _keys!1070) (size!34717 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!42325 () Bool)

(declare-fun tp!80906 () Bool)

(declare-fun e!626488 () Bool)

(assert (=> mapNonEmpty!42325 (= mapRes!42325 (and tp!80906 e!626488))))

(declare-fun mapRest!42325 () (Array (_ BitVec 32) ValueCell!12812))

(declare-fun mapKey!42325 () (_ BitVec 32))

(declare-fun mapValue!42325 () ValueCell!12812)

(assert (=> mapNonEmpty!42325 (= (arr!34180 _values!874) (store mapRest!42325 mapKey!42325 mapValue!42325))))

(declare-fun b!1097287 () Bool)

(assert (=> b!1097287 (= e!626488 tp_is_empty!27043)))

(declare-fun b!1097288 () Bool)

(declare-fun res!731947 () Bool)

(assert (=> b!1097288 (=> (not res!731947) (not e!626484))))

(assert (=> b!1097288 (= res!731947 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34716 _keys!1070))))))

(declare-fun res!731950 () Bool)

(assert (=> start!96650 (=> (not res!731950) (not e!626484))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96650 (= res!731950 (validMask!0 mask!1414))))

(assert (=> start!96650 e!626484))

(assert (=> start!96650 tp!80905))

(assert (=> start!96650 true))

(assert (=> start!96650 tp_is_empty!27043))

(declare-fun array_inv!26368 (array!71027) Bool)

(assert (=> start!96650 (array_inv!26368 _keys!1070)))

(declare-fun array_inv!26369 (array!71029) Bool)

(assert (=> start!96650 (and (array_inv!26369 _values!874) e!626485)))

(declare-fun b!1097289 () Bool)

(assert (=> b!1097289 (= e!626484 e!626483)))

(declare-fun res!731949 () Bool)

(assert (=> b!1097289 (=> (not res!731949) (not e!626483))))

(assert (=> b!1097289 (= res!731949 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!490509 mask!1414))))

(assert (=> b!1097289 (= lt!490509 (array!71028 (store (arr!34179 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34716 _keys!1070)))))

(declare-fun b!1097290 () Bool)

(declare-fun res!731952 () Bool)

(assert (=> b!1097290 (=> (not res!731952) (not e!626484))))

(assert (=> b!1097290 (= res!731952 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23869))))

(assert (= (and start!96650 res!731950) b!1097286))

(assert (= (and b!1097286 res!731948) b!1097282))

(assert (= (and b!1097282 res!731946) b!1097290))

(assert (= (and b!1097290 res!731952) b!1097288))

(assert (= (and b!1097288 res!731947) b!1097285))

(assert (= (and b!1097285 res!731945) b!1097280))

(assert (= (and b!1097280 res!731951) b!1097289))

(assert (= (and b!1097289 res!731949) b!1097283))

(assert (= (and b!1097283 res!731953) b!1097281))

(assert (= (and b!1097284 condMapEmpty!42325) mapIsEmpty!42325))

(assert (= (and b!1097284 (not condMapEmpty!42325)) mapNonEmpty!42325))

(get-info :version)

(assert (= (and mapNonEmpty!42325 ((_ is ValueCellFull!12812) mapValue!42325)) b!1097287))

(assert (= (and b!1097284 ((_ is ValueCellFull!12812) mapDefault!42325)) b!1097279))

(assert (= start!96650 b!1097284))

(declare-fun b_lambda!17661 () Bool)

(assert (=> (not b_lambda!17661) (not b!1097281)))

(declare-fun t!33901 () Bool)

(declare-fun tb!7851 () Bool)

(assert (=> (and start!96650 (= defaultEntry!882 defaultEntry!882) t!33901) tb!7851))

(declare-fun result!16233 () Bool)

(assert (=> tb!7851 (= result!16233 tp_is_empty!27043)))

(assert (=> b!1097281 t!33901))

(declare-fun b_and!36661 () Bool)

(assert (= b_and!36659 (and (=> t!33901 result!16233) b_and!36661)))

(declare-fun m!1017207 () Bool)

(assert (=> mapNonEmpty!42325 m!1017207))

(declare-fun m!1017209 () Bool)

(assert (=> b!1097280 m!1017209))

(declare-fun m!1017211 () Bool)

(assert (=> b!1097289 m!1017211))

(declare-fun m!1017213 () Bool)

(assert (=> b!1097289 m!1017213))

(declare-fun m!1017215 () Bool)

(assert (=> b!1097283 m!1017215))

(declare-fun m!1017217 () Bool)

(assert (=> b!1097290 m!1017217))

(declare-fun m!1017219 () Bool)

(assert (=> b!1097282 m!1017219))

(declare-fun m!1017221 () Bool)

(assert (=> b!1097281 m!1017221))

(declare-fun m!1017223 () Bool)

(assert (=> b!1097281 m!1017223))

(declare-fun m!1017225 () Bool)

(assert (=> b!1097281 m!1017225))

(declare-fun m!1017227 () Bool)

(assert (=> b!1097281 m!1017227))

(declare-fun m!1017229 () Bool)

(assert (=> b!1097281 m!1017229))

(declare-fun m!1017231 () Bool)

(assert (=> b!1097281 m!1017231))

(declare-fun m!1017233 () Bool)

(assert (=> start!96650 m!1017233))

(declare-fun m!1017235 () Bool)

(assert (=> start!96650 m!1017235))

(declare-fun m!1017237 () Bool)

(assert (=> start!96650 m!1017237))

(declare-fun m!1017239 () Bool)

(assert (=> b!1097285 m!1017239))

(check-sat (not b!1097290) (not b!1097282) (not b!1097289) tp_is_empty!27043 (not b_lambda!17661) (not b!1097283) (not mapNonEmpty!42325) b_and!36661 (not b!1097285) (not b!1097281) (not start!96650) (not b_next!22993))
(check-sat b_and!36661 (not b_next!22993))
