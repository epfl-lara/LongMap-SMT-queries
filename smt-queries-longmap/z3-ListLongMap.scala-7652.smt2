; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96226 () Bool)

(assert start!96226)

(declare-fun b_free!22885 () Bool)

(declare-fun b_next!22885 () Bool)

(assert (=> start!96226 (= b_free!22885 (not b_next!22885))))

(declare-fun tp!80504 () Bool)

(declare-fun b_and!36419 () Bool)

(assert (=> start!96226 (= tp!80504 b_and!36419)))

(declare-fun b!1092936 () Bool)

(declare-fun e!624085 () Bool)

(declare-fun e!624087 () Bool)

(assert (=> b!1092936 (= e!624085 e!624087)))

(declare-fun res!729337 () Bool)

(assert (=> b!1092936 (=> (not res!729337) (not e!624087))))

(declare-datatypes ((array!70606 0))(
  ( (array!70607 (arr!33977 (Array (_ BitVec 32) (_ BitVec 64))) (size!34515 (_ BitVec 32))) )
))
(declare-fun lt!488541 () array!70606)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70606 (_ BitVec 32)) Bool)

(assert (=> b!1092936 (= res!729337 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!488541 mask!1414))))

(declare-fun _keys!1070 () array!70606)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1092936 (= lt!488541 (array!70607 (store (arr!33977 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34515 _keys!1070)))))

(declare-fun b!1092937 () Bool)

(declare-fun res!729345 () Bool)

(assert (=> b!1092937 (=> (not res!729345) (not e!624085))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((V!40977 0))(
  ( (V!40978 (val!13500 Int)) )
))
(declare-datatypes ((ValueCell!12734 0))(
  ( (ValueCellFull!12734 (v!16120 V!40977)) (EmptyCell!12734) )
))
(declare-datatypes ((array!70608 0))(
  ( (array!70609 (arr!33978 (Array (_ BitVec 32) ValueCell!12734)) (size!34516 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70608)

(assert (=> b!1092937 (= res!729345 (and (= (size!34516 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34515 _keys!1070) (size!34516 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1092938 () Bool)

(declare-fun res!729344 () Bool)

(assert (=> b!1092938 (=> (not res!729344) (not e!624085))))

(assert (=> b!1092938 (= res!729344 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34515 _keys!1070))))))

(declare-fun b!1092939 () Bool)

(declare-fun res!729341 () Bool)

(assert (=> b!1092939 (=> (not res!729341) (not e!624085))))

(declare-datatypes ((List!23798 0))(
  ( (Nil!23795) (Cons!23794 (h!25003 (_ BitVec 64)) (t!33732 List!23798)) )
))
(declare-fun arrayNoDuplicates!0 (array!70606 (_ BitVec 32) List!23798) Bool)

(assert (=> b!1092939 (= res!729341 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23795))))

(declare-fun res!729340 () Bool)

(assert (=> start!96226 (=> (not res!729340) (not e!624085))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96226 (= res!729340 (validMask!0 mask!1414))))

(assert (=> start!96226 e!624085))

(assert (=> start!96226 tp!80504))

(assert (=> start!96226 true))

(declare-fun tp_is_empty!26887 () Bool)

(assert (=> start!96226 tp_is_empty!26887))

(declare-fun array_inv!26230 (array!70606) Bool)

(assert (=> start!96226 (array_inv!26230 _keys!1070)))

(declare-fun e!624089 () Bool)

(declare-fun array_inv!26231 (array!70608) Bool)

(assert (=> start!96226 (and (array_inv!26231 _values!874) e!624089)))

(declare-fun mapNonEmpty!42085 () Bool)

(declare-fun mapRes!42085 () Bool)

(declare-fun tp!80503 () Bool)

(declare-fun e!624084 () Bool)

(assert (=> mapNonEmpty!42085 (= mapRes!42085 (and tp!80503 e!624084))))

(declare-fun mapValue!42085 () ValueCell!12734)

(declare-fun mapRest!42085 () (Array (_ BitVec 32) ValueCell!12734))

(declare-fun mapKey!42085 () (_ BitVec 32))

(assert (=> mapNonEmpty!42085 (= (arr!33978 _values!874) (store mapRest!42085 mapKey!42085 mapValue!42085))))

(declare-fun b!1092940 () Bool)

(declare-fun res!729339 () Bool)

(assert (=> b!1092940 (=> (not res!729339) (not e!624087))))

(assert (=> b!1092940 (= res!729339 (arrayNoDuplicates!0 lt!488541 #b00000000000000000000000000000000 Nil!23795))))

(declare-fun b!1092941 () Bool)

(declare-fun res!729343 () Bool)

(assert (=> b!1092941 (=> (not res!729343) (not e!624085))))

(assert (=> b!1092941 (= res!729343 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun mapIsEmpty!42085 () Bool)

(assert (=> mapIsEmpty!42085 mapRes!42085))

(declare-fun b!1092942 () Bool)

(assert (=> b!1092942 (= e!624087 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40977)

(declare-datatypes ((tuple2!17232 0))(
  ( (tuple2!17233 (_1!8627 (_ BitVec 64)) (_2!8627 V!40977)) )
))
(declare-datatypes ((List!23799 0))(
  ( (Nil!23796) (Cons!23795 (h!25004 tuple2!17232) (t!33733 List!23799)) )
))
(declare-datatypes ((ListLongMap!15201 0))(
  ( (ListLongMap!15202 (toList!7616 List!23799)) )
))
(declare-fun lt!488546 () ListLongMap!15201)

(declare-fun zeroValue!831 () V!40977)

(declare-fun getCurrentListMap!4279 (array!70606 array!70608 (_ BitVec 32) (_ BitVec 32) V!40977 V!40977 (_ BitVec 32) Int) ListLongMap!15201)

(assert (=> b!1092942 (= lt!488546 (getCurrentListMap!4279 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!488540 () ListLongMap!15201)

(declare-fun lt!488543 () array!70608)

(assert (=> b!1092942 (= lt!488540 (getCurrentListMap!4279 lt!488541 lt!488543 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!488545 () ListLongMap!15201)

(declare-fun lt!488538 () ListLongMap!15201)

(assert (=> b!1092942 (and (= lt!488545 lt!488538) (= lt!488538 lt!488545))))

(declare-fun lt!488539 () ListLongMap!15201)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun -!888 (ListLongMap!15201 (_ BitVec 64)) ListLongMap!15201)

(assert (=> b!1092942 (= lt!488538 (-!888 lt!488539 k0!904))))

(declare-datatypes ((Unit!35811 0))(
  ( (Unit!35812) )
))
(declare-fun lt!488542 () Unit!35811)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!163 (array!70606 array!70608 (_ BitVec 32) (_ BitVec 32) V!40977 V!40977 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35811)

(assert (=> b!1092942 (= lt!488542 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!163 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4149 (array!70606 array!70608 (_ BitVec 32) (_ BitVec 32) V!40977 V!40977 (_ BitVec 32) Int) ListLongMap!15201)

(assert (=> b!1092942 (= lt!488545 (getCurrentListMapNoExtraKeys!4149 lt!488541 lt!488543 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2220 (Int (_ BitVec 64)) V!40977)

(assert (=> b!1092942 (= lt!488543 (array!70609 (store (arr!33978 _values!874) i!650 (ValueCellFull!12734 (dynLambda!2220 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34516 _values!874)))))

(assert (=> b!1092942 (= lt!488539 (getCurrentListMapNoExtraKeys!4149 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70606 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1092942 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!488544 () Unit!35811)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70606 (_ BitVec 64) (_ BitVec 32)) Unit!35811)

(assert (=> b!1092942 (= lt!488544 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1092943 () Bool)

(declare-fun res!729338 () Bool)

(assert (=> b!1092943 (=> (not res!729338) (not e!624085))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1092943 (= res!729338 (validKeyInArray!0 k0!904))))

(declare-fun b!1092944 () Bool)

(declare-fun e!624086 () Bool)

(assert (=> b!1092944 (= e!624089 (and e!624086 mapRes!42085))))

(declare-fun condMapEmpty!42085 () Bool)

(declare-fun mapDefault!42085 () ValueCell!12734)

(assert (=> b!1092944 (= condMapEmpty!42085 (= (arr!33978 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12734)) mapDefault!42085)))))

(declare-fun b!1092945 () Bool)

(assert (=> b!1092945 (= e!624084 tp_is_empty!26887)))

(declare-fun b!1092946 () Bool)

(declare-fun res!729342 () Bool)

(assert (=> b!1092946 (=> (not res!729342) (not e!624085))))

(assert (=> b!1092946 (= res!729342 (= (select (arr!33977 _keys!1070) i!650) k0!904))))

(declare-fun b!1092947 () Bool)

(assert (=> b!1092947 (= e!624086 tp_is_empty!26887)))

(assert (= (and start!96226 res!729340) b!1092937))

(assert (= (and b!1092937 res!729345) b!1092941))

(assert (= (and b!1092941 res!729343) b!1092939))

(assert (= (and b!1092939 res!729341) b!1092938))

(assert (= (and b!1092938 res!729344) b!1092943))

(assert (= (and b!1092943 res!729338) b!1092946))

(assert (= (and b!1092946 res!729342) b!1092936))

(assert (= (and b!1092936 res!729337) b!1092940))

(assert (= (and b!1092940 res!729339) b!1092942))

(assert (= (and b!1092944 condMapEmpty!42085) mapIsEmpty!42085))

(assert (= (and b!1092944 (not condMapEmpty!42085)) mapNonEmpty!42085))

(get-info :version)

(assert (= (and mapNonEmpty!42085 ((_ is ValueCellFull!12734) mapValue!42085)) b!1092945))

(assert (= (and b!1092944 ((_ is ValueCellFull!12734) mapDefault!42085)) b!1092947))

(assert (= start!96226 b!1092944))

(declare-fun b_lambda!17533 () Bool)

(assert (=> (not b_lambda!17533) (not b!1092942)))

(declare-fun t!33731 () Bool)

(declare-fun tb!7755 () Bool)

(assert (=> (and start!96226 (= defaultEntry!882 defaultEntry!882) t!33731) tb!7755))

(declare-fun result!16037 () Bool)

(assert (=> tb!7755 (= result!16037 tp_is_empty!26887)))

(assert (=> b!1092942 t!33731))

(declare-fun b_and!36421 () Bool)

(assert (= b_and!36419 (and (=> t!33731 result!16037) b_and!36421)))

(declare-fun m!1012295 () Bool)

(assert (=> b!1092946 m!1012295))

(declare-fun m!1012297 () Bool)

(assert (=> b!1092943 m!1012297))

(declare-fun m!1012299 () Bool)

(assert (=> mapNonEmpty!42085 m!1012299))

(declare-fun m!1012301 () Bool)

(assert (=> b!1092940 m!1012301))

(declare-fun m!1012303 () Bool)

(assert (=> b!1092941 m!1012303))

(declare-fun m!1012305 () Bool)

(assert (=> b!1092939 m!1012305))

(declare-fun m!1012307 () Bool)

(assert (=> b!1092936 m!1012307))

(declare-fun m!1012309 () Bool)

(assert (=> b!1092936 m!1012309))

(declare-fun m!1012311 () Bool)

(assert (=> b!1092942 m!1012311))

(declare-fun m!1012313 () Bool)

(assert (=> b!1092942 m!1012313))

(declare-fun m!1012315 () Bool)

(assert (=> b!1092942 m!1012315))

(declare-fun m!1012317 () Bool)

(assert (=> b!1092942 m!1012317))

(declare-fun m!1012319 () Bool)

(assert (=> b!1092942 m!1012319))

(declare-fun m!1012321 () Bool)

(assert (=> b!1092942 m!1012321))

(declare-fun m!1012323 () Bool)

(assert (=> b!1092942 m!1012323))

(declare-fun m!1012325 () Bool)

(assert (=> b!1092942 m!1012325))

(declare-fun m!1012327 () Bool)

(assert (=> b!1092942 m!1012327))

(declare-fun m!1012329 () Bool)

(assert (=> b!1092942 m!1012329))

(declare-fun m!1012331 () Bool)

(assert (=> start!96226 m!1012331))

(declare-fun m!1012333 () Bool)

(assert (=> start!96226 m!1012333))

(declare-fun m!1012335 () Bool)

(assert (=> start!96226 m!1012335))

(check-sat (not b!1092941) (not b_next!22885) (not b!1092940) (not b!1092939) (not mapNonEmpty!42085) b_and!36421 (not b!1092942) (not b_lambda!17533) tp_is_empty!26887 (not b!1092936) (not start!96226) (not b!1092943))
(check-sat b_and!36421 (not b_next!22885))
