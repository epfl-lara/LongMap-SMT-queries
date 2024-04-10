; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96434 () Bool)

(assert start!96434)

(declare-fun b_free!23013 () Bool)

(declare-fun b_next!23013 () Bool)

(assert (=> start!96434 (= b_free!23013 (not b_next!23013))))

(declare-fun tp!80966 () Bool)

(declare-fun b_and!36689 () Bool)

(assert (=> start!96434 (= tp!80966 b_and!36689)))

(declare-fun b!1096332 () Bool)

(declare-fun e!625808 () Bool)

(assert (=> b!1096332 (= e!625808 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((V!41211 0))(
  ( (V!41212 (val!13588 Int)) )
))
(declare-datatypes ((ValueCell!12822 0))(
  ( (ValueCellFull!12822 (v!16209 V!41211)) (EmptyCell!12822) )
))
(declare-datatypes ((array!71039 0))(
  ( (array!71040 (arr!34191 (Array (_ BitVec 32) ValueCell!12822)) (size!34727 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71039)

(declare-fun minValue!831 () V!41211)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((tuple2!17258 0))(
  ( (tuple2!17259 (_1!8640 (_ BitVec 64)) (_2!8640 V!41211)) )
))
(declare-datatypes ((List!23878 0))(
  ( (Nil!23875) (Cons!23874 (h!25083 tuple2!17258) (t!33937 List!23878)) )
))
(declare-datatypes ((ListLongMap!15227 0))(
  ( (ListLongMap!15228 (toList!7629 List!23878)) )
))
(declare-fun lt!490116 () ListLongMap!15227)

(declare-fun zeroValue!831 () V!41211)

(declare-datatypes ((array!71041 0))(
  ( (array!71042 (arr!34192 (Array (_ BitVec 32) (_ BitVec 64))) (size!34728 (_ BitVec 32))) )
))
(declare-fun lt!490115 () array!71041)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!4145 (array!71041 array!71039 (_ BitVec 32) (_ BitVec 32) V!41211 V!41211 (_ BitVec 32) Int) ListLongMap!15227)

(declare-fun dynLambda!2280 (Int (_ BitVec 64)) V!41211)

(assert (=> b!1096332 (= lt!490116 (getCurrentListMapNoExtraKeys!4145 lt!490115 (array!71040 (store (arr!34191 _values!874) i!650 (ValueCellFull!12822 (dynLambda!2280 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34727 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!490114 () ListLongMap!15227)

(declare-fun _keys!1070 () array!71041)

(assert (=> b!1096332 (= lt!490114 (getCurrentListMapNoExtraKeys!4145 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!71041 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1096332 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36070 0))(
  ( (Unit!36071) )
))
(declare-fun lt!490117 () Unit!36070)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71041 (_ BitVec 64) (_ BitVec 32)) Unit!36070)

(assert (=> b!1096332 (= lt!490117 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1096333 () Bool)

(declare-fun res!731693 () Bool)

(declare-fun e!625811 () Bool)

(assert (=> b!1096333 (=> (not res!731693) (not e!625811))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71041 (_ BitVec 32)) Bool)

(assert (=> b!1096333 (= res!731693 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1096334 () Bool)

(declare-fun e!625809 () Bool)

(declare-fun tp_is_empty!27063 () Bool)

(assert (=> b!1096334 (= e!625809 tp_is_empty!27063)))

(declare-fun mapIsEmpty!42355 () Bool)

(declare-fun mapRes!42355 () Bool)

(assert (=> mapIsEmpty!42355 mapRes!42355))

(declare-fun b!1096335 () Bool)

(declare-fun res!731696 () Bool)

(assert (=> b!1096335 (=> (not res!731696) (not e!625811))))

(assert (=> b!1096335 (= res!731696 (= (select (arr!34192 _keys!1070) i!650) k0!904))))

(declare-fun res!731697 () Bool)

(assert (=> start!96434 (=> (not res!731697) (not e!625811))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96434 (= res!731697 (validMask!0 mask!1414))))

(assert (=> start!96434 e!625811))

(assert (=> start!96434 tp!80966))

(assert (=> start!96434 true))

(assert (=> start!96434 tp_is_empty!27063))

(declare-fun array_inv!26346 (array!71041) Bool)

(assert (=> start!96434 (array_inv!26346 _keys!1070)))

(declare-fun e!625810 () Bool)

(declare-fun array_inv!26347 (array!71039) Bool)

(assert (=> start!96434 (and (array_inv!26347 _values!874) e!625810)))

(declare-fun b!1096336 () Bool)

(declare-fun res!731698 () Bool)

(assert (=> b!1096336 (=> (not res!731698) (not e!625808))))

(declare-datatypes ((List!23879 0))(
  ( (Nil!23876) (Cons!23875 (h!25084 (_ BitVec 64)) (t!33938 List!23879)) )
))
(declare-fun arrayNoDuplicates!0 (array!71041 (_ BitVec 32) List!23879) Bool)

(assert (=> b!1096336 (= res!731698 (arrayNoDuplicates!0 lt!490115 #b00000000000000000000000000000000 Nil!23876))))

(declare-fun b!1096337 () Bool)

(declare-fun res!731694 () Bool)

(assert (=> b!1096337 (=> (not res!731694) (not e!625811))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1096337 (= res!731694 (validKeyInArray!0 k0!904))))

(declare-fun b!1096338 () Bool)

(assert (=> b!1096338 (= e!625811 e!625808)))

(declare-fun res!731699 () Bool)

(assert (=> b!1096338 (=> (not res!731699) (not e!625808))))

(assert (=> b!1096338 (= res!731699 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!490115 mask!1414))))

(assert (=> b!1096338 (= lt!490115 (array!71042 (store (arr!34192 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34728 _keys!1070)))))

(declare-fun b!1096339 () Bool)

(declare-fun res!731700 () Bool)

(assert (=> b!1096339 (=> (not res!731700) (not e!625811))))

(assert (=> b!1096339 (= res!731700 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23876))))

(declare-fun b!1096340 () Bool)

(declare-fun res!731695 () Bool)

(assert (=> b!1096340 (=> (not res!731695) (not e!625811))))

(assert (=> b!1096340 (= res!731695 (and (= (size!34727 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34728 _keys!1070) (size!34727 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!42355 () Bool)

(declare-fun tp!80965 () Bool)

(declare-fun e!625813 () Bool)

(assert (=> mapNonEmpty!42355 (= mapRes!42355 (and tp!80965 e!625813))))

(declare-fun mapKey!42355 () (_ BitVec 32))

(declare-fun mapValue!42355 () ValueCell!12822)

(declare-fun mapRest!42355 () (Array (_ BitVec 32) ValueCell!12822))

(assert (=> mapNonEmpty!42355 (= (arr!34191 _values!874) (store mapRest!42355 mapKey!42355 mapValue!42355))))

(declare-fun b!1096341 () Bool)

(assert (=> b!1096341 (= e!625813 tp_is_empty!27063)))

(declare-fun b!1096342 () Bool)

(assert (=> b!1096342 (= e!625810 (and e!625809 mapRes!42355))))

(declare-fun condMapEmpty!42355 () Bool)

(declare-fun mapDefault!42355 () ValueCell!12822)

(assert (=> b!1096342 (= condMapEmpty!42355 (= (arr!34191 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12822)) mapDefault!42355)))))

(declare-fun b!1096343 () Bool)

(declare-fun res!731701 () Bool)

(assert (=> b!1096343 (=> (not res!731701) (not e!625811))))

(assert (=> b!1096343 (= res!731701 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34728 _keys!1070))))))

(assert (= (and start!96434 res!731697) b!1096340))

(assert (= (and b!1096340 res!731695) b!1096333))

(assert (= (and b!1096333 res!731693) b!1096339))

(assert (= (and b!1096339 res!731700) b!1096343))

(assert (= (and b!1096343 res!731701) b!1096337))

(assert (= (and b!1096337 res!731694) b!1096335))

(assert (= (and b!1096335 res!731696) b!1096338))

(assert (= (and b!1096338 res!731699) b!1096336))

(assert (= (and b!1096336 res!731698) b!1096332))

(assert (= (and b!1096342 condMapEmpty!42355) mapIsEmpty!42355))

(assert (= (and b!1096342 (not condMapEmpty!42355)) mapNonEmpty!42355))

(get-info :version)

(assert (= (and mapNonEmpty!42355 ((_ is ValueCellFull!12822) mapValue!42355)) b!1096341))

(assert (= (and b!1096342 ((_ is ValueCellFull!12822) mapDefault!42355)) b!1096334))

(assert (= start!96434 b!1096342))

(declare-fun b_lambda!17671 () Bool)

(assert (=> (not b_lambda!17671) (not b!1096332)))

(declare-fun t!33936 () Bool)

(declare-fun tb!7879 () Bool)

(assert (=> (and start!96434 (= defaultEntry!882 defaultEntry!882) t!33936) tb!7879))

(declare-fun result!16281 () Bool)

(assert (=> tb!7879 (= result!16281 tp_is_empty!27063)))

(assert (=> b!1096332 t!33936))

(declare-fun b_and!36691 () Bool)

(assert (= b_and!36689 (and (=> t!33936 result!16281) b_and!36691)))

(declare-fun m!1015875 () Bool)

(assert (=> start!96434 m!1015875))

(declare-fun m!1015877 () Bool)

(assert (=> start!96434 m!1015877))

(declare-fun m!1015879 () Bool)

(assert (=> start!96434 m!1015879))

(declare-fun m!1015881 () Bool)

(assert (=> b!1096337 m!1015881))

(declare-fun m!1015883 () Bool)

(assert (=> b!1096338 m!1015883))

(declare-fun m!1015885 () Bool)

(assert (=> b!1096338 m!1015885))

(declare-fun m!1015887 () Bool)

(assert (=> b!1096333 m!1015887))

(declare-fun m!1015889 () Bool)

(assert (=> b!1096339 m!1015889))

(declare-fun m!1015891 () Bool)

(assert (=> b!1096332 m!1015891))

(declare-fun m!1015893 () Bool)

(assert (=> b!1096332 m!1015893))

(declare-fun m!1015895 () Bool)

(assert (=> b!1096332 m!1015895))

(declare-fun m!1015897 () Bool)

(assert (=> b!1096332 m!1015897))

(declare-fun m!1015899 () Bool)

(assert (=> b!1096332 m!1015899))

(declare-fun m!1015901 () Bool)

(assert (=> b!1096332 m!1015901))

(declare-fun m!1015903 () Bool)

(assert (=> b!1096335 m!1015903))

(declare-fun m!1015905 () Bool)

(assert (=> b!1096336 m!1015905))

(declare-fun m!1015907 () Bool)

(assert (=> mapNonEmpty!42355 m!1015907))

(check-sat (not b!1096333) (not b!1096337) (not b!1096338) (not b_lambda!17671) (not b!1096336) (not b!1096332) (not start!96434) tp_is_empty!27063 (not b_next!23013) (not mapNonEmpty!42355) b_and!36691 (not b!1096339))
(check-sat b_and!36691 (not b_next!23013))
