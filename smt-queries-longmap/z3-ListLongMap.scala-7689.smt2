; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96482 () Bool)

(assert start!96482)

(declare-fun b_free!23061 () Bool)

(declare-fun b_next!23061 () Bool)

(assert (=> start!96482 (= b_free!23061 (not b_next!23061))))

(declare-fun tp!81109 () Bool)

(declare-fun b_and!36785 () Bool)

(assert (=> start!96482 (= tp!81109 b_and!36785)))

(declare-fun b!1097244 () Bool)

(declare-fun res!732349 () Bool)

(declare-fun e!626241 () Bool)

(assert (=> b!1097244 (=> (not res!732349) (not e!626241))))

(declare-datatypes ((array!71133 0))(
  ( (array!71134 (arr!34238 (Array (_ BitVec 32) (_ BitVec 64))) (size!34774 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71133)

(declare-datatypes ((List!23909 0))(
  ( (Nil!23906) (Cons!23905 (h!25114 (_ BitVec 64)) (t!34016 List!23909)) )
))
(declare-fun arrayNoDuplicates!0 (array!71133 (_ BitVec 32) List!23909) Bool)

(assert (=> b!1097244 (= res!732349 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23906))))

(declare-fun mapNonEmpty!42427 () Bool)

(declare-fun mapRes!42427 () Bool)

(declare-fun tp!81110 () Bool)

(declare-fun e!626245 () Bool)

(assert (=> mapNonEmpty!42427 (= mapRes!42427 (and tp!81110 e!626245))))

(declare-fun mapKey!42427 () (_ BitVec 32))

(declare-datatypes ((V!41275 0))(
  ( (V!41276 (val!13612 Int)) )
))
(declare-datatypes ((ValueCell!12846 0))(
  ( (ValueCellFull!12846 (v!16233 V!41275)) (EmptyCell!12846) )
))
(declare-datatypes ((array!71135 0))(
  ( (array!71136 (arr!34239 (Array (_ BitVec 32) ValueCell!12846)) (size!34775 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71135)

(declare-fun mapValue!42427 () ValueCell!12846)

(declare-fun mapRest!42427 () (Array (_ BitVec 32) ValueCell!12846))

(assert (=> mapNonEmpty!42427 (= (arr!34239 _values!874) (store mapRest!42427 mapKey!42427 mapValue!42427))))

(declare-fun b!1097246 () Bool)

(declare-fun e!626242 () Bool)

(declare-fun e!626244 () Bool)

(assert (=> b!1097246 (= e!626242 (and e!626244 mapRes!42427))))

(declare-fun condMapEmpty!42427 () Bool)

(declare-fun mapDefault!42427 () ValueCell!12846)

(assert (=> b!1097246 (= condMapEmpty!42427 (= (arr!34239 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12846)) mapDefault!42427)))))

(declare-fun b!1097247 () Bool)

(declare-fun res!732342 () Bool)

(assert (=> b!1097247 (=> (not res!732342) (not e!626241))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1097247 (= res!732342 (and (= (size!34775 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34774 _keys!1070) (size!34775 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1097248 () Bool)

(declare-fun res!732344 () Bool)

(assert (=> b!1097248 (=> (not res!732344) (not e!626241))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1097248 (= res!732344 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34774 _keys!1070))))))

(declare-fun mapIsEmpty!42427 () Bool)

(assert (=> mapIsEmpty!42427 mapRes!42427))

(declare-fun b!1097249 () Bool)

(declare-fun e!626243 () Bool)

(assert (=> b!1097249 (= e!626241 e!626243)))

(declare-fun res!732348 () Bool)

(assert (=> b!1097249 (=> (not res!732348) (not e!626243))))

(declare-fun lt!490452 () array!71133)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71133 (_ BitVec 32)) Bool)

(assert (=> b!1097249 (= res!732348 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!490452 mask!1414))))

(assert (=> b!1097249 (= lt!490452 (array!71134 (store (arr!34238 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34774 _keys!1070)))))

(declare-fun b!1097250 () Bool)

(declare-fun res!732341 () Bool)

(assert (=> b!1097250 (=> (not res!732341) (not e!626241))))

(assert (=> b!1097250 (= res!732341 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1097251 () Bool)

(assert (=> b!1097251 (= e!626243 (not (bvslt i!650 (size!34775 _values!874))))))

(declare-datatypes ((tuple2!17286 0))(
  ( (tuple2!17287 (_1!8654 (_ BitVec 64)) (_2!8654 V!41275)) )
))
(declare-datatypes ((List!23910 0))(
  ( (Nil!23907) (Cons!23906 (h!25115 tuple2!17286) (t!34017 List!23910)) )
))
(declare-datatypes ((ListLongMap!15255 0))(
  ( (ListLongMap!15256 (toList!7643 List!23910)) )
))
(declare-fun lt!490450 () ListLongMap!15255)

(declare-fun lt!490451 () ListLongMap!15255)

(assert (=> b!1097251 (and (= lt!490450 lt!490451) (= lt!490451 lt!490450))))

(declare-fun lt!490449 () ListLongMap!15255)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun -!933 (ListLongMap!15255 (_ BitVec 64)) ListLongMap!15255)

(assert (=> b!1097251 (= lt!490451 (-!933 lt!490449 k0!904))))

(declare-fun zeroValue!831 () V!41275)

(declare-datatypes ((Unit!36098 0))(
  ( (Unit!36099) )
))
(declare-fun lt!490453 () Unit!36098)

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!41275)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!189 (array!71133 array!71135 (_ BitVec 32) (_ BitVec 32) V!41275 V!41275 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36098)

(assert (=> b!1097251 (= lt!490453 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!189 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4159 (array!71133 array!71135 (_ BitVec 32) (_ BitVec 32) V!41275 V!41275 (_ BitVec 32) Int) ListLongMap!15255)

(declare-fun dynLambda!2294 (Int (_ BitVec 64)) V!41275)

(assert (=> b!1097251 (= lt!490450 (getCurrentListMapNoExtraKeys!4159 lt!490452 (array!71136 (store (arr!34239 _values!874) i!650 (ValueCellFull!12846 (dynLambda!2294 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34775 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1097251 (= lt!490449 (getCurrentListMapNoExtraKeys!4159 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71133 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1097251 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!490448 () Unit!36098)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71133 (_ BitVec 64) (_ BitVec 32)) Unit!36098)

(assert (=> b!1097251 (= lt!490448 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun res!732347 () Bool)

(assert (=> start!96482 (=> (not res!732347) (not e!626241))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96482 (= res!732347 (validMask!0 mask!1414))))

(assert (=> start!96482 e!626241))

(assert (=> start!96482 tp!81109))

(assert (=> start!96482 true))

(declare-fun tp_is_empty!27111 () Bool)

(assert (=> start!96482 tp_is_empty!27111))

(declare-fun array_inv!26378 (array!71133) Bool)

(assert (=> start!96482 (array_inv!26378 _keys!1070)))

(declare-fun array_inv!26379 (array!71135) Bool)

(assert (=> start!96482 (and (array_inv!26379 _values!874) e!626242)))

(declare-fun b!1097245 () Bool)

(declare-fun res!732343 () Bool)

(assert (=> b!1097245 (=> (not res!732343) (not e!626241))))

(assert (=> b!1097245 (= res!732343 (= (select (arr!34238 _keys!1070) i!650) k0!904))))

(declare-fun b!1097252 () Bool)

(assert (=> b!1097252 (= e!626244 tp_is_empty!27111)))

(declare-fun b!1097253 () Bool)

(assert (=> b!1097253 (= e!626245 tp_is_empty!27111)))

(declare-fun b!1097254 () Bool)

(declare-fun res!732346 () Bool)

(assert (=> b!1097254 (=> (not res!732346) (not e!626241))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1097254 (= res!732346 (validKeyInArray!0 k0!904))))

(declare-fun b!1097255 () Bool)

(declare-fun res!732345 () Bool)

(assert (=> b!1097255 (=> (not res!732345) (not e!626243))))

(assert (=> b!1097255 (= res!732345 (arrayNoDuplicates!0 lt!490452 #b00000000000000000000000000000000 Nil!23906))))

(assert (= (and start!96482 res!732347) b!1097247))

(assert (= (and b!1097247 res!732342) b!1097250))

(assert (= (and b!1097250 res!732341) b!1097244))

(assert (= (and b!1097244 res!732349) b!1097248))

(assert (= (and b!1097248 res!732344) b!1097254))

(assert (= (and b!1097254 res!732346) b!1097245))

(assert (= (and b!1097245 res!732343) b!1097249))

(assert (= (and b!1097249 res!732348) b!1097255))

(assert (= (and b!1097255 res!732345) b!1097251))

(assert (= (and b!1097246 condMapEmpty!42427) mapIsEmpty!42427))

(assert (= (and b!1097246 (not condMapEmpty!42427)) mapNonEmpty!42427))

(get-info :version)

(assert (= (and mapNonEmpty!42427 ((_ is ValueCellFull!12846) mapValue!42427)) b!1097253))

(assert (= (and b!1097246 ((_ is ValueCellFull!12846) mapDefault!42427)) b!1097252))

(assert (= start!96482 b!1097246))

(declare-fun b_lambda!17719 () Bool)

(assert (=> (not b_lambda!17719) (not b!1097251)))

(declare-fun t!34015 () Bool)

(declare-fun tb!7927 () Bool)

(assert (=> (and start!96482 (= defaultEntry!882 defaultEntry!882) t!34015) tb!7927))

(declare-fun result!16377 () Bool)

(assert (=> tb!7927 (= result!16377 tp_is_empty!27111)))

(assert (=> b!1097251 t!34015))

(declare-fun b_and!36787 () Bool)

(assert (= b_and!36785 (and (=> t!34015 result!16377) b_and!36787)))

(declare-fun m!1016719 () Bool)

(assert (=> b!1097244 m!1016719))

(declare-fun m!1016721 () Bool)

(assert (=> b!1097255 m!1016721))

(declare-fun m!1016723 () Bool)

(assert (=> b!1097245 m!1016723))

(declare-fun m!1016725 () Bool)

(assert (=> b!1097254 m!1016725))

(declare-fun m!1016727 () Bool)

(assert (=> b!1097251 m!1016727))

(declare-fun m!1016729 () Bool)

(assert (=> b!1097251 m!1016729))

(declare-fun m!1016731 () Bool)

(assert (=> b!1097251 m!1016731))

(declare-fun m!1016733 () Bool)

(assert (=> b!1097251 m!1016733))

(declare-fun m!1016735 () Bool)

(assert (=> b!1097251 m!1016735))

(declare-fun m!1016737 () Bool)

(assert (=> b!1097251 m!1016737))

(declare-fun m!1016739 () Bool)

(assert (=> b!1097251 m!1016739))

(declare-fun m!1016741 () Bool)

(assert (=> b!1097251 m!1016741))

(declare-fun m!1016743 () Bool)

(assert (=> b!1097249 m!1016743))

(declare-fun m!1016745 () Bool)

(assert (=> b!1097249 m!1016745))

(declare-fun m!1016747 () Bool)

(assert (=> start!96482 m!1016747))

(declare-fun m!1016749 () Bool)

(assert (=> start!96482 m!1016749))

(declare-fun m!1016751 () Bool)

(assert (=> start!96482 m!1016751))

(declare-fun m!1016753 () Bool)

(assert (=> mapNonEmpty!42427 m!1016753))

(declare-fun m!1016755 () Bool)

(assert (=> b!1097250 m!1016755))

(check-sat (not b!1097251) (not b!1097250) (not b_next!23061) (not b!1097255) (not b!1097249) (not start!96482) b_and!36787 (not mapNonEmpty!42427) (not b_lambda!17719) tp_is_empty!27111 (not b!1097254) (not b!1097244))
(check-sat b_and!36787 (not b_next!23061))
