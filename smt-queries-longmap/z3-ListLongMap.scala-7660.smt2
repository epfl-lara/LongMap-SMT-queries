; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96274 () Bool)

(assert start!96274)

(declare-fun b_free!22933 () Bool)

(declare-fun b_next!22933 () Bool)

(assert (=> start!96274 (= b_free!22933 (not b_next!22933))))

(declare-fun tp!80648 () Bool)

(declare-fun b_and!36515 () Bool)

(assert (=> start!96274 (= tp!80648 b_and!36515)))

(declare-fun res!729993 () Bool)

(declare-fun e!624516 () Bool)

(assert (=> start!96274 (=> (not res!729993) (not e!624516))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96274 (= res!729993 (validMask!0 mask!1414))))

(assert (=> start!96274 e!624516))

(assert (=> start!96274 tp!80648))

(assert (=> start!96274 true))

(declare-fun tp_is_empty!26935 () Bool)

(assert (=> start!96274 tp_is_empty!26935))

(declare-datatypes ((array!70700 0))(
  ( (array!70701 (arr!34024 (Array (_ BitVec 32) (_ BitVec 64))) (size!34562 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70700)

(declare-fun array_inv!26262 (array!70700) Bool)

(assert (=> start!96274 (array_inv!26262 _keys!1070)))

(declare-datatypes ((V!41041 0))(
  ( (V!41042 (val!13524 Int)) )
))
(declare-datatypes ((ValueCell!12758 0))(
  ( (ValueCellFull!12758 (v!16144 V!41041)) (EmptyCell!12758) )
))
(declare-datatypes ((array!70702 0))(
  ( (array!70703 (arr!34025 (Array (_ BitVec 32) ValueCell!12758)) (size!34563 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70702)

(declare-fun e!624519 () Bool)

(declare-fun array_inv!26263 (array!70702) Bool)

(assert (=> start!96274 (and (array_inv!26263 _values!874) e!624519)))

(declare-fun b!1093848 () Bool)

(declare-fun res!729992 () Bool)

(assert (=> b!1093848 (=> (not res!729992) (not e!624516))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1093848 (= res!729992 (= (select (arr!34024 _keys!1070) i!650) k0!904))))

(declare-fun b!1093849 () Bool)

(declare-fun res!729991 () Bool)

(assert (=> b!1093849 (=> (not res!729991) (not e!624516))))

(declare-datatypes ((List!23835 0))(
  ( (Nil!23832) (Cons!23831 (h!25040 (_ BitVec 64)) (t!33817 List!23835)) )
))
(declare-fun arrayNoDuplicates!0 (array!70700 (_ BitVec 32) List!23835) Bool)

(assert (=> b!1093849 (= res!729991 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23832))))

(declare-fun b!1093850 () Bool)

(declare-fun res!729985 () Bool)

(assert (=> b!1093850 (=> (not res!729985) (not e!624516))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70700 (_ BitVec 32)) Bool)

(assert (=> b!1093850 (= res!729985 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1093851 () Bool)

(declare-fun e!624520 () Bool)

(declare-fun mapRes!42157 () Bool)

(assert (=> b!1093851 (= e!624519 (and e!624520 mapRes!42157))))

(declare-fun condMapEmpty!42157 () Bool)

(declare-fun mapDefault!42157 () ValueCell!12758)

(assert (=> b!1093851 (= condMapEmpty!42157 (= (arr!34025 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12758)) mapDefault!42157)))))

(declare-fun b!1093852 () Bool)

(declare-fun res!729989 () Bool)

(assert (=> b!1093852 (=> (not res!729989) (not e!624516))))

(assert (=> b!1093852 (= res!729989 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34562 _keys!1070))))))

(declare-fun b!1093853 () Bool)

(declare-fun e!624521 () Bool)

(assert (=> b!1093853 (= e!624521 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!41041)

(declare-datatypes ((tuple2!17268 0))(
  ( (tuple2!17269 (_1!8645 (_ BitVec 64)) (_2!8645 V!41041)) )
))
(declare-datatypes ((List!23836 0))(
  ( (Nil!23833) (Cons!23832 (h!25041 tuple2!17268) (t!33818 List!23836)) )
))
(declare-datatypes ((ListLongMap!15237 0))(
  ( (ListLongMap!15238 (toList!7634 List!23836)) )
))
(declare-fun lt!489203 () ListLongMap!15237)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-fun zeroValue!831 () V!41041)

(declare-fun getCurrentListMap!4297 (array!70700 array!70702 (_ BitVec 32) (_ BitVec 32) V!41041 V!41041 (_ BitVec 32) Int) ListLongMap!15237)

(assert (=> b!1093853 (= lt!489203 (getCurrentListMap!4297 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!489202 () ListLongMap!15237)

(declare-fun lt!489197 () array!70702)

(declare-fun lt!489200 () array!70700)

(assert (=> b!1093853 (= lt!489202 (getCurrentListMap!4297 lt!489200 lt!489197 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!489199 () ListLongMap!15237)

(declare-fun lt!489198 () ListLongMap!15237)

(assert (=> b!1093853 (and (= lt!489199 lt!489198) (= lt!489198 lt!489199))))

(declare-fun lt!489201 () ListLongMap!15237)

(declare-fun -!906 (ListLongMap!15237 (_ BitVec 64)) ListLongMap!15237)

(assert (=> b!1093853 (= lt!489198 (-!906 lt!489201 k0!904))))

(declare-datatypes ((Unit!35847 0))(
  ( (Unit!35848) )
))
(declare-fun lt!489195 () Unit!35847)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!181 (array!70700 array!70702 (_ BitVec 32) (_ BitVec 32) V!41041 V!41041 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35847)

(assert (=> b!1093853 (= lt!489195 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!181 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4167 (array!70700 array!70702 (_ BitVec 32) (_ BitVec 32) V!41041 V!41041 (_ BitVec 32) Int) ListLongMap!15237)

(assert (=> b!1093853 (= lt!489199 (getCurrentListMapNoExtraKeys!4167 lt!489200 lt!489197 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2238 (Int (_ BitVec 64)) V!41041)

(assert (=> b!1093853 (= lt!489197 (array!70703 (store (arr!34025 _values!874) i!650 (ValueCellFull!12758 (dynLambda!2238 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34563 _values!874)))))

(assert (=> b!1093853 (= lt!489201 (getCurrentListMapNoExtraKeys!4167 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70700 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1093853 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!489196 () Unit!35847)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70700 (_ BitVec 64) (_ BitVec 32)) Unit!35847)

(assert (=> b!1093853 (= lt!489196 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1093854 () Bool)

(declare-fun res!729987 () Bool)

(assert (=> b!1093854 (=> (not res!729987) (not e!624516))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1093854 (= res!729987 (validKeyInArray!0 k0!904))))

(declare-fun b!1093855 () Bool)

(assert (=> b!1093855 (= e!624516 e!624521)))

(declare-fun res!729990 () Bool)

(assert (=> b!1093855 (=> (not res!729990) (not e!624521))))

(assert (=> b!1093855 (= res!729990 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!489200 mask!1414))))

(assert (=> b!1093855 (= lt!489200 (array!70701 (store (arr!34024 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34562 _keys!1070)))))

(declare-fun b!1093856 () Bool)

(assert (=> b!1093856 (= e!624520 tp_is_empty!26935)))

(declare-fun b!1093857 () Bool)

(declare-fun res!729986 () Bool)

(assert (=> b!1093857 (=> (not res!729986) (not e!624521))))

(assert (=> b!1093857 (= res!729986 (arrayNoDuplicates!0 lt!489200 #b00000000000000000000000000000000 Nil!23832))))

(declare-fun mapIsEmpty!42157 () Bool)

(assert (=> mapIsEmpty!42157 mapRes!42157))

(declare-fun b!1093858 () Bool)

(declare-fun e!624517 () Bool)

(assert (=> b!1093858 (= e!624517 tp_is_empty!26935)))

(declare-fun b!1093859 () Bool)

(declare-fun res!729988 () Bool)

(assert (=> b!1093859 (=> (not res!729988) (not e!624516))))

(assert (=> b!1093859 (= res!729988 (and (= (size!34563 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34562 _keys!1070) (size!34563 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!42157 () Bool)

(declare-fun tp!80647 () Bool)

(assert (=> mapNonEmpty!42157 (= mapRes!42157 (and tp!80647 e!624517))))

(declare-fun mapRest!42157 () (Array (_ BitVec 32) ValueCell!12758))

(declare-fun mapKey!42157 () (_ BitVec 32))

(declare-fun mapValue!42157 () ValueCell!12758)

(assert (=> mapNonEmpty!42157 (= (arr!34025 _values!874) (store mapRest!42157 mapKey!42157 mapValue!42157))))

(assert (= (and start!96274 res!729993) b!1093859))

(assert (= (and b!1093859 res!729988) b!1093850))

(assert (= (and b!1093850 res!729985) b!1093849))

(assert (= (and b!1093849 res!729991) b!1093852))

(assert (= (and b!1093852 res!729989) b!1093854))

(assert (= (and b!1093854 res!729987) b!1093848))

(assert (= (and b!1093848 res!729992) b!1093855))

(assert (= (and b!1093855 res!729990) b!1093857))

(assert (= (and b!1093857 res!729986) b!1093853))

(assert (= (and b!1093851 condMapEmpty!42157) mapIsEmpty!42157))

(assert (= (and b!1093851 (not condMapEmpty!42157)) mapNonEmpty!42157))

(get-info :version)

(assert (= (and mapNonEmpty!42157 ((_ is ValueCellFull!12758) mapValue!42157)) b!1093858))

(assert (= (and b!1093851 ((_ is ValueCellFull!12758) mapDefault!42157)) b!1093856))

(assert (= start!96274 b!1093851))

(declare-fun b_lambda!17581 () Bool)

(assert (=> (not b_lambda!17581) (not b!1093853)))

(declare-fun t!33816 () Bool)

(declare-fun tb!7803 () Bool)

(assert (=> (and start!96274 (= defaultEntry!882 defaultEntry!882) t!33816) tb!7803))

(declare-fun result!16133 () Bool)

(assert (=> tb!7803 (= result!16133 tp_is_empty!26935)))

(assert (=> b!1093853 t!33816))

(declare-fun b_and!36517 () Bool)

(assert (= b_and!36515 (and (=> t!33816 result!16133) b_and!36517)))

(declare-fun m!1013303 () Bool)

(assert (=> b!1093849 m!1013303))

(declare-fun m!1013305 () Bool)

(assert (=> start!96274 m!1013305))

(declare-fun m!1013307 () Bool)

(assert (=> start!96274 m!1013307))

(declare-fun m!1013309 () Bool)

(assert (=> start!96274 m!1013309))

(declare-fun m!1013311 () Bool)

(assert (=> b!1093854 m!1013311))

(declare-fun m!1013313 () Bool)

(assert (=> b!1093850 m!1013313))

(declare-fun m!1013315 () Bool)

(assert (=> b!1093857 m!1013315))

(declare-fun m!1013317 () Bool)

(assert (=> b!1093853 m!1013317))

(declare-fun m!1013319 () Bool)

(assert (=> b!1093853 m!1013319))

(declare-fun m!1013321 () Bool)

(assert (=> b!1093853 m!1013321))

(declare-fun m!1013323 () Bool)

(assert (=> b!1093853 m!1013323))

(declare-fun m!1013325 () Bool)

(assert (=> b!1093853 m!1013325))

(declare-fun m!1013327 () Bool)

(assert (=> b!1093853 m!1013327))

(declare-fun m!1013329 () Bool)

(assert (=> b!1093853 m!1013329))

(declare-fun m!1013331 () Bool)

(assert (=> b!1093853 m!1013331))

(declare-fun m!1013333 () Bool)

(assert (=> b!1093853 m!1013333))

(declare-fun m!1013335 () Bool)

(assert (=> b!1093853 m!1013335))

(declare-fun m!1013337 () Bool)

(assert (=> b!1093855 m!1013337))

(declare-fun m!1013339 () Bool)

(assert (=> b!1093855 m!1013339))

(declare-fun m!1013341 () Bool)

(assert (=> mapNonEmpty!42157 m!1013341))

(declare-fun m!1013343 () Bool)

(assert (=> b!1093848 m!1013343))

(check-sat (not b!1093853) (not b!1093855) (not b!1093857) (not start!96274) (not b_next!22933) tp_is_empty!26935 (not b!1093850) (not b_lambda!17581) (not b!1093854) b_and!36517 (not b!1093849) (not mapNonEmpty!42157))
(check-sat b_and!36517 (not b_next!22933))
