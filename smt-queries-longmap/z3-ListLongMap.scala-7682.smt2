; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96432 () Bool)

(assert start!96432)

(declare-fun b_free!23017 () Bool)

(declare-fun b_next!23017 () Bool)

(assert (=> start!96432 (= b_free!23017 (not b_next!23017))))

(declare-fun tp!80977 () Bool)

(declare-fun b_and!36671 () Bool)

(assert (=> start!96432 (= tp!80977 b_and!36671)))

(declare-fun b!1096255 () Bool)

(declare-fun e!625756 () Bool)

(declare-fun e!625754 () Bool)

(declare-fun mapRes!42361 () Bool)

(assert (=> b!1096255 (= e!625756 (and e!625754 mapRes!42361))))

(declare-fun condMapEmpty!42361 () Bool)

(declare-datatypes ((V!41217 0))(
  ( (V!41218 (val!13590 Int)) )
))
(declare-datatypes ((ValueCell!12824 0))(
  ( (ValueCellFull!12824 (v!16210 V!41217)) (EmptyCell!12824) )
))
(declare-datatypes ((array!70956 0))(
  ( (array!70957 (arr!34150 (Array (_ BitVec 32) ValueCell!12824)) (size!34688 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70956)

(declare-fun mapDefault!42361 () ValueCell!12824)

(assert (=> b!1096255 (= condMapEmpty!42361 (= (arr!34150 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12824)) mapDefault!42361)))))

(declare-fun b!1096256 () Bool)

(declare-fun res!731679 () Bool)

(declare-fun e!625755 () Bool)

(assert (=> b!1096256 (=> (not res!731679) (not e!625755))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1096256 (= res!731679 (validKeyInArray!0 k0!904))))

(declare-fun b!1096257 () Bool)

(declare-fun res!731685 () Bool)

(assert (=> b!1096257 (=> (not res!731685) (not e!625755))))

(declare-datatypes ((array!70958 0))(
  ( (array!70959 (arr!34151 (Array (_ BitVec 32) (_ BitVec 64))) (size!34689 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70958)

(declare-datatypes ((List!23908 0))(
  ( (Nil!23905) (Cons!23904 (h!25113 (_ BitVec 64)) (t!33962 List!23908)) )
))
(declare-fun arrayNoDuplicates!0 (array!70958 (_ BitVec 32) List!23908) Bool)

(assert (=> b!1096257 (= res!731685 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23905))))

(declare-fun b!1096258 () Bool)

(declare-fun tp_is_empty!27067 () Bool)

(assert (=> b!1096258 (= e!625754 tp_is_empty!27067)))

(declare-fun mapIsEmpty!42361 () Bool)

(assert (=> mapIsEmpty!42361 mapRes!42361))

(declare-fun b!1096259 () Bool)

(declare-fun e!625752 () Bool)

(assert (=> b!1096259 (= e!625752 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-fun zeroValue!831 () V!41217)

(declare-fun lt!489940 () array!70958)

(declare-fun minValue!831 () V!41217)

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((tuple2!17316 0))(
  ( (tuple2!17317 (_1!8669 (_ BitVec 64)) (_2!8669 V!41217)) )
))
(declare-datatypes ((List!23909 0))(
  ( (Nil!23906) (Cons!23905 (h!25114 tuple2!17316) (t!33963 List!23909)) )
))
(declare-datatypes ((ListLongMap!15285 0))(
  ( (ListLongMap!15286 (toList!7658 List!23909)) )
))
(declare-fun lt!489938 () ListLongMap!15285)

(declare-fun getCurrentListMapNoExtraKeys!4191 (array!70958 array!70956 (_ BitVec 32) (_ BitVec 32) V!41217 V!41217 (_ BitVec 32) Int) ListLongMap!15285)

(declare-fun dynLambda!2260 (Int (_ BitVec 64)) V!41217)

(assert (=> b!1096259 (= lt!489938 (getCurrentListMapNoExtraKeys!4191 lt!489940 (array!70957 (store (arr!34150 _values!874) i!650 (ValueCellFull!12824 (dynLambda!2260 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34688 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!489939 () ListLongMap!15285)

(assert (=> b!1096259 (= lt!489939 (getCurrentListMapNoExtraKeys!4191 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70958 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1096259 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35903 0))(
  ( (Unit!35904) )
))
(declare-fun lt!489941 () Unit!35903)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70958 (_ BitVec 64) (_ BitVec 32)) Unit!35903)

(assert (=> b!1096259 (= lt!489941 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1096260 () Bool)

(declare-fun res!731684 () Bool)

(assert (=> b!1096260 (=> (not res!731684) (not e!625755))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70958 (_ BitVec 32)) Bool)

(assert (=> b!1096260 (= res!731684 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1096262 () Bool)

(assert (=> b!1096262 (= e!625755 e!625752)))

(declare-fun res!731682 () Bool)

(assert (=> b!1096262 (=> (not res!731682) (not e!625752))))

(assert (=> b!1096262 (= res!731682 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!489940 mask!1414))))

(assert (=> b!1096262 (= lt!489940 (array!70959 (store (arr!34151 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34689 _keys!1070)))))

(declare-fun b!1096263 () Bool)

(declare-fun res!731683 () Bool)

(assert (=> b!1096263 (=> (not res!731683) (not e!625755))))

(assert (=> b!1096263 (= res!731683 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34689 _keys!1070))))))

(declare-fun b!1096264 () Bool)

(declare-fun res!731686 () Bool)

(assert (=> b!1096264 (=> (not res!731686) (not e!625755))))

(assert (=> b!1096264 (= res!731686 (and (= (size!34688 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34689 _keys!1070) (size!34688 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!42361 () Bool)

(declare-fun tp!80978 () Bool)

(declare-fun e!625751 () Bool)

(assert (=> mapNonEmpty!42361 (= mapRes!42361 (and tp!80978 e!625751))))

(declare-fun mapValue!42361 () ValueCell!12824)

(declare-fun mapKey!42361 () (_ BitVec 32))

(declare-fun mapRest!42361 () (Array (_ BitVec 32) ValueCell!12824))

(assert (=> mapNonEmpty!42361 (= (arr!34150 _values!874) (store mapRest!42361 mapKey!42361 mapValue!42361))))

(declare-fun b!1096265 () Bool)

(declare-fun res!731678 () Bool)

(assert (=> b!1096265 (=> (not res!731678) (not e!625752))))

(assert (=> b!1096265 (= res!731678 (arrayNoDuplicates!0 lt!489940 #b00000000000000000000000000000000 Nil!23905))))

(declare-fun b!1096266 () Bool)

(assert (=> b!1096266 (= e!625751 tp_is_empty!27067)))

(declare-fun b!1096261 () Bool)

(declare-fun res!731681 () Bool)

(assert (=> b!1096261 (=> (not res!731681) (not e!625755))))

(assert (=> b!1096261 (= res!731681 (= (select (arr!34151 _keys!1070) i!650) k0!904))))

(declare-fun res!731680 () Bool)

(assert (=> start!96432 (=> (not res!731680) (not e!625755))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96432 (= res!731680 (validMask!0 mask!1414))))

(assert (=> start!96432 e!625755))

(assert (=> start!96432 tp!80977))

(assert (=> start!96432 true))

(assert (=> start!96432 tp_is_empty!27067))

(declare-fun array_inv!26346 (array!70958) Bool)

(assert (=> start!96432 (array_inv!26346 _keys!1070)))

(declare-fun array_inv!26347 (array!70956) Bool)

(assert (=> start!96432 (and (array_inv!26347 _values!874) e!625756)))

(assert (= (and start!96432 res!731680) b!1096264))

(assert (= (and b!1096264 res!731686) b!1096260))

(assert (= (and b!1096260 res!731684) b!1096257))

(assert (= (and b!1096257 res!731685) b!1096263))

(assert (= (and b!1096263 res!731683) b!1096256))

(assert (= (and b!1096256 res!731679) b!1096261))

(assert (= (and b!1096261 res!731681) b!1096262))

(assert (= (and b!1096262 res!731682) b!1096265))

(assert (= (and b!1096265 res!731678) b!1096259))

(assert (= (and b!1096255 condMapEmpty!42361) mapIsEmpty!42361))

(assert (= (and b!1096255 (not condMapEmpty!42361)) mapNonEmpty!42361))

(get-info :version)

(assert (= (and mapNonEmpty!42361 ((_ is ValueCellFull!12824) mapValue!42361)) b!1096266))

(assert (= (and b!1096255 ((_ is ValueCellFull!12824) mapDefault!42361)) b!1096258))

(assert (= start!96432 b!1096255))

(declare-fun b_lambda!17653 () Bool)

(assert (=> (not b_lambda!17653) (not b!1096259)))

(declare-fun t!33961 () Bool)

(declare-fun tb!7875 () Bool)

(assert (=> (and start!96432 (= defaultEntry!882 defaultEntry!882) t!33961) tb!7875))

(declare-fun result!16281 () Bool)

(assert (=> tb!7875 (= result!16281 tp_is_empty!27067)))

(assert (=> b!1096259 t!33961))

(declare-fun b_and!36673 () Bool)

(assert (= b_and!36671 (and (=> t!33961 result!16281) b_and!36673)))

(declare-fun m!1015317 () Bool)

(assert (=> b!1096262 m!1015317))

(declare-fun m!1015319 () Bool)

(assert (=> b!1096262 m!1015319))

(declare-fun m!1015321 () Bool)

(assert (=> b!1096261 m!1015321))

(declare-fun m!1015323 () Bool)

(assert (=> b!1096260 m!1015323))

(declare-fun m!1015325 () Bool)

(assert (=> start!96432 m!1015325))

(declare-fun m!1015327 () Bool)

(assert (=> start!96432 m!1015327))

(declare-fun m!1015329 () Bool)

(assert (=> start!96432 m!1015329))

(declare-fun m!1015331 () Bool)

(assert (=> b!1096259 m!1015331))

(declare-fun m!1015333 () Bool)

(assert (=> b!1096259 m!1015333))

(declare-fun m!1015335 () Bool)

(assert (=> b!1096259 m!1015335))

(declare-fun m!1015337 () Bool)

(assert (=> b!1096259 m!1015337))

(declare-fun m!1015339 () Bool)

(assert (=> b!1096259 m!1015339))

(declare-fun m!1015341 () Bool)

(assert (=> b!1096259 m!1015341))

(declare-fun m!1015343 () Bool)

(assert (=> b!1096265 m!1015343))

(declare-fun m!1015345 () Bool)

(assert (=> b!1096256 m!1015345))

(declare-fun m!1015347 () Bool)

(assert (=> b!1096257 m!1015347))

(declare-fun m!1015349 () Bool)

(assert (=> mapNonEmpty!42361 m!1015349))

(check-sat (not mapNonEmpty!42361) tp_is_empty!27067 b_and!36673 (not b_lambda!17653) (not b_next!23017) (not b!1096256) (not start!96432) (not b!1096265) (not b!1096259) (not b!1096262) (not b!1096260) (not b!1096257))
(check-sat b_and!36673 (not b_next!23017))
