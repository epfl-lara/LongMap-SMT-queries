; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96380 () Bool)

(assert start!96380)

(declare-fun b_free!22959 () Bool)

(declare-fun b_next!22959 () Bool)

(assert (=> start!96380 (= b_free!22959 (not b_next!22959))))

(declare-fun tp!80804 () Bool)

(declare-fun b_and!36585 () Bool)

(assert (=> start!96380 (= tp!80804 b_and!36585)))

(declare-fun b!1095310 () Bool)

(declare-fun res!730971 () Bool)

(declare-fun e!625325 () Bool)

(assert (=> b!1095310 (=> (not res!730971) (not e!625325))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((array!70931 0))(
  ( (array!70932 (arr!34137 (Array (_ BitVec 32) (_ BitVec 64))) (size!34673 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70931)

(declare-datatypes ((V!41139 0))(
  ( (V!41140 (val!13561 Int)) )
))
(declare-datatypes ((ValueCell!12795 0))(
  ( (ValueCellFull!12795 (v!16182 V!41139)) (EmptyCell!12795) )
))
(declare-datatypes ((array!70933 0))(
  ( (array!70934 (arr!34138 (Array (_ BitVec 32) ValueCell!12795)) (size!34674 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70933)

(assert (=> b!1095310 (= res!730971 (and (= (size!34674 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34673 _keys!1070) (size!34674 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!42274 () Bool)

(declare-fun mapRes!42274 () Bool)

(assert (=> mapIsEmpty!42274 mapRes!42274))

(declare-fun b!1095311 () Bool)

(declare-fun res!730967 () Bool)

(assert (=> b!1095311 (=> (not res!730967) (not e!625325))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70931 (_ BitVec 32)) Bool)

(assert (=> b!1095311 (= res!730967 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1095312 () Bool)

(declare-fun e!625324 () Bool)

(declare-fun tp_is_empty!27009 () Bool)

(assert (=> b!1095312 (= e!625324 tp_is_empty!27009)))

(declare-fun b!1095313 () Bool)

(declare-fun res!730965 () Bool)

(assert (=> b!1095313 (=> (not res!730965) (not e!625325))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1095313 (= res!730965 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34673 _keys!1070))))))

(declare-fun mapNonEmpty!42274 () Bool)

(declare-fun tp!80803 () Bool)

(assert (=> mapNonEmpty!42274 (= mapRes!42274 (and tp!80803 e!625324))))

(declare-fun mapKey!42274 () (_ BitVec 32))

(declare-fun mapValue!42274 () ValueCell!12795)

(declare-fun mapRest!42274 () (Array (_ BitVec 32) ValueCell!12795))

(assert (=> mapNonEmpty!42274 (= (arr!34138 _values!874) (store mapRest!42274 mapKey!42274 mapValue!42274))))

(declare-fun b!1095315 () Bool)

(declare-fun res!730968 () Bool)

(assert (=> b!1095315 (=> (not res!730968) (not e!625325))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1095315 (= res!730968 (validKeyInArray!0 k0!904))))

(declare-fun b!1095316 () Bool)

(declare-fun e!625326 () Bool)

(assert (=> b!1095316 (= e!625326 tp_is_empty!27009)))

(declare-fun b!1095317 () Bool)

(declare-fun res!730972 () Bool)

(declare-fun e!625327 () Bool)

(assert (=> b!1095317 (=> (not res!730972) (not e!625327))))

(declare-fun lt!489795 () array!70931)

(declare-datatypes ((List!23837 0))(
  ( (Nil!23834) (Cons!23833 (h!25042 (_ BitVec 64)) (t!33844 List!23837)) )
))
(declare-fun arrayNoDuplicates!0 (array!70931 (_ BitVec 32) List!23837) Bool)

(assert (=> b!1095317 (= res!730972 (arrayNoDuplicates!0 lt!489795 #b00000000000000000000000000000000 Nil!23834))))

(declare-fun b!1095318 () Bool)

(assert (=> b!1095318 (= e!625327 (not (bvslt i!650 (size!34674 _values!874))))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!41139)

(declare-datatypes ((tuple2!17220 0))(
  ( (tuple2!17221 (_1!8621 (_ BitVec 64)) (_2!8621 V!41139)) )
))
(declare-datatypes ((List!23838 0))(
  ( (Nil!23835) (Cons!23834 (h!25043 tuple2!17220) (t!33845 List!23838)) )
))
(declare-datatypes ((ListLongMap!15189 0))(
  ( (ListLongMap!15190 (toList!7610 List!23838)) )
))
(declare-fun lt!489796 () ListLongMap!15189)

(declare-fun zeroValue!831 () V!41139)

(declare-fun getCurrentListMapNoExtraKeys!4126 (array!70931 array!70933 (_ BitVec 32) (_ BitVec 32) V!41139 V!41139 (_ BitVec 32) Int) ListLongMap!15189)

(assert (=> b!1095318 (= lt!489796 (getCurrentListMapNoExtraKeys!4126 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70931 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1095318 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36032 0))(
  ( (Unit!36033) )
))
(declare-fun lt!489794 () Unit!36032)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70931 (_ BitVec 64) (_ BitVec 32)) Unit!36032)

(assert (=> b!1095318 (= lt!489794 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1095319 () Bool)

(declare-fun res!730969 () Bool)

(assert (=> b!1095319 (=> (not res!730969) (not e!625325))))

(assert (=> b!1095319 (= res!730969 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23834))))

(declare-fun b!1095320 () Bool)

(assert (=> b!1095320 (= e!625325 e!625327)))

(declare-fun res!730970 () Bool)

(assert (=> b!1095320 (=> (not res!730970) (not e!625327))))

(assert (=> b!1095320 (= res!730970 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!489795 mask!1414))))

(assert (=> b!1095320 (= lt!489795 (array!70932 (store (arr!34137 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34673 _keys!1070)))))

(declare-fun b!1095321 () Bool)

(declare-fun e!625323 () Bool)

(assert (=> b!1095321 (= e!625323 (and e!625326 mapRes!42274))))

(declare-fun condMapEmpty!42274 () Bool)

(declare-fun mapDefault!42274 () ValueCell!12795)

(assert (=> b!1095321 (= condMapEmpty!42274 (= (arr!34138 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12795)) mapDefault!42274)))))

(declare-fun b!1095314 () Bool)

(declare-fun res!730964 () Bool)

(assert (=> b!1095314 (=> (not res!730964) (not e!625325))))

(assert (=> b!1095314 (= res!730964 (= (select (arr!34137 _keys!1070) i!650) k0!904))))

(declare-fun res!730966 () Bool)

(assert (=> start!96380 (=> (not res!730966) (not e!625325))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96380 (= res!730966 (validMask!0 mask!1414))))

(assert (=> start!96380 e!625325))

(assert (=> start!96380 tp!80804))

(assert (=> start!96380 true))

(assert (=> start!96380 tp_is_empty!27009))

(declare-fun array_inv!26306 (array!70931) Bool)

(assert (=> start!96380 (array_inv!26306 _keys!1070)))

(declare-fun array_inv!26307 (array!70933) Bool)

(assert (=> start!96380 (and (array_inv!26307 _values!874) e!625323)))

(assert (= (and start!96380 res!730966) b!1095310))

(assert (= (and b!1095310 res!730971) b!1095311))

(assert (= (and b!1095311 res!730967) b!1095319))

(assert (= (and b!1095319 res!730969) b!1095313))

(assert (= (and b!1095313 res!730965) b!1095315))

(assert (= (and b!1095315 res!730968) b!1095314))

(assert (= (and b!1095314 res!730964) b!1095320))

(assert (= (and b!1095320 res!730970) b!1095317))

(assert (= (and b!1095317 res!730972) b!1095318))

(assert (= (and b!1095321 condMapEmpty!42274) mapIsEmpty!42274))

(assert (= (and b!1095321 (not condMapEmpty!42274)) mapNonEmpty!42274))

(get-info :version)

(assert (= (and mapNonEmpty!42274 ((_ is ValueCellFull!12795) mapValue!42274)) b!1095312))

(assert (= (and b!1095321 ((_ is ValueCellFull!12795) mapDefault!42274)) b!1095316))

(assert (= start!96380 b!1095321))

(declare-fun m!1014969 () Bool)

(assert (=> b!1095317 m!1014969))

(declare-fun m!1014971 () Bool)

(assert (=> b!1095314 m!1014971))

(declare-fun m!1014973 () Bool)

(assert (=> b!1095311 m!1014973))

(declare-fun m!1014975 () Bool)

(assert (=> b!1095320 m!1014975))

(declare-fun m!1014977 () Bool)

(assert (=> b!1095320 m!1014977))

(declare-fun m!1014979 () Bool)

(assert (=> b!1095319 m!1014979))

(declare-fun m!1014981 () Bool)

(assert (=> b!1095315 m!1014981))

(declare-fun m!1014983 () Bool)

(assert (=> start!96380 m!1014983))

(declare-fun m!1014985 () Bool)

(assert (=> start!96380 m!1014985))

(declare-fun m!1014987 () Bool)

(assert (=> start!96380 m!1014987))

(declare-fun m!1014989 () Bool)

(assert (=> mapNonEmpty!42274 m!1014989))

(declare-fun m!1014991 () Bool)

(assert (=> b!1095318 m!1014991))

(declare-fun m!1014993 () Bool)

(assert (=> b!1095318 m!1014993))

(declare-fun m!1014995 () Bool)

(assert (=> b!1095318 m!1014995))

(check-sat (not b!1095315) (not b!1095320) (not mapNonEmpty!42274) (not b_next!22959) b_and!36585 tp_is_empty!27009 (not b!1095311) (not b!1095318) (not b!1095319) (not b!1095317) (not start!96380))
(check-sat b_and!36585 (not b_next!22959))
