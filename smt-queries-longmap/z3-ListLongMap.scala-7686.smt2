; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96464 () Bool)

(assert start!96464)

(declare-fun b_free!23043 () Bool)

(declare-fun b_next!23043 () Bool)

(assert (=> start!96464 (= b_free!23043 (not b_next!23043))))

(declare-fun tp!81056 () Bool)

(declare-fun b_and!36749 () Bool)

(assert (=> start!96464 (= tp!81056 b_and!36749)))

(declare-fun b!1096902 () Bool)

(declare-fun res!732106 () Bool)

(declare-fun e!626081 () Bool)

(assert (=> b!1096902 (=> (not res!732106) (not e!626081))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((array!71099 0))(
  ( (array!71100 (arr!34221 (Array (_ BitVec 32) (_ BitVec 64))) (size!34757 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71099)

(declare-datatypes ((V!41251 0))(
  ( (V!41252 (val!13603 Int)) )
))
(declare-datatypes ((ValueCell!12837 0))(
  ( (ValueCellFull!12837 (v!16224 V!41251)) (EmptyCell!12837) )
))
(declare-datatypes ((array!71101 0))(
  ( (array!71102 (arr!34222 (Array (_ BitVec 32) ValueCell!12837)) (size!34758 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71101)

(assert (=> b!1096902 (= res!732106 (and (= (size!34758 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34757 _keys!1070) (size!34758 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1096903 () Bool)

(declare-fun res!732099 () Bool)

(assert (=> b!1096903 (=> (not res!732099) (not e!626081))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1096903 (= res!732099 (= (select (arr!34221 _keys!1070) i!650) k0!904))))

(declare-fun b!1096904 () Bool)

(declare-fun e!626080 () Bool)

(declare-fun e!626079 () Bool)

(declare-fun mapRes!42400 () Bool)

(assert (=> b!1096904 (= e!626080 (and e!626079 mapRes!42400))))

(declare-fun condMapEmpty!42400 () Bool)

(declare-fun mapDefault!42400 () ValueCell!12837)

(assert (=> b!1096904 (= condMapEmpty!42400 (= (arr!34222 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12837)) mapDefault!42400)))))

(declare-fun b!1096905 () Bool)

(declare-fun res!732100 () Bool)

(assert (=> b!1096905 (=> (not res!732100) (not e!626081))))

(assert (=> b!1096905 (= res!732100 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34757 _keys!1070))))))

(declare-fun b!1096906 () Bool)

(declare-fun tp_is_empty!27093 () Bool)

(assert (=> b!1096906 (= e!626079 tp_is_empty!27093)))

(declare-fun b!1096907 () Bool)

(declare-fun res!732103 () Bool)

(assert (=> b!1096907 (=> (not res!732103) (not e!626081))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71099 (_ BitVec 32)) Bool)

(assert (=> b!1096907 (= res!732103 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun res!732102 () Bool)

(assert (=> start!96464 (=> (not res!732102) (not e!626081))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96464 (= res!732102 (validMask!0 mask!1414))))

(assert (=> start!96464 e!626081))

(assert (=> start!96464 tp!81056))

(assert (=> start!96464 true))

(assert (=> start!96464 tp_is_empty!27093))

(declare-fun array_inv!26366 (array!71099) Bool)

(assert (=> start!96464 (array_inv!26366 _keys!1070)))

(declare-fun array_inv!26367 (array!71101) Bool)

(assert (=> start!96464 (and (array_inv!26367 _values!874) e!626080)))

(declare-fun b!1096908 () Bool)

(declare-fun e!626082 () Bool)

(assert (=> b!1096908 (= e!626081 e!626082)))

(declare-fun res!732104 () Bool)

(assert (=> b!1096908 (=> (not res!732104) (not e!626082))))

(declare-fun lt!490297 () array!71099)

(assert (=> b!1096908 (= res!732104 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!490297 mask!1414))))

(assert (=> b!1096908 (= lt!490297 (array!71100 (store (arr!34221 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34757 _keys!1070)))))

(declare-fun b!1096909 () Bool)

(declare-fun res!732098 () Bool)

(assert (=> b!1096909 (=> (not res!732098) (not e!626081))))

(declare-datatypes ((List!23897 0))(
  ( (Nil!23894) (Cons!23893 (h!25102 (_ BitVec 64)) (t!33986 List!23897)) )
))
(declare-fun arrayNoDuplicates!0 (array!71099 (_ BitVec 32) List!23897) Bool)

(assert (=> b!1096909 (= res!732098 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23894))))

(declare-fun b!1096910 () Bool)

(declare-fun e!626083 () Bool)

(assert (=> b!1096910 (= e!626083 tp_is_empty!27093)))

(declare-fun mapNonEmpty!42400 () Bool)

(declare-fun tp!81055 () Bool)

(assert (=> mapNonEmpty!42400 (= mapRes!42400 (and tp!81055 e!626083))))

(declare-fun mapRest!42400 () (Array (_ BitVec 32) ValueCell!12837))

(declare-fun mapValue!42400 () ValueCell!12837)

(declare-fun mapKey!42400 () (_ BitVec 32))

(assert (=> mapNonEmpty!42400 (= (arr!34222 _values!874) (store mapRest!42400 mapKey!42400 mapValue!42400))))

(declare-fun b!1096911 () Bool)

(assert (=> b!1096911 (= e!626082 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!41251)

(declare-datatypes ((tuple2!17274 0))(
  ( (tuple2!17275 (_1!8648 (_ BitVec 64)) (_2!8648 V!41251)) )
))
(declare-datatypes ((List!23898 0))(
  ( (Nil!23895) (Cons!23894 (h!25103 tuple2!17274) (t!33987 List!23898)) )
))
(declare-datatypes ((ListLongMap!15243 0))(
  ( (ListLongMap!15244 (toList!7637 List!23898)) )
))
(declare-fun lt!490294 () ListLongMap!15243)

(declare-fun zeroValue!831 () V!41251)

(declare-fun getCurrentListMapNoExtraKeys!4153 (array!71099 array!71101 (_ BitVec 32) (_ BitVec 32) V!41251 V!41251 (_ BitVec 32) Int) ListLongMap!15243)

(declare-fun dynLambda!2288 (Int (_ BitVec 64)) V!41251)

(assert (=> b!1096911 (= lt!490294 (getCurrentListMapNoExtraKeys!4153 lt!490297 (array!71102 (store (arr!34222 _values!874) i!650 (ValueCellFull!12837 (dynLambda!2288 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34758 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!490295 () ListLongMap!15243)

(assert (=> b!1096911 (= lt!490295 (getCurrentListMapNoExtraKeys!4153 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71099 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1096911 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36086 0))(
  ( (Unit!36087) )
))
(declare-fun lt!490296 () Unit!36086)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71099 (_ BitVec 64) (_ BitVec 32)) Unit!36086)

(assert (=> b!1096911 (= lt!490296 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun mapIsEmpty!42400 () Bool)

(assert (=> mapIsEmpty!42400 mapRes!42400))

(declare-fun b!1096912 () Bool)

(declare-fun res!732101 () Bool)

(assert (=> b!1096912 (=> (not res!732101) (not e!626082))))

(assert (=> b!1096912 (= res!732101 (arrayNoDuplicates!0 lt!490297 #b00000000000000000000000000000000 Nil!23894))))

(declare-fun b!1096913 () Bool)

(declare-fun res!732105 () Bool)

(assert (=> b!1096913 (=> (not res!732105) (not e!626081))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1096913 (= res!732105 (validKeyInArray!0 k0!904))))

(assert (= (and start!96464 res!732102) b!1096902))

(assert (= (and b!1096902 res!732106) b!1096907))

(assert (= (and b!1096907 res!732103) b!1096909))

(assert (= (and b!1096909 res!732098) b!1096905))

(assert (= (and b!1096905 res!732100) b!1096913))

(assert (= (and b!1096913 res!732105) b!1096903))

(assert (= (and b!1096903 res!732099) b!1096908))

(assert (= (and b!1096908 res!732104) b!1096912))

(assert (= (and b!1096912 res!732101) b!1096911))

(assert (= (and b!1096904 condMapEmpty!42400) mapIsEmpty!42400))

(assert (= (and b!1096904 (not condMapEmpty!42400)) mapNonEmpty!42400))

(get-info :version)

(assert (= (and mapNonEmpty!42400 ((_ is ValueCellFull!12837) mapValue!42400)) b!1096910))

(assert (= (and b!1096904 ((_ is ValueCellFull!12837) mapDefault!42400)) b!1096906))

(assert (= start!96464 b!1096904))

(declare-fun b_lambda!17701 () Bool)

(assert (=> (not b_lambda!17701) (not b!1096911)))

(declare-fun t!33985 () Bool)

(declare-fun tb!7909 () Bool)

(assert (=> (and start!96464 (= defaultEntry!882 defaultEntry!882) t!33985) tb!7909))

(declare-fun result!16341 () Bool)

(assert (=> tb!7909 (= result!16341 tp_is_empty!27093)))

(assert (=> b!1096911 t!33985))

(declare-fun b_and!36751 () Bool)

(assert (= b_and!36749 (and (=> t!33985 result!16341) b_and!36751)))

(declare-fun m!1016385 () Bool)

(assert (=> mapNonEmpty!42400 m!1016385))

(declare-fun m!1016387 () Bool)

(assert (=> start!96464 m!1016387))

(declare-fun m!1016389 () Bool)

(assert (=> start!96464 m!1016389))

(declare-fun m!1016391 () Bool)

(assert (=> start!96464 m!1016391))

(declare-fun m!1016393 () Bool)

(assert (=> b!1096907 m!1016393))

(declare-fun m!1016395 () Bool)

(assert (=> b!1096911 m!1016395))

(declare-fun m!1016397 () Bool)

(assert (=> b!1096911 m!1016397))

(declare-fun m!1016399 () Bool)

(assert (=> b!1096911 m!1016399))

(declare-fun m!1016401 () Bool)

(assert (=> b!1096911 m!1016401))

(declare-fun m!1016403 () Bool)

(assert (=> b!1096911 m!1016403))

(declare-fun m!1016405 () Bool)

(assert (=> b!1096911 m!1016405))

(declare-fun m!1016407 () Bool)

(assert (=> b!1096903 m!1016407))

(declare-fun m!1016409 () Bool)

(assert (=> b!1096912 m!1016409))

(declare-fun m!1016411 () Bool)

(assert (=> b!1096908 m!1016411))

(declare-fun m!1016413 () Bool)

(assert (=> b!1096908 m!1016413))

(declare-fun m!1016415 () Bool)

(assert (=> b!1096913 m!1016415))

(declare-fun m!1016417 () Bool)

(assert (=> b!1096909 m!1016417))

(check-sat (not b!1096912) (not b_lambda!17701) (not b!1096913) (not b!1096911) (not b!1096909) tp_is_empty!27093 (not b!1096907) (not start!96464) (not mapNonEmpty!42400) b_and!36751 (not b_next!23043) (not b!1096908))
(check-sat b_and!36751 (not b_next!23043))
