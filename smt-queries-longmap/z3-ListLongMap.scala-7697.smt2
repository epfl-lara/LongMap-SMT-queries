; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96870 () Bool)

(assert start!96870)

(declare-fun b_free!23107 () Bool)

(declare-fun b_next!23107 () Bool)

(assert (=> start!96870 (= b_free!23107 (not b_next!23107))))

(declare-fun tp!81260 () Bool)

(declare-fun b_and!36943 () Bool)

(assert (=> start!96870 (= tp!81260 b_and!36943)))

(declare-fun b!1100373 () Bool)

(declare-fun res!733976 () Bool)

(declare-fun e!628149 () Bool)

(assert (=> b!1100373 (=> (not res!733976) (not e!628149))))

(declare-datatypes ((array!71263 0))(
  ( (array!71264 (arr!34293 (Array (_ BitVec 32) (_ BitVec 64))) (size!34830 (_ BitVec 32))) )
))
(declare-fun lt!492495 () array!71263)

(declare-datatypes ((List!23959 0))(
  ( (Nil!23956) (Cons!23955 (h!25173 (_ BitVec 64)) (t!34104 List!23959)) )
))
(declare-fun arrayNoDuplicates!0 (array!71263 (_ BitVec 32) List!23959) Bool)

(assert (=> b!1100373 (= res!733976 (arrayNoDuplicates!0 lt!492495 #b00000000000000000000000000000000 Nil!23956))))

(declare-fun b!1100374 () Bool)

(declare-fun res!733977 () Bool)

(declare-fun e!628143 () Bool)

(assert (=> b!1100374 (=> (not res!733977) (not e!628143))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1100374 (= res!733977 (validKeyInArray!0 k0!904))))

(declare-datatypes ((V!41337 0))(
  ( (V!41338 (val!13635 Int)) )
))
(declare-datatypes ((tuple2!17336 0))(
  ( (tuple2!17337 (_1!8679 (_ BitVec 64)) (_2!8679 V!41337)) )
))
(declare-datatypes ((List!23960 0))(
  ( (Nil!23957) (Cons!23956 (h!25174 tuple2!17336) (t!34105 List!23960)) )
))
(declare-datatypes ((ListLongMap!15313 0))(
  ( (ListLongMap!15314 (toList!7672 List!23960)) )
))
(declare-fun lt!492503 () ListLongMap!15313)

(declare-fun e!628145 () Bool)

(declare-fun b!1100375 () Bool)

(declare-fun lt!492500 () ListLongMap!15313)

(declare-fun -!944 (ListLongMap!15313 (_ BitVec 64)) ListLongMap!15313)

(assert (=> b!1100375 (= e!628145 (= (-!944 lt!492500 k0!904) lt!492503))))

(declare-fun lt!492493 () ListLongMap!15313)

(declare-fun lt!492489 () ListLongMap!15313)

(declare-fun lt!492496 () tuple2!17336)

(declare-fun +!3406 (ListLongMap!15313 tuple2!17336) ListLongMap!15313)

(assert (=> b!1100375 (= (-!944 lt!492493 k0!904) (+!3406 lt!492489 lt!492496))))

(declare-datatypes ((Unit!36135 0))(
  ( (Unit!36136) )
))
(declare-fun lt!492492 () Unit!36135)

(declare-fun lt!492488 () ListLongMap!15313)

(declare-fun minValue!831 () V!41337)

(declare-fun addRemoveCommutativeForDiffKeys!123 (ListLongMap!15313 (_ BitVec 64) V!41337 (_ BitVec 64)) Unit!36135)

(assert (=> b!1100375 (= lt!492492 (addRemoveCommutativeForDiffKeys!123 lt!492488 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(declare-fun mapNonEmpty!42508 () Bool)

(declare-fun mapRes!42508 () Bool)

(declare-fun tp!81259 () Bool)

(declare-fun e!628148 () Bool)

(assert (=> mapNonEmpty!42508 (= mapRes!42508 (and tp!81259 e!628148))))

(declare-datatypes ((ValueCell!12869 0))(
  ( (ValueCellFull!12869 (v!16256 V!41337)) (EmptyCell!12869) )
))
(declare-datatypes ((array!71265 0))(
  ( (array!71266 (arr!34294 (Array (_ BitVec 32) ValueCell!12869)) (size!34831 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71265)

(declare-fun mapRest!42508 () (Array (_ BitVec 32) ValueCell!12869))

(declare-fun mapValue!42508 () ValueCell!12869)

(declare-fun mapKey!42508 () (_ BitVec 32))

(assert (=> mapNonEmpty!42508 (= (arr!34294 _values!874) (store mapRest!42508 mapKey!42508 mapValue!42508))))

(declare-fun b!1100376 () Bool)

(declare-fun res!733979 () Bool)

(assert (=> b!1100376 (=> (not res!733979) (not e!628143))))

(declare-fun _keys!1070 () array!71263)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71263 (_ BitVec 32)) Bool)

(assert (=> b!1100376 (= res!733979 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1100378 () Bool)

(declare-fun e!628147 () Bool)

(declare-fun tp_is_empty!27157 () Bool)

(assert (=> b!1100378 (= e!628147 tp_is_empty!27157)))

(declare-fun b!1100379 () Bool)

(declare-fun res!733982 () Bool)

(assert (=> b!1100379 (=> (not res!733982) (not e!628143))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1100379 (= res!733982 (and (= (size!34831 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34830 _keys!1070) (size!34831 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1100380 () Bool)

(declare-fun res!733980 () Bool)

(assert (=> b!1100380 (=> (not res!733980) (not e!628143))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1100380 (= res!733980 (= (select (arr!34293 _keys!1070) i!650) k0!904))))

(declare-fun b!1100381 () Bool)

(declare-fun e!628142 () Bool)

(assert (=> b!1100381 (= e!628149 (not e!628142))))

(declare-fun res!733974 () Bool)

(assert (=> b!1100381 (=> res!733974 e!628142)))

(assert (=> b!1100381 (= res!733974 (or (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun zeroValue!831 () V!41337)

(declare-fun getCurrentListMap!4381 (array!71263 array!71265 (_ BitVec 32) (_ BitVec 32) V!41337 V!41337 (_ BitVec 32) Int) ListLongMap!15313)

(assert (=> b!1100381 (= lt!492500 (getCurrentListMap!4381 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!492499 () array!71265)

(assert (=> b!1100381 (= lt!492503 (getCurrentListMap!4381 lt!492495 lt!492499 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!492501 () ListLongMap!15313)

(declare-fun lt!492502 () ListLongMap!15313)

(assert (=> b!1100381 (and (= lt!492501 lt!492502) (= lt!492502 lt!492501))))

(declare-fun lt!492491 () ListLongMap!15313)

(assert (=> b!1100381 (= lt!492502 (-!944 lt!492491 k0!904))))

(declare-fun lt!492494 () Unit!36135)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!215 (array!71263 array!71265 (_ BitVec 32) (_ BitVec 32) V!41337 V!41337 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36135)

(assert (=> b!1100381 (= lt!492494 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!215 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4222 (array!71263 array!71265 (_ BitVec 32) (_ BitVec 32) V!41337 V!41337 (_ BitVec 32) Int) ListLongMap!15313)

(assert (=> b!1100381 (= lt!492501 (getCurrentListMapNoExtraKeys!4222 lt!492495 lt!492499 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2340 (Int (_ BitVec 64)) V!41337)

(assert (=> b!1100381 (= lt!492499 (array!71266 (store (arr!34294 _values!874) i!650 (ValueCellFull!12869 (dynLambda!2340 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34831 _values!874)))))

(assert (=> b!1100381 (= lt!492491 (getCurrentListMapNoExtraKeys!4222 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!71263 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1100381 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!492487 () Unit!36135)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71263 (_ BitVec 64) (_ BitVec 32)) Unit!36135)

(assert (=> b!1100381 (= lt!492487 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1100382 () Bool)

(declare-fun res!733981 () Bool)

(assert (=> b!1100382 (=> (not res!733981) (not e!628143))))

(assert (=> b!1100382 (= res!733981 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23956))))

(declare-fun b!1100383 () Bool)

(declare-fun res!733975 () Bool)

(assert (=> b!1100383 (=> (not res!733975) (not e!628143))))

(assert (=> b!1100383 (= res!733975 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34830 _keys!1070))))))

(declare-fun mapIsEmpty!42508 () Bool)

(assert (=> mapIsEmpty!42508 mapRes!42508))

(declare-fun b!1100384 () Bool)

(assert (=> b!1100384 (= e!628143 e!628149)))

(declare-fun res!733978 () Bool)

(assert (=> b!1100384 (=> (not res!733978) (not e!628149))))

(assert (=> b!1100384 (= res!733978 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!492495 mask!1414))))

(assert (=> b!1100384 (= lt!492495 (array!71264 (store (arr!34293 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34830 _keys!1070)))))

(declare-fun b!1100385 () Bool)

(declare-fun e!628146 () Bool)

(assert (=> b!1100385 (= e!628146 (and e!628147 mapRes!42508))))

(declare-fun condMapEmpty!42508 () Bool)

(declare-fun mapDefault!42508 () ValueCell!12869)

(assert (=> b!1100385 (= condMapEmpty!42508 (= (arr!34294 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12869)) mapDefault!42508)))))

(declare-fun b!1100386 () Bool)

(assert (=> b!1100386 (= e!628142 e!628145)))

(declare-fun res!733972 () Bool)

(assert (=> b!1100386 (=> res!733972 e!628145)))

(assert (=> b!1100386 (= res!733972 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-fun lt!492498 () ListLongMap!15313)

(assert (=> b!1100386 (= lt!492489 lt!492498)))

(assert (=> b!1100386 (= lt!492489 (-!944 lt!492488 k0!904))))

(declare-fun lt!492490 () Unit!36135)

(assert (=> b!1100386 (= lt!492490 (addRemoveCommutativeForDiffKeys!123 lt!492491 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(assert (=> b!1100386 (= lt!492503 (+!3406 lt!492498 lt!492496))))

(declare-fun lt!492497 () tuple2!17336)

(assert (=> b!1100386 (= lt!492498 (+!3406 lt!492502 lt!492497))))

(assert (=> b!1100386 (= lt!492500 lt!492493)))

(assert (=> b!1100386 (= lt!492493 (+!3406 lt!492488 lt!492496))))

(assert (=> b!1100386 (= lt!492488 (+!3406 lt!492491 lt!492497))))

(assert (=> b!1100386 (= lt!492503 (+!3406 (+!3406 lt!492501 lt!492497) lt!492496))))

(assert (=> b!1100386 (= lt!492496 (tuple2!17337 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(assert (=> b!1100386 (= lt!492497 (tuple2!17337 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun res!733973 () Bool)

(assert (=> start!96870 (=> (not res!733973) (not e!628143))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96870 (= res!733973 (validMask!0 mask!1414))))

(assert (=> start!96870 e!628143))

(assert (=> start!96870 tp!81260))

(assert (=> start!96870 true))

(assert (=> start!96870 tp_is_empty!27157))

(declare-fun array_inv!26440 (array!71263) Bool)

(assert (=> start!96870 (array_inv!26440 _keys!1070)))

(declare-fun array_inv!26441 (array!71265) Bool)

(assert (=> start!96870 (and (array_inv!26441 _values!874) e!628146)))

(declare-fun b!1100377 () Bool)

(assert (=> b!1100377 (= e!628148 tp_is_empty!27157)))

(assert (= (and start!96870 res!733973) b!1100379))

(assert (= (and b!1100379 res!733982) b!1100376))

(assert (= (and b!1100376 res!733979) b!1100382))

(assert (= (and b!1100382 res!733981) b!1100383))

(assert (= (and b!1100383 res!733975) b!1100374))

(assert (= (and b!1100374 res!733977) b!1100380))

(assert (= (and b!1100380 res!733980) b!1100384))

(assert (= (and b!1100384 res!733978) b!1100373))

(assert (= (and b!1100373 res!733976) b!1100381))

(assert (= (and b!1100381 (not res!733974)) b!1100386))

(assert (= (and b!1100386 (not res!733972)) b!1100375))

(assert (= (and b!1100385 condMapEmpty!42508) mapIsEmpty!42508))

(assert (= (and b!1100385 (not condMapEmpty!42508)) mapNonEmpty!42508))

(get-info :version)

(assert (= (and mapNonEmpty!42508 ((_ is ValueCellFull!12869) mapValue!42508)) b!1100377))

(assert (= (and b!1100385 ((_ is ValueCellFull!12869) mapDefault!42508)) b!1100378))

(assert (= start!96870 b!1100385))

(declare-fun b_lambda!17895 () Bool)

(assert (=> (not b_lambda!17895) (not b!1100381)))

(declare-fun t!34103 () Bool)

(declare-fun tb!7965 () Bool)

(assert (=> (and start!96870 (= defaultEntry!882 defaultEntry!882) t!34103) tb!7965))

(declare-fun result!16469 () Bool)

(assert (=> tb!7965 (= result!16469 tp_is_empty!27157)))

(assert (=> b!1100381 t!34103))

(declare-fun b_and!36945 () Bool)

(assert (= b_and!36943 (and (=> t!34103 result!16469) b_and!36945)))

(declare-fun m!1020617 () Bool)

(assert (=> b!1100375 m!1020617))

(declare-fun m!1020619 () Bool)

(assert (=> b!1100375 m!1020619))

(declare-fun m!1020621 () Bool)

(assert (=> b!1100375 m!1020621))

(declare-fun m!1020623 () Bool)

(assert (=> b!1100375 m!1020623))

(declare-fun m!1020625 () Bool)

(assert (=> b!1100386 m!1020625))

(declare-fun m!1020627 () Bool)

(assert (=> b!1100386 m!1020627))

(declare-fun m!1020629 () Bool)

(assert (=> b!1100386 m!1020629))

(declare-fun m!1020631 () Bool)

(assert (=> b!1100386 m!1020631))

(assert (=> b!1100386 m!1020627))

(declare-fun m!1020633 () Bool)

(assert (=> b!1100386 m!1020633))

(declare-fun m!1020635 () Bool)

(assert (=> b!1100386 m!1020635))

(declare-fun m!1020637 () Bool)

(assert (=> b!1100386 m!1020637))

(declare-fun m!1020639 () Bool)

(assert (=> b!1100386 m!1020639))

(declare-fun m!1020641 () Bool)

(assert (=> b!1100382 m!1020641))

(declare-fun m!1020643 () Bool)

(assert (=> mapNonEmpty!42508 m!1020643))

(declare-fun m!1020645 () Bool)

(assert (=> start!96870 m!1020645))

(declare-fun m!1020647 () Bool)

(assert (=> start!96870 m!1020647))

(declare-fun m!1020649 () Bool)

(assert (=> start!96870 m!1020649))

(declare-fun m!1020651 () Bool)

(assert (=> b!1100374 m!1020651))

(declare-fun m!1020653 () Bool)

(assert (=> b!1100384 m!1020653))

(declare-fun m!1020655 () Bool)

(assert (=> b!1100384 m!1020655))

(declare-fun m!1020657 () Bool)

(assert (=> b!1100373 m!1020657))

(declare-fun m!1020659 () Bool)

(assert (=> b!1100376 m!1020659))

(declare-fun m!1020661 () Bool)

(assert (=> b!1100380 m!1020661))

(declare-fun m!1020663 () Bool)

(assert (=> b!1100381 m!1020663))

(declare-fun m!1020665 () Bool)

(assert (=> b!1100381 m!1020665))

(declare-fun m!1020667 () Bool)

(assert (=> b!1100381 m!1020667))

(declare-fun m!1020669 () Bool)

(assert (=> b!1100381 m!1020669))

(declare-fun m!1020671 () Bool)

(assert (=> b!1100381 m!1020671))

(declare-fun m!1020673 () Bool)

(assert (=> b!1100381 m!1020673))

(declare-fun m!1020675 () Bool)

(assert (=> b!1100381 m!1020675))

(declare-fun m!1020677 () Bool)

(assert (=> b!1100381 m!1020677))

(declare-fun m!1020679 () Bool)

(assert (=> b!1100381 m!1020679))

(declare-fun m!1020681 () Bool)

(assert (=> b!1100381 m!1020681))

(check-sat tp_is_empty!27157 (not b!1100381) (not b!1100384) (not start!96870) (not b!1100382) (not b_next!23107) b_and!36945 (not mapNonEmpty!42508) (not b!1100375) (not b!1100373) (not b_lambda!17895) (not b!1100376) (not b!1100374) (not b!1100386))
(check-sat b_and!36945 (not b_next!23107))
