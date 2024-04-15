; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96438 () Bool)

(assert start!96438)

(declare-fun b_free!23023 () Bool)

(declare-fun b_next!23023 () Bool)

(assert (=> start!96438 (= b_free!23023 (not b_next!23023))))

(declare-fun tp!80995 () Bool)

(declare-fun b_and!36683 () Bool)

(assert (=> start!96438 (= tp!80995 b_and!36683)))

(declare-fun b!1096369 () Bool)

(declare-fun res!731765 () Bool)

(declare-fun e!625808 () Bool)

(assert (=> b!1096369 (=> (not res!731765) (not e!625808))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((array!70968 0))(
  ( (array!70969 (arr!34156 (Array (_ BitVec 32) (_ BitVec 64))) (size!34694 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70968)

(declare-datatypes ((V!41225 0))(
  ( (V!41226 (val!13593 Int)) )
))
(declare-datatypes ((ValueCell!12827 0))(
  ( (ValueCellFull!12827 (v!16213 V!41225)) (EmptyCell!12827) )
))
(declare-datatypes ((array!70970 0))(
  ( (array!70971 (arr!34157 (Array (_ BitVec 32) ValueCell!12827)) (size!34695 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70970)

(assert (=> b!1096369 (= res!731765 (and (= (size!34695 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34694 _keys!1070) (size!34695 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1096370 () Bool)

(declare-fun res!731761 () Bool)

(declare-fun e!625807 () Bool)

(assert (=> b!1096370 (=> (not res!731761) (not e!625807))))

(declare-fun lt!489974 () array!70968)

(declare-datatypes ((List!23914 0))(
  ( (Nil!23911) (Cons!23910 (h!25119 (_ BitVec 64)) (t!33974 List!23914)) )
))
(declare-fun arrayNoDuplicates!0 (array!70968 (_ BitVec 32) List!23914) Bool)

(assert (=> b!1096370 (= res!731761 (arrayNoDuplicates!0 lt!489974 #b00000000000000000000000000000000 Nil!23911))))

(declare-fun mapIsEmpty!42370 () Bool)

(declare-fun mapRes!42370 () Bool)

(assert (=> mapIsEmpty!42370 mapRes!42370))

(declare-fun b!1096371 () Bool)

(declare-fun res!731763 () Bool)

(assert (=> b!1096371 (=> (not res!731763) (not e!625808))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1096371 (= res!731763 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34694 _keys!1070))))))

(declare-fun b!1096373 () Bool)

(declare-fun e!625805 () Bool)

(declare-fun e!625810 () Bool)

(assert (=> b!1096373 (= e!625805 (and e!625810 mapRes!42370))))

(declare-fun condMapEmpty!42370 () Bool)

(declare-fun mapDefault!42370 () ValueCell!12827)

(assert (=> b!1096373 (= condMapEmpty!42370 (= (arr!34157 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12827)) mapDefault!42370)))))

(declare-fun b!1096374 () Bool)

(declare-fun res!731762 () Bool)

(assert (=> b!1096374 (=> (not res!731762) (not e!625808))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1096374 (= res!731762 (validKeyInArray!0 k0!904))))

(declare-fun mapNonEmpty!42370 () Bool)

(declare-fun tp!80996 () Bool)

(declare-fun e!625809 () Bool)

(assert (=> mapNonEmpty!42370 (= mapRes!42370 (and tp!80996 e!625809))))

(declare-fun mapValue!42370 () ValueCell!12827)

(declare-fun mapRest!42370 () (Array (_ BitVec 32) ValueCell!12827))

(declare-fun mapKey!42370 () (_ BitVec 32))

(assert (=> mapNonEmpty!42370 (= (arr!34157 _values!874) (store mapRest!42370 mapKey!42370 mapValue!42370))))

(declare-fun res!731766 () Bool)

(assert (=> start!96438 (=> (not res!731766) (not e!625808))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96438 (= res!731766 (validMask!0 mask!1414))))

(assert (=> start!96438 e!625808))

(assert (=> start!96438 tp!80995))

(assert (=> start!96438 true))

(declare-fun tp_is_empty!27073 () Bool)

(assert (=> start!96438 tp_is_empty!27073))

(declare-fun array_inv!26350 (array!70968) Bool)

(assert (=> start!96438 (array_inv!26350 _keys!1070)))

(declare-fun array_inv!26351 (array!70970) Bool)

(assert (=> start!96438 (and (array_inv!26351 _values!874) e!625805)))

(declare-fun b!1096372 () Bool)

(declare-fun res!731767 () Bool)

(assert (=> b!1096372 (=> (not res!731767) (not e!625808))))

(assert (=> b!1096372 (= res!731767 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23911))))

(declare-fun b!1096375 () Bool)

(declare-fun res!731764 () Bool)

(assert (=> b!1096375 (=> (not res!731764) (not e!625808))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70968 (_ BitVec 32)) Bool)

(assert (=> b!1096375 (= res!731764 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1096376 () Bool)

(assert (=> b!1096376 (= e!625810 tp_is_empty!27073)))

(declare-fun b!1096377 () Bool)

(assert (=> b!1096377 (= e!625808 e!625807)))

(declare-fun res!731759 () Bool)

(assert (=> b!1096377 (=> (not res!731759) (not e!625807))))

(assert (=> b!1096377 (= res!731759 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!489974 mask!1414))))

(assert (=> b!1096377 (= lt!489974 (array!70969 (store (arr!34156 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34694 _keys!1070)))))

(declare-fun b!1096378 () Bool)

(assert (=> b!1096378 (= e!625807 (not true))))

(declare-fun minValue!831 () V!41225)

(declare-fun zeroValue!831 () V!41225)

(declare-datatypes ((tuple2!17322 0))(
  ( (tuple2!17323 (_1!8672 (_ BitVec 64)) (_2!8672 V!41225)) )
))
(declare-datatypes ((List!23915 0))(
  ( (Nil!23912) (Cons!23911 (h!25120 tuple2!17322) (t!33975 List!23915)) )
))
(declare-datatypes ((ListLongMap!15291 0))(
  ( (ListLongMap!15292 (toList!7661 List!23915)) )
))
(declare-fun lt!489975 () ListLongMap!15291)

(declare-fun defaultEntry!882 () Int)

(declare-fun getCurrentListMapNoExtraKeys!4194 (array!70968 array!70970 (_ BitVec 32) (_ BitVec 32) V!41225 V!41225 (_ BitVec 32) Int) ListLongMap!15291)

(declare-fun dynLambda!2263 (Int (_ BitVec 64)) V!41225)

(assert (=> b!1096378 (= lt!489975 (getCurrentListMapNoExtraKeys!4194 lt!489974 (array!70971 (store (arr!34157 _values!874) i!650 (ValueCellFull!12827 (dynLambda!2263 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34695 _values!874)) mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!489977 () ListLongMap!15291)

(assert (=> b!1096378 (= lt!489977 (getCurrentListMapNoExtraKeys!4194 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70968 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1096378 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35909 0))(
  ( (Unit!35910) )
))
(declare-fun lt!489976 () Unit!35909)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70968 (_ BitVec 64) (_ BitVec 32)) Unit!35909)

(assert (=> b!1096378 (= lt!489976 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1096379 () Bool)

(declare-fun res!731760 () Bool)

(assert (=> b!1096379 (=> (not res!731760) (not e!625808))))

(assert (=> b!1096379 (= res!731760 (= (select (arr!34156 _keys!1070) i!650) k0!904))))

(declare-fun b!1096380 () Bool)

(assert (=> b!1096380 (= e!625809 tp_is_empty!27073)))

(assert (= (and start!96438 res!731766) b!1096369))

(assert (= (and b!1096369 res!731765) b!1096375))

(assert (= (and b!1096375 res!731764) b!1096372))

(assert (= (and b!1096372 res!731767) b!1096371))

(assert (= (and b!1096371 res!731763) b!1096374))

(assert (= (and b!1096374 res!731762) b!1096379))

(assert (= (and b!1096379 res!731760) b!1096377))

(assert (= (and b!1096377 res!731759) b!1096370))

(assert (= (and b!1096370 res!731761) b!1096378))

(assert (= (and b!1096373 condMapEmpty!42370) mapIsEmpty!42370))

(assert (= (and b!1096373 (not condMapEmpty!42370)) mapNonEmpty!42370))

(get-info :version)

(assert (= (and mapNonEmpty!42370 ((_ is ValueCellFull!12827) mapValue!42370)) b!1096380))

(assert (= (and b!1096373 ((_ is ValueCellFull!12827) mapDefault!42370)) b!1096376))

(assert (= start!96438 b!1096373))

(declare-fun b_lambda!17659 () Bool)

(assert (=> (not b_lambda!17659) (not b!1096378)))

(declare-fun t!33973 () Bool)

(declare-fun tb!7881 () Bool)

(assert (=> (and start!96438 (= defaultEntry!882 defaultEntry!882) t!33973) tb!7881))

(declare-fun result!16293 () Bool)

(assert (=> tb!7881 (= result!16293 tp_is_empty!27073)))

(assert (=> b!1096378 t!33973))

(declare-fun b_and!36685 () Bool)

(assert (= b_and!36683 (and (=> t!33973 result!16293) b_and!36685)))

(declare-fun m!1015419 () Bool)

(assert (=> b!1096377 m!1015419))

(declare-fun m!1015421 () Bool)

(assert (=> b!1096377 m!1015421))

(declare-fun m!1015423 () Bool)

(assert (=> start!96438 m!1015423))

(declare-fun m!1015425 () Bool)

(assert (=> start!96438 m!1015425))

(declare-fun m!1015427 () Bool)

(assert (=> start!96438 m!1015427))

(declare-fun m!1015429 () Bool)

(assert (=> b!1096370 m!1015429))

(declare-fun m!1015431 () Bool)

(assert (=> b!1096378 m!1015431))

(declare-fun m!1015433 () Bool)

(assert (=> b!1096378 m!1015433))

(declare-fun m!1015435 () Bool)

(assert (=> b!1096378 m!1015435))

(declare-fun m!1015437 () Bool)

(assert (=> b!1096378 m!1015437))

(declare-fun m!1015439 () Bool)

(assert (=> b!1096378 m!1015439))

(declare-fun m!1015441 () Bool)

(assert (=> b!1096378 m!1015441))

(declare-fun m!1015443 () Bool)

(assert (=> b!1096379 m!1015443))

(declare-fun m!1015445 () Bool)

(assert (=> b!1096375 m!1015445))

(declare-fun m!1015447 () Bool)

(assert (=> b!1096374 m!1015447))

(declare-fun m!1015449 () Bool)

(assert (=> b!1096372 m!1015449))

(declare-fun m!1015451 () Bool)

(assert (=> mapNonEmpty!42370 m!1015451))

(check-sat tp_is_empty!27073 (not b!1096378) (not start!96438) (not b!1096374) (not b!1096370) (not b!1096372) (not mapNonEmpty!42370) (not b_next!23023) b_and!36685 (not b!1096377) (not b!1096375) (not b_lambda!17659))
(check-sat b_and!36685 (not b_next!23023))
