; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96680 () Bool)

(assert start!96680)

(declare-fun b_free!23023 () Bool)

(declare-fun b_next!23023 () Bool)

(assert (=> start!96680 (= b_free!23023 (not b_next!23023))))

(declare-fun tp!80996 () Bool)

(declare-fun b_and!36719 () Bool)

(assert (=> start!96680 (= tp!80996 b_and!36719)))

(declare-fun b!1097849 () Bool)

(declare-fun res!732356 () Bool)

(declare-fun e!626757 () Bool)

(assert (=> b!1097849 (=> (not res!732356) (not e!626757))))

(declare-datatypes ((array!71087 0))(
  ( (array!71088 (arr!34209 (Array (_ BitVec 32) (_ BitVec 64))) (size!34746 (_ BitVec 32))) )
))
(declare-fun lt!490689 () array!71087)

(declare-datatypes ((List!23895 0))(
  ( (Nil!23892) (Cons!23891 (h!25109 (_ BitVec 64)) (t!33956 List!23895)) )
))
(declare-fun arrayNoDuplicates!0 (array!71087 (_ BitVec 32) List!23895) Bool)

(assert (=> b!1097849 (= res!732356 (arrayNoDuplicates!0 lt!490689 #b00000000000000000000000000000000 Nil!23892))))

(declare-fun b!1097850 () Bool)

(declare-fun e!626755 () Bool)

(declare-fun tp_is_empty!27073 () Bool)

(assert (=> b!1097850 (= e!626755 tp_is_empty!27073)))

(declare-fun b!1097851 () Bool)

(declare-fun res!732355 () Bool)

(declare-fun e!626753 () Bool)

(assert (=> b!1097851 (=> (not res!732355) (not e!626753))))

(declare-fun _keys!1070 () array!71087)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1097851 (= res!732355 (= (select (arr!34209 _keys!1070) i!650) k0!904))))

(declare-fun b!1097852 () Bool)

(declare-fun res!732354 () Bool)

(assert (=> b!1097852 (=> (not res!732354) (not e!626753))))

(assert (=> b!1097852 (= res!732354 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23892))))

(declare-fun b!1097853 () Bool)

(assert (=> b!1097853 (= e!626753 e!626757)))

(declare-fun res!732353 () Bool)

(assert (=> b!1097853 (=> (not res!732353) (not e!626757))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71087 (_ BitVec 32)) Bool)

(assert (=> b!1097853 (= res!732353 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!490689 mask!1414))))

(assert (=> b!1097853 (= lt!490689 (array!71088 (store (arr!34209 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34746 _keys!1070)))))

(declare-fun b!1097854 () Bool)

(declare-fun e!626756 () Bool)

(declare-fun e!626754 () Bool)

(declare-fun mapRes!42370 () Bool)

(assert (=> b!1097854 (= e!626756 (and e!626754 mapRes!42370))))

(declare-fun condMapEmpty!42370 () Bool)

(declare-datatypes ((V!41225 0))(
  ( (V!41226 (val!13593 Int)) )
))
(declare-datatypes ((ValueCell!12827 0))(
  ( (ValueCellFull!12827 (v!16210 V!41225)) (EmptyCell!12827) )
))
(declare-datatypes ((array!71089 0))(
  ( (array!71090 (arr!34210 (Array (_ BitVec 32) ValueCell!12827)) (size!34747 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71089)

(declare-fun mapDefault!42370 () ValueCell!12827)

(assert (=> b!1097854 (= condMapEmpty!42370 (= (arr!34210 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12827)) mapDefault!42370)))))

(declare-fun b!1097855 () Bool)

(assert (=> b!1097855 (= e!626757 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!41225)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((tuple2!17272 0))(
  ( (tuple2!17273 (_1!8647 (_ BitVec 64)) (_2!8647 V!41225)) )
))
(declare-datatypes ((List!23896 0))(
  ( (Nil!23893) (Cons!23892 (h!25110 tuple2!17272) (t!33957 List!23896)) )
))
(declare-datatypes ((ListLongMap!15249 0))(
  ( (ListLongMap!15250 (toList!7640 List!23896)) )
))
(declare-fun lt!490692 () ListLongMap!15249)

(declare-fun zeroValue!831 () V!41225)

(declare-fun getCurrentListMapNoExtraKeys!4193 (array!71087 array!71089 (_ BitVec 32) (_ BitVec 32) V!41225 V!41225 (_ BitVec 32) Int) ListLongMap!15249)

(declare-fun dynLambda!2311 (Int (_ BitVec 64)) V!41225)

(assert (=> b!1097855 (= lt!490692 (getCurrentListMapNoExtraKeys!4193 lt!490689 (array!71090 (store (arr!34210 _values!874) i!650 (ValueCellFull!12827 (dynLambda!2311 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34747 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!490691 () ListLongMap!15249)

(assert (=> b!1097855 (= lt!490691 (getCurrentListMapNoExtraKeys!4193 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71087 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1097855 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36067 0))(
  ( (Unit!36068) )
))
(declare-fun lt!490690 () Unit!36067)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71087 (_ BitVec 64) (_ BitVec 32)) Unit!36067)

(assert (=> b!1097855 (= lt!490690 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1097856 () Bool)

(assert (=> b!1097856 (= e!626754 tp_is_empty!27073)))

(declare-fun b!1097857 () Bool)

(declare-fun res!732350 () Bool)

(assert (=> b!1097857 (=> (not res!732350) (not e!626753))))

(assert (=> b!1097857 (= res!732350 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1097858 () Bool)

(declare-fun res!732358 () Bool)

(assert (=> b!1097858 (=> (not res!732358) (not e!626753))))

(assert (=> b!1097858 (= res!732358 (and (= (size!34747 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34746 _keys!1070) (size!34747 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!42370 () Bool)

(assert (=> mapIsEmpty!42370 mapRes!42370))

(declare-fun b!1097859 () Bool)

(declare-fun res!732352 () Bool)

(assert (=> b!1097859 (=> (not res!732352) (not e!626753))))

(assert (=> b!1097859 (= res!732352 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34746 _keys!1070))))))

(declare-fun b!1097860 () Bool)

(declare-fun res!732357 () Bool)

(assert (=> b!1097860 (=> (not res!732357) (not e!626753))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1097860 (= res!732357 (validKeyInArray!0 k0!904))))

(declare-fun mapNonEmpty!42370 () Bool)

(declare-fun tp!80995 () Bool)

(assert (=> mapNonEmpty!42370 (= mapRes!42370 (and tp!80995 e!626755))))

(declare-fun mapRest!42370 () (Array (_ BitVec 32) ValueCell!12827))

(declare-fun mapKey!42370 () (_ BitVec 32))

(declare-fun mapValue!42370 () ValueCell!12827)

(assert (=> mapNonEmpty!42370 (= (arr!34210 _values!874) (store mapRest!42370 mapKey!42370 mapValue!42370))))

(declare-fun res!732351 () Bool)

(assert (=> start!96680 (=> (not res!732351) (not e!626753))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96680 (= res!732351 (validMask!0 mask!1414))))

(assert (=> start!96680 e!626753))

(assert (=> start!96680 tp!80996))

(assert (=> start!96680 true))

(assert (=> start!96680 tp_is_empty!27073))

(declare-fun array_inv!26390 (array!71087) Bool)

(assert (=> start!96680 (array_inv!26390 _keys!1070)))

(declare-fun array_inv!26391 (array!71089) Bool)

(assert (=> start!96680 (and (array_inv!26391 _values!874) e!626756)))

(assert (= (and start!96680 res!732351) b!1097858))

(assert (= (and b!1097858 res!732358) b!1097857))

(assert (= (and b!1097857 res!732350) b!1097852))

(assert (= (and b!1097852 res!732354) b!1097859))

(assert (= (and b!1097859 res!732352) b!1097860))

(assert (= (and b!1097860 res!732357) b!1097851))

(assert (= (and b!1097851 res!732355) b!1097853))

(assert (= (and b!1097853 res!732353) b!1097849))

(assert (= (and b!1097849 res!732356) b!1097855))

(assert (= (and b!1097854 condMapEmpty!42370) mapIsEmpty!42370))

(assert (= (and b!1097854 (not condMapEmpty!42370)) mapNonEmpty!42370))

(get-info :version)

(assert (= (and mapNonEmpty!42370 ((_ is ValueCellFull!12827) mapValue!42370)) b!1097850))

(assert (= (and b!1097854 ((_ is ValueCellFull!12827) mapDefault!42370)) b!1097856))

(assert (= start!96680 b!1097854))

(declare-fun b_lambda!17691 () Bool)

(assert (=> (not b_lambda!17691) (not b!1097855)))

(declare-fun t!33955 () Bool)

(declare-fun tb!7881 () Bool)

(assert (=> (and start!96680 (= defaultEntry!882 defaultEntry!882) t!33955) tb!7881))

(declare-fun result!16293 () Bool)

(assert (=> tb!7881 (= result!16293 tp_is_empty!27073)))

(assert (=> b!1097855 t!33955))

(declare-fun b_and!36721 () Bool)

(assert (= b_and!36719 (and (=> t!33955 result!16293) b_and!36721)))

(declare-fun m!1017717 () Bool)

(assert (=> b!1097851 m!1017717))

(declare-fun m!1017719 () Bool)

(assert (=> b!1097857 m!1017719))

(declare-fun m!1017721 () Bool)

(assert (=> mapNonEmpty!42370 m!1017721))

(declare-fun m!1017723 () Bool)

(assert (=> start!96680 m!1017723))

(declare-fun m!1017725 () Bool)

(assert (=> start!96680 m!1017725))

(declare-fun m!1017727 () Bool)

(assert (=> start!96680 m!1017727))

(declare-fun m!1017729 () Bool)

(assert (=> b!1097852 m!1017729))

(declare-fun m!1017731 () Bool)

(assert (=> b!1097849 m!1017731))

(declare-fun m!1017733 () Bool)

(assert (=> b!1097855 m!1017733))

(declare-fun m!1017735 () Bool)

(assert (=> b!1097855 m!1017735))

(declare-fun m!1017737 () Bool)

(assert (=> b!1097855 m!1017737))

(declare-fun m!1017739 () Bool)

(assert (=> b!1097855 m!1017739))

(declare-fun m!1017741 () Bool)

(assert (=> b!1097855 m!1017741))

(declare-fun m!1017743 () Bool)

(assert (=> b!1097855 m!1017743))

(declare-fun m!1017745 () Bool)

(assert (=> b!1097853 m!1017745))

(declare-fun m!1017747 () Bool)

(assert (=> b!1097853 m!1017747))

(declare-fun m!1017749 () Bool)

(assert (=> b!1097860 m!1017749))

(check-sat (not b_next!23023) (not b!1097855) tp_is_empty!27073 (not b!1097860) (not b!1097857) (not b!1097852) (not start!96680) (not b!1097849) (not b_lambda!17691) b_and!36721 (not mapNonEmpty!42370) (not b!1097853))
(check-sat b_and!36721 (not b_next!23023))
