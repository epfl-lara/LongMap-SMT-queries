; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96978 () Bool)

(assert start!96978)

(declare-fun b_free!23137 () Bool)

(declare-fun b_next!23137 () Bool)

(assert (=> start!96978 (= b_free!23137 (not b_next!23137))))

(declare-fun tp!81359 () Bool)

(declare-fun b_and!37045 () Bool)

(assert (=> start!96978 (= tp!81359 b_and!37045)))

(declare-fun b!1101621 () Bool)

(declare-fun res!734729 () Bool)

(declare-fun e!628876 () Bool)

(assert (=> b!1101621 (=> (not res!734729) (not e!628876))))

(declare-datatypes ((array!71327 0))(
  ( (array!71328 (arr!34322 (Array (_ BitVec 32) (_ BitVec 64))) (size!34859 (_ BitVec 32))) )
))
(declare-fun lt!493443 () array!71327)

(declare-datatypes ((List!23984 0))(
  ( (Nil!23981) (Cons!23980 (h!25198 (_ BitVec 64)) (t!34159 List!23984)) )
))
(declare-fun arrayNoDuplicates!0 (array!71327 (_ BitVec 32) List!23984) Bool)

(assert (=> b!1101621 (= res!734729 (arrayNoDuplicates!0 lt!493443 #b00000000000000000000000000000000 Nil!23981))))

(declare-fun mapIsEmpty!42562 () Bool)

(declare-fun mapRes!42562 () Bool)

(assert (=> mapIsEmpty!42562 mapRes!42562))

(declare-fun b!1101622 () Bool)

(declare-fun res!734725 () Bool)

(declare-fun e!628875 () Bool)

(assert (=> b!1101622 (=> (not res!734725) (not e!628875))))

(declare-fun _keys!1070 () array!71327)

(assert (=> b!1101622 (= res!734725 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23981))))

(declare-fun b!1101623 () Bool)

(declare-fun res!734731 () Bool)

(assert (=> b!1101623 (=> (not res!734731) (not e!628875))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1101623 (= res!734731 (validKeyInArray!0 k0!904))))

(declare-fun b!1101624 () Bool)

(declare-fun e!628879 () Bool)

(assert (=> b!1101624 (= e!628879 true)))

(declare-datatypes ((V!41377 0))(
  ( (V!41378 (val!13650 Int)) )
))
(declare-datatypes ((tuple2!17364 0))(
  ( (tuple2!17365 (_1!8693 (_ BitVec 64)) (_2!8693 V!41377)) )
))
(declare-datatypes ((List!23985 0))(
  ( (Nil!23982) (Cons!23981 (h!25199 tuple2!17364) (t!34160 List!23985)) )
))
(declare-datatypes ((ListLongMap!15341 0))(
  ( (ListLongMap!15342 (toList!7686 List!23985)) )
))
(declare-fun lt!493453 () ListLongMap!15341)

(declare-fun lt!493454 () ListLongMap!15341)

(declare-fun -!954 (ListLongMap!15341 (_ BitVec 64)) ListLongMap!15341)

(assert (=> b!1101624 (= (-!954 lt!493453 k0!904) lt!493454)))

(declare-datatypes ((Unit!36161 0))(
  ( (Unit!36162) )
))
(declare-fun lt!493445 () Unit!36161)

(declare-fun lt!493442 () ListLongMap!15341)

(declare-fun zeroValue!831 () V!41377)

(declare-fun addRemoveCommutativeForDiffKeys!125 (ListLongMap!15341 (_ BitVec 64) V!41377 (_ BitVec 64)) Unit!36161)

(assert (=> b!1101624 (= lt!493445 (addRemoveCommutativeForDiffKeys!125 lt!493442 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(declare-fun b!1101625 () Bool)

(assert (=> b!1101625 (= e!628875 e!628876)))

(declare-fun res!734727 () Bool)

(assert (=> b!1101625 (=> (not res!734727) (not e!628876))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71327 (_ BitVec 32)) Bool)

(assert (=> b!1101625 (= res!734727 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!493443 mask!1414))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1101625 (= lt!493443 (array!71328 (store (arr!34322 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34859 _keys!1070)))))

(declare-fun b!1101626 () Bool)

(declare-fun e!628881 () Bool)

(assert (=> b!1101626 (= e!628876 (not e!628881))))

(declare-fun res!734734 () Bool)

(assert (=> b!1101626 (=> res!734734 e!628881)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1101626 (= res!734734 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun minValue!831 () V!41377)

(declare-fun lt!493449 () ListLongMap!15341)

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((ValueCell!12884 0))(
  ( (ValueCellFull!12884 (v!16274 V!41377)) (EmptyCell!12884) )
))
(declare-datatypes ((array!71329 0))(
  ( (array!71330 (arr!34323 (Array (_ BitVec 32) ValueCell!12884)) (size!34860 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71329)

(declare-fun getCurrentListMap!4390 (array!71327 array!71329 (_ BitVec 32) (_ BitVec 32) V!41377 V!41377 (_ BitVec 32) Int) ListLongMap!15341)

(assert (=> b!1101626 (= lt!493449 (getCurrentListMap!4390 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!493448 () array!71329)

(declare-fun lt!493446 () ListLongMap!15341)

(assert (=> b!1101626 (= lt!493446 (getCurrentListMap!4390 lt!493443 lt!493448 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!493451 () ListLongMap!15341)

(declare-fun lt!493450 () ListLongMap!15341)

(assert (=> b!1101626 (and (= lt!493451 lt!493450) (= lt!493450 lt!493451))))

(assert (=> b!1101626 (= lt!493450 (-!954 lt!493442 k0!904))))

(declare-fun lt!493452 () Unit!36161)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!224 (array!71327 array!71329 (_ BitVec 32) (_ BitVec 32) V!41377 V!41377 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36161)

(assert (=> b!1101626 (= lt!493452 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!224 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4231 (array!71327 array!71329 (_ BitVec 32) (_ BitVec 32) V!41377 V!41377 (_ BitVec 32) Int) ListLongMap!15341)

(assert (=> b!1101626 (= lt!493451 (getCurrentListMapNoExtraKeys!4231 lt!493443 lt!493448 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2349 (Int (_ BitVec 64)) V!41377)

(assert (=> b!1101626 (= lt!493448 (array!71330 (store (arr!34323 _values!874) i!650 (ValueCellFull!12884 (dynLambda!2349 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34860 _values!874)))))

(assert (=> b!1101626 (= lt!493442 (getCurrentListMapNoExtraKeys!4231 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71327 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1101626 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!493447 () Unit!36161)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71327 (_ BitVec 64) (_ BitVec 32)) Unit!36161)

(assert (=> b!1101626 (= lt!493447 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1101627 () Bool)

(declare-fun res!734735 () Bool)

(assert (=> b!1101627 (=> (not res!734735) (not e!628875))))

(assert (=> b!1101627 (= res!734735 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1101628 () Bool)

(declare-fun res!734733 () Bool)

(assert (=> b!1101628 (=> (not res!734733) (not e!628875))))

(assert (=> b!1101628 (= res!734733 (= (select (arr!34322 _keys!1070) i!650) k0!904))))

(declare-fun res!734728 () Bool)

(assert (=> start!96978 (=> (not res!734728) (not e!628875))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96978 (= res!734728 (validMask!0 mask!1414))))

(assert (=> start!96978 e!628875))

(assert (=> start!96978 tp!81359))

(assert (=> start!96978 true))

(declare-fun tp_is_empty!27187 () Bool)

(assert (=> start!96978 tp_is_empty!27187))

(declare-fun array_inv!26460 (array!71327) Bool)

(assert (=> start!96978 (array_inv!26460 _keys!1070)))

(declare-fun e!628880 () Bool)

(declare-fun array_inv!26461 (array!71329) Bool)

(assert (=> start!96978 (and (array_inv!26461 _values!874) e!628880)))

(declare-fun mapNonEmpty!42562 () Bool)

(declare-fun tp!81358 () Bool)

(declare-fun e!628874 () Bool)

(assert (=> mapNonEmpty!42562 (= mapRes!42562 (and tp!81358 e!628874))))

(declare-fun mapRest!42562 () (Array (_ BitVec 32) ValueCell!12884))

(declare-fun mapKey!42562 () (_ BitVec 32))

(declare-fun mapValue!42562 () ValueCell!12884)

(assert (=> mapNonEmpty!42562 (= (arr!34323 _values!874) (store mapRest!42562 mapKey!42562 mapValue!42562))))

(declare-fun b!1101629 () Bool)

(declare-fun e!628878 () Bool)

(assert (=> b!1101629 (= e!628880 (and e!628878 mapRes!42562))))

(declare-fun condMapEmpty!42562 () Bool)

(declare-fun mapDefault!42562 () ValueCell!12884)

(assert (=> b!1101629 (= condMapEmpty!42562 (= (arr!34323 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12884)) mapDefault!42562)))))

(declare-fun b!1101630 () Bool)

(assert (=> b!1101630 (= e!628881 e!628879)))

(declare-fun res!734730 () Bool)

(assert (=> b!1101630 (=> res!734730 e!628879)))

(assert (=> b!1101630 (= res!734730 (= #b0000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(assert (=> b!1101630 (= lt!493446 lt!493454)))

(declare-fun lt!493444 () tuple2!17364)

(declare-fun +!3418 (ListLongMap!15341 tuple2!17364) ListLongMap!15341)

(assert (=> b!1101630 (= lt!493454 (+!3418 lt!493450 lt!493444))))

(assert (=> b!1101630 (= lt!493449 lt!493453)))

(assert (=> b!1101630 (= lt!493453 (+!3418 lt!493442 lt!493444))))

(assert (=> b!1101630 (= lt!493446 (+!3418 lt!493451 lt!493444))))

(assert (=> b!1101630 (= lt!493444 (tuple2!17365 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1101631 () Bool)

(assert (=> b!1101631 (= e!628874 tp_is_empty!27187)))

(declare-fun b!1101632 () Bool)

(declare-fun res!734732 () Bool)

(assert (=> b!1101632 (=> (not res!734732) (not e!628875))))

(assert (=> b!1101632 (= res!734732 (and (= (size!34860 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34859 _keys!1070) (size!34860 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1101633 () Bool)

(assert (=> b!1101633 (= e!628878 tp_is_empty!27187)))

(declare-fun b!1101634 () Bool)

(declare-fun res!734726 () Bool)

(assert (=> b!1101634 (=> (not res!734726) (not e!628875))))

(assert (=> b!1101634 (= res!734726 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34859 _keys!1070))))))

(assert (= (and start!96978 res!734728) b!1101632))

(assert (= (and b!1101632 res!734732) b!1101627))

(assert (= (and b!1101627 res!734735) b!1101622))

(assert (= (and b!1101622 res!734725) b!1101634))

(assert (= (and b!1101634 res!734726) b!1101623))

(assert (= (and b!1101623 res!734731) b!1101628))

(assert (= (and b!1101628 res!734733) b!1101625))

(assert (= (and b!1101625 res!734727) b!1101621))

(assert (= (and b!1101621 res!734729) b!1101626))

(assert (= (and b!1101626 (not res!734734)) b!1101630))

(assert (= (and b!1101630 (not res!734730)) b!1101624))

(assert (= (and b!1101629 condMapEmpty!42562) mapIsEmpty!42562))

(assert (= (and b!1101629 (not condMapEmpty!42562)) mapNonEmpty!42562))

(get-info :version)

(assert (= (and mapNonEmpty!42562 ((_ is ValueCellFull!12884) mapValue!42562)) b!1101631))

(assert (= (and b!1101629 ((_ is ValueCellFull!12884) mapDefault!42562)) b!1101633))

(assert (= start!96978 b!1101629))

(declare-fun b_lambda!18015 () Bool)

(assert (=> (not b_lambda!18015) (not b!1101626)))

(declare-fun t!34158 () Bool)

(declare-fun tb!7995 () Bool)

(assert (=> (and start!96978 (= defaultEntry!882 defaultEntry!882) t!34158) tb!7995))

(declare-fun result!16535 () Bool)

(assert (=> tb!7995 (= result!16535 tp_is_empty!27187)))

(assert (=> b!1101626 t!34158))

(declare-fun b_and!37047 () Bool)

(assert (= b_and!37045 (and (=> t!34158 result!16535) b_and!37047)))

(declare-fun m!1022009 () Bool)

(assert (=> mapNonEmpty!42562 m!1022009))

(declare-fun m!1022011 () Bool)

(assert (=> b!1101624 m!1022011))

(declare-fun m!1022013 () Bool)

(assert (=> b!1101624 m!1022013))

(declare-fun m!1022015 () Bool)

(assert (=> b!1101628 m!1022015))

(declare-fun m!1022017 () Bool)

(assert (=> b!1101630 m!1022017))

(declare-fun m!1022019 () Bool)

(assert (=> b!1101630 m!1022019))

(declare-fun m!1022021 () Bool)

(assert (=> b!1101630 m!1022021))

(declare-fun m!1022023 () Bool)

(assert (=> b!1101623 m!1022023))

(declare-fun m!1022025 () Bool)

(assert (=> b!1101622 m!1022025))

(declare-fun m!1022027 () Bool)

(assert (=> b!1101627 m!1022027))

(declare-fun m!1022029 () Bool)

(assert (=> b!1101626 m!1022029))

(declare-fun m!1022031 () Bool)

(assert (=> b!1101626 m!1022031))

(declare-fun m!1022033 () Bool)

(assert (=> b!1101626 m!1022033))

(declare-fun m!1022035 () Bool)

(assert (=> b!1101626 m!1022035))

(declare-fun m!1022037 () Bool)

(assert (=> b!1101626 m!1022037))

(declare-fun m!1022039 () Bool)

(assert (=> b!1101626 m!1022039))

(declare-fun m!1022041 () Bool)

(assert (=> b!1101626 m!1022041))

(declare-fun m!1022043 () Bool)

(assert (=> b!1101626 m!1022043))

(declare-fun m!1022045 () Bool)

(assert (=> b!1101626 m!1022045))

(declare-fun m!1022047 () Bool)

(assert (=> b!1101626 m!1022047))

(declare-fun m!1022049 () Bool)

(assert (=> b!1101625 m!1022049))

(declare-fun m!1022051 () Bool)

(assert (=> b!1101625 m!1022051))

(declare-fun m!1022053 () Bool)

(assert (=> start!96978 m!1022053))

(declare-fun m!1022055 () Bool)

(assert (=> start!96978 m!1022055))

(declare-fun m!1022057 () Bool)

(assert (=> start!96978 m!1022057))

(declare-fun m!1022059 () Bool)

(assert (=> b!1101621 m!1022059))

(check-sat tp_is_empty!27187 (not b!1101630) (not b!1101625) (not b!1101624) (not start!96978) (not b!1101623) (not mapNonEmpty!42562) (not b_lambda!18015) (not b_next!23137) (not b!1101627) (not b!1101621) (not b!1101626) b_and!37047 (not b!1101622))
(check-sat b_and!37047 (not b_next!23137))
