; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96294 () Bool)

(assert start!96294)

(declare-fun b_free!22711 () Bool)

(declare-fun b_next!22711 () Bool)

(assert (=> start!96294 (= b_free!22711 (not b_next!22711))))

(declare-fun tp!79982 () Bool)

(declare-fun b_and!36107 () Bool)

(assert (=> start!96294 (= tp!79982 b_and!36107)))

(declare-fun b!1090709 () Bool)

(declare-fun res!727181 () Bool)

(declare-fun e!623080 () Bool)

(assert (=> b!1090709 (=> (not res!727181) (not e!623080))))

(declare-datatypes ((array!70389 0))(
  ( (array!70390 (arr!33862 (Array (_ BitVec 32) (_ BitVec 64))) (size!34399 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70389)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1090709 (= res!727181 (= (select (arr!33862 _keys!1070) i!650) k0!904))))

(declare-fun b!1090710 () Bool)

(declare-fun res!727180 () Bool)

(assert (=> b!1090710 (=> (not res!727180) (not e!623080))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((V!40745 0))(
  ( (V!40746 (val!13413 Int)) )
))
(declare-datatypes ((ValueCell!12647 0))(
  ( (ValueCellFull!12647 (v!16030 V!40745)) (EmptyCell!12647) )
))
(declare-datatypes ((array!70391 0))(
  ( (array!70392 (arr!33863 (Array (_ BitVec 32) ValueCell!12647)) (size!34400 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70391)

(assert (=> b!1090710 (= res!727180 (and (= (size!34400 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34399 _keys!1070) (size!34400 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1090711 () Bool)

(declare-fun e!623079 () Bool)

(assert (=> b!1090711 (= e!623079 true)))

(declare-datatypes ((tuple2!17052 0))(
  ( (tuple2!17053 (_1!8537 (_ BitVec 64)) (_2!8537 V!40745)) )
))
(declare-datatypes ((List!23644 0))(
  ( (Nil!23641) (Cons!23640 (h!24858 tuple2!17052) (t!33405 List!23644)) )
))
(declare-datatypes ((ListLongMap!15029 0))(
  ( (ListLongMap!15030 (toList!7530 List!23644)) )
))
(declare-fun lt!486155 () ListLongMap!15029)

(declare-fun lt!486147 () ListLongMap!15029)

(declare-fun -!840 (ListLongMap!15029 (_ BitVec 64)) ListLongMap!15029)

(assert (=> b!1090711 (= (-!840 lt!486155 k0!904) lt!486147)))

(declare-fun lt!486152 () ListLongMap!15029)

(declare-datatypes ((Unit!35847 0))(
  ( (Unit!35848) )
))
(declare-fun lt!486154 () Unit!35847)

(declare-fun zeroValue!831 () V!40745)

(declare-fun addRemoveCommutativeForDiffKeys!78 (ListLongMap!15029 (_ BitVec 64) V!40745 (_ BitVec 64)) Unit!35847)

(assert (=> b!1090711 (= lt!486154 (addRemoveCommutativeForDiffKeys!78 lt!486152 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(declare-fun b!1090712 () Bool)

(declare-fun e!623077 () Bool)

(assert (=> b!1090712 (= e!623077 e!623079)))

(declare-fun res!727183 () Bool)

(assert (=> b!1090712 (=> res!727183 e!623079)))

(assert (=> b!1090712 (= res!727183 (= #b0000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-fun lt!486158 () ListLongMap!15029)

(assert (=> b!1090712 (= lt!486158 lt!486147)))

(declare-fun lt!486149 () ListLongMap!15029)

(declare-fun lt!486148 () tuple2!17052)

(declare-fun +!3348 (ListLongMap!15029 tuple2!17052) ListLongMap!15029)

(assert (=> b!1090712 (= lt!486147 (+!3348 lt!486149 lt!486148))))

(declare-fun lt!486157 () ListLongMap!15029)

(assert (=> b!1090712 (= lt!486157 lt!486155)))

(assert (=> b!1090712 (= lt!486155 (+!3348 lt!486152 lt!486148))))

(declare-fun lt!486156 () ListLongMap!15029)

(assert (=> b!1090712 (= lt!486158 (+!3348 lt!486156 lt!486148))))

(assert (=> b!1090712 (= lt!486148 (tuple2!17053 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1090713 () Bool)

(declare-fun res!727188 () Bool)

(assert (=> b!1090713 (=> (not res!727188) (not e!623080))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70389 (_ BitVec 32)) Bool)

(assert (=> b!1090713 (= res!727188 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1090714 () Bool)

(declare-fun res!727179 () Bool)

(assert (=> b!1090714 (=> (not res!727179) (not e!623080))))

(assert (=> b!1090714 (= res!727179 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34399 _keys!1070))))))

(declare-fun b!1090715 () Bool)

(declare-fun res!727185 () Bool)

(assert (=> b!1090715 (=> (not res!727185) (not e!623080))))

(declare-datatypes ((List!23645 0))(
  ( (Nil!23642) (Cons!23641 (h!24859 (_ BitVec 64)) (t!33406 List!23645)) )
))
(declare-fun arrayNoDuplicates!0 (array!70389 (_ BitVec 32) List!23645) Bool)

(assert (=> b!1090715 (= res!727185 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23642))))

(declare-fun mapNonEmpty!41824 () Bool)

(declare-fun mapRes!41824 () Bool)

(declare-fun tp!79981 () Bool)

(declare-fun e!623075 () Bool)

(assert (=> mapNonEmpty!41824 (= mapRes!41824 (and tp!79981 e!623075))))

(declare-fun mapKey!41824 () (_ BitVec 32))

(declare-fun mapRest!41824 () (Array (_ BitVec 32) ValueCell!12647))

(declare-fun mapValue!41824 () ValueCell!12647)

(assert (=> mapNonEmpty!41824 (= (arr!33863 _values!874) (store mapRest!41824 mapKey!41824 mapValue!41824))))

(declare-fun b!1090716 () Bool)

(declare-fun e!623074 () Bool)

(assert (=> b!1090716 (= e!623080 e!623074)))

(declare-fun res!727186 () Bool)

(assert (=> b!1090716 (=> (not res!727186) (not e!623074))))

(declare-fun lt!486159 () array!70389)

(assert (=> b!1090716 (= res!727186 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!486159 mask!1414))))

(assert (=> b!1090716 (= lt!486159 (array!70390 (store (arr!33862 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34399 _keys!1070)))))

(declare-fun b!1090717 () Bool)

(declare-fun e!623081 () Bool)

(declare-fun tp_is_empty!26713 () Bool)

(assert (=> b!1090717 (= e!623081 tp_is_empty!26713)))

(declare-fun b!1090718 () Bool)

(declare-fun e!623078 () Bool)

(assert (=> b!1090718 (= e!623078 (and e!623081 mapRes!41824))))

(declare-fun condMapEmpty!41824 () Bool)

(declare-fun mapDefault!41824 () ValueCell!12647)

(assert (=> b!1090718 (= condMapEmpty!41824 (= (arr!33863 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12647)) mapDefault!41824)))))

(declare-fun res!727178 () Bool)

(assert (=> start!96294 (=> (not res!727178) (not e!623080))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96294 (= res!727178 (validMask!0 mask!1414))))

(assert (=> start!96294 e!623080))

(assert (=> start!96294 tp!79982))

(assert (=> start!96294 true))

(assert (=> start!96294 tp_is_empty!26713))

(declare-fun array_inv!26166 (array!70389) Bool)

(assert (=> start!96294 (array_inv!26166 _keys!1070)))

(declare-fun array_inv!26167 (array!70391) Bool)

(assert (=> start!96294 (and (array_inv!26167 _values!874) e!623078)))

(declare-fun b!1090719 () Bool)

(declare-fun res!727187 () Bool)

(assert (=> b!1090719 (=> (not res!727187) (not e!623080))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1090719 (= res!727187 (validKeyInArray!0 k0!904))))

(declare-fun b!1090720 () Bool)

(assert (=> b!1090720 (= e!623075 tp_is_empty!26713)))

(declare-fun b!1090721 () Bool)

(assert (=> b!1090721 (= e!623074 (not e!623077))))

(declare-fun res!727184 () Bool)

(assert (=> b!1090721 (=> res!727184 e!623077)))

(assert (=> b!1090721 (= res!727184 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40745)

(declare-fun getCurrentListMap!4287 (array!70389 array!70391 (_ BitVec 32) (_ BitVec 32) V!40745 V!40745 (_ BitVec 32) Int) ListLongMap!15029)

(assert (=> b!1090721 (= lt!486157 (getCurrentListMap!4287 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!486153 () array!70391)

(assert (=> b!1090721 (= lt!486158 (getCurrentListMap!4287 lt!486159 lt!486153 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1090721 (and (= lt!486156 lt!486149) (= lt!486149 lt!486156))))

(assert (=> b!1090721 (= lt!486149 (-!840 lt!486152 k0!904))))

(declare-fun lt!486150 () Unit!35847)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!116 (array!70389 array!70391 (_ BitVec 32) (_ BitVec 32) V!40745 V!40745 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35847)

(assert (=> b!1090721 (= lt!486150 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!116 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4092 (array!70389 array!70391 (_ BitVec 32) (_ BitVec 32) V!40745 V!40745 (_ BitVec 32) Int) ListLongMap!15029)

(assert (=> b!1090721 (= lt!486156 (getCurrentListMapNoExtraKeys!4092 lt!486159 lt!486153 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2213 (Int (_ BitVec 64)) V!40745)

(assert (=> b!1090721 (= lt!486153 (array!70392 (store (arr!33863 _values!874) i!650 (ValueCellFull!12647 (dynLambda!2213 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34400 _values!874)))))

(assert (=> b!1090721 (= lt!486152 (getCurrentListMapNoExtraKeys!4092 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70389 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1090721 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!486151 () Unit!35847)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70389 (_ BitVec 64) (_ BitVec 32)) Unit!35847)

(assert (=> b!1090721 (= lt!486151 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1090722 () Bool)

(declare-fun res!727182 () Bool)

(assert (=> b!1090722 (=> (not res!727182) (not e!623074))))

(assert (=> b!1090722 (= res!727182 (arrayNoDuplicates!0 lt!486159 #b00000000000000000000000000000000 Nil!23642))))

(declare-fun mapIsEmpty!41824 () Bool)

(assert (=> mapIsEmpty!41824 mapRes!41824))

(assert (= (and start!96294 res!727178) b!1090710))

(assert (= (and b!1090710 res!727180) b!1090713))

(assert (= (and b!1090713 res!727188) b!1090715))

(assert (= (and b!1090715 res!727185) b!1090714))

(assert (= (and b!1090714 res!727179) b!1090719))

(assert (= (and b!1090719 res!727187) b!1090709))

(assert (= (and b!1090709 res!727181) b!1090716))

(assert (= (and b!1090716 res!727186) b!1090722))

(assert (= (and b!1090722 res!727182) b!1090721))

(assert (= (and b!1090721 (not res!727184)) b!1090712))

(assert (= (and b!1090712 (not res!727183)) b!1090711))

(assert (= (and b!1090718 condMapEmpty!41824) mapIsEmpty!41824))

(assert (= (and b!1090718 (not condMapEmpty!41824)) mapNonEmpty!41824))

(get-info :version)

(assert (= (and mapNonEmpty!41824 ((_ is ValueCellFull!12647) mapValue!41824)) b!1090720))

(assert (= (and b!1090718 ((_ is ValueCellFull!12647) mapDefault!41824)) b!1090717))

(assert (= start!96294 b!1090718))

(declare-fun b_lambda!17391 () Bool)

(assert (=> (not b_lambda!17391) (not b!1090721)))

(declare-fun t!33404 () Bool)

(declare-fun tb!7581 () Bool)

(assert (=> (and start!96294 (= defaultEntry!882 defaultEntry!882) t!33404) tb!7581))

(declare-fun result!15689 () Bool)

(assert (=> tb!7581 (= result!15689 tp_is_empty!26713)))

(assert (=> b!1090721 t!33404))

(declare-fun b_and!36109 () Bool)

(assert (= b_and!36107 (and (=> t!33404 result!15689) b_and!36109)))

(declare-fun m!1010291 () Bool)

(assert (=> start!96294 m!1010291))

(declare-fun m!1010293 () Bool)

(assert (=> start!96294 m!1010293))

(declare-fun m!1010295 () Bool)

(assert (=> start!96294 m!1010295))

(declare-fun m!1010297 () Bool)

(assert (=> b!1090719 m!1010297))

(declare-fun m!1010299 () Bool)

(assert (=> b!1090712 m!1010299))

(declare-fun m!1010301 () Bool)

(assert (=> b!1090712 m!1010301))

(declare-fun m!1010303 () Bool)

(assert (=> b!1090712 m!1010303))

(declare-fun m!1010305 () Bool)

(assert (=> b!1090711 m!1010305))

(declare-fun m!1010307 () Bool)

(assert (=> b!1090711 m!1010307))

(declare-fun m!1010309 () Bool)

(assert (=> b!1090709 m!1010309))

(declare-fun m!1010311 () Bool)

(assert (=> b!1090721 m!1010311))

(declare-fun m!1010313 () Bool)

(assert (=> b!1090721 m!1010313))

(declare-fun m!1010315 () Bool)

(assert (=> b!1090721 m!1010315))

(declare-fun m!1010317 () Bool)

(assert (=> b!1090721 m!1010317))

(declare-fun m!1010319 () Bool)

(assert (=> b!1090721 m!1010319))

(declare-fun m!1010321 () Bool)

(assert (=> b!1090721 m!1010321))

(declare-fun m!1010323 () Bool)

(assert (=> b!1090721 m!1010323))

(declare-fun m!1010325 () Bool)

(assert (=> b!1090721 m!1010325))

(declare-fun m!1010327 () Bool)

(assert (=> b!1090721 m!1010327))

(declare-fun m!1010329 () Bool)

(assert (=> b!1090721 m!1010329))

(declare-fun m!1010331 () Bool)

(assert (=> b!1090722 m!1010331))

(declare-fun m!1010333 () Bool)

(assert (=> b!1090713 m!1010333))

(declare-fun m!1010335 () Bool)

(assert (=> b!1090716 m!1010335))

(declare-fun m!1010337 () Bool)

(assert (=> b!1090716 m!1010337))

(declare-fun m!1010339 () Bool)

(assert (=> b!1090715 m!1010339))

(declare-fun m!1010341 () Bool)

(assert (=> mapNonEmpty!41824 m!1010341))

(check-sat (not b!1090711) (not b!1090721) (not mapNonEmpty!41824) (not b!1090722) (not b!1090715) tp_is_empty!26713 (not b!1090716) (not b!1090713) (not b_next!22711) (not start!96294) b_and!36109 (not b!1090719) (not b_lambda!17391) (not b!1090712))
(check-sat b_and!36109 (not b_next!22711))
